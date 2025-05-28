-- 6.3.6.6. comp5/comp5 - adder_mux_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY adder_mux_tb IS
END adder_mux_tb;
 
ARCHITECTURE behavior OF adder_mux_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adder_mux
    PORT(
         SOO : IN  std_logic;
         exp : IN  std_logic_vector(7 downto 0);
         adder_mux_in : IN  std_logic_vector(27 downto 0);
         to_adder_block : OUT  std_logic_vector(36 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal SOO : std_logic := '0';
   signal exp : std_logic_vector(7 downto 0) := (others => '0');
   signal adder_mux_in : std_logic_vector(27 downto 0) := (others => '0');

    --Outputs
   signal to_adder_block : std_logic_vector(36 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: adder_mux PORT MAP (
          SOO => SOO,
          exp => exp,
          adder_mux_in => adder_mux_in,
          to_adder_block => to_adder_block
        );

 
   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns.
      wait for 100 ns;  
         SOO <= '0';
         exp <= "01111111";
         adder_mux_in <= "0101010101010101010101010101";
      wait for 100 ns;  
         SOO <= '1';
         exp <= "11111111";
         adder_mux_in <= "0101010101010101010101010101";
      wait;
   end process;
END;