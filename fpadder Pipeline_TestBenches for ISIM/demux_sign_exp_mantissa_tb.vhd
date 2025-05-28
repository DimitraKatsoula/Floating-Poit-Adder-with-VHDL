-- 6.3.6.1. comp5/comp0 - demux_sign_exp_mantissa_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY demux_sign_exp_mantissa_tb IS
END demux_sign_exp_mantissa_tb;
 
ARCHITECTURE behavior OF demux_sign_exp_mantissa_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT demux_sign_exp_mantissa
    PORT(
         Input_Adder_A : IN  std_logic_vector(36 downto 0);
         Input_Adder_B : IN  std_logic_vector(36 downto 0);
         sign_A : OUT  std_logic;
         sign_B : OUT  std_logic;
         to_comp_and_sub_exp_A : OUT  std_logic_vector(7 downto 0);
         to_comp_and_sub_exp_B : OUT  std_logic_vector(7 downto 0);
         to_shift_mantissa_A : OUT  std_logic_vector(27 downto 0);
         to_shift_mantissa_B : OUT  std_logic_vector(27 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal Input_Adder_A : std_logic_vector(36 downto 0) := (others => '0');
   signal Input_Adder_B : std_logic_vector(36 downto 0) := (others => '0');

    --Outputs
   signal sign_A : std_logic;
   signal sign_B : std_logic;
   signal to_comp_and_sub_exp_A : std_logic_vector(7 downto 0);
   signal to_comp_and_sub_exp_B : std_logic_vector(7 downto 0);
   signal to_shift_mantissa_A : std_logic_vector(27 downto 0);
   signal to_shift_mantissa_B : std_logic_vector(27 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: demux_sign_exp_mantissa PORT MAP (
          Input_Adder_A => Input_Adder_A,
          Input_Adder_B => Input_Adder_B,
          sign_A => sign_A,
          sign_B => sign_B,
          to_comp_and_sub_exp_A => to_comp_and_sub_exp_A,
          to_comp_and_sub_exp_B => to_comp_and_sub_exp_B,
          to_shift_mantissa_A => to_shift_mantissa_A,
          to_shift_mantissa_B => to_shift_mantissa_B
        );

   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns.
      wait for 100 ns;  
        --              "1 00000000X0000000000000000001";
      Input_Adder_A <= "0000000001000000100000000010100000000";
      Input_Adder_B <= "1000000001000010000000000001100000000";
        --              "1 00000000X0000000000000000001";
      wait for 100 ns;  
      Input_Adder_A <= "0111110001000000001000001000100000000";
      Input_Adder_B <= "1111111101000000000000010000100000000";     
        --              "1 00000000X0000000000000000001";
      wait for 100 ns;  
      Input_Adder_A <= "1111000001100000000000000100100000000";
      Input_Adder_B <= "0111100001010000000000000010100000000";      
        --              "1 00000000X0000000000000000001";
      wait for 100 ns;  
      Input_Adder_A <= "1111000001001000000000100000100000000";
      Input_Adder_B <= "1111100001010000000000010000100000000";
      -- insert stimulus here 
      wait;
   end process;
END;