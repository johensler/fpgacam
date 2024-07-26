
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE IEEE.NUMERIC_STD.ALL;

ENTITY i2c_config_rom IS
    GENERIC (
        ROM_DEPTH : INTEGER := 6 -- depth of ROM
    );
    PORT (
        address_i : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        data_o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END i2c_config_rom;

ARCHITECTURE Behavioral OF i2c_config_rom IS
    TYPE rom_type2 IS ARRAY (0 TO ROM_DEPTH - 1) OF STD_LOGIC_VECTOR(15 DOWNTO 0);

    -- input fitting data
    --TODO(MaBa) Beschreibe wierum Daten eingefügt werden müssen
    CONSTANT ROM : rom_type2 := (
        0 => "0000000000000000", -- keep all zeros, data wont be transmitted
        1 => "00000001" & "01001000", -- COM7 data h04, reg h12 bitreverse
        2 => "01100000" & "01001000", -- COM7 data h04, reg h12 bitreverse 
        3 => "01000000" & "00110001", -- COM7 data h04, reg h12 bitreverse 
        4 => "00001011" & "00000010", -- COM7 data h04, reg h12 bitreverse 
        OTHERS => (OTHERS => '0')
    );
BEGIN

    -- read logic
    PROCESS (address_i)
    BEGIN
        IF to_integer(unsigned(address_i)) < ROM_DEPTH THEN
            data_o <= ROM(to_integer(unsigned(address_i)));
        ELSE
            data_o <= (OTHERS => '0');
        END IF;
    END PROCESS;

END Behavioral;