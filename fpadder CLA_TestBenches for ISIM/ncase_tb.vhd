-- 6.3.1. comp0 - ncase_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY ncase_tb IS
END ncase_tb;
ARCHITECTURE behavior OF ncase_tb IS  
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT ncase
    PORT(
         NumberA : IN  std_logic_vector(31 downto 0);
         NumberB : IN  std_logic_vector(31 downto 0);
         A_S : IN  std_logic;
         enable : OUT  std_logic_vector(1 downto 0);
         S1_ncase : OUT  std_logic_vector(31 downto 0);
         S2_ncase : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal NumberA : std_logic_vector(31 downto 0) := (others => '0');
   signal NumberB : std_logic_vector(31 downto 0) := (others => '0');
   signal A_S : std_logic := '0';
    --Outputs
   signal enable : std_logic_vector(1 downto 0);
   signal S1_ncase : std_logic_vector(31 downto 0);
   signal S2_ncase : std_logic_vector(31 downto 0);
BEGIN
    -- Instantiate the Unit Under Test (UUT)
   uut: ncase PORT MAP (
          NumberA => NumberA,
          NumberB => NumberB,
          A_S => A_S,
          enable => enable,
          S1_ncase => S1_ncase,
          S2_ncase => S2_ncase
        );
   -- Stimulus process
   stim_proc: process
   begin    
        -- Norm + Norm  
      wait for 100 ns;  
--           <= "0 00000001 00000000000000000000001";
      NumberA <= "00000000100000000000000000000001";
      NumberB <= "00000000100000000000000000000010";
      A_S <= '0';
        -- Sub + Norm
      wait for 100 ns;  
--           <= "0 00000001 00000000000000000000001";
      NumberA <= "00000000010000000000000000000100";
      NumberB <= "00000001100000000000000000000010";
      A_S <= '0';
        -- Norm + Sub
      wait for 100 ns;  
--           <= "0 00000001 00000000000000000000001";
      NumberA <= "00000001100000000000000000000010";
      NumberB <= "00000000010000000000000000000100";
      A_S <= '0';
        -- Sub + Sub
      wait for 100 ns;  
--           <= "0 00000001 00000000000000000000001";
      NumberA <= "00000000001000000000000000000110";
      NumberB <= "00000000010000000000000000000100";
      A_S <= '0';           
        -- Norm + Zero
      wait for 100 ns;  
--           <= "0 00000001 00000000000000000000001";
      NumberA <= "00000000100000000000000000000010";
      NumberB <= "00000000000000000000000000000000";
      A_S <= '0';   
        -- +inf + Zero
        wait for 100 ns;
--           <= "0 00000001 00000000000000000000001";   
      NumberA <= "01111111100000000000000000000000";
      NumberB <= "00000000000000000000000000000001";
      A_S <= '0';
        -- +qNaN + Zero
      wait for 100 ns;  
--           <= "0 00000001 00000000000000000000001";
      NumberA <= "01111111100000000000000000000001";
      NumberB <= "00000000000000000000000000000000";
      A_S <= '0';
        -- +inf -inf
        wait for 100 ns;
--           <= "0 00000001 00000000000000000000001";       
      NumberA <= "01111111100000000000000000000000";
      NumberB <= "01111111100000000000000000000000";
      A_S <= '1';
      wait;
   end process;

END;

