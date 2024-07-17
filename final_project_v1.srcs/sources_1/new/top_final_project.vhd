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
        vga_o : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
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
    SIGNAL siod_o_reg_r : STD_LOGIC;
    SIGNAL siod_o_reg2_r : STD_LOGIC;

    SIGNAL siod_control_r : STD_LOGIC := '1'; -- inital high -> input

    SIGNAL sccb_data_r : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sccb_startWrite_r : STD_LOGIC;
    -- BEGIN ------ debug -> generate repeated start signal for i2c tb ---------
    SIGNAL prescale_var_r : INTEGER RANGE 0 TO 100000000 := 0;
    -- END   ------ debug -> generate repeated start signal for i2c tb ---------
    SIGNAL clk_25MHz_r : STD_LOGIC;
    SIGNAL locked_clk25MHz_r : STD_LOGIC;

    SIGNAL startup_delay_finished : STD_LOGIC;
    SIGNAL reset_startup_delay : STD_LOGIC;
    SIGNAL startup_delay_count : INTEGER := 0;
    SIGNAL i2c_cycle_count : INTEGER := 0;
    SIGNAL i2c_config_address_counter : unsigned(2 DOWNTO 0) := "000";
    SIGNAL i2c_start_write_r : STD_LOGIC;
    -- Component for logic analyzer
    COMPONENT ila_cam

        PORT (
            clk : IN STD_LOGIC;
            probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            probe2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0)

        );
    END COMPONENT;

    COMPONENT vga_buffer IS
        PORT (
            cam_pclk_i : IN STD_LOGIC;
            rst_i : IN STD_LOGIC;
            cam_href_i : IN STD_LOGIC;
            cam_vsynch_i : IN STD_LOGIC;
            cam_d_i : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            vga_d_o : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
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
    -- After reset config data in ROM is automatically send to configure camera
    -- make sure last led (num 15) wont light up, otherwise communication went 
    -- wrong (LED lights up when ACK error is latched)
    ----------------------------------------------------------------------------
    -- counter for short delay
    i2c_startup_delay_proc : PROCESS (clk_100MHz_i, rst_n_i)
    BEGIN
        IF (rst_n_i = '1') THEN
            -- reset all output signals of process
            startup_delay_finished <= '0';
            startup_delay_count <= 0;
        ELSIF (reset_startup_delay = '1') THEN
            startup_delay_finished <= '0';
        ELSIF rising_edge(clk_100MHz_i) THEN
            IF startup_delay_count < 1000000 THEN
                -- increment count    
                startup_delay_count <= startup_delay_count + 1;
                startup_delay_finished <= '0';
            ELSE
                startup_delay_finished <= '1';
                --startup_delay_count <= 0;
            END IF;
        END IF;
    END PROCESS i2c_startup_delay_proc;

    -- counter that generates address for rom and write signals for i2c
    i2c_config_counter_proc : PROCESS (clk_100MHz_i, rst_n_i)
    BEGIN
        IF (rst_n_i = '1') THEN
            -- reset all output signals of process
            i2c_config_address_counter <= "000";
            i2c_start_write_r <= '0';
            i2c_cycle_count <= 0;
            debug_o <= '0';
            reset_startup_delay <= '0';
        ELSIF rising_edge(clk_100MHz_i) THEN
            IF startup_delay_finished = '1' THEN
                debug_o <= '1';
                IF i2c_cycle_count < 10000 THEN
                    i2c_start_write_r <= '0';
                    i2c_cycle_count <= i2c_cycle_count + 1;
                ELSIF i2c_cycle_count = 10000 THEN
                    IF i2c_config_address_counter < "011" THEN
                        i2c_config_address_counter <= i2c_config_address_counter + 1;
                    ELSE
                        i2c_config_address_counter <= "000";
                        reset_startup_delay <= '1';
                    END IF;
                    i2c_cycle_count <= i2c_cycle_count + 1;
                ELSIF i2c_cycle_count < 10260 THEN
                    i2c_start_write_r <= '1';
                    i2c_cycle_count <= i2c_cycle_count + 1;
                ELSE
                    i2c_cycle_count <= 0;
                END IF;
            ELSE
                i2c_cycle_count <= 0;
                i2c_start_write_r <= '0';
            END IF;
        END IF;
    END PROCESS i2c_config_counter_proc;

    -- inst rom with i2c config data
    i2c_config_rom_inst : ENTITY work.i2c_config_rom
        PORT MAP(
            address_i => STD_LOGIC_VECTOR(i2c_config_address_counter),
            data_o => sccb_data_r
        );

    -- inst i2c controler 
    i2c_controler_inst : ENTITY work.i2c_controler
        PORT MAP(
            clk_100MHz_i => clk_100MHz_i,
            rst_n_i => rst_n_i,
            data_wr_i => sccb_data_r,
            btnU_n_i => i2c_start_write_r,
            scl_o_o => sioc_control_r,
            ack_error_o => sccb_ack_err_o,
            ack_error_latch_o => sccb_ack_error_latch_o,
            sda_o_o => siod_control_r,
            sda_i => siod_o_reg2_r,
            start_fsm_debug_o => start_fsm_debug_o
        );

    -- Purpose: Double-register the incoming data (I2C ACK)
    -- (It removes problems caused by metastabiliy)
    sync_i2c_i_proc : PROCESS (clk_100MHz_i, rst_n_i)
    BEGIN
        IF (rst_n_i = '1') THEN
            siod_o_reg_r <= '0';
            siod_o_reg2_r <= '0';
        ELSIF rising_edge(clk_100MHz_i) THEN
            siod_o_reg_r <= siod_o_r;
            siod_o_reg2_r <= siod_o_reg_r;
        END IF;
    END PROCESS sync_i2c_i_proc;

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
        probe1 => (0 => cam_href_i),
        probe2 => cam_d_i
    );

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
            vga_d_o => vga_o,
            Hsync_o => vga_hsync,
            Vsync_o => vga_vsync
        );
END Behavioral;