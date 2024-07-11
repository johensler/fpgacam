----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.07.2024 11:45:15
-- Design Name: 
-- Module Name: i2c_controler - Behavioral
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

ENTITY i2c_controler IS
    GENERIC (
        SIMULATION : BOOLEAN := true -- deprecated
    );
    PORT (
        clk_100MHz_i : IN STD_LOGIC;
        rst_n_i : IN STD_LOGIC;
        data_wr_i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        btnU_n_i : IN STD_LOGIC;
        scl_o_o : OUT STD_LOGIC;
        ack_error_o : OUT STD_LOGIC;
        ack_error_latch_o : OUT STD_LOGIC;
        sda_o_o : OUT STD_LOGIC;
        sda_i : IN STD_LOGIC;
        start_fsm_debug_o : OUT STD_LOGIC
    );
END i2c_controler;

ARCHITECTURE Behavioral OF i2c_controler IS

    CONSTANT count_freq400kHz : INTEGER := 63 - 1;

    TYPE fsm_i2c_t IS (
        state_idle,
        state_startCond,
        state_transmitDeviceAddr,
        state_ack1,
        state_transmitRegAddr,
        state_ack2,
        state_transmitRegConfig,
        state_ack3,
        state_stopCond
    );

    SIGNAL clk_400KHz : STD_LOGIC;
    --address of target peripheral: 42 for read 43 for write     
    SIGNAL addr_wr_r : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01000010";

    SIGNAL ack_error_r : STD_LOGIC; --flag if improper acknowledge from slave

    SIGNAL prescale_var_r : INTEGER RANGE 0 TO 63 := 0;

    SIGNAL byte_index_r : INTEGER RANGE 0 TO 15 := 0;
    SIGNAL count_cycle_var_r : INTEGER RANGE 0 TO 4 := 0;

    SIGNAL state_var_r : fsm_i2c_t := state_idle;

    SIGNAL scl_o : STD_LOGIC;
    SIGNAL sda_o : STD_LOGIC;

    SIGNAL start_write_r : STD_LOGIC;
    SIGNAL countDebounce_var_r : INTEGER RANGE 0 TO 1600000 := 0;
    SIGNAL btnUdebounced_n_r : STD_LOGIC;
    SIGNAL start_counting_debounced : STD_LOGIC;

    SIGNAL btnU_n_signal : STD_LOGIC;

BEGIN

    -- 400 KHz clock generation ------------------------------------------------
    create_i2c_clk : PROCESS (clk_100MHz_i, rst_n_i)
    BEGIN
        IF (rst_n_i = '1') THEN
            prescale_var_r <= 0;
        ELSIF (rising_edge(clk_100MHz_i)) THEN
            IF prescale_var_r = count_freq400kHz THEN
                prescale_var_r <= 0;
                clk_400KHz <= '1';
            ELSE
                prescale_var_r <= prescale_var_r + 1;
                clk_400KHz <= '0';
            END IF;
        END IF;
    END PROCESS create_i2c_clk;

    -- I2C FSM -----------------------------------------------------------------
    i2c_fsm : PROCESS (clk_400KHz, rst_n_i)
    BEGIN
        IF (rst_n_i = '1') THEN
            state_var_r <= state_idle;
        ELSIF rising_edge(clk_400KHz) THEN
            CASE state_var_r IS
                WHEN state_idle =>
                    sda_o <= '1';
                    scl_o <= '1';
                    ack_error_r <= '0';

                    IF start_write_r = '1' THEN
                        state_var_r <= state_startCond;
                    ELSE
                        state_var_r <= state_idle;
                    END IF;
                WHEN state_startCond =>
                    IF count_cycle_var_r < 4 - 1 THEN
                        count_cycle_var_r <= count_cycle_var_r + 1;
                        state_var_r <= state_startCond;
                    ELSE -- 3
                        count_cycle_var_r <= 0;
                        -- change state condition when 8 bits sent
                        state_var_r <= state_transmitDeviceAddr;
                    END IF;

                    IF (count_cycle_var_r = 0) THEN
                        scl_o <= '1';
                        sda_o <= '1';
                    ELSIF (count_cycle_var_r = 1) THEN -- start condition
                        scl_o <= '1';
                        sda_o <= '0';
                    ELSIF (count_cycle_var_r = 2) THEN
                        scl_o <= '1';
                        sda_o <= '0';
                    ELSE
                        sda_o <= '0';
                        scl_o <= '0';
                    END IF;

                WHEN state_transmitDeviceAddr =>
                    sda_o <= addr_wr_r(byte_index_r);

                    IF count_cycle_var_r < 4 - 1 THEN
                        count_cycle_var_r <= count_cycle_var_r + 1;
                        state_var_r <= state_transmitDeviceAddr;
                    ELSE
                        count_cycle_var_r <= 0;
                        -- change state condition when 8 bits sent
                        IF byte_index_r < 7 THEN
                            byte_index_r <= byte_index_r + 1;
                            state_var_r <= state_transmitDeviceAddr;
                        ELSE
                            byte_index_r <= 0;
                            state_var_r <= state_ack1;
                        END IF;
                    END IF;
                    IF (count_cycle_var_r = 0) THEN
                        scl_o <= '0';
                    ELSIF (count_cycle_var_r = 1) THEN
                        scl_o <= '1';
                    ELSIF (count_cycle_var_r = 2) THEN
                        scl_o <= '1';
                    ELSE
                        scl_o <= '0';
                    END IF;

                WHEN state_ack1 =>
                    sda_o <= '1'; -- input

                    IF count_cycle_var_r < 4 - 1 THEN
                        count_cycle_var_r <= count_cycle_var_r + 1;
                        state_var_r <= state_ack1;
                    ELSE
                        count_cycle_var_r <= 0;
                        -- change state condition when 8 bits sent
                        IF (ack_error_r = '1') THEN
                            state_var_r <= state_idle;
                        ELSE
                            state_var_r <= state_transmitRegAddr;
                        END IF;
                    END IF;

                    IF (count_cycle_var_r = 0) THEN
                        scl_o <= '0';
                    ELSIF (count_cycle_var_r = 1) THEN
                        scl_o <= '1';
                    ELSIF (count_cycle_var_r = 2) THEN
                        scl_o <= '1';
                        ack_error_r <= sda_i;
                    ELSE
                        scl_o <= '0';
                    END IF;

                WHEN state_transmitRegAddr =>
                    sda_o <= data_wr_i(byte_index_r);

                    IF count_cycle_var_r < 4 - 1 THEN
                        count_cycle_var_r <= count_cycle_var_r + 1;
                        state_var_r <= state_transmitRegAddr;
                    ELSE
                        count_cycle_var_r <= 0;
                        -- change state condition when 8 bits sent
                        IF byte_index_r < 7 THEN
                            byte_index_r <= byte_index_r + 1;
                            state_var_r <= state_transmitRegAddr;
                        ELSE
                            byte_index_r <= byte_index_r + 1;
                            state_var_r <= state_ack2;
                        END IF;
                    END IF;

                    IF (count_cycle_var_r = 0) THEN
                        scl_o <= '0';
                    ELSIF (count_cycle_var_r = 1) THEN
                        scl_o <= '1';
                    ELSIF (count_cycle_var_r = 2) THEN
                        scl_o <= '1';
                    ELSE
                        scl_o <= '0';
                    END IF;

                WHEN state_ack2 =>
                    sda_o <= '1'; -- input
                    IF count_cycle_var_r < 4 - 1 THEN
                        count_cycle_var_r <= count_cycle_var_r + 1;
                        state_var_r <= state_ack2;
                    ELSE
                        count_cycle_var_r <= 0;
                        -- change state condition when 8 bits sent
                        IF (ack_error_r = '1') THEN
                            state_var_r <= state_idle;
                        ELSE
                            state_var_r <= state_transmitRegConfig;
                        END IF;
                    END IF;

                    IF (count_cycle_var_r = 0) THEN
                        scl_o <= '0';
                    ELSIF (count_cycle_var_r = 1) THEN
                        scl_o <= '1';
                    ELSIF (count_cycle_var_r = 2) THEN
                        scl_o <= '1';
                        ack_error_r <= sda_i;
                    ELSE
                        scl_o <= '0';
                    END IF;

                WHEN state_transmitRegConfig =>
                    sda_o <= data_wr_i(byte_index_r);

                    IF count_cycle_var_r < 4 - 1 THEN
                        count_cycle_var_r <= count_cycle_var_r + 1;
                        state_var_r <= state_transmitRegConfig;
                    ELSE
                        count_cycle_var_r <= 0;
                        -- change state condition when 8 bits sent
                        IF byte_index_r < 15 THEN
                            byte_index_r <= byte_index_r + 1;
                            state_var_r <= state_transmitRegConfig;
                        ELSE
                            byte_index_r <= 0;
                            state_var_r <= state_ack3;
                        END IF;
                    END IF;

                    IF (count_cycle_var_r = 0) THEN
                        scl_o <= '0';
                    ELSIF (count_cycle_var_r = 1) THEN
                        scl_o <= '1';
                    ELSIF (count_cycle_var_r = 2) THEN
                        scl_o <= '1';
                    ELSE
                        scl_o <= '0';
                    END IF;

                WHEN state_ack3 =>
                    sda_o <= '1'; -- input

                    IF count_cycle_var_r < 4 - 1 THEN
                        count_cycle_var_r <= count_cycle_var_r + 1;
                        state_var_r <= state_ack3;
                    ELSE
                        count_cycle_var_r <= 0;
                        -- change state condition when 8 bits sent
                        IF (ack_error_r = '1') THEN
                            state_var_r <= state_idle;
                        ELSE
                            state_var_r <= state_stopCond;
                        END IF;
                    END IF;

                    IF (count_cycle_var_r = 0) THEN
                        scl_o <= '0';
                    ELSIF (count_cycle_var_r = 1) THEN
                        scl_o <= '1';
                    ELSIF (count_cycle_var_r = 2) THEN
                        scl_o <= '1';
                        ack_error_r <= sda_i;
                    ELSE
                        scl_o <= '0';
                    END IF;

                WHEN state_stopCond =>
                    IF count_cycle_var_r < 4 - 1 THEN
                        count_cycle_var_r <= count_cycle_var_r + 1;
                        state_var_r <= state_stopCond;
                    ELSE
                        count_cycle_var_r <= 0;
                        -- change state condition when 8 bits sent
                        state_var_r <= state_idle;
                    END IF;

                    IF (count_cycle_var_r = 0) THEN
                        scl_o <= '0';
                        sda_o <= '0';
                    ELSIF (count_cycle_var_r = 1) THEN
                        scl_o <= '1';
                        sda_o <= '0';
                    ELSIF (count_cycle_var_r = 2) THEN -- stop condition
                        scl_o <= '1';
                        sda_o <= '1';
                    ELSE
                        sda_o <= '1';
                        scl_o <= '1';
                    END IF;

                WHEN OTHERS =>
                    -- change to IDLE
                    state_var_r <= state_idle;
            END CASE;
        END IF;
    END PROCESS i2c_fsm;

    sda_o_o <= sda_o;
    scl_o_o <= scl_o;
    ack_error_o <= ack_error_r;

    -- BEGIN ------ debug -> generate repeated start signal for i2c tb ---------
    start_write_r <= btnUdebounced_n_r;
    start_fsm_debug_o <= btnUdebounced_n_r;

    btnU_n_signal <= '1'; -- change back to button for single operation
    PROCESS (clk_400KHz, rst_n_i)
    BEGIN
        IF (rst_n_i = '1') THEN
            countDebounce_var_r <= 0;
            btnUdebounced_n_r <= '0';
            start_counting_debounced <= '0';
        ELSIF rising_edge(clk_400KHz) THEN
            --IF (btnU_n_signal = '1' AND start_counting_debounced = '0') THEN
            IF (btnU_n_i = '1' AND start_counting_debounced = '0') THEN
                btnUdebounced_n_r <= '1';
                start_counting_debounced <= '1';
            ELSIF (start_counting_debounced = '1') THEN
                btnUdebounced_n_r <= '0';
                countDebounce_var_r <= countDebounce_var_r + 1;
                IF (countDebounce_var_r = 1600000) THEN
                    countDebounce_var_r <= 0;
                    start_counting_debounced <= '0';
                END IF;
            END IF;
        END IF;
    END PROCESS;
    -- END   ------ debug -> generate repeated start signal for i2c tb ---------

    ack_flag_proc : PROCESS (clk_400KHz, rst_n_i)
    BEGIN
        IF (rst_n_i = '1') THEN
            ack_error_latch_o <= '0';
        ELSIF rising_edge(clk_400KHz) THEN
            IF (ack_error_r = '1') THEN
                ack_error_latch_o <= '1';
            END IF;
        END IF;
    END PROCESS;

END Behavioral;