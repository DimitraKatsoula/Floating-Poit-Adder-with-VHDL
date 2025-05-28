-- 6.3.3. comp2 - Distributing_demux_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY Distributing_demux_tb IS
END Distributing_demux_tb;
 
ARCHITECTURE behavior OF Distributing_demux_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Distributing_demux
    PORT(
         Distributing_demux_A : IN  std_logic_vector(36 downto 0);
         Distributing_demux_B : IN  std_logic_vector(36 downto 0);
         enable : IN  std_logic_vector(1 downto 0);
         Norm_Norm_A : OUT  std_logic_vector(36 downto 0);
         Norm_Norm_B : OUT  std_logic_vector(36 downto 0);
         Sub_Norm_A : OUT  std_logic_vector(36 downto 0);
         Sub_Norm_B : OUT  std_logic_vector(36 downto 0);
         Norm_Sub_A : OUT  std_logic_vector(36 downto 0);
         Norm_Sub_B : OUT  std_logic_vector(36 downto 0);
         Sub_Sub_A : OUT  std_logic_vector(36 downto 0);
         Sub_Sub_B : OUT  std_logic_vector(36 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Distributing_demux_A : std_logic_vector(36 downto 0) := (others => '0');
   signal Distributing_demux_B : std_logic_vector(36 downto 0) := (others => '0');
   signal enable : std_logic_vector(1 downto 0) := (others => '0');

    --Outputs
   signal Norm_Norm_A : std_logic_vector(36 downto 0);
   signal Norm_Norm_B : std_logic_vector(36 downto 0);
   signal Sub_Norm_A : std_logic_vector(36 downto 0);
   signal Sub_Norm_B : std_logic_vector(36 downto 0);
   signal Norm_Sub_A : std_logic_vector(36 downto 0);
   signal Norm_Sub_B : std_logic_vector(36 downto 0);
   signal Sub_Sub_A : std_logic_vector(36 downto 0);
   signal Sub_Sub_B : std_logic_vector(36 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: Distributing_demux PORT MAP (
          Distributing_demux_A => Distributing_demux_A,
          Distributing_demux_B => Distributing_demux_B,
          enable => enable,
          Norm_Norm_A => Norm_Norm_A,
          Norm_Norm_B => Norm_Norm_B,
          Sub_Norm_A => Sub_Norm_A,
          Sub_Norm_B => Sub_Norm_B,
          Norm_Sub_A => Norm_Sub_A,
          Norm_Sub_B => Norm_Sub_B,
          Sub_Sub_A => Sub_Sub_A,
          Sub_Sub_B => Sub_Sub_B
        );


   -- Stimulus process
   stim_proc: process
   begin        
        -- Norm + Norm  
      wait for 100 ns;  
--                NumberA <= "0 00000001X000000000000000000000010000";
      Distributing_demux_A <= "0000000011000000000000000000000000001";
      Distributing_demux_B <= "0000000011000000000000000000000000010";
      enable <= "00";       
        -- Sub + Norm
      wait for 100 ns;  
--                NumberA <= "0 00000001X000000000000000000000010000";
      Distributing_demux_A <= "0000000000000000000000000000010000000";
      Distributing_demux_B <= "0100000111000000000000000000000100000";
      enable <= "01";
        --  Norm + Sub
      wait for 100 ns;  
--                NumberA <= "0 00000001X000000000000000000000010000";
      Distributing_demux_A <= "0000000101000000000000000000000000100";
      Distributing_demux_B <= "0000000000000000000000000000001000000";
      enable <= "10";
        -- Sub + Sub        
        wait for 100 ns;
--                NumberA <= "0 00000001X000000000000000000000010000";      
      Distributing_demux_A <= "0000000000000000000000000100000000000";
      Distributing_demux_B <= "0000000000000000000000000001000000000";
      enable <= "11";
--                NumberA <= "0 00000001X000000000000000000000010000";      
      Distributing_demux_A <= "0000000000000000000000000000000000000";
      Distributing_demux_B <= "0000000000000000000000000001000000000";
      enable <= "--";
      wait;
   end process;
END;
