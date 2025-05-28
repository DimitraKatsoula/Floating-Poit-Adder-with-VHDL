-- 6.3.5. comp4 - MUX_pre_Adder_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY MUX_pre_adder_tb IS
END MUX_pre_adder_tb;
 
ARCHITECTURE behavior OF MUX_pre_adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_pre_adder
    PORT(
         from_demux_A : IN  std_logic_vector(36 downto 0);
         from_demux_B : IN  std_logic_vector(36 downto 0);
         from_distribute_01_B : IN  std_logic_vector(36 downto 0);
         from_distribute_10_A : IN  std_logic_vector(36 downto 0);
         from_normalize_A : IN  std_logic_vector(36 downto 0);
         from_normalize_B : IN  std_logic_vector(36 downto 0);
         Result_before_adding_A : OUT  std_logic_vector(36 downto 0);
         Result_before_adding_B : OUT  std_logic_vector(36 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal from_demux_A : std_logic_vector(36 downto 0) := (others => '0');
   signal from_demux_B : std_logic_vector(36 downto 0) := (others => '0');
   signal from_distribute_01_B : std_logic_vector(36 downto 0) := (others => '0');
   signal from_distribute_10_A : std_logic_vector(36 downto 0) := (others => '0');
   signal from_normalize_A : std_logic_vector(36 downto 0) := (others => '0');
   signal from_normalize_B : std_logic_vector(36 downto 0) := (others => '0');

    --Outputs
   signal Result_before_adding_A : std_logic_vector(36 downto 0);
   signal Result_before_adding_B : std_logic_vector(36 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: MUX_pre_adder PORT MAP (
          from_demux_A => from_demux_A,
          from_demux_B => from_demux_B,
          from_distribute_01_B => from_distribute_01_B,
          from_distribute_10_A => from_distribute_10_A,
          from_normalize_A => from_normalize_A,
          from_normalize_B => from_normalize_B,
          Result_before_adding_A => Result_before_adding_A,
          Result_before_adding_B => Result_before_adding_B
        );

   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns.
        -- Norm + Norm
      wait for 100 ns;
--        NumberA <= "0 00000001X000000000000000000000010000";          
      from_demux_A <= "0100000011100000000000000000001100000";
--        NumberA <= "0 00000001X000000000000000000000010000";  
      from_demux_B <= "0100000101100000000000000000001000000";
--                NumberA <= "0 00000001X000000000000000000000010000";  
      from_distribute_01_B <= "-------------------------------------";
--                NumberA <= "0 00000001X000000000000000000000010000";  
      from_distribute_10_A <= "-------------------------------------";
--            NumberA <= "0 00000001X000000000000000000000010000";  
      from_normalize_A <= "-------------------------------------";
--            NumberA <= "0 00000001X000000000000000000000010000";  
      from_normalize_B <= "-------------------------------------";
        -- 1st Norm + 2nd Sub       
      wait for 100 ns;
--        NumberA <= "0 00000001X000000000000000000000010000";          
      from_demux_A <= "-------------------------------------";
--        NumberA <= "0 00000001X000000000000000000000010000";  
      from_demux_B <= "-------------------------------------";
--                NumberA <= "0 00000001X000000000000000000000010000";  
      from_distribute_01_B <= "-------------------------------------";
--                NumberA <= "0 00000001X000000000000000000000010000";  
      from_distribute_10_A <= "0100000011100000000000000000001100000";
--            NumberA <= "0 00000001X000000000000000000000010000";  
      from_normalize_A <= "-------------------------------------";
--            NumberA <= "0 00000001X000000000000000000000010000";  
      from_normalize_B <= "0100000101100000000000000000001000000";
        -- 1st Sub + 2nd Norm       
      wait for 100 ns;
--        NumberA <= "0 00000001X000000000000000000000010000";          
      from_demux_A <= "-------------------------------------";
--        NumberA <= "0 00000001X000000000000000000000010000";  
      from_demux_B <= "-------------------------------------";
--                NumberA <= "0 00000001X000000000000000000000010000";  
      from_distribute_01_B <= "0100000101100000000000000000001000000";
--                NumberA <= "0 00000001X000000000000000000000010000";  
      from_distribute_10_A <= "-------------------------------------";
--            NumberA <= "0 00000001X000000000000000000000010000";  
      from_normalize_A <= "0100000011100000000000000000001100000";
--            NumberA <= "0 00000001X000000000000000000000010000";  
      from_normalize_B <= "-------------------------------------";
        -- Sub + Sub        
      wait for 100 ns;
--        NumberA <= "0 00000001X000000000000000000000010000";          
      from_demux_A <= "-------------------------------------";
--        NumberA <= "0 00000001X000000000000000000000010000";  
      from_demux_B <= "-------------------------------------";
--                NumberA <= "0 00000001X000000000000000000000010000";  
      from_distribute_01_B <= "-------------------------------------";
--                NumberA <= "0 00000001X000000000000000000000010000";  
      from_distribute_10_A <= "-------------------------------------";
--            NumberA <= "0 00000001X000000000000000000000010000";  
      from_normalize_A <= "0100000011100000000000000000001100000";
--            NumberA <= "0 00000001X000000000000000000000010000";  
      from_normalize_B <= "0100000101100000000000000000001000000";  
        -- Impossible situation 
      wait for 100 ns;
--        NumberA <= "0 00000001X000000000000000000000010000";          
      from_demux_A <= "0100000011100000000000000000001100000";
--        NumberA <= "0 00000001X000000000000000000000010000";  
      from_demux_B <= "-------------------------------------";
--                NumberA <= "0 00000001X000000000000000000000010000";  
      from_distribute_01_B <= "0100000101100000000000000000001000000";
--                NumberA <= "0 00000001X000000000000000000000010000";  
      from_distribute_10_A <= "-------------------------------------";
--            NumberA <= "0 00000001X000000000000000000000010000";  
      from_normalize_A <= "-------------------------------------";
--            NumberA <= "0 00000001X000000000000000000000010000";  
      from_normalize_B <= "-------------------------------------";  
        -- Impossible situation 
      wait for 100 ns;
--        NumberA <= "0 00000001X000000000000000000000010000";          
      from_demux_A <= "-------------------------------------";
--        NumberA <= "0 00000001X000000000000000000000010000";  
      from_demux_B <= "-------------------------------------";
--                NumberA <= "0 00000001X000000000000000000000010000";  
      from_distribute_01_B <= "0100000101100000000000000000001000000";
--                NumberA <= "0 00000001X000000000000000000000010000";  
      from_distribute_10_A <= "0100000011100000000000000000001100000";
--            NumberA <= "0 00000001X000000000000000000000010000";  
      from_normalize_A <= "-------------------------------------";
--            NumberA <= "0 00000001X000000000000000000000010000";  
      from_normalize_B <= "-------------------------------------";  
        -- Impossible situation 
      wait for 100 ns;
--        NumberA <= "0 00000001X000000000000000000000010000";          
      from_demux_A <= "-------------------------------------";
--        NumberA <= "0 00000001X000000000000000000000010000";  
      from_demux_B <= "-------------------------------------";
--                NumberA <= "0 00000001X000000000000000000000010000";  
      from_distribute_01_B <= "0100000101100000000000000000001000000";
--                NumberA <= "0 00000001X000000000000000000000010000";  
      from_distribute_10_A <= "-------------------------------------";
--            NumberA <= "0 00000001X000000000000000000000010000";  
      from_normalize_A <= "-------------------------------------";
--            NumberA <= "0 00000001X000000000000000000000010000";  
      from_normalize_B <= "0100000101100000000000000000001000000";  
      wait;
   end process;
END;