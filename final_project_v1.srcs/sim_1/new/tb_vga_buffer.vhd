LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY tb_vga_buffer IS
END tb_vga_buffer;

ARCHITECTURE behavior OF tb_vga_buffer IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT vga_buffer
        PORT (
            cam_pclk_i : IN STD_LOGIC;
            rst_i : IN STD_LOGIC;
            cam_href_i : IN STD_LOGIC;
            cam_vsynch_i : IN STD_LOGIC;
            cam_d_i : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            vga_d_o : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
        );
    END COMPONENT;

    -- Signals to connect to UUT
    SIGNAL cam_pclk_i : STD_LOGIC := '0';
    SIGNAL rst_i : STD_LOGIC := '0';
    SIGNAL cam_href_i : STD_LOGIC := '0';
    SIGNAL cam_vsynch_i : STD_LOGIC := '0';
    SIGNAL cam_d_i : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL vga_d_o : STD_LOGIC_VECTOR(11 DOWNTO 0);

    -- Clock period definitions
    CONSTANT clk_period : TIME := 40 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut : vga_buffer PORT MAP(
        cam_pclk_i => cam_pclk_i,
        rst_i => rst_i,
        cam_href_i => cam_href_i,
        cam_vsynch_i => cam_vsynch_i,
        cam_d_i => cam_d_i,
        vga_d_o => vga_d_o
    );

    -- Clock process definitions
    clk_process : PROCESS
    BEGIN
        cam_pclk_i <= '0';
        WAIT FOR clk_period/2;
        cam_pclk_i <= '1';
        WAIT FOR clk_period/2;
    END PROCESS;

    -- Stimulus process
    stim_proc : PROCESS
        VARIABLE count : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
        VARIABLE line_count : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
    BEGIN
        -- hold reset state for 100 ns.
        WAIT FOR 100 ns;
        rst_i <= '1';
        WAIT FOR 500 ns;
        rst_i <= '0';
        WAIT FOR 20 ns;

        -- Simualte two frames
        frame_loop : WHILE unsigned(line_count) < 480 LOOP
            cam_href_i <= '1'; -- Start a displaying a line
            line_loop : WHILE unsigned(count) < 1280 LOOP -- two byte per pixel

                cam_d_i <= "10101010"; -- some mock data
                WAIT FOR clk_period;
                count := STD_LOGIC_VECTOR(unsigned(count) + 1);

            END LOOP; -- line_loop
            cam_href_i <= '0'; -- Stop a displaying a line

            WAIT FOR 144 * clk_period; -- Time in between two line href 

            line_count := STD_LOGIC_VECTOR(unsigned(line_count) + 1);
            count := (OTHERS => '0'); -- reset col counter;
        END LOOP; -- frame_loop

        WAIT FOR 10 * 784 * 2 * clk_period; -- Time after last href before vsynch (*2 because 2 byte per pixel -> one t_p is 2*clk_period)
        cam_vsynch_i <= '1';
        WAIT FOR 3 * 784 * 2 * clk_period; -- Time of vsynch
        cam_vsynch_i <= '0';
        WAIT FOR 17 * 784 * 2 * clk_period; -- Time after vsynch before next lines first href

        count := (OTHERS => '0');
        line_count := (OTHERS => '0');

        frame_loop2 : WHILE unsigned(line_count) < 480 LOOP
            cam_href_i <= '1'; -- Start a displaying a line
            line_loop2 : WHILE unsigned(count) < 640 LOOP

                cam_d_i <= "10101010"; -- some mock data
                WAIT FOR clk_period;
                count := STD_LOGIC_VECTOR(unsigned(count) + 1);

            END LOOP; -- line_loop
            cam_href_i <= '0'; -- Start a displaying a line

            WAIT FOR 144 * clk_period;

            line_count := STD_LOGIC_VECTOR(unsigned(line_count) + 1);
            count := (OTHERS => '0'); -- reset col counter;

        END LOOP; -- frame_loop
        WAIT;
    END PROCESS;

END;