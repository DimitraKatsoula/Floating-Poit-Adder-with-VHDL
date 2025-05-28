-- 6.3.4.1.2. comp3/comp0/comp1 - Norm_Sub_to_Norm_Norm_tb.vhd         

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY Norm_Sub_to_Norm_Norm_tb IS
END Norm_Sub_to_Norm_Norm_tb;
 
ARCHITECTURE behavior OF Norm_Sub_to_Norm_Norm_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Norm_Sub_to_Norm_Norm
    PORT(
         Subnormal2_B : IN  std_logic_vector(36 downto 0);
         Norm_Norm_10_B : OUT  std_logic_vector(36 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Subnormal2_B : std_logic_vector(36 downto 0) := (others => '0');

    --Outputs
   signal Norm_Norm_10_B : std_logic_vector(36 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: Norm_Sub_to_Norm_Norm PORT MAP (
          Subnormal2_B => Subnormal2_B,
          Norm_Norm_10_B => Norm_Norm_10_B
        );


   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns.
      wait for 100 ns;  
--                  "0 00000001X000000000000000000000010000";           
     Subnormal2_B <= "0000000000100000000000000000000010000";
      wait for 100 ns;  
--                  "0 00000001X000000000000000000000010000";           
     Subnormal2_B <= "0000000000000100000000000000000010000";     
      wait for 100 ns;
      wait for 100 ns;  
--                  "0 00000001X000000000000000000000010000";           
     Subnormal2_B <= "0000000000000000000000000000000010000";     
      wait for 100 ns;  
      wait;
   end process;
END;