-- 6.3.6.5. comp5/comp4 - carry1_shift_mantissa_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY carry1_shift_mantissa_tb IS
END carry1_shift_mantissa_tb;
 
ARCHITECTURE behavior OF carry1_shift_mantissa_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT carry1_shift_mantissa
    PORT(
         exp_plus_one_in : IN  std_logic_vector(7 downto 0);
         SS : IN  std_logic_vector(27 downto 0);
         SA : IN  std_logic;
         SB : IN  std_logic;
         A_S : IN  std_logic;
         Coo : IN  std_logic;
         no_overflow : OUT  std_logic_vector(27 downto 0);
         exp_overflow1 : OUT  std_logic;
         exp_plus_one_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal exp_plus_one_in : std_logic_vector(7 downto 0) := (others => '0');
   signal SS : std_logic_vector(27 downto 0) := (others => '0');
   signal SA : std_logic := '0';
   signal SB : std_logic := '0';
   signal A_S : std_logic := '0';
   signal Coo : std_logic := '0';

    --Outputs
   signal no_overflow : std_logic_vector(27 downto 0);
   signal exp_overflow1 : std_logic;
   signal exp_plus_one_out : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: carry1_shift_mantissa PORT MAP (
          exp_plus_one_in => exp_plus_one_in,
          SS => SS,
          SA => SA,
          SB => SB,
          A_S => A_S,
          Coo => Coo,
          no_overflow => no_overflow,
          exp_overflow1 => exp_overflow1,
          exp_plus_one_out => exp_plus_one_out
        );
 
   -- Stimulus process
   stim_proc: process
   begin        
---------------------- substracting
wait for 100 ns;    
exp_plus_one_in <= "01111111";
SS <= "1000000000000000000001000001";
SA <= '0';
SB <= '0';
A_S <= '1';
Coo <= '0';
wait for 100 ns;    
exp_plus_one_in <= "01111111";
SS <= "1000000000000000000001000001";
SA <= '0';
SB <= '1';
A_S <= '0';
Coo <= '1';
wait for 100 ns;    
exp_plus_one_in <= "01111111";
SS <= "1000000000000000000001000001";
SA <= '1';
SB <= '0';
A_S <= '0';
Coo <= '0';
wait for 100 ns;    
exp_plus_one_in <= "01111111";
SS <= "1000000000000000000001000001";
SA <= '1';
SB <= '1';
A_S <= '1';
Coo <= '1';
----------------------- adding with carry 0
wait for 100 ns;    
exp_plus_one_in <= "01111111";
SS <= "1000000000000000000001000001";
SA <= '0';
SB <= '0';
A_S <= '0';
Coo <= '0';
wait for 100 ns;    
exp_plus_one_in <= "01111111";
SS <= "1000000000000000000001000001";
SA <= '0';
SB <= '1';
A_S <= '1';
Coo <= '0';
wait for 100 ns;    
exp_plus_one_in <= "01111111";
SS <= "1000000000000000000001000001";
SA <= '1';
SB <= '0';
A_S <= '1';
Coo <= '0';
wait for 100 ns;    
exp_plus_one_in <= "01111111";
SS <= "1000000000000000000001000001";
SA <= '1';
SB <= '1';
A_S <= '0';
Coo <= '0';
wait for 100 ns;
----------------------- adding with carry 1
wait for 100 ns;    
exp_plus_one_in <= "01111111";
SS <= "1000000000000000000001000001";
SA <= '0';
SB <= '0';
A_S <= '0';
Coo <= '1';
wait for 100 ns;    
exp_plus_one_in <= "01111111";
SS <= "1000000000000000000001000001";
SA <= '0';
SB <= '1';
A_S <= '1';
Coo <= '1';
wait for 100 ns;    
exp_plus_one_in <= "01111111";
SS <= "1000000000000000000001000001";
SA <= '1';
SB <= '0';
A_S <= '1';
Coo <= '1';
wait for 100 ns;    
exp_plus_one_in <= "01111111";
SS <= "1000000000000000000001000001";
SA <= '1';
SB <= '1';
A_S <= '0';
Coo <= '1';
wait for 100 ns;
-- checking overflow (in adding and Coo=1 only)
wait for 100 ns;    
exp_plus_one_in <= "11111111";
SS <= "1000000000000000000001000001";
SA <= '1';
SB <= '1';
A_S <= '0';
Coo <= '1';
wait for 100 ns;    
-- checking no overflow (in adding and Coo=1 only)
exp_plus_one_in <= "11111110";
SS <= "1000000000000000000001000001";
SA <= '1';
SB <= '1';
A_S <= '0';
Coo <= '1';
wait;
end process;
END;


