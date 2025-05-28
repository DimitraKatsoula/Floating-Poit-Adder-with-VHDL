-- 6.3.4.1.1. comp3/comp0/comp0 - Sub_Norm_to_Norm_Norm_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

 
ENTITY Sub_Norm_to_Norm_Norm_tb IS
END Sub_Norm_to_Norm_Norm_tb;
 
ARCHITECTURE behavior OF Sub_Norm_to_Norm_Norm_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sub_Norm_to_Norm_Norm
    PORT(
         Subnormal1_A : IN  std_logic_vector(36 downto 0);
         Norm_Norm_01_A : OUT  std_logic_vector(36 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Subnormal1_A : std_logic_vector(36 downto 0) := (others => '0');

    --Outputs
   signal Norm_Norm_01_A : std_logic_vector(36 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: Sub_Norm_to_Norm_Norm PORT MAP (
          Subnormal1_A => Subnormal1_A,
          Norm_Norm_01_A => Norm_Norm_01_A
        );

 
   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns.
      wait for 100 ns;  
--                  "0 00000001X000000000000000000000010000";           
     Subnormal1_A <= "0000000000100000000000000000000010000";
      wait for 100 ns;  
--                  "0 00000001X000000000000000000000010000";           
     Subnormal1_A <= "0000000000000100000000000000000010000";     
      wait for 100 ns;
      wait for 100 ns;  
--                  "0 00000001X000000000000000000000010000";           
     Subnormal1_A <= "0000000000000000000000000000000010000";     
      wait for 100 ns;      
      wait;
   end process;

END;




