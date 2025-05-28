LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY adding_same_exp_pipeline_tb IS
END adding_same_exp_pipeline_tb;
ARCHITECTURE behavior OF adding_same_exp_pipeline_tb IS
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT adding_same_exp_pipeline
PORT(
A : IN std_logic_vector(27 downto 0);
B : IN std_logic_vector(27 downto 0);
CLK : IN std_logic;
RSTn : IN std_logic;
Cinput : IN std_logic;
Co : OUT std_logic;
S : OUT std_logic_vector(27 downto 0)
);
END COMPONENT;
--Inputs
signal A : std_logic_vector(27 downto 0) := (others => '0');
signal B : std_logic_vector(27 downto 0) := (others => '0');
signal CLK : std_logic := '0';
signal RSTn : std_logic := '0';
232
signal Cinput : std_logic := '0';
--Outputs
signal Co : std_logic;
signal S : std_logic_vector(27 downto 0);
-- Clock period definitions
constant CLK_period : time := 10 ns;
BEGIN
-- Instantiate the Unit Under Test (UUT)
uut: adding_same_exp_pipeline PORT MAP (
A => A,
B => B,
CLK => CLK,
RSTn => RSTn,
Cinput => Cinput,
Co => Co,
S => S
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
RSTn<='1';
wait for 100 ns;
Cinput<='0';
A<= "0101010100000000000000000001";
B<= "0010001000000000000000000010";
wait for CLK_period*29;
assert (S = A+B) report "SUM INCORRECT"
severity Error;
wait for 100 ns;
wait for CLK_period*29;
Cinput<='0';
A<= "1010101010101010101010101010";
B<= "0101010101010101010101010101";
wait for 100 ns;
wait for CLK_period*29;
assert (S = A+B) report "SUM INCORRECT"
severity Error;
wait for 100 ns;
wait for CLK_period*29;
Cinput<='0';
A<= "1010101010101010101010101010";
B<= "1101010101010101010101010101";
wait for 100 ns;
wait for CLK_period*29;
233
assert (S = A+B) report "SUM INCORRECT"
severity Error;
wait;
end process;
END;
