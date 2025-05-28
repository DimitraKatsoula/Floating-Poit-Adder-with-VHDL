-- 6.3.6. comp5 - adder_block_tb.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY adder_block_tb IS
END adder_block_tb;
 
ARCHITECTURE behavior OF adder_block_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adder_block
    PORT(
         Input_Adder_A : IN  std_logic_vector(36 downto 0);
         Input_Adder_B : IN  std_logic_vector(36 downto 0);
         A_S : IN  std_logic;
         Result_37bit : OUT  std_logic_vector(36 downto 0);
         exp_overflow1 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Input_Adder_A : std_logic_vector(36 downto 0) := (others => '0');
   signal Input_Adder_B : std_logic_vector(36 downto 0) := (others => '0');
   signal A_S : std_logic := '0';

    --Outputs
   signal Result_37bit : std_logic_vector(36 downto 0);
   signal exp_overflow1 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: adder_block PORT MAP (
          Input_Adder_A => Input_Adder_A,
          Input_Adder_B => Input_Adder_B,
          A_S => A_S,
          Result_37bit => Result_37bit,
          exp_overflow1 => exp_overflow1
        );


   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns.
      wait for 100 ns;  
---------------------------------------------------------------
-- ADDING POSSIBLE
--------------------------------------------------------------- 
-- NORM - NORM  
---------------------------------------------------------------
        -- same exp adding       (+A)+(+B)
      wait for 100 ns;  
--           <=       "0 00000001X000000000000000000000000001";
      Input_Adder_A <= "0011111111010000000000000000000000000";-- = +1.250
      Input_Adder_B <= "0011111111001000000000000000000000000";-- = +1.125
      A_S <= '0';                                              -- = +2.375
        --                    "0 00000001 0000000000000000000000000001"; 
      wait for 100 ns;          
        assert (Result_37bit = "01000000010011000000000000000000") report "SUM INCORRECT"
        severity Error;
        -- same exp adding       (+A)+(+B)
      wait for 100 ns;  
--           <=       "0 00000001X000000000000000000000000001";
      Input_Adder_A <= "0011111111010101010101010101010101010";-- = +1.33333325386
      Input_Adder_B <= "0011111111101010101010101010101010101";-- = +1.66666662693
      A_S <= '0';                                                 -- = +2.375
--           <=             "0 00000001X000000000000000000000000001";
      wait for 100 ns;  
        assert (Result_37bit = "01000000010111111111111111111111") report "SUM INCORRECT"
        severity Error;     
        -- same exp substracting (+A)-(+b)
      wait for 100 ns;  
--           <=       "0 00000001X000000000000000000000000001";
      Input_Adder_A <= "0011111111000000000000000000000000000";-- = +1.0
      Input_Adder_B <= "0011111111000000000000000000000000000";-- = -1.0
      A_S <= '1';                                              -- = 0
              wait for 100 ns;  
        assert (Result_37bit = "0011111110000000000000000000000000000") report "SUM INCORRECT"
        severity Error; 
        -- same exp substracting (+a)-(+B)
      wait for 100 ns;  
--           <=       "0 00000001X000000000000000000000000001";     
      Input_Adder_A <= "0011111111000000000000000000000000000";-- = +1.000
      Input_Adder_B <= "0011111111000000000000000000000000000";-- = +1.000
      A_S <= '0';                                             -- = +2.000
--           <=             "0 00000001X000000000000000000000000001";
      wait for 100 ns;  
        assert (Result_37bit = "01000000010000000000000000000000") report "SUM INCORRECT"
        severity Error;
---------------------------------------------------------------     
        -- expA>expB, adding, (+A)+(+B)
      wait for 100 ns;
--           <=       "0 00000001X000000000000000000000000001";
      Input_Adder_A <= "0011111111010000000000000000000000000";-- = +1.2500
      Input_Adder_B <= "0011111101001000000000000000000000000";-- = +0.5625
      A_S <= '0';                                   -- = +1.8125
              wait for 100 ns;  
        assert (Result_37bit = "00111111111101000000000000000000") report "SUM INCORRECT"
        severity Error;
        -- expA>expB, substracting, (+A)-(+b)
      wait for 100 ns;  
--           <=       "0 00000001X000000000000000000000000001";
      Input_Adder_A <= "0011111111010000000000000000000000000";-- = +1.2500
      Input_Adder_B <= "0011111101001000000000000000000000000";-- = -0.5625
      A_S <= '1';                                              -- = +0.6875
              wait for 100 ns;  
        assert (Result_37bit = "00111111001100000000000000000000") report "SUM INCORRECT"
        severity Error;
        -- expA>expB, substracting, (+a)-(+B)
      wait for 100 ns;  
--           <=       "0 00000001X000000000000000000000000001";
      Input_Adder_A <= "1011111111010000000000000000000000000";-- = -1.2500
      Input_Adder_B <= "0011111101001000000000000000000000000";-- = +0.5625
      A_S <= '0';                                              -- = -0.6875
        wait for 100 ns;    
        assert (Result_37bit = "10111111001100000000000000000000") report "SUM INCORRECT"
        severity Error;
---------------------------------------------------------------     
        -- expA<expB, adding, (+A)+(+B)
      wait for 100 ns;
--           <=       "0 00000001X000000000000000000000000001";
      Input_Adder_B <= "0011111111010000000000000000000000000";-- = +1.2500
      Input_Adder_A <= "0011111101001000000000000000000000000";-- = +0.5625
      A_S <= '0';                                   -- = +1.8125
        wait for 100 ns;    
        assert (Result_37bit = "00111111111010000000000000000000") report "SUM INCORRECT"
        severity Error;
        -- expA<expB, substracting, (+A)-(+b)
      wait for 100 ns;  
--           <=       "0 00000001X000000000000000000000000001";
      Input_Adder_B <= "0011111111010000000000000000000000000";-- = +0.5625
      Input_Adder_A <= "0011111101001000000000000000000000000";-- = -1.2500
      A_S <= '1';                                              -- = -0.6875
        wait for 100 ns;    
        assert (Result_37bit = "10111111001100000000000000000000") report "SUM INCORRECT"
        severity Error;
        -- expA<expB, substracting, (-a)+(+B)
      wait for 100 ns;  
--           <=       "0 00000001X000000000000000000000000001";
      Input_Adder_B <= "1011111111010000000000000000000000000";-- = -0.5625
      Input_Adder_A <= "0011111101001000000000000000000000000";-- = +1.2500
      A_S <= '0';                                                -- = +0.6875
        wait for 100 ns;    
        assert (Result_37bit = "00111111001100000000000000000000") report "SUM INCORRECT"
        severity Error;
      wait;
   end process;
END;


