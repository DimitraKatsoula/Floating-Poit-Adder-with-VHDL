LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY reg_tb IS
END reg_tb;
ARCHITECTURE behavior OF reg_tb IS
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT reg
PORT(
D : IN std_logic;
CLK : IN std_logic;
RSTn : IN std_logic;
Q : OUT std_logic
235
);
END COMPONENT;
--Inputs
signal D : std_logic := '0';
signal CLK : std_logic := '0';
signal RSTn : std_logic := '0';
--Outputs
signal Q : std_logic;
-- Clock period definitions
constant CLK_period : time := 10 ns;
BEGIN
-- Instantiate the Unit Under Test (UUT)
uut: reg PORT MAP (
D => D,
CLK => CLK,
RSTn => RSTn,
Q => Q
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
RSTn <= '1';
wait for CLK_period*10;
D <= '0';
wait for CLK_period*10;
D <= '1';
wait for CLK_period*10;
RSTn <= '0';
wait for CLK_period*10;
D <= '0';
wait for CLK_period*10;
D <= '1';
wait;
end process;
END;