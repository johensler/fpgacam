

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

-- This component coutns through horizontal pixels (640 x 480 at 25 MHz)
-- Visible area 640 pixel
--Front porch 16 pixel = 656
--Synch pulse 96 pixel = 752
--Back porch 48 pixel = 800
-- > Whole line 800 pixel
ENTITY hsynch IS
    PORT (
        clk_pix_in : IN STD_LOGIC;
        rst_in : IN STD_LOGIC;
        hdisplay_out : OUT STD_LOGIC;
        hsynch_out : OUT STD_LOGIC;
        hline_end_out : OUT STD_LOGIC;
        hpixel_count_out : OUT INTEGER);
END hsynch;

ARCHITECTURE Behavioral OF hsynch IS

    CONSTANT count_max : INTEGER := 800 - 1;
    CONSTANT display_max : INTEGER := 640 - 1;
    CONSTANT front_porch_end : INTEGER := 656 - 1;
    CONSTANT back_porch_start : INTEGER := 752 - 1;

    SIGNAL count : INTEGER := 0; -- Counts though the pixels
    SIGNAL hline_end : STD_LOGIC := '0'; -- Signals end of horizontal line
    SIGNAL hdisplay_end : STD_LOGIC := '0'; -- Signals end if horizontal display area
    SIGNAL hsynch_start : STD_LOGIC := '0'; -- Signal to start synch pulse
    SIGNAL hsynch_end : STD_LOGIC := '0';-- Signal to end synch pulse

BEGIN
    -- Counting thourgh horizontal pixel
    create_pixel_clk : PROCESS (clk_pix_in)
    BEGIN
        IF (rising_edge(clk_pix_in)) THEN
            IF rst_in = '1' THEN
                count <= 0;
                hline_end <= '0'; -- reset end line
                hdisplay_end <= '0'; -- reset end of display area
                hsynch_start <= '0'; -- reset start of synch pulse
                hsynch_end <= '0'; -- reset end of synch pulse
            ELSIF count = count_max THEN
                count <= 0; -- reset count
                hline_end <= '1'; -- set end line
            ELSIF count = display_max THEN
                hdisplay_end <= '1'; -- set end of display area
                count <= count + 1; -- increment count
            ELSIF count = front_porch_end THEN
                hsynch_start <= '1'; -- set start of synch pulse
                count <= count + 1; -- increment count
            ELSIF count = back_porch_start THEN
                hsynch_end <= '1'; -- set end of synch pulse
                count <= count + 1; -- increment count
            ELSE
                count <= count + 1; -- increment count
                hline_end <= '0'; -- reset end line
                hdisplay_end <= '0'; -- reset end of display area
                hsynch_start <= '0'; -- reset start of synch pulse
                hsynch_end <= '0'; -- reset end of synch pulse
            END IF;
        END IF;
    END PROCESS create_pixel_clk;

    set_hdisplay_out : PROCESS (hdisplay_end, hline_end)
    BEGIN
        IF hline_end = '1' THEN -- if end of line reached, we start displaying again
            hdisplay_out <= '0';
        END IF;
        IF hdisplay_end = '1' THEN -- end display when reached display end
            hdisplay_out <= '1';
        END IF;
    END PROCESS set_hdisplay_out;

    set_hsynch_out : PROCESS (hsynch_start, hsynch_end)
    BEGIN
        IF hsynch_start = '1' THEN -- if end of line reached, we start displaying again
            hsynch_out <= '0';
        END IF;
        IF hsynch_end = '1' THEN -- end display when reached display end
            hsynch_out <= '1';
        END IF;
    END PROCESS set_hsynch_out;

    hline_end_out <= hline_end; -- Wire line end to output to be used as clock for vsynch
    hpixel_count_out <= count; -- Output current horizontal pixel count

END Behavioral;