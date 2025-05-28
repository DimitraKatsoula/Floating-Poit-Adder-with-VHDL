-- 6.3.7. comp6 - normalize_results_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY normalize_result_tb IS
END normalize_result_tb;
 
ARCHITECTURE behavior OF normalize_result_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT normalize_result
    PORT(
         Maybe_Subnormal : IN  std_logic_vector(36 downto 0);
         exp_underflow : OUT  std_logic;
         Normal : OUT  std_logic_vector(36 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal Maybe_Subnormal : std_logic_vector(36 downto 0) := (others => '0');

    --Outputs
   signal exp_underflow : std_logic;
   signal Normal : std_logic_vector(36 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: normalize_result PORT MAP (
          Maybe_Subnormal => Maybe_Subnormal,
          exp_underflow => exp_underflow,
          Normal => Normal
        );


   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns.
      wait for 100 ns;  
        --          "0 00000001X000000000000000000000000001";
Maybe_Subnormal <= "0011111110100000000000000000000000000";
      wait for 100 ns;  
        --          "0 00000001X000000000000000000000000001";
Maybe_Subnormal <= "0011111110010000000000000000000000000";
      wait for 100 ns;  
        --          "0 00000001X000000000000000000000000001";
Maybe_Subnormal <= "0011111111100000000000000000000010000";

      wait for 100 ns;  
        --          "0 00000001X000000000000000000000000001";
Maybe_Subnormal <= "0011111110000000000000000000000000001";
      wait for 100 ns;  
        --          "0 00000001X000000000000000000000000001";
Maybe_Subnormal <= "0011111110000000000000000000000000000";
        --          "0 00000001X000000000000000000000000001";
Maybe_Subnormal <= "0000000010000010000000000000000000000";
wait;
end process;
END;




