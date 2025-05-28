LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY FA_tb IS
END FA_tb;
ARCHITECTURE behavior OF FA_tb IS
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT FA
PORT(
Cinput : IN std_logic;
A : IN std_logic;
B : IN std_logic;
S : OUT std_logic;
Co : OUT std_logic
);
END COMPONENT;
--Inputs
signal Cinput : std_logic := '0';
signal A : std_logic := '0';
signal B : std_logic := '0';
--Outputs
signal S : std_logic;
signal Co : std_logic;
-- No clocks detected in port list. Replace <clock> below with
-- appropriate port name
BEGIN
-- Instantiate the Unit Under Test (UUT)
uut: FA PORT MAP (
Cinput => Cinput,
A => A,
B => B,
S => S,
Co => Co
);
-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
wait for 100 ns;
234
A <= '0';
B <= '0';
Cinput <= '0';
wait for 100 ns;
A <= '0';
B <= '1';
Cinput <= '0';
wait for 100 ns;
A <= '1';
B <= '0';
Cinput <= '0';
wait for 100 ns;
A <= '1';
B <= '1';
Cinput <= '0';
-- Cin is bonded to value 0
-- from previus block,
-- so there is no need of this
-- but checking it, anyway...
wait for 100 ns;
A <= '0';
B <= '0';
Cinput <= '1';
wait for 100 ns;
A <= '0';
B <= '1';
Cinput <= '1';
wait for 100 ns;
A <= '1';
B <= '0';
Cinput <= '1';
wait for 100 ns;
A <= '1';
B <= '1';
Cinput <= '1';
wait;
end process;
END;