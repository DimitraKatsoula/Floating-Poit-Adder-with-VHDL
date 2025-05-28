-- 6.3.4.1. comp3/comp0 - DEMUX_normalize_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY DEMUX_normalize_tb IS
END DEMUX_normalize_tb;
 
ARCHITECTURE behavior OF DEMUX_normalize_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DEMUX_normalize
    PORT(
         DEMUX_normalize_01_A : IN  std_logic_vector(36 downto 0);
         DEMUX_normalize_10_B : IN  std_logic_vector(36 downto 0);
         DEMUX_normalize_11_A : IN  std_logic_vector(36 downto 0);
         DEMUX_normalize_11_B : IN  std_logic_vector(36 downto 0);
         DEMUX_normalize_out_01_A : OUT  std_logic_vector(36 downto 0);
         DEMUX_normalize_out_10_B : OUT  std_logic_vector(36 downto 0);
         DEMUX_normalize_out_11_A : OUT  std_logic_vector(36 downto 0);
         DEMUX_normalize_out_11_B : OUT  std_logic_vector(36 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DEMUX_normalize_01_A : std_logic_vector(36 downto 0) := (others => '0');
   signal DEMUX_normalize_10_B : std_logic_vector(36 downto 0) := (others => '0');
   signal DEMUX_normalize_11_A : std_logic_vector(36 downto 0) := (others => '0');
   signal DEMUX_normalize_11_B : std_logic_vector(36 downto 0) := (others => '0');

    --Outputs
   signal DEMUX_normalize_out_01_A : std_logic_vector(36 downto 0);
   signal DEMUX_normalize_out_10_B : std_logic_vector(36 downto 0);
   signal DEMUX_normalize_out_11_A : std_logic_vector(36 downto 0);
   signal DEMUX_normalize_out_11_B : std_logic_vector(36 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: DEMUX_normalize PORT MAP (
          DEMUX_normalize_01_A => DEMUX_normalize_01_A,
          DEMUX_normalize_10_B => DEMUX_normalize_10_B,
          DEMUX_normalize_11_A => DEMUX_normalize_11_A,
          DEMUX_normalize_11_B => DEMUX_normalize_11_B,
          DEMUX_normalize_out_01_A => DEMUX_normalize_out_01_A,
          DEMUX_normalize_out_10_B => DEMUX_normalize_out_10_B,
          DEMUX_normalize_out_11_A => DEMUX_normalize_out_11_A,
          DEMUX_normalize_out_11_B => DEMUX_normalize_out_11_B
        );


   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns.
      wait for 100 ns;  
--                           "0 00000001X000000000000000000000010000";          
      DEMUX_normalize_01_A <= "0000000000100000000000000000000010000";
      DEMUX_normalize_10_B <= "0000000000010000000000000000000010000";
      DEMUX_normalize_11_A <= "0000000000001000000000000000000010000";
      DEMUX_normalize_11_B <= "0000000000000100000000000000000010000";
      wait for 100 ns;  
--                           "0 00000001X000000000000000000000010000";          
      DEMUX_normalize_01_A <= "0000000000100000000000000000000000000";
      DEMUX_normalize_10_B <= "0000000000100000000000000000000000000";
      DEMUX_normalize_11_A <= "0000000000101000000000000000000000000";
      DEMUX_normalize_11_B <= "0000000000100100000000000000000000000";
      wait for 100 ns;  
        wait;
   end process;
END;