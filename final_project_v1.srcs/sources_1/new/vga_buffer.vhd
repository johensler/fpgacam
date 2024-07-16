LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY vga_buffer IS
    PORT (
        cam_pclk_i : IN STD_LOGIC;
        rst_i : IN STD_LOGIC;
        cam_href_i : IN STD_LOGIC;
        cam_d_i : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        vga_d_o : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
        Hsync_o : OUT STD_LOGIC;
        Vsync_o : OUT STD_LOGIC
    );
END vga_buffer;

ARCHITECTURE Behavioral OF vga_buffer IS

    -- Signals for VGA receiver of camera
    SIGNAL col_cnt : INTEGER := 0; --  Counts thourgh pixel in one line
    SIGNAL row_cnt : INTEGER := 0; -- Counts the lines / rows
    SIGNAL wr_en_cam : STD_LOGIC := '0';
    SIGNAL wr_addr_cam : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');

    --Signals for VGA output driver
    SIGNAL clk_lines : STD_LOGIC; -- line clock for vsynch

    SIGNAL hdisplay : STD_LOGIC; -- active low for horizontal display
    SIGNAL vdisplay : STD_LOGIC; -- active low for vertical display

    SIGNAL hpixel_count : INTEGER; -- Index of current hozizontal pixel
    SIGNAL vpixel_count : INTEGER; -- Index of current vertival pixel

    SIGNAL rd_addr_vga : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL d_vga : STD_LOGIC_VECTOR(7 DOWNTO 0);

    -- VGA hsynch and vsynch signals
    COMPONENT hsynch
        PORT (
            clk_pix_in : IN STD_LOGIC;
            rst_in : IN STD_LOGIC;
            hline_end_out : OUT STD_LOGIC;
            hsynch_out : OUT STD_LOGIC;
            hdisplay_out : OUT STD_LOGIC;
            hpixel_count_out : OUT INTEGER
        );
    END COMPONENT hsynch;

    COMPONENT vsynch
        PORT (
            clk_pix_in : IN STD_LOGIC;
            rst_in : IN STD_LOGIC;
            vsynch_out : OUT STD_LOGIC;
            vdisplay_out : OUT STD_LOGIC;
            vpixel_count_out : OUT INTEGER
        );
    END COMPONENT vsynch;
BEGIN

    ----------------------------------------------------------------------------
    -- Instances
    ----------------------------------------------------------------------------
    dual_port_ram_inst : ENTITY work.dual_port_ram -- port A for camera, port B for VGA output
        PORT MAP(
            clk => cam_pclk_i,
            we_a => wr_en_cam,
            addr_a => wr_addr_cam,
            data_in_a => cam_d_i,
            addr_b => rd_addr_vga,
            data_out_b => d_vga
        );

    -- Instantiate the hsynch component
    HSYNCH_inst : hsynch
    PORT MAP(
        clk_pix_in => cam_pclk_i,
        rst_in => rst_i,
        hline_end_out => clk_lines,
        hsynch_out => Hsync_o,
        hdisplay_out => hdisplay,
        hpixel_count_out => hpixel_count
    );

    -- Instantiate the vsynch component
    VSYNCH_inst : vsynch
    PORT MAP(
        clk_pix_in => clk_lines,
        rst_in => rst_i,
        vsynch_out => Vsync_o,
        vdisplay_out => vdisplay,
        vpixel_count_out => vpixel_count
    );

    ----------------------------------------------------------------------------
    -- Processes
    ----------------------------------------------------------------------------

    -- The Basys Board has not enough memory so save the 8bit 640x480 image. Thus we only save every second pixel.
    -- Generate wr signal for BRAM
    col_cnt_process : PROCESS (cam_pclk_i)
    BEGIN
        IF rising_edge(cam_pclk_i) THEN
            IF cam_href_i = '1' THEN
                col_cnt <= col_cnt + 1;
                IF col_cnt MOD 2 = 0 THEN -- Enable write on every 4th pixel
                    wr_en_cam <= '1';
                ELSE
                    wr_en_cam <= '0';
                END IF;
            ELSE
                col_cnt <= 0; -- Reset pixel count at line end
                wr_en_cam <= '0'; -- Ensure write enable is reset at line end
            END IF;
        END IF;
    END PROCESS;

    --Count the rows
    row_cnt_process : PROCESS (cam_href_i)
    BEGIN
        IF cam_href_i = '0' THEN
            IF row_cnt = 480 THEN -- reset if frame finished
                row_cnt <= 1;
            ELSE
                row_cnt <= row_cnt + 1;
            END IF;
        END IF;
    END PROCESS;

    -- Generate writing adress 
    -- We store every second pixel in a row -> 320x480 = 153600 adress spaces then reset and start with next frame
    wr_addr_cam_process : PROCESS (wr_en_cam)
    BEGIN
        IF falling_edge(wr_en_cam) THEN --change adress always at falling edge, writing is then done on rising edge
            IF unsigned(wr_addr_cam) = 153599 THEN
                wr_addr_cam <= (OTHERS => '0');
            ELSE
                wr_addr_cam <= STD_LOGIC_VECTOR(unsigned(wr_addr_cam) + 1);
            END IF;
        END IF;
    END PROCESS;

    --VGA OUTPUT
    output_process : PROCESS (cam_pclk_i)
    BEGIN
        IF hpixel_count < 640 AND vpixel_count < 480 THEN
            -- vga_d_o(0-3) is red, vga_d_o(4-7) is blue, vga_d_o(8-11) is green, 
            -- d_vga is GRB 4:2:2
            rd_addr_vga <= STD_LOGIC_VECTOR(to_unsigned(vpixel_count * 320 + (hpixel_count / 2), 18));
            vga_d_o <= d_vga(3 DOWNTO 0) & d_vga(7 DOWNTO 6) & "00" & d_vga(5 DOWNTO 4) & "00";

        ELSE
            vga_d_o <= (OTHERS => '0');

        END IF;
    END PROCESS output_process;

END Behavioral;