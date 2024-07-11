----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.07.2024 13:42:26
-- Design Name: 
-- Module Name: tb_i2c_controler - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY tb_i2c_controler IS
END tb_i2c_controler;

ARCHITECTURE Behavioral OF tb_i2c_controler IS

    CONSTANT CLK_PERIOD : TIME := 10 ns;

    CONSTANT RESET_TIME : TIME := 5 us;
    CONSTANT DATA_TIME : TIME := 21 us;
    CONSTANT ACK_TIME : TIME := 2 us;

    SIGNAL clk_100MHz_tb : STD_LOGIC := '0';
    SIGNAL rst_n_tb : STD_LOGIC := '0';
    SIGNAL btnU_n_tb : STD_LOGIC := '0';
    SIGNAL scl_tb : STD_LOGIC := '0';
    SIGNAL ack_error_tb : STD_LOGIC := '0';
    SIGNAL sda_o_tb : STD_LOGIC;
    SIGNAL sda_i_tb : STD_LOGIC := '0';
    SIGNAL data_wr_tb : STD_LOGIC_VECTOR(15 DOWNTO 0);

    SIGNAL regAddress_tb : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01001000";
    SIGNAL regConfig_tb : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00100000";
BEGIN

    -- Instantiate I2C controler
    I2C_CONTROLER_INST : ENTITY work.i2c_controler
        PORT MAP(
            clk_100MHz_i => clk_100MHz_tb,
            rst_n_i => rst_n_tb,
            btnU_n_i => btnU_n_tb,
            data_wr_i => data_wr_tb,
            scl_o_o => scl_tb,
            ack_error_o => ack_error_tb,
            sda_o_o => sda_o_tb,
            sda_i => sda_i_tb
        );

    -- 100 MHz clock
    clk_100MHz_tb <= NOT clk_100MHz_tb AFTER CLK_PERIOD/2;

    PROCESS IS
    BEGIN
        -- init signals    
        btnU_n_tb <= '0';
        data_wr_tb <= (OTHERS => '0');
        sda_i_tb <= '1';
        -- reset
        rst_n_tb <= '1';
        WAIT FOR RESET_TIME;
        rst_n_tb <= '0';
        WAIT FOR RESET_TIME;

        -- start i2c transmission
        btnU_n_tb <= '1';
        WAIT FOR RESET_TIME;
        btnU_n_tb <= '0';

        WAIT FOR 15 us;
        sda_i_tb <= '0'; -- 1 = ack
        WAIT FOR ACK_TIME;
        sda_i_tb <= '1';
        data_wr_tb <= regConfig_tb & regAddress_tb;
        btnU_n_tb <= '1';
        WAIT FOR DATA_TIME;
        sda_i_tb <= '0'; -- 1 = ack
        WAIT FOR ACK_TIME;
        sda_i_tb <= '1';

        WAIT FOR DATA_TIME;
        sda_i_tb <= '0'; -- 1 = ack
        WAIT FOR ACK_TIME;
        sda_i_tb <= '1';
        WAIT FOR 600 us;
    END PROCESS;

END Behavioral;