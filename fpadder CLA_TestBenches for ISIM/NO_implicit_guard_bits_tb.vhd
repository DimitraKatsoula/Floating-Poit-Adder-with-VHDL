-- 6.3.8. comp7 - NO_implicit_guard_bits_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY NO_implicit_guard_bits_tb IS
END NO_implicit_guard_bits_tb;
 
ARCHITECTURE behavior OF NO_implicit_guard_bits_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT NO_implicit_guard_bits
    PORT(
         Input_NO_implicit : IN  std_logic_vector(36 downto 0);
         exp_overflow2 : OUT  std_logic;
         Result_32bit : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Input_NO_implicit : std_logic_vector(36 downto 0) := (others => '0');

    --Outputs
   signal exp_overflow2 : std_logic;
   signal Result_32bit : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: NO_implicit_guard_bits PORT MAP (
          Input_NO_implicit => Input_NO_implicit,
          exp_overflow2 => exp_overflow2,
          Result_32bit => Result_32bit
        );


   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns.
      wait for 100 ns;  
        --          "0 00000001X000000000000000000000000001";
Input_NO_implicit <= "0011111111100000000000000000000001000";
      wait for 100 ns;  
        --          "0 00000001X000000000000000000000000001";
Input_NO_implicit <= "0011111111100000000000000000000000111";
      wait for 100 ns;  
        --          "0 00000001X000000000000000000000000001";
Input_NO_implicit <= "0011111111100000000000000000000000000";
      wait for 100 ns;  
        --          "0 00000001X000000000000000000000000001";
Input_NO_implicit <= "0111111111111111111111111111111111100";
      wait for 100 ns;  
        --          "0 00000001X000000000000000000000000001";
Input_NO_implicit <= "0111111101111111111111111111111111100";
      wait for 100 ns;  
        --          "0 00000001X000000000000000000000000001";
Input_NO_implicit <= "0111111111111111111111111111111110010";
      wait;
   end process;
END;