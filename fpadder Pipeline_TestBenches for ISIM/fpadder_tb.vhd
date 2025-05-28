LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY fpadder_tb IS
END fpadder_tb;
ARCHITECTURE behavior OF fpadder_tb IS
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT fpadder
PORT(
NumberA : IN std_logic_vector(31 downto 0);
NumberB : IN std_logic_vector(31 downto 0);
A_S : IN std_logic;
CLK : IN std_logic;
RSTn : IN std_logic;
Total_Result : OUT std_logic_vector(31 downto 0);
exp_overflow : OUT std_logic;
exp_underflow : OUT std_logic
);
END COMPONENT;
--Inputs
signal NumberA : std_logic_vector(31 downto 0) := (others => '0');
signal NumberB : std_logic_vector(31 downto 0) := (others => '0');
signal A_S : std_logic := '0';
signal CLK : std_logic := '0';
signal RSTn : std_logic := '0';
--Outputs
signal Total_Result : std_logic_vector(31 downto 0);
signal exp_overflow : std_logic;
signal exp_underflow : std_logic;
-- Clock period definitions
constant CLK_period : time := 10 ns;
220
BEGIN
-- Instantiate the Unit Under Test (UUT)
uut: fpadder PORT MAP (
NumberA => NumberA,
NumberB => NumberB,
A_S => A_S,
CLK => CLK,
RSTn => RSTn,
Total_Result => Total_Result,
exp_overflow => exp_overflow,
exp_underflow => exp_underflow
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
---------------------------------------------------------------
-- ADDING POSSIBLE
---------------------------------------------------------------
-- NORM - NORM
---------------------------------------------------------------
-- same exp adding (+A)+(+B)
wait for 100 ns;
wait for CLK_period*29;
RSTn<='1';
wait for 100 ns;
-- <= "0 00000001 00000000000000000000001";
NumberA <= "00111111101000000000000000000000";-- = +1.250
NumberB <= "00111111100100000000000000000000";-- = +1.125
A_S <= '0'; -- = +2.375
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "01000000000110000000000000000000") report "SUM INCORRECT"
severity Error;
-- same exp adding (+A)+(+B)
wait for 100 ns;
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberA <= "00111111111000000000000000000000";-- = +1.75
NumberB <= "00111111110100000000000000000000";-- = +1.625
A_S <= '0'; -- = +3.375
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "01000000010110000000000000000000") report "SUM INCORRECT"
severity Error;
-- same exp adding (+A)+(+B)
wait for 100 ns;
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
221
NumberA <= "00111111101000000000000000000000";-- = +1.250
NumberB <= "00111111100100000000000000000000";-- = +1.125
A_S <= '0'; -- = +2.375
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "01000000000110000000000000000000") report "SUM INCORRECT"
severity Error;
-- same exp substracting (+A)-(+b)
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberA <= "00111111101000000000000000000000";-- = +1.250
NumberB <= "00111111100100000000000000000000";-- = -1.125
A_S <= '1'; -- = +0.125
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "00111110000000000000000000000000") report "SUM INCORRECT"
severity Error;
-- same exp substracting (+a)-(+B)
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberA <= "00111111100100000000000000000000";-- = +1.125
NumberB <= "00111111101000000000000000000000";-- = -1.250
A_S <= '1'; -- = -0.125
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "10111110000000000000000000000000") report "SUM INCORRECT"
severity Error;
---------------------------------------------------------------
-- expA<expB, adding, (+A)+(+B)
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberA <= "00111111001000000000000000000000";-- = +0.625
NumberB <= "00111111100100000000000000000000";-- = +1.125
A_S <= '0'; -- = +1.75
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "00111111111000000000000000000000") report "SUM INCORRECT"
severity Error;
-- expA<expB, adding, (+A)+(+B)
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberA <= "00111111001000000000000000000000";-- = +0.625
NumberB <= "00111111100100000000000000000000";-- = +1.125
A_S <= '0'; -- = +1.75
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "00111111111000000000000000000000") report "SUM INCORRECT"
severity Error;
-- expA<expB, substracting, (+A)-(+b)
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberA <= "00111111001000000000000000000000";-- = +0.625
NumberB <= "00111111100010000000000000000000";-- = -1.0625
A_S <= '1'; -- = -0.4375
wait for CLK_period*29;
222
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "10111110111000000000000000000000") report "SUM INCORRECT"
severity Error;
-- expA<expB, substracting, (+a)-(+B)
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberA <= "00111111000100000000000000000000";-- = +0.5625
NumberB <= "00111111101000000000000000000000";-- = -1.2500
A_S <= '1'; -- = -0.6875
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "10111111001100000000000000000000") report "SUM INCORRECT"
severity Error;
---------------------------------------------------------------
-- expA>expB, adding, (+A)+(+B)
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberA <= "00111111101000000000000000000000";-- = +1.2500
NumberB <= "00111111000100000000000000000000";-- = +0.5625
A_S <= '0'; -- = +1.8125
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "00111111111010000000000000000000") report "SUM INCORRECT"
severity Error;
-- expA>expB, adding, (+A)+(+B)
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberA <= "00111111101000000000000000000000";-- = +1.2500
NumberB <= "00111111000100000000000000000000";-- = +0.5625
A_S <= '0'; -- = +1.8125
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "00111111111010000000000000000000") report "SUM INCORRECT"
severity Error;
-- expA>expB, substracting, (+A)-(+b)
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberA <= "00111111101000000000000000000000";-- = +1.2500
NumberB <= "00111111000100000000000000000000";-- = -0.5625
A_S <= '1'; -- = +0.6875
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "00111111001100000000000000000000") report "SUM INCORRECT"
severity Error;
-- expA>expB, substracting, (+a)-(+B)
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberA <= "00111111100100000000000000000000";-- = +1.125
NumberB <= "00111111010000000000000000000000";-- = -0.75
A_S <= '1'; -- = +0.375
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "00111110110000000000000000000000") report "SUM INCORRECT"
severity Error;
---------------------------------------------------------------
-- ADDING POSSIBLE
223
---------------------------------------------------------------
-- NORM - SUB
---------------------------------------------------------------
-- adding (+A)+(+B)
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberA <= "00111101000000000000000000000000";-- = +0.03125
NumberB <= "00000000010000000000000000000000";-- = +0,5
A_S <= '0'; -- = +0,53125000000
-- e^x = 10^x, -- E^x = (euler's constant)^x
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "00111111000010000000000000000000") report "SUM INCORRECT"
severity Error;
-- substracting (+A)-(+b)
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberA <= "00111101000000000000000000000000";-- = +0,03125
NumberB <= "00000000010000000000000000000000";-- = -0,5
A_S <= '1'; -- = -0,46875000000
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "10111110111100000000000000000000") report "SUM INCORRECT"
severity Error;
-- substracting (+a)-(+B)
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberA <= "00000000010000000000000000000000";-- = +0,5
NumberB <= "00111101000000000000000000000000";-- = -0,03125
A_S <= '1'; -- = +0,46875000000
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "00111110111100000000000000000000") report "SUM INCORRECT"
severity Error;
wait for CLK_period*29;
-- adding while difference of exponents is >28
-- <= "0 00000001 00000000000000000000001";
NumberA <= "01010000100000000000000000000000";-- = +17179869184
NumberB <= "00000000010000000000000000000000";-- = +0,5
A_S <= '0'; -- = +17179869184,5
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "01010000100000000000000000000000") report "SUM INCORRECT"
severity Error;
-- substracting while difference of exponents is >28, (+A)-(+b)
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberA <= "01010000100000000000000000000000";-- = +17179869184
NumberB <= "00000000010000000000000000000000";-- = -0,5
A_S <= '1'; -- = +17179869183,5
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "01010000100000000000000000000000") report "SUM INCORRECT"
severity Error;
-- substracting while difference of exponents is >28,(+a)-(+B)
wait for CLK_period*29;
224
-- <= "0 00000001 00000000000000000000001";
NumberA <= "00000000010000000000000000000000";-- = +0.5
NumberB <= "01010000100000000000000000000000";-- = -17179869184
A_S <= '1'; -- = -17179869183,5
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "11010000100000000000000000000000") report "SUM INCORRECT"
severity Error;
---------------------------------------------------------------
-- SUB - NORM
---------------------------------------------------------------
-- adding (+A)+(+B)
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberB <= "00111101000000000000000000000000";-- = +0.03125
NumberA <= "00000000010000000000000000000000";-- = +0,5
A_S <= '0'; -- = +0,53125000000
-- e^x = 10^x, -- E^x = (euler's constant)^x
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "00111111000010000000000000000000") report "SUM INCORRECT"
severity Error;
-- substracting (+A)-(+b)
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberB <= "00111101000000000000000000000000";-- = -0,03125
NumberA <= "00000000010000000000000000000000";-- = +0,5
A_S <= '1'; -- = +0,46875000000
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "00111110111100000000000000000000") report "SUM INCORRECT"
severity Error;
-- substracting (+a)-(+B)
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberB <= "00000000010000000000000000000000";-- = -0,5
NumberA <= "00111101000000000000000000000000";-- = +0,03125
A_S <= '1'; -- = -0,46875000000
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "10111110111100000000000000000000") report "SUM INCORRECT"
severity Error;
wait for CLK_period*29;
-- adding while difference of exponents is >28
-- <= "0 00000001 00000000000000000000001";
NumberB <= "01010000100000000000000000000000";-- = +17179869184
NumberA <= "00000000010000000000000000000000";-- = +0,5
A_S <= '0'; -- = +17179869184,5
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "01010000100000000000000000000000") report "SUM INCORRECT"
severity Error;
-- substracting while difference of exponents is >28, (+A)-(+b)
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
225
NumberB <= "01010000100000000000000000000000";-- = -17179869184
NumberA <= "00000000010000000000000000000000";-- = +0,5
A_S <= '1'; -- = -17179869183,5
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "11010000100000000000000000000000") report "SUM INCORRECT"
severity Error;
-- substracting while difference of exponents is >28,(+a)-(+B)
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberB <= "00000000010000000000000000000000";-- = -0.5
NumberA <= "01010000100000000000000000000000";-- = +17179869184
A_S <= '1'; -- = +17179869183,5
wait for CLK_period*29;
-- "0 00000001 00000000000000000000001";
assert (Total_Result = "01010000100000000000000000000000") report "SUM INCORRECT"
severity Error;
-------------------------------------------------------
---- ADDING POSSIBLE
-------------------------------------------------------
-------------------------------------------------------
---- Sub + Sub
-------------------------------------------------------
----------------------------------------------------------------INCORRECT ASSERT
HERE
-- 1. adding (+A)+(+B)
wait for CLK_period*29;
-- NumberA <= "0 00000001 00000000000000000000001";
NumberA <= "00000000010000000000000000000000";
NumberB <= "00000000010000000000000000000000";
A_S <= '0';
wait for CLK_period*29;
-- "0 00000001 00000000000000000000001";
assert (Total_Result = "00111111100000000000000000000000") report "SUM INCORRECT"
severity Error;
-------------------------------------------------------
---- ADDING IMPOSSIBLE
-------------------------------------------------------
---- +/- Norm +/- Zero
-------------------------------------------------------
-- -- 1. adding (+A)+(+B) Norm + Zero
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberA <= "00000000100000000000000000000001";
NumberB <= "00000000000000000000000000000000";
A_S <= '0';
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
assert (Total_Result = "00000000100000000000000000000001") report "SUM INCORRECT"
severity Error;
-- -- 2. adding (+A)+(+B) Zero + Norm
wait for CLK_period*29;
-- NumberA <= "0 00000001 00000000000000000000001";
NumberA <= "00000000000000000000000000000000";
NumberB <= "00000000101000000000000000000000";
A_S <= '1';
wait for CLK_period*29;
assert (Total_Result = "10000000101000000000000000000000") report "SUM INCORRECT"
severity Error;
-------------------------------------------------------
226
---- +/- Zero +/- NaN
-------------------------------------------------------
-- -- 1. adding (+A)+(+B) Zero + NaN
wait for CLK_period*29;
-- <= "0 00000001 00000000000000000000001";
NumberA <= "00000000000000000000000000000000";
NumberB <= "01111111101000000000000000000000";
A_S <= '0';
wait for CLK_period*29;
assert (Total_Result = "01111111101000000000000000000000") report "SUM INCORRECT"
severity Error;
-- -- 2. substracting (+A)+(+B) Zero + NaN
-- wait for CLK_period*29;
---- <= "0 00000001 00000000000000000000001";
-- NumberA <= "00000000000000000000000000000000";
-- NumberB <= "01111111101000000000000000000000";
-- A_S <= '1';
-------------------------------------------------------
---- +/- inf +/- Zero
-------------------------------------------------------
-- -- 1. adding (+A)+(+B) inf + Zero
wait for CLK_period*29;
---- <= "0 00000001 00000000000000000000001";
NumberA <= "01111111100000000000000000000000";
NumberB <= "00000000000000000000000000000000";
A_S <= '0';
wait for CLK_period*29;
assert (Total_Result = "01111111100000000000000000000000") report "SUM INCORRECT"
severity Error;
wait for CLK_period*29;
---- <= "0 00000001 00000000000000000000001";
NumberA <= "01111111100000000000000000000000";
NumberB <= "01111111100000000000000000000000";
A_S <= '1';
wait for CLK_period*29;
assert (Total_Result = "01111111100000000000000000000001") report "SUM INCORRECT"
severity Error;
wait for CLK_period*29;
---- <= "0 00000001 00000000000000000000001";
NumberA <= "01111111100000000000000000000000";
NumberB <= "01111111100000000000000000000000";
A_S <= '0';
wait for CLK_period*29;
assert (Total_Result = "01111111100000000000000000000000") report "SUM INCORRECT"
severity Error;
wait for CLK_period*29;
wait;
end process;
END;