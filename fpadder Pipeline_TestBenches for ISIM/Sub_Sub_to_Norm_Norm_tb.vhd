-- 6.3.4.1.3. comp3/comp0/comp2 - Sub_Sub_to_Norm_Norm_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Sub_Sub_to_Norm_Norm_tb IS
END Sub_Sub_to_Norm_Norm_tb;
 
ARCHITECTURE behavior OF Sub_Sub_to_Norm_Norm_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sub_Sub_to_Norm_Norm
    PORT(
         Subnormal3_A : IN  std_logic_vector(36 downto 0);
         Subnormal3_B : IN  std_logic_vector(36 downto 0);
         Norm_Norm_11_A : OUT  std_logic_vector(36 downto 0);
         Norm_Norm_11_B : OUT  std_logic_vector(36 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Subnormal3_A : std_logic_vector(36 downto 0) := (others => '0');
   signal Subnormal3_B : std_logic_vector(36 downto 0) := (others => '0');

    --Outputs
   signal Norm_Norm_11_A : std_logic_vector(36 downto 0);
   signal Norm_Norm_11_B : std_logic_vector(36 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: Sub_Sub_to_Norm_Norm PORT MAP (
          Subnormal3_A => Subnormal3_A,
          Subnormal3_B => Subnormal3_B,
          Norm_Norm_11_A => Norm_Norm_11_A,
          Norm_Norm_11_B => Norm_Norm_11_B
        );

   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns.
      wait for 100 ns;  
--                  "0 00000001X000000000000000000000010000";           
     Subnormal3_A <= "0000000000100000000000000000000010000";
     Subnormal3_B <= "0000000000000000000000000000000010000";
      wait for 100 ns;  
--                  "0 00000001X000000000000000000000010000";           
     Subnormal3_A <= "0000000000000100000000000000000010000";     
      wait for 100 ns;
      wait for 100 ns;  
--                  "0 00000001X000000000000000000000010000";           
     Subnormal3_A <= "0000000000000000000000000000000010000";
     Subnormal3_B <= "0000000000100000000000000000000010000"; 
      wait for 100 ns;  
      wait;
   end process;
END;