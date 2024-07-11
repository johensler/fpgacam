--------------------------------------------------------------------------------
-- whole project as async design, use this process as example
-- process_name : process(clk_i, rst_n_i)
-- begin
--    if (rst_n_i = '1') then
--         -- reset all output signals of process
--         all_signals <= (others => '0');
--     elsif rising_edge(clk_i) then
--         -- do something clocked
--     end if;
-- end process process_name;
--------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
LIBRARY UNISIM;
USE UNISIM.vcomponents.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

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
        vga_red_o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        vga_green_o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        vga_blue_o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        sccb_ack_err_o : OUT STD_LOGIC;
        sccb_ack_error_latch_o : OUT STD_LOGIC;
        btnU_n_i : IN STD_LOGIC; -- button up!
        debug_o : OUT STD_LOGIC;
        start_fsm_debug_o : OUT STD_LOGIC;
        sw : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
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
    -- For GRB 4:2:2 we have to set: COM7[2]=1, COM7[0]=0, COM15[5]=x and COM15[4]=0
    -- data 0: [COM7] Register h12, config data: select RGB format
    SIGNAL sccb_regAddress_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01001000"; -- reversed order!!!
    SIGNAL sccb_regConfig_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000100"; -- reversed order!!!

    -- data 1: [COM15] Register h40, config data: select normal RGB format (GBR 4:2:2)
    SIGNAL sccb_regAddress1_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000010"; -- reversed order!!!
    SIGNAL sccb_regConfig1_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000"; -- reversed order!!!

    -- data 2 [COM10] Register h15, config data: h40, config data:  HSYNCH/VSYNCH Polarity (active low), use HSYNCH instead of HREF
    SIGNAL sccb_regAddress2_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "10101000"; -- reversed order!!!
    SIGNAL sccb_regConfig2_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01000011"; -- reversed order!!!

    SIGNAL sccb_data_r : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sccb_startWrite_r : STD_LOGIC;
    -- BEGIN ------ debug -> generate repeated start signal for i2c tb ---------
    SIGNAL prescale_var_r : INTEGER RANGE 0 TO 100000000 := 0;
    -- END   ------ debug -> generate repeated start signal for i2c tb ---------
    SIGNAL clk_25MHz_r : STD_LOGIC;
    SIGNAL locked_clk25MHz_r : STD_LOGIC;

    -- Component for logic analyzer
    COMPONENT ila_cam

        PORT (
            clk : IN STD_LOGIC;
            probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            probe3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            probe4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
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
    -- connect vga directly throug fpga
    vga_hsync <= cam_href_i;
    vga_vsync <= cam_vsync_i;
    vga_green_o <= cam_d_i(7 DOWNTO 4);
    vga_red_o <= cam_d_i(3 DOWNTO 2) & "00";
    vga_blue_o <= cam_d_i(1 DOWNTO 0) & "00";

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
    dataSelection_comb_proc : PROCESS (sw)
    BEGIN

        CASE(sw) IS

            WHEN "0000000000000000" =>
            sccb_data_r <= sccb_regConfig_r & sccb_regAddress_r;

            WHEN "0000000000000001" =>
            sccb_data_r <= sccb_regConfig1_r & sccb_regAddress1_r;

            WHEN "0000000000000010" =>
            sccb_data_r <= sccb_regConfig2_r & sccb_regAddress2_r;

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

    -- TODO(MaBa): Muss ich Daten einsyncen?
    -- TODO(MaBa): Add ROM with config data
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
    -- INTEGRATGED LOGIC ANALYZER 
    ----------------------------------------------------------------------------
    ila_cam_inst : ila_cam
    PORT MAP(
        clk => clk_100MHz_i,
        probe0 => (0 => cam_pclk_i),
        probe1 => (0 => cam_vsync_i),
        probe2 => (0 => cam_href_i),
        probe3 => cam_d_i,
        probe4 => (0 => rst_n_i)
    );
END Behavioral;