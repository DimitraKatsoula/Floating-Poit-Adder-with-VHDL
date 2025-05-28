- 6.3.6.3. comp5/comp2 - right_shift_mantissa_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY right_shift_mantissa_tb IS
END right_shift_mantissa_tb;
 
ARCHITECTURE behavior OF right_shift_mantissa_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT right_shift_mantissa
    PORT(
         mantissa_in_A : IN  std_logic_vector(27 downto 0);
         mantissa_in_B : IN  std_logic_vector(27 downto 0);
         xtimes_right_shift : IN  std_logic_vector(7 downto 0);
         bigger_expA : IN  std_logic;
         to_adder_A : OUT  std_logic_vector(27 downto 0);
         to_adder_B : OUT  std_logic_vector(27 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal mantissa_in_A : std_logic_vector(27 downto 0) := (others => '0');
   signal mantissa_in_B : std_logic_vector(27 downto 0) := (others => '0');
   signal xtimes_right_shift : std_logic_vector(7 downto 0) := (others => '0');
   signal bigger_expA : std_logic := '0';

    --Outputs
   signal to_adder_A : std_logic_vector(27 downto 0);
   signal to_adder_B : std_logic_vector(27 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: right_shift_mantissa PORT MAP (
          mantissa_in_A => mantissa_in_A,
          mantissa_in_B => mantissa_in_B,
          xtimes_right_shift => xtimes_right_shift,
          bigger_expA => bigger_expA,
          to_adder_A => to_adder_A,
          to_adder_B => to_adder_B
        ); 

   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns.
      wait for 100 ns;
--                    "1 10000000 1000000000000000001";             
      mantissa_in_A <= "1100000001000000000000000001";  
      mantissa_in_B <= "1100000011000000000000000001";  
      xtimes_right_shift <= "00000001";
      bigger_expA <= '0';
      wait for 100 ns;      
      mantissa_in_A <= "1100000001000000000000000001";  
      mantissa_in_B <= "1100000101000000000000000001";  
      xtimes_right_shift <= "00000010";
      bigger_expA <= '0';
      wait for 100 ns;      
      mantissa_in_A <= "1100000001000000000000000001";  
      mantissa_in_B <= "1100000111000000000000000001";  
      xtimes_right_shift <= "00000011";
      bigger_expA <= '0';       
      wait for 100 ns;      
      mantissa_in_A <= "1100000001000000000000000000";  
      mantissa_in_B <= "1100110111000000000000000000";  
      xtimes_right_shift <= "00011011";
      bigger_expA <= '0';
        ------------------------------------------------
      wait for 100 ns;
--                    "1 10000000 1000000000000000001";             
      mantissa_in_B <= "1100000001000000000000000001";  
      mantissa_in_A <= "1100000011000000000000000001";  
      xtimes_right_shift <= "00000001";
      bigger_expA <= '1';
      wait for 100 ns;      
      mantissa_in_B <= "1100000001000000000000000001";  
      mantissa_in_A <= "1100000101000000000000000001";  
      xtimes_right_shift <= "00000010";
      bigger_expA <= '1';
      wait for 100 ns;      
      mantissa_in_B <= "1100000001000000000000000001";  
      mantissa_in_A <= "1100000111000000000000000001";  
      xtimes_right_shift <= "00000011";
      bigger_expA <= '1';       
      wait for 100 ns;      
      mantissa_in_B <= "1100000001000000000000000000";  
      mantissa_in_A <= "1100110111000000000000000000";  
      xtimes_right_shift <= "00011011";
      bigger_expA <= '1';
      wait;
   end process;
END;