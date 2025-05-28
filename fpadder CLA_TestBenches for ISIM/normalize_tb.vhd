-- 6.3.4. comp3 - normalize_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY normalize_tb IS
END normalize_tb;
 
ARCHITECTURE behavior OF normalize_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT normalize
    PORT(
         Sub_Norm_A : IN  std_logic_vector(36 downto 0);
         Norm_Sub_B : IN  std_logic_vector(36 downto 0);
         Sub_Sub_A : IN  std_logic_vector(36 downto 0);
         Sub_Sub_B : IN  std_logic_vector(36 downto 0);
         Normal_A : OUT  std_logic_vector(36 downto 0);
         Normal_B : OUT  std_logic_vector(36 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Sub_Norm_A : std_logic_vector(36 downto 0) := (others => '0');
   signal Norm_Sub_B : std_logic_vector(36 downto 0) := (others => '0');
   signal Sub_Sub_A : std_logic_vector(36 downto 0) := (others => '0');
   signal Sub_Sub_B : std_logic_vector(36 downto 0) := (others => '0');

    --Outputs
   signal Normal_A : std_logic_vector(36 downto 0);
   signal Normal_B : std_logic_vector(36 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: normalize PORT MAP (
          Sub_Norm_A => Sub_Norm_A,
          Norm_Sub_B => Norm_Sub_B,
          Sub_Sub_A => Sub_Sub_A,
          Sub_Sub_B => Sub_Sub_B,
          Normal_A => Normal_A,
          Normal_B => Normal_B
        );

   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns.
      wait for 100 ns;

        -- 1. enable = 01 --> A= Sub, B= Norm.
--         NumberA <= "0 00000001X000000000000000000000010000";
            Sub_Norm_A <= "0000000000100000000000000000000000000";
            Norm_Sub_B <= "-------------------------------------";
            Sub_Sub_A  <= "-------------------------------------";
            Sub_Sub_B  <= "-------------------------------------";
      wait for 100 ns;

      wait for 100 ns;  
        -- 2. enable = 10 --> A=NOrm, B=Sub.
            Sub_Norm_A <= "-------------------------------------";
--         NumberA <= "0 00000001X000000000000000000000010000";         
            Norm_Sub_B <= "0000000000100000000000000000000010000";
            Sub_Sub_A  <= "-------------------------------------";
            Sub_Sub_B  <= "-------------------------------------";

      wait for 100 ns;          
        -- 3. enable = 11 --> A= Sub, B= Sub.       
            Sub_Norm_A <= "-------------------------------------";
            Norm_Sub_B <= "-------------------------------------";
--         NumberA <= "0 00000001X000000000000000000000010000";         
            Sub_Sub_A  <= "0000000000000000000000000000000010000";
            Sub_Sub_B  <= "0000000000100000000000000000000000000";
       wait for 100 ns;
        -- 4. other condition
--         NumberA <= "0 00000001X000000000000000000000010000";
            Sub_Norm_A <= "-------------------------------------";
            Norm_Sub_B <= "-------------------------------------";
            Sub_Sub_A  <= "-------------------------------------"; 
            Sub_Sub_B  <= "-------------------------------------";
        wait for 100 ns;      -- insert stimulus here 
      wait;
   end process;
END;


