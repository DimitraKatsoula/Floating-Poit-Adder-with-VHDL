-- 6.3.6.4. 1. comp5/comp3/comp0 - signs_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY signs_tb IS
END signs_tb;
 
ARCHITECTURE behavior OF signs_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT signs
    PORT(
         SA : IN  std_logic;
         SB : IN  std_logic;
         A : IN  std_logic_vector(27 downto 0);
         B : IN  std_logic_vector(27 downto 0);
         A_S : IN  std_logic;
         Aa : OUT  std_logic_vector(27 downto 0);
         Bb : OUT  std_logic_vector(27 downto 0);
         C : OUT  std_logic;
         SO : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal SA : std_logic := '0';
   signal SB : std_logic := '0';
   signal A : std_logic_vector(27 downto 0) := (others => '0');
   signal B : std_logic_vector(27 downto 0) := (others => '0');
   signal A_S : std_logic := '0';

    --Outputs
   signal Aa : std_logic_vector(27 downto 0);
   signal Bb : std_logic_vector(27 downto 0);
   signal C : std_logic;
   signal SO : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: signs PORT MAP (
          SA => SA,
          SB => SB,
          A => A,
          B => B,
          A_S => A_S,
          Aa => Aa,
          Bb => Bb,
          C => C,
          SO => SO
        );

   -- Stimulus process
   stim_proc: process
   begin        
-- B>A
    wait for 100ns;
SA <= '0';
SB <= '0';
A <= "0000000000000000000000000011";
B <= "0000000000000000000000000111";
A_S <= '0';
    wait for 100ns;
SA <= '0';
SB <= '0';
A <= "0000000000000000000000000011";
B <= "0000000000000000000000000111";
A_S <= '1';
    wait for 100ns;
SA <= '0';
SB <= '1';
A <= "0000000000000000000000000011";
B <= "0000000000000000000000000111";
A_S <= '0';
    wait for 100ns;
SA <= '0';
SB <= '1';
A <= "0000000000000000000000000011";
B <= "0000000000000000000000000111";
A_S <= '1';
    wait for 100ns;
SA <= '1';
SB <= '0';
A <= "0000000000000000000000000011";
B <= "0000000000000000000000000111";
A_S <= '0';
    wait for 100ns;
SA <= '1';
SB <= '0';
A <= "0000000000000000000000000011";
B <= "0000000000000000000000000111";
A_S <= '1';
    wait for 100ns;
SA <= '1';
SB <= '1';
A <= "0000000000000000000000000011";
B <= "0000000000000000000000000111";
A_S <= '0';
    wait for 100ns;
SA <= '1';
SB <= '1';
A <= "0000000000000000000000000011";
B <= "0000000000000000000000000111";
A_S <= '1';
------------------------------------
-- B<A
    wait for 100ns;
SA <= '0';
SB <= '0';
B <= "0000000000000000000000000011";
A <= "0000000000000000000000000111";
A_S <= '0';
    wait for 100ns;
SA <= '0';
SB <= '0';
B <= "0000000000000000000000000011";
A <= "0000000000000000000000000111";
A_S <= '1';
    wait for 100ns;
SA <= '0';
SB <= '1';
B <= "0000000000000000000000000011";
A <= "0000000000000000000000000111";
A_S <= '0';
    wait for 100ns;
SA <= '0';
SB <= '1';
B <= "0000000000000000000000000011";
A <= "0000000000000000000000000111";
A_S <= '1';
    wait for 100ns;
SA <= '1';
SB <= '0';
B <= "0000000000000000000000000011";
A <= "0000000000000000000000000111";
A_S <= '0';
    wait for 100ns;
SA <= '1';
SB <= '0';
B <= "0000000000000000000000000011";
A <= "0000000000000000000000000111";
A_S <= '1';
    wait for 100ns;
SA <= '1';
SB <= '1';
B <= "0000000000000000000000000011";
A <= "0000000000000000000000000111";
A_S <= '0';
    wait for 100ns;
SA <= '1';
SB <= '1';
B <= "0000000000000000000000000011";
A <= "0000000000000000000000000111";
A_S <= '1';
      wait;
   end process;
END;