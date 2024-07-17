----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.07.2024 04:31:40
-- Design Name: 
-- Module Name: i2c_config_rom - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- For GRB 4:2:2 we have to set: COM7[2]=1, COM7[0]=0, COM15[5]=x and COM15[4]=0
-- data 0: [COM7] Register h12, config data: select RGB format
-- SIGNAL sccb_regAddress_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01001000"; -- reversed order!!!
-- SIGNAL sccb_regConfig_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000100"; -- reversed order!!!

-- data 1: [COM15] Register h40, config data: select normal RGB format (GBR 4:2:2)
-- SIGNAL sccb_regAddress1_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000010"; -- reversed order!!!
-- SIGNAL sccb_regConfig1_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000"; -- reversed order!!!

-- data 2 [COM10] Register h15, config data: h40, config data:  HSYNCH/VSYNCH Polarity (active low), use HSYNCH instead of HREF
-- SIGNAL sccb_regAddress2_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "10101000"; -- reversed order!!!
-- SIGNAL sccb_regConfig2_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01000011"; -- reversed order!!!

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
        1 => "00100000" & "01101000", -- COM7 data h04, reg h12 bitreverse
        -- select outpute range 00 to FF, select RGB 565
        2 => "00001011" & "00000010", -- COM15 data h00, reg h40 bitreverse
        -- vsync negativ, 
        3 => "01000000" & "10101000", -- COM10 data h40, reg h15 bitreverse
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