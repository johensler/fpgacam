LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY top_final_project_tb IS
END top_final_project_tb;

ARCHITECTURE behavior OF top_final_project_tb IS
    COMPONENT top_final_project IS
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
    END COMPONENT;

    -- Signals for UUT
    SIGNAL clk_100MHz_i : STD_LOGIC := '0';
    SIGNAL rst_n_i : STD_LOGIC := '0';
    SIGNAL cam_vsync_i : STD_LOGIC := '0';
    SIGNAL cam_href_i : STD_LOGIC := '0';
    SIGNAL cam_pclk_i : STD_LOGIC := '0';
    SIGNAL cam_xclk_o : STD_LOGIC;
    SIGNAL cam_d_i : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cam_reset_o : STD_LOGIC;
    SIGNAL cam_pwdn_o : STD_LOGIC;
    SIGNAL cam_sioc_io : STD_LOGIC;
    SIGNAL cam_siod_io : STD_LOGIC;
    SIGNAL vga_hsync : STD_LOGIC;
    SIGNAL vga_vsync : STD_LOGIC;
    SIGNAL vga_o : STD_LOGIC_VECTOR(11 DOWNTO 0);
    SIGNAL sccb_ack_err_o : STD_LOGIC;
    SIGNAL sccb_ack_error_latch_o : STD_LOGIC;
    SIGNAL btnU_n_i : STD_LOGIC := '0'; -- button up!
    SIGNAL debug_o : STD_LOGIC;
    SIGNAL start_fsm_debug_o : STD_LOGIC;
    SIGNAL sw_i : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL dataSelectionControlLed_o : STD_LOGIC;

    -- Clock period definitions
    CONSTANT clk_period : TIME := 10 ns;
    CONSTANT clk_period_pxl : TIME := 40 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut : top_final_project PORT MAP(
        clk_100MHz_i => clk_100MHz_i,
        rst_n_i => rst_n_i,
        cam_vsync_i => cam_vsync_i,
        cam_href_i => cam_href_i,
        cam_pclk_i => cam_pclk_i,
        cam_xclk_o => cam_xclk_o,
        cam_d_i => cam_d_i,
        cam_reset_o => cam_reset_o,
        cam_pwdn_o => cam_pwdn_o,
        cam_sioc_io => cam_sioc_io,
        cam_siod_io => cam_siod_io,
        vga_hsync => vga_hsync,
        vga_vsync => vga_vsync,
        vga_o => vga_o,
        sccb_ack_err_o => sccb_ack_err_o,
        sccb_ack_error_latch_o => sccb_ack_error_latch_o,
        btnU_n_i => btnU_n_i,
        debug_o => debug_o,
        start_fsm_debug_o => start_fsm_debug_o,
        sw_i => sw_i,
        dataSelectionControlLed_o => dataSelectionControlLed_o
    );

    -- Clock process definitions
    clk_process : PROCESS
    BEGIN
        clk_100MHz_i <= '0';
        WAIT FOR clk_period/2;
        clk_100MHz_i <= '1';
        WAIT FOR clk_period/2;
    END PROCESS;

    -- Clock process definitions
    clk_process2 : PROCESS
    BEGIN
        cam_pclk_i <= '0';
        WAIT FOR clk_period_pxl/2;
        cam_pclk_i <= '1';
        WAIT FOR clk_period_pxl/2;
    END PROCESS;

    -- Stimulus process
    stim_proc : PROCESS
    BEGIN
        -- hold reset state for 100 ns.
        WAIT FOR 100 ns;
        rst_n_i <= '1';
        WAIT FOR 500 ns;
        rst_n_i <= '0';

        -- Test button press
        btnU_n_i <= '1';
        WAIT FOR 20 ns;
        btnU_n_i <= '0';

        WAIT;
    END PROCESS;

END;