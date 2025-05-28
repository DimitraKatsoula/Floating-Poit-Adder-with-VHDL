LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY adder_block_tb IS
227
END adder_block_tb;
ARCHITECTURE behavior OF adder_block_tb IS
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT adder_block
PORT(
Input_Adder_A : IN std_logic_vector(36 downto 0);
Input_Adder_B : IN std_logic_vector(36 downto 0);
A_S : IN std_logic;
CLK : IN std_logic;
RSTn : IN std_logic;
Result_37bit : OUT std_logic_vector(36 downto 0);
exp_overflow1 : OUT std_logic
);
END COMPONENT;
--Inputs
signal Input_Adder_A : std_logic_vector(36 downto 0) := (others => '0');
signal Input_Adder_B : std_logic_vector(36 downto 0) := (others => '0');
signal A_S : std_logic := '0';
signal CLK : std_logic := '0';
signal RSTn : std_logic := '0';
--Outputs
signal Result_37bit : std_logic_vector(36 downto 0);
signal exp_overflow1 : std_logic;
-- Clock period definitions
constant CLK_period : time := 10 ns;
BEGIN
-- Instantiate the Unit Under Test (UUT)
uut: adder_block PORT MAP (
Input_Adder_A => Input_Adder_A,
Input_Adder_B => Input_Adder_B,
A_S => A_S,
CLK => CLK,
RSTn => RSTn,
Result_37bit => Result_37bit,
exp_overflow1 => exp_overflow1
);
-- Clock process definitions
CLK_process :process
begin
CLK <= '0';
wait for CLK_period/2;
CLK <= '1';
wait for CLK_period/2;
end process;
-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
wait for 100 ns;
wait for CLK_period*29;
RSTn <= '1';
228
wait for 100 ns;
---------------------------------------------------------------
-- ADDING POSSIBLE
---------------------------------------------------------------
-- NORM - NORM
---------------------------------------------------------------
---- same exp adding "0 00000001X000000000000000000000000001";
Input_Adder_A <= "0011111111010101010101010101010101010";
Input_Adder_B <= "0011111111101010101010101010101010101";
A_S <= '0';
wait for CLK_period*29;
---- same exp adding "0 00000001X000000000000000000000000001";
-- same exp adding (+A)+(+B)
wait for CLK_period*29;
-- <= "0 00000001X000000000000000000000000001";
Input_Adder_A <= "0011111111010000000000000000000000000";-- = +1.250
Input_Adder_B <= "0011111111001000000000000000000000000";-- = +1.125
A_S <= '0'; -- = +2.375
-- "0 00000001 0000000000000000000000000001";
wait for CLK_period*29;
-- same exp adding (+A)+(+B)
wait for CLK_period*29;
-- <= "0 00000001X000000000000000000000000001";
Input_Adder_A <= "0011111111010101010101010101010101010";-- =
+1.33333325386
Input_Adder_B <= "0011111111101010101010101010101010101";-- =
+1.66666662693
A_S <= '0'; -- = +2.375
-- <= "0 00000001X000000000000000000000000001";
wait for CLK_period*29;
-- same exp substracting (+A)-(+b)
wait for CLK_period*29;
-- <= "0 00000001X000000000000000000000000001";
Input_Adder_A <= "0011111111000000000000000000000000000";-- = +1.0
Input_Adder_B <= "0011111111000000000000000000000000000";-- = -1.0
A_S <= '1'; -- = 0
wait for CLK_period*29;
-- same exp substracting (+a)-(+B)
wait for CLK_period*29;
-- <= "0 00000001X000000000000000000000000001";
Input_Adder_A <= "0011111111000000000000000000000000000";-- = +1.000
Input_Adder_B <= "0011111111000000000000000000000000000";-- = +1.000
A_S <= '0'; -- = +2.000
-- <= "0 00000001X000000000000000000000000001";
wait for CLK_period*29;
---------------------------------------------------------------
-- expA>expB, adding, (+A)+(+B)
wait for CLK_period*29;
-- <= "0 00000001X000000000000000000000000001";
Input_Adder_A <= "0011111111010000000000000000000000000";-- = +1.2500
Input_Adder_B <= "0011111101001000000000000000000000000";-- = +0.5625
A_S <= '0'; -- = +1.8125
wait for CLK_period*29;
-- expA>expB, substracting, (+A)-(+b)
wait for CLK_period*29;
-- <= "0 00000001X000000000000000000000000001";
Input_Adder_A <= "0011111111010000000000000000000000000";-- = +1.2500
Input_Adder_B <= "0011111101001000000000000000000000000";-- = -0.5625
A_S <= '1'; -- = +0.6875
wait for CLK_period*29;
-- expA>expB, substracting, (+a)-(+B)
229
wait for CLK_period*29;
-- <= "0 00000001X000000000000000000000000001";
Input_Adder_A <= "1011111111010000000000000000000000000";-- = -1.2500
Input_Adder_B <= "0011111101001000000000000000000000000";-- = +0.5625
A_S <= '0'; -- = -0.6875
wait for CLK_period*29;
---------------------------------------------------------------
-- expA<expB, adding, (+A)+(+B)
wait for CLK_period*29;
-- <= "0 00000001X000000000000000000000000001";
Input_Adder_B <= "0011111111010000000000000000000000000";-- = +1.2500
Input_Adder_A <= "0011111101001000000000000000000000000";-- = +0.5625
A_S <= '0'; -- = +1.8125
wait for CLK_period*29;
-- expA<expB, substracting, (+A)-(+b)
wait for CLK_period*29;
-- <= "0 00000001X000000000000000000000000001";
Input_Adder_B <= "0011111111010000000000000000000000000";-- = +0.5625
Input_Adder_A <= "0011111101001000000000000000000000000";-- = -1.2500
A_S <= '1'; -- = -0.6875
wait for CLK_period*29;
-- expA<expB, substracting, (-a)+(+B)
wait for CLK_period*29;
-- <= "0 00000001X000000000000000000000000001";
Input_Adder_B <= "1011111111010000000000000000000000000";-- = -0.5625
Input_Adder_A <= "0011111101001000000000000000000000000";-- = +1.2500
A_S <= '0'; -- = +0.6875
wait for CLK_period*29;
wait;
end process;
END;