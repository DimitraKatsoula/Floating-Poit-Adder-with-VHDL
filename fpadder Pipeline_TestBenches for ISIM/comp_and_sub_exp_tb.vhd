-- 6.3.6.2. comp5/comp1 - comp_and_sub_exp_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY comp_and_sub_exp_tb IS
END comp_and_sub_exp_tb;
 
ARCHITECTURE behavior OF comp_and_sub_exp_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT comp_and_sub_exp
    PORT(
         Input_exp_A : IN  std_logic_vector(7 downto 0);
         Input_exp_B : IN  std_logic_vector(7 downto 0);
         diff : OUT  std_logic_vector(7 downto 0);
         which_is_bigger : OUT  std_logic;
         to_adder_mux : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal Input_exp_A : std_logic_vector(7 downto 0) := (others => '0');
   signal Input_exp_B : std_logic_vector(7 downto 0) := (others => '0');

    --Outputs
   signal diff : std_logic_vector(7 downto 0);
   signal which_is_bigger : std_logic;
   signal to_adder_mux : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: comp_and_sub_exp PORT MAP (
          Input_exp_A => Input_exp_A,
          Input_exp_B => Input_exp_B,
          diff => diff,
          which_is_bigger => which_is_bigger,
          to_adder_mux => to_adder_mux
        );

   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns.
      wait for 100 ns;  
      Input_exp_A <= "10000000";
        Input_exp_B <= "10000001";
      wait for 100 ns;  
      Input_exp_A <= "10000001";
        Input_exp_B <=  "10000100"; 
      wait for 100 ns;  
      Input_exp_A <= "00000001";
        Input_exp_B <= "11111110";
      wait for 100 ns;  
      Input_exp_A <= "11111110";
        Input_exp_B <=  "00000001";
      wait for 100 ns;  
      Input_exp_A <= "10000001";
        Input_exp_B <= "10000000";
      wait for 100 ns;  
      Input_exp_A <= "00000001";
        Input_exp_B <=  "00000001";
      wait for 100 ns;  
      Input_exp_A <= "00000001";
        Input_exp_B <=  "00000010";
      wait;
   end process;
END;



