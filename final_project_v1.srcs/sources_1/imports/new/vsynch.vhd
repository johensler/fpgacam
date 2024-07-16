LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
-- This component coutns through vertical pixels (640 x 480 at 25 MHz)
-- Visible area 480 pixel
--Front porch 10 pixel = 490
--Synch pulse 2 pixel = 492
--Back porch 33 pixel = 525
-- > Whole line 525 pixel
ENTITY vsynch IS
    PORT (
        clk_pix_in : IN STD_LOGIC;
        rst_in : IN STD_LOGIC;
        vdisplay_out : OUT STD_LOGIC;
        vsynch_out : OUT STD_LOGIC;
        vpixel_count_out : OUT INTEGER);
END vsynch;

ARCHITECTURE Behavioral OF vsynch IS

    CONSTANT count_max : INTEGER := 525 - 1;
    CONSTANT display_max : INTEGER := 480 - 1;
    CONSTANT front_porch_end : INTEGER := 490 - 1;
    CONSTANT back_porch_start : INTEGER := 492 - 1;

    SIGNAL count : INTEGER := 0; -- Counts though the pixels
    SIGNAL vline_end : STD_LOGIC := '0'; -- Signals end of vertical line
    SIGNAL vdisplay_end : STD_LOGIC := '0'; -- Signals end if vertical display area
    SIGNAL vsynch_start : STD_LOGIC := '0'; -- Signal to start synch pulse
    SIGNAL vsynch_end : STD_LOGIC := '0';-- Signal to end synch pulse
BEGIN
    -- Counting thourgh vertical pixel
    create_pixel_clk : PROCESS (clk_pix_in)
    BEGIN
        IF (rising_edge(clk_pix_in)) THEN
            IF rst_in = '1' THEN
                count <= 0;
                vline_end <= '0'; -- reset end line
                vdisplay_end <= '0'; -- reset end of display area
                vsynch_start <= '0'; -- reset start of synch pulse
                vsynch_end <= '0'; -- reset end of synch pulse
            ELSIF count = count_max THEN
                count <= 0; -- reset count
                vline_end <= '1'; -- set end line
            ELSIF count = display_max THEN
                vdisplay_end <= '1'; -- set end of display area
                count <= count + 1; -- increment count
            ELSIF count = front_porch_end THEN
                vsynch_start <= '1'; -- set start of synch pulse
                count <= count + 1; -- increment count
            ELSIF count = back_porch_start THEN
                vsynch_end <= '1'; -- set end of synch pulse
                count <= count + 1; -- increment count
            ELSE
                count <= count + 1; -- increment count
                vline_end <= '0'; -- reset end line
                vdisplay_end <= '0'; -- reset end of display area
                vsynch_start <= '0'; -- reset start of synch pulse
                vsynch_end <= '0'; -- reset end of synch pulse
            END IF;
        END IF;
    END PROCESS create_pixel_clk;

    set_vdisplay_out : PROCESS (vdisplay_end, vline_end)
    BEGIN
        IF vline_end = '1' THEN -- if end of line reached, we start displaying again
            vdisplay_out <= '0';
        END IF;
        IF vdisplay_end = '1' THEN -- end display when reached display end
            vdisplay_out <= '1';
        END IF;
    END PROCESS set_vdisplay_out;

    set_vsynch_out : PROCESS (vsynch_start, vsynch_end)
    BEGIN
        IF vsynch_start = '1' THEN -- if end of line reached, we start displaying again
            vsynch_out <= '0';
        END IF;
        IF vsynch_end = '1' THEN -- end display when reached display end
            vsynch_out <= '1';
        END IF;
    END PROCESS set_vsynch_out;

    vpixel_count_out <= count; -- Output the current vertical pixel count

END Behavioral;