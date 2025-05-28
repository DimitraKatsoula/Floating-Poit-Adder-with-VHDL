-- 6.3.4.2. comp3/comp1 - MUX_normalize_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
 
ENTITY MUX_normalize_tb IS
END MUX_normalize_tb;
 
ARCHITECTURE behavior OF MUX_normalize_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_normalize
    PORT(
         MUX_normalize_01_A : IN  std_logic_vector(36 downto 0);
         MUX_normalize_10_B : IN  std_logic_vector(36 downto 0);
         MUX_normalize_11_A : IN  std_logic_vector(36 downto 0);
         MUX_normalize_11_B : IN  std_logic_vector(36 downto 0);
         MUX_normalize_out_A : OUT  std_logic_vector(36 downto 0);
         MUX_normalize_out_B : OUT  std_logic_vector(36 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal MUX_normalize_01_A : std_logic_vector(36 downto 0) := (others => '0');
   signal MUX_normalize_10_B : std_logic_vector(36 downto 0) := (others => '0');
   signal MUX_normalize_11_A : std_logic_vector(36 downto 0) := (others => '0');
   signal MUX_normalize_11_B : std_logic_vector(36 downto 0) := (others => '0');

    --Outputs
   signal MUX_normalize_out_A : std_logic_vector(36 downto 0);
   signal MUX_normalize_out_B : std_logic_vector(36 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: MUX_normalize PORT MAP (
          MUX_normalize_01_A => MUX_normalize_01_A,
          MUX_normalize_10_B => MUX_normalize_10_B,
          MUX_normalize_11_A => MUX_normalize_11_A,
          MUX_normalize_11_B => MUX_normalize_11_B,
          MUX_normalize_out_A => MUX_normalize_out_A,
          MUX_normalize_out_B => MUX_normalize_out_B
        );

 
   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns.
      wait for 100 ns;  
--                         "0 00000001X000000000000000000000010000";        
      MUX_normalize_01_A <= "0000000011010000000000000000000010000";
      MUX_normalize_10_B <= "0000000111000100000000000000000010000";
      MUX_normalize_11_A <= "0000001111000001000000000000000010000";
      MUX_normalize_11_B <= "0000011111000000010000000000000010000";
      wait for 100 ns;  
--                         "0 00000001X000000000000000000000010000";        
      MUX_normalize_01_A <= "0000000011110000000000000000000010000";
      MUX_normalize_10_B <= "0000000111010100000000000000000010000";
      MUX_normalize_11_A <= "0000001111001001000000000000000010000";
      MUX_normalize_11_B <= "0000011111000100010000000000000010000";
      wait;
   end process;
END;


