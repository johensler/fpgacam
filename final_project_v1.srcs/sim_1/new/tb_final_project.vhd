LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY top_final_project_tb IS
END top_final_project_tb;

ARCHITECTURE behavior OF top_final_project_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT top_final_project
    PORT(
        clk_100MHz_i : IN std_logic;
        rst_n_i : IN std_logic;
        cam_vsync_i : IN std_logic;
        cam_href_i : IN std_logic;
        cam_pclk_i : IN std_logic;
        cam_xclk_o : OUT std_logic;
        cam_d_i : IN std_logic_vector(7 DOWNTO 0);
        cam_reset_o : OUT std_logic;
        cam_pwdn_o : OUT std_logic;
        cam_sioc_io : INOUT std_logic;
        cam_siod_io : INOUT std_logic;
        vga_hsync : OUT std_logic;
        vga_vsync : OUT std_logic;
        vga_red_o : OUT std_logic_vector(3 DOWNTO 0);
        vga_green_o : OUT std_logic_vector(3 DOWNTO 0);
        vga_blue_o : OUT std_logic_vector(3 DOWNTO 0);
        sccb_ack_err_o : OUT std_logic;
        sccb_ack_error_latch_o : OUT std_logic;
        btnU_n_i : IN std_logic; -- button up!
        debug_o : OUT std_logic;
        start_fsm_debug_o : OUT std_logic;
        dataSelection_switch_i : IN std_logic;
        dataSelectionControlLed_o : OUT std_logic
    );
    END COMPONENT;

    -- Signals for UUT
    signal clk_100MHz_i : std_logic := '0';
    signal rst_n_i : std_logic := '0';
    signal cam_vsync_i : std_logic := '0';
    signal cam_href_i : std_logic := '0';
    signal cam_pclk_i : std_logic := '0';
    signal cam_xclk_o : std_logic;
    signal cam_d_i : std_logic_vector(7 DOWNTO 0) := (others => '0');
    signal cam_reset_o : std_logic;
    signal cam_pwdn_o : std_logic;
    signal cam_sioc_io : std_logic;
    signal cam_siod_io : std_logic;
    signal vga_hsync : std_logic;
    signal vga_vsync : std_logic;
    signal vga_red_o : std_logic_vector(3 DOWNTO 0);
    signal vga_green_o : std_logic_vector(3 DOWNTO 0);
    signal vga_blue_o : std_logic_vector(3 DOWNTO 0);
    signal sccb_ack_err_o : std_logic;
    signal sccb_ack_error_latch_o : std_logic;
    signal btnU_n_i : std_logic := '0'; -- button up!
    signal debug_o : std_logic;
    signal start_fsm_debug_o : std_logic;
    signal dataSelection_switch_i : std_logic := '0';
    signal dataSelectionControlLed_o : std_logic;

    -- Clock period definitions
    constant clk_period : time := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: top_final_project PORT MAP (
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
        vga_red_o => vga_red_o,
        vga_green_o => vga_green_o,
        vga_blue_o => vga_blue_o,
        sccb_ack_err_o => sccb_ack_err_o,
        sccb_ack_error_latch_o => sccb_ack_error_latch_o,
        btnU_n_i => btnU_n_i,
        debug_o => debug_o,
        start_fsm_debug_o => start_fsm_debug_o,
        dataSelection_switch_i => dataSelection_switch_i,
        dataSelectionControlLed_o => dataSelectionControlLed_o
    );

    -- Clock process definitions
    clk_process :process
    begin
        clk_100MHz_i <= '0';
        wait for clk_period/2;
        clk_100MHz_i <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin		
        -- hold reset state for 100 ns.
        wait for 100 ns;  
        rst_n_i <= '1';
        wait for 500 ns;
        rst_n_i <= '0';

        -- Test button press
        btnU_n_i <= '1';
        wait for 20 ns;
        btnU_n_i <= '0';

        wait;
    end process;

END;
