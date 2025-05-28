-- 6.3.6.4.2.1. comp5/comp3/comp1/adder_0comp, comp5/comp3/comp1/adder_icomp - CLA_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY CLA_tb IS
END CLA_tb;
 
ARCHITECTURE behavior OF CLA_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CLA
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Cin : IN  std_logic;
         S : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Cin : std_logic := '0';

    --Outputs
   signal S : std_logic;
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: CLA PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          S => S,
          Cout => Cout
        );

   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns.
wait for 100 ns;    
A    <= '0';
B    <= '0';
Cin  <= '0';
wait for 100 ns;    
A    <= '0';
B    <= '1';
Cin  <= '0';
wait for 100 ns;    
A    <= '1';
B    <= '0';
Cin  <= '0';
wait for 100 ns;    
A    <= '1';
B    <= '1';
Cin  <= '0';
-- Cin is bonded to value 0 
-- from previus block, 
-- so there is no need of this 
-- but checking it, anyway...
wait for 100 ns;    
A    <= '0';
B    <= '0';
Cin  <= '1';
wait for 100 ns;    
A    <= '0';
B    <= '1';
Cin  <= '1';
wait for 100 ns;    
A    <= '1';
B    <= '0';
Cin  <= '1';
wait for 100 ns;    
A    <= '1';
B    <= '1';
Cin  <= '1';
      wait;
   end process;
END;