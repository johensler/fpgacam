LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY vga_buffer IS
    PORT (
        cam_pclk_i : IN STD_LOGIC;
        rst_i : IN STD_LOGIC;
        cam_href_i : IN STD_LOGIC;
        cam_d_i : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        vga_d_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END vga_buffer;

ARCHITECTURE Behavioral OF vga_buffer IS

    SIGNAL col_cnt : INTEGER := 0; --  Counts thourgh pixel in one line
    SIGNAL row_cnt : INTEGER := 0; -- Counts the lines / rows

    SIGNAL is_cnt : STD_LOGIC := '0';

    SIGNAL wr_en : STD_LOGIC := '0';
    SIGNAL rd_en : STD_LOGIC := '0';

    SIGNAL wr_addr : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');

    COMPONENT frame_buffer
        PORT (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            clkb : IN STD_LOGIC;
            addrb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;
BEGIN

    frame_buffer_inst : frame_buffer
    PORT MAP(
        clka => cam_pclk_i,
        wea => (0 => wr_en),
        addra => wr_addr,
        dina => cam_d_i,
        clkb => cam_pclk_i,
        addrb => wr_addr,
        doutb => vga_d_o
    );

    --Process to start and end counting the pixels in a line
    write_process : PROCESS (cam_pclk_i)
    BEGIN
        IF rising_edge(cam_pclk_i) THEN
            IF cam_href_i = '1' THEN -- Check if line is in display region
                is_cnt <= '1'; -- Start pixel counting when starting a new line
            ELSE
                is_cnt <= '0'; -- Stop pixel counting when ending a line
            END IF;
        END IF;
    END PROCESS;

    -- The Basys Board has not enough memory so save the 8bit 640x480 image. Thus we only save every second pixel.
    -- Generate wr signal for BRAM
    col_cnt_process : PROCESS (cam_pclk_i)
    BEGIN
        IF rising_edge(cam_pclk_i) THEN
            IF is_cnt = '1' THEN
                col_cnt <= col_cnt + 1;
                wr_en <= NOT wr_en; -- Write only every second pixel
            ELSE
                col_cnt <= 0; -- Reset pixel count at line end
            END IF;
        END IF;
    END PROCESS;

    --Count the rows
    row_cnt_process : PROCESS (is_cnt)
    BEGIN
        IF is_cnt = '0' THEN
            IF row_cnt = 479 THEN -- reset if frame finished
                row_cnt <= 0;
            END IF;
            row_cnt <= row_cnt + 1;
        END IF;
    END PROCESS;

    -- Generate writing adress
    wr_addr_process : PROCESS (wr_en)
    BEGIN
        IF wr_en = '1'THEN
            wr_addr <= STD_LOGIC_VECTOR(unsigned(wr_addr) + 1);
        END IF;
    END PROCESS;

END Behavioral;