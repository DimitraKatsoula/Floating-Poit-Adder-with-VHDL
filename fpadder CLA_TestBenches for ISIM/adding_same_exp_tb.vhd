-- 6.3.6.4.2. comp5/comp3/comp1 - adding_same_exp_tb.vhd	
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY adding_same_exp_tb IS
END adding_same_exp_tb;
 
ARCHITECTURE behavior OF adding_same_exp_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adding_same_exp
    PORT(
         A : IN  std_logic_vector(27 downto 0);
         B : IN  std_logic_vector(27 downto 0);
         Cinput : IN  std_logic;
         S : OUT  std_logic_vector(27 downto 0);
         Co : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal A : std_logic_vector(27 downto 0) := (others => '0');
   signal B : std_logic_vector(27 downto 0) := (others => '0');
   signal Cinput : std_logic := '0';

    --Outputs
   signal S : std_logic_vector(27 downto 0);
   signal Co : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: adding_same_exp PORT MAP (
          A => A,
          B => B,
          Cinput => Cinput,
          S => S,
          Co => Co
        );

   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns.
    wait for 100ns;
       Cinput <= '0';
        A<= "1000000000000000000000110000";
        B<= "1000000000000000000001000000";
      wait for 100 ns;      
      Cinput <= '0';
        A<= "1000000000000000000000000010";
        B<= "1111000000000000000000110000";
      wait for 100 ns;      
      Cinput <= '0';
        A<= "1010101010101010101010101010";
        B<= "0101010101010101010101010101";
        wait for 100 ns;        
      Cinput <= '0'; 
        A<= "1100000000000000000000000010";
        B<= "1111111111111111111111111111";
        wait for 100 ns;
        Cinput <= '0';
        A<= "1000000000000000000000000010";
        B<= "1000000000000000000000000001";
      wait;
   end process;
END;
	

