LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

--Dual port ram with dedicated read (B) and write (A) port
ENTITY dual_port_ram IS
    PORT (
        clk : IN STD_LOGIC;
        we_a : IN STD_LOGIC; -- Write enable for port A
        addr_a : IN STD_LOGIC_VECTOR(16 DOWNTO 0); -- Address for port A
        data_in_a : IN STD_LOGIC_VECTOR(11 DOWNTO 0); -- Data input for port A

        addr_b : IN STD_LOGIC_VECTOR(16 DOWNTO 0); -- Address for port B
        data_out_b : OUT STD_LOGIC_VECTOR(11 DOWNTO 0) -- Data output for port B
    );
END dual_port_ram;

ARCHITECTURE Behavioral OF dual_port_ram IS
    TYPE ram_type IS ARRAY (153600 DOWNTO 0) OF STD_LOGIC_VECTOR(3 DOWNTO 0); --160x480 = 76800, last byte use as buffer, not written in
    SIGNAL RAM_red : ram_type := (OTHERS => (OTHERS => '0'));
    SIGNAL RAM_green : ram_type := (OTHERS => (OTHERS => '0'));
    SIGNAL RAM_blue : ram_type := (OTHERS => (OTHERS => '0'));
BEGIN

    -- Clocked read and write of RAM
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            -- Port A operations
            IF we_a = '1' THEN -- writing if enabled
                RAM_red(to_integer(unsigned(addr_a))) <= data_in_a(11 DOWNTO 8);
                RAM_green(to_integer(unsigned(addr_a))) <= data_in_a(7 DOWNTO 4);
                RAM_blue(to_integer(unsigned(addr_a))) <= data_in_a(3 DOWNTO 0);
            END IF;

            -- Port B operations
            data_out_b <= RAM_red(to_integer(unsigned(addr_b))) & RAM_green(to_integer(unsigned(addr_b))) & RAM_blue(to_integer(unsigned(addr_b))); -- reading

        END IF;
    END PROCESS;

END Behavioral;