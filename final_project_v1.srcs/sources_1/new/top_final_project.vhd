LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
LIBRARY UNISIM;
USE UNISIM.vcomponents.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY top_final_project IS
    PORT (
        clk_100MHz_i : IN STD_LOGIC;
        rst_n_i : IN STD_LOGIC;
        cam_vsync_i : IN STD_LOGIC;
        cam_href_i : IN STD_LOGIC;
        cam_pclk_i : IN STD_LOGIC;
        cam_xclk_o : OUT STD_LOGIC;
        cam_d_i : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        cam_reset_o : OUT STD_LOGIC;
        cam_pwdn_o : OUT STD_LOGIC;
        cam_sioc_io : INOUT STD_LOGIC;
        cam_siod_io : INOUT STD_LOGIC;
        vga_hsync : OUT STD_LOGIC;
        vga_vsync : OUT STD_LOGIC;
        vga_red : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        vga_blue : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        vga_green : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        sccb_ack_err_o : OUT STD_LOGIC;
        sccb_ack_error_latch_o : OUT STD_LOGIC;
        btnU_n_i : IN STD_LOGIC; -- button up!
        debug_o : OUT STD_LOGIC;
        start_fsm_debug_o : OUT STD_LOGIC;
        sw_i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        dataSelectionControlLed_o : OUT STD_LOGIC
    );
END top_final_project;

ARCHITECTURE Behavioral OF top_final_project IS
    SIGNAL sioc_i_r : STD_LOGIC;
    SIGNAL sioc_o_r : STD_LOGIC;
    SIGNAL sioc_control_r : STD_LOGIC := '1'; -- inital high -> input

    SIGNAL siod_i_r : STD_LOGIC;
    SIGNAL siod_o_r : STD_LOGIC;
    SIGNAL siod_control_r : STD_LOGIC := '1'; -- inital high -> input

    -- config data PAY ATTENTION: in reversed order!!!
    -- COM7 Reset (Should also be done on reset, but to be sure)
    SIGNAL sccb_regAddress_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01001000"; -- reversed order!!!
    SIGNAL sccb_regConfig_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000001"; -- reversed order!!!

    -- COM7 Set Output format to RGB (instead of YUV, which is default)
    SIGNAL sccb_regAddress1_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01001000"; -- reversed order!!!
    SIGNAL sccb_regConfig1_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00100000"; -- reversed order!!!

    -- RGB444 Enable the RGB44 output format (only valid with the lower command)
    SIGNAL sccb_regAddress2_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00110001"; -- reversed order!!!
    SIGNAL sccb_regConfig2_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01000000"; -- reversed order!!!

    -- COM15 Set RGB 444 format (only valid with upper command) and output range to [00] to [FF]
    SIGNAL sccb_regAddress3_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000010"; -- reversed order!!!
    SIGNAL sccb_regConfig3_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00001011"; -- reversed order!!!

    -- COM7 Set Output format to RGB (instead of YUV, which is default) + debug color bars
    SIGNAL sccb_regAddress4_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01001000"; -- reversed order!!!
    SIGNAL sccb_regConfig4_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01100000"; -- reversed order!!!

    SIGNAL sccb_data_r : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sccb_startWrite_r : STD_LOGIC;
    -- BEGIN ------ debug -> generate repeated start signal for i2c tb ---------
    SIGNAL prescale_var_r : INTEGER RANGE 0 TO 100000000 := 0;
    -- END   ------ debug -> generate repeated start signal for i2c tb ---------
    SIGNAL clk_25MHz_r : STD_LOGIC;
    SIGNAL locked_clk25MHz_r : STD_LOGIC;

    COMPONENT vga_buffer IS
        PORT (
            cam_pclk_i : IN STD_LOGIC;
            rst_i : IN STD_LOGIC;
            cam_href_i : IN STD_LOGIC;
            cam_vsynch_i : IN STD_LOGIC;
            cam_d_i : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            sw_i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            vga_red : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            vga_blue : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            vga_green : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            Hsync_o : OUT STD_LOGIC;
            Vsync_o : OUT STD_LOGIC
        );
    END COMPONENT;

BEGIN
    ----------------------------------------------------------------------------
    -- STATIC SIGNALS INIT
    ----------------------------------------------------------------------------
    -- 0 -> normal mode, 1 -> power down mode
    cam_pwdn_o <= '0';
    -- connect 25 MHz clock to cam
    cam_xclk_o <= clk_25MHz_r;
    -- since only pullup resistors are supposed to pull lines against 3V3 output
    -- is hardcoded to zero, to pull down lines use siox_control_r signals
    sioc_i_r <= '0';
    siod_i_r <= '0';
    ----------------------------------------------------------------------------
    -- IO BUFFER 
    ----------------------------------------------------------------------------
    -- for cam_sioc_o
    IOBUF_inst1 : IOBUF
    GENERIC MAP(
        DRIVE => 12,
        IOSTANDARD => "DEFAULT",
        SLEW => "FAST")
    PORT MAP(
        O => sioc_o_r, -- Buffer output
        IO => cam_sioc_io, -- Buffer inout port (connect directly to top-level port)
        I => sioc_i_r, -- Buffer input
        T => sioc_control_r -- 3-state enable input, high=input, low=output 
    );
    -- for cam_siod_o
    IOBUF_inst2 : IOBUF
    GENERIC MAP(
        DRIVE => 12,
        IOSTANDARD => "DEFAULT",
        SLEW => "FAST")
    PORT MAP(
        O => siod_o_r, -- Buffer output
        IO => cam_siod_io, -- Buffer inout port (connect directly to top-level port)
        I => siod_i_r, -- Buffer input
        T => siod_control_r -- 3-state enable input, high=input, low=output 
    );
    ----------------------------------------------------------------------------
    -- CLOCK GEN w/ MMCM 25MHz
    ----------------------------------------------------------------------------
    clock_gen_inst : ENTITY work.clk_wiz_0
        PORT MAP(
            clk_in1 => clk_100MHz_i,
            clk_out1 => clk_25MHz_r,
            reset => rst_n_i,
            locked => locked_clk25MHz_r
        );

    ----------------------------------------------------------------------------
    -- I2C
    -- Peripheral addresses are 42 for write and 43 for read
    -- select data via switches, pay attention when inputting data -> must be in
    -- reversed order!!!
    -- press button to send via switch selected data via i2c
    -- make sure last led (num 15) wont light up, otherwise communication went 
    -- wrong
    ----------------------------------------------------------------------------
    dataSelection_comb_proc : PROCESS (sw_i)
    BEGIN

        CASE(sw_i) IS

            WHEN "0000000000000000" =>
            sccb_data_r <= sccb_regConfig_r & sccb_regAddress_r;

            WHEN "0000000000000001" =>
            sccb_data_r <= sccb_regConfig1_r & sccb_regAddress1_r;

            WHEN "0000000000000010" =>
            sccb_data_r <= sccb_regConfig2_r & sccb_regAddress2_r;

            WHEN "0000000000000011" =>
            sccb_data_r <= sccb_regConfig3_r & sccb_regAddress3_r;

            WHEN "0000000000000100" =>
            sccb_data_r <= sccb_regConfig4_r & sccb_regAddress4_r;

            WHEN OTHERS =>
            sccb_data_r <= sccb_regConfig_r & sccb_regAddress_r;

        END CASE;
    END PROCESS;

    i2c_controler_inst : ENTITY work.i2c_controler
        PORT MAP(
            clk_100MHz_i => clk_100MHz_i,
            rst_n_i => rst_n_i,
            data_wr_i => sccb_data_r,
            btnU_n_i => btnU_n_i,
            scl_o_o => sioc_control_r,
            ack_error_o => sccb_ack_err_o,
            ack_error_latch_o => sccb_ack_error_latch_o,
            sda_o_o => siod_control_r,
            sda_i => siod_o_r,
            start_fsm_debug_o => start_fsm_debug_o
        );
    debug_o <= '0';

    ----------------------------------------------------------------------------
    -- CAM RESET (ACTIVE HIGH)
    ----------------------------------------------------------------------------
    -- 0: Reset mode 1: Normal mode
    cam_rst_proc : PROCESS (rst_n_i)
    BEGIN
        IF (rst_n_i = '1') THEN
            cam_reset_o <= '0';
        ELSE
            cam_reset_o <= '1';
        END IF;
    END PROCESS;

    ----------------------------------------------------------------------------
    -- VGA Framebuffer, stores input data from camera in BRAM and outputs VGA to display
    ----------------------------------------------------------------------------
    vga_buffer_inst : ENTITY work.vga_buffer
        PORT MAP(
            cam_pclk_i => cam_pclk_i,
            rst_i => rst_n_i,
            cam_href_i => cam_href_i,
            cam_vsynch_i => cam_vsync_i,
            cam_d_i => cam_d_i,
            sw_i => sw_i,
            vga_red => vga_red,
            vga_blue => vga_blue,
            vga_green => vga_green,
            Hsync_o => vga_hsync,
            Vsync_o => vga_vsync
        );
END Behavioral;