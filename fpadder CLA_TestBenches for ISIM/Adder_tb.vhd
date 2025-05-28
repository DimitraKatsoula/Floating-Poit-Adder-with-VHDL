-- 6.3.6.4. comp5/comp3 - Adder_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY Adder_tb IS
END Adder_tb;
 
ARCHITECTURE behavior OF Adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Adder
    PORT(
         SA : IN  std_logic;
         SB : IN  std_logic;
         A : IN  std_logic_vector(27 downto 0);
         B : IN  std_logic_vector(27 downto 0);
         A_S : IN  std_logic;
         S : OUT  std_logic_vector(27 downto 0);
         SO : OUT  std_logic;
         Co : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal SA : std_logic := '0';
   signal SB : std_logic := '0';
   signal A : std_logic_vector(27 downto 0) := (others => '0');
   signal B : std_logic_vector(27 downto 0) := (others => '0');
   signal A_S : std_logic := '0';

    --Outputs
   signal S : std_logic_vector(27 downto 0);
   signal SO : std_logic;
   signal Co : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: Adder PORT MAP (
          SA => SA,
          SB => SB,
          A => A,
          B => B,
          A_S => A_S,
          S => S,
          SO => SO,
          Co => Co
        );

   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns.
      wait for 100 ns;  
      SA <= '0';
        SB <= '0';
        A<= "1000000000000000000000110000";
        B<= "1000000000000000000001000000";
      A_S<='0';
      wait for 100 ns;      
      SA <= '0';
        SB <= '0';
        A<= "1000000000000000000000000010";
        B<= "1111000000000000000000110000";
      A_S<='0';
      wait for 100 ns;      
      SA <= '0';
        SB <= '0';
        A<= "1010101010101010101010101010";
        B<= "0101010101010101010101010101";
      A_S<='0';     
        wait for 100 ns;        
      SA <= '0';
        SB <= '0';
        A<= "1100000000000000000000000010";
        B<= "1111111111111111111111111111";
      A_S<='0';
        wait for 100 ns;
        SA <= '0';
        SB <= '0';
        A<= "1000000000000000000000000010";
        B<= "1000000000000000000000000001";
      A_S<='1';     
      wait;
   end process;
END;


