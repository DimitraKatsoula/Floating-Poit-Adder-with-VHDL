-- 6.3.2. comp1 - implicit_guard_bits_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY implicit_guard_bit_tb IS
END implicit_guard_bit_tb;
 
ARCHITECTURE behavior OF implicit_guard_bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT implicit_guard_bit
    PORT(
         NumberAA : IN  std_logic_vector(31 downto 0);
         NumberBB : IN  std_logic_vector(31 downto 0);
         enable : IN  std_logic_vector(1 downto 0);
         NA : OUT  std_logic_vector(36 downto 0);
         NB : OUT  std_logic_vector(36 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal NumberAA : std_logic_vector(31 downto 0) := (others => '0');
   signal NumberBB : std_logic_vector(31 downto 0) := (others => '0');
   signal enable : std_logic_vector(1 downto 0) := (others => '0');

    --Outputs
   signal NA : std_logic_vector(36 downto 0);
   signal NB : std_logic_vector(36 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: implicit_guard_bit PORT MAP (
          NumberAA => NumberAA,
          NumberBB => NumberBB,
          enable => enable,
          NA => NA,
          NB => NB
        );


   -- Stimulus process
   stim_proc: process
   begin        
        -- Norm + Norm  
      wait for 100 ns;  
--    NumberA <= "0 00000001 00000000000000000000001";
      NumberAA <= "00000000100000000000000000000001";
      NumberBB <= "00000000100000000000000000000010";
      enable <= "00";
        -- Norm + Zero
      wait for 100 ns;  
--    NumberA <= "0 00000001 00000000000000000000001";
      NumberAA <= "00000000100000000000000000000010";
      NumberBB <= "00000000000000000000000000000000";
      enable <= "--";
        -- NaN + Zero
        wait for 100 ns;
--    NumberA <= "0 00000001 00000000000000000000001";      
      NumberAA <= "01111111111111111111111111111111";
      NumberBB <= "00000000000000000000000000000001";
      enable <= "--";
        -- inf + Sub
        wait for 100 ns;
--    NumberA <= "0 00000001 00000000000000000000001";      
      NumberAA <= "01111111100000000000000000000000";
      NumberBB <= "00000000000000000000000000000001";
      enable <= "--";       
        -- Sub + Norm
      wait for 100 ns;  
        --         "0 00000000 00001000000000000000000";
      NumberAA <= "00000000010000000000000000000100";
      NumberBB <= "01000001100000000000000000000010";
      enable <= "01";
        --  Norm + Sub
      wait for 100 ns;  
        --         "0 00000000 00001000000000000000000";
      NumberAA <= "00000001010000000000000000000100";
      NumberBB <= "00000000000000000000000000000010";
      enable <= "10";
        -- Sub + Sub        
        wait for 100 ns;
--   NumberA <=  "0 00000001 00000000000000000000001";      
      NumberAA <= "00000000000000000000000001000000";
      NumberBB <= "00000000000000000000000000100000";
      enable <= "11";
----
        -- Norm + Norm  
      wait for 100 ns;  
--           <= "0 00000001 00000000000000000000001";
      NumberAA <= "00000000100000000000000000000001";
      NumberBB <= "00000000100000000000000000000010";
      enable <= "00";
        -- Sub + Norm
      wait for 100 ns;  
--           <= "0 00000001 00000000000000000000001";
      NumberAA <= "00000000010000000000000000000100";
      NumberBB <= "00000001100000000000000000000010";
      enable <= "01";
        -- Norm + Sub
      wait for 100 ns;  
--           <= "0 00000001 00000000000000000000001";
      NumberAA <= "00000001100000000000000000000010";
      NumberBB <= "00000000010000000000000000000100";
      enable <= "10";
        -- Sub + Sub
      wait for 100 ns;  
--           <= "0 00000001 00000000000000000000001";
      NumberAA <= "00000000001000000000000000000110";
      NumberBB <= "00000000010000000000000000000100";
      enable <= "11";   
      wait;
   end process;
END;
