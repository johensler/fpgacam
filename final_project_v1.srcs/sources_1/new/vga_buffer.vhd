LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY vga_buffer IS
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
END vga_buffer;

ARCHITECTURE Behavioral OF vga_buffer IS

    -- Signals for VGA receiver of camera
    SIGNAL wr_en_cam : STD_LOGIC := '0'; -- Write enable for camera input data
    SIGNAL wr_addr_cam : STD_LOGIC_VECTOR(16 DOWNTO 0); -- 18 bit write adress for camera input data (changes every second pixel)
    SIGNAL d_received : STD_LOGIC_VECTOR(11 DOWNTO 0); -- Received 8-bit pixel value
    SIGNAL d_buffer : STD_LOGIC_VECTOR(15 DOWNTO 0); -- Data buffer to combine the two bytes that are send seperately
    SIGNAL full_addr : STD_LOGIC_VECTOR(18 DOWNTO 0); -- 19 bit adress, that changes for every pixel read
    SIGNAL full_addr_next : STD_LOGIC_VECTOR(18 DOWNTO 0); -- Next 19 bit adress

    --Signals for VGA output driver
    SIGNAL clk_lines : STD_LOGIC; -- line clock for vsynch
    SIGNAL hdisplay : STD_LOGIC; -- active low for horizontal display
    SIGNAL vdisplay : STD_LOGIC; -- active low for vertical display
    SIGNAL hpixel_count : INTEGER; -- Index of current hozizontal pixel
    SIGNAL vpixel_count : INTEGER; -- Index of current vertival pixel
    SIGNAL rd_addr_vga : STD_LOGIC_VECTOR(16 DOWNTO 0) := (OTHERS => '0'); -- Adress for reading a pixel value
    SIGNAL rd_d_vga : STD_LOGIC_VECTOR(11 DOWNTO 0); -- Read data from frame buffer

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
    dual_port_ram_inst : ENTITY work.dual_port_ram -- port A for writing camera data, port B for reading 
        PORT MAP(
            clk => cam_pclk_i,
            we_a => wr_en_cam,
            addr_a => wr_addr_cam,
            data_in_a => d_received,
            addr_b => rd_addr_vga,
            data_out_b => rd_d_vga
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
    -- ´Processes
    ----------------------------------------------------------------------------
    -- Receiver camera data and save it to frame buffer
    -- Data is send in 2 cycles. Two byte are send for each pixel. 
    -- In the first cycle d_buffer loads the first 8bit and in the next cycle the second 8bit are read. 
    -- Then the write enable will be set to true and the data is stored in the frame buffer.

    wr_addr_cam <= full_addr(18 DOWNTO 2); -- wr_addr leaves out lsb to only save every second pixel

    PROCESS (cam_pclk_i)
    BEGIN
        IF rising_edge(cam_pclk_i) THEN
            IF rst_i = '1' THEN
                wr_en_cam <= '1';-- Reset to 1 so first byte is not written
                full_addr <= (OTHERS => '0');
                full_addr_next <= (OTHERS => '0');
            ELSIF cam_vsynch_i = '1' THEN -- check if frame is over, if true reset the addr and write enable
                wr_en_cam <= '1'; -- Reset to 1 so first byte is not written
                full_addr <= (OTHERS => '0');
                full_addr_next <= (OTHERS => '0');
            ELSE
                IF wr_en_cam = '1' THEN -- If writing was enabled in this cycle: Go to next adress in frame buffer
                    full_addr_next <= STD_LOGIC_VECTOR(unsigned(full_addr_next) + 1);
                END IF;

                full_addr <= full_addr_next; -- Increment adress
                wr_en_cam <= cam_href_i AND NOT wr_en_cam; -- Set wr_enable signal to true or false, depending on the current cycle. (Save every second pixel)

                d_buffer <= d_buffer(7 DOWNTO 0) & cam_d_i; -- Store incoming data in lower 8 bits and move old lower 8 bits into higher 8 bits 

                IF sw_i(15 DOWNTO 13) = "000" THEN --444 xRGB
                    d_received <= d_buffer(11 DOWNTO 8) & d_buffer(7 DOWNTO 4) & d_buffer(3 DOWNTO 0); -- Format of d_received = Red(8 DOWNTO 6) Green(5 DOWNTO 3) Blue(2 DOWNTO 0)
                ELSIF sw_i(15 DOWNTO 13) = "001" THEN--RGB565
                    d_received <= d_buffer(15 DOWNTO 12) & d_buffer(10 DOWNTO 7) & d_buffer(4 DOWNTO 1); -- Format of d_received = Red(8 DOWNTO 6) Green(5 DOWNTO 3) Blue(2 DOWNTO 0)
                ELSIF sw_i(15 DOWNTO 13) = "010" THEN --GRB565
                    d_received <= d_buffer(10 DOWNTO 7) & d_buffer(15 DOWNTO 12) & d_buffer(4 DOWNTO 1);
                END IF;

            END IF;
        END IF;
    END PROCESS;
    --VGA OUTPUT
    output_process : PROCESS (cam_pclk_i)
    BEGIN
        IF hpixel_count < 640 AND vpixel_count < 480 THEN -- Check if display area is active
            rd_addr_vga <= STD_LOGIC_VECTOR(to_unsigned(vpixel_count * 160 + (hpixel_count / 4), 17)); -- Calculate adress in framebuffer
            vga_red <= rd_d_vga(11 DOWNTO 8);
            vga_green <= rd_d_vga(7 DOWNTO 4);
            vga_blue <= rd_d_vga(3 DOWNTO 0);

        ELSE
            vga_red <= (OTHERS => '0');
            vga_green <= (OTHERS => '0');
            vga_blue <= (OTHERS => '0');

        END IF;
    END PROCESS output_process;

END Behavioral;