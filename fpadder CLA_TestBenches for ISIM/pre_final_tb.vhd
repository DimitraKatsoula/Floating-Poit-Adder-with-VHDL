-- 6.3.9. comp8 - pre_final_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY pre_final_tb IS
END pre_final_tb;
 
ARCHITECTURE behavior OF pre_final_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pre_final
    PORT(
         Adding_imposible : IN  std_logic_vector(31 downto 0);
         Adding_result : IN  std_logic_vector(31 downto 0);
         enable : IN  std_logic_vector(1 downto 0);
         exp_overflow1 : IN  std_logic;
         exp_overflow2 : IN  std_logic;
         exp_overflow : OUT  std_logic;
         Result_pre_final : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal Adding_imposible : std_logic_vector(31 downto 0) := (others => '0');
   signal Adding_result : std_logic_vector(31 downto 0) := (others => '0');
   signal enable : std_logic_vector(1 downto 0) := (others => '0');
   signal exp_overflow1 : std_logic := '0';
   signal exp_overflow2 : std_logic := '0';

    --Outputs
   signal exp_overflow : std_logic;
   signal Result_pre_final : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: pre_final PORT MAP (
          Adding_imposible => Adding_imposible,
          Adding_result => Adding_result,
          enable => enable,
          exp_overflow1 => exp_overflow1,
          exp_overflow2 => exp_overflow2,
          exp_overflow => exp_overflow,
          Result_pre_final => Result_pre_final
        );

   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns.
      wait for 100 ns;  
Adding_imposible <= "--------------------------------";
Adding_result <=    "00000000010000000000000000000100";
enable <= "00";
exp_overflow1 <= '0';
exp_overflow2 <= '0';
      wait for 100 ns;  
Adding_imposible <= "--------------------------------";
Adding_result <=    "00000000010000000000000000000100";
enable <= "01";
exp_overflow1 <= '0';
exp_overflow2 <= '0';
      wait for 100 ns;  
Adding_imposible <= "--------------------------------";
Adding_result <=    "00000000010000000000000000000100";
enable <= "10";
exp_overflow1 <= '0';
exp_overflow2 <= '0';
      wait for 100 ns;  
Adding_imposible <= "--------------------------------";
Adding_result <=    "00111111110000000000000000000100";
enable <= "11";
exp_overflow1 <= '0';
exp_overflow2 <= '0';
      wait for 100 ns;  
Adding_imposible <= "--------------------------------";
Adding_result <=    "00111111110000000000000000000100";
enable <= "11";
exp_overflow1 <= '1';
exp_overflow2 <= '0';
      wait for 100 ns;  
Adding_imposible <= "--------------------------------";
Adding_result <=    "00111111110000000000000000000100";
enable <= "11";
exp_overflow1 <= '0';
exp_overflow2 <= '1';
      wait for 100 ns;  
Adding_imposible <= "--------------------------------";
Adding_result <=    "00111111110000000000000000000100";
enable <= "11";
exp_overflow1 <= '1';
exp_overflow2 <= '1';
      wait for 100 ns;  
Adding_imposible <= "00000000000000000000000000000000"; 
Adding_result <=    "--------------------------------";
enable <= "--";
exp_overflow1 <= '0';
exp_overflow2 <= '0';
wait;
end process;
END;