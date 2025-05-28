-- 6.1.6.4. comp5/comp3 - Adder.vhd

-- Purpose of Adder:
-- Add mantissa's of numbers with equal exps, and send
-- result of adding and carry bit, to --> mantissa_overflow.
-- Implement the addition with a CLA adder
--------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Adder is
    Port ( SA   : in  STD_LOGIC;
           SB   : in  STD_LOGIC;
           A    : in  STD_LOGIC_VECTOR (27 downto 0);
           B    : in  STD_LOGIC_VECTOR (27 downto 0);
           A_S  : in  STD_LOGIC;
           S    : out  STD_LOGIC_VECTOR (27 downto 0);
           SO   : out  STD_LOGIC;
           Co   : out  STD_LOGIC);
end Adder;

architecture Behavioral of Adder is

component signs port ( 
    SA  : in  STD_LOGIC;
    SB  : in  STD_LOGIC;
    A   : in  STD_LOGIC_VECTOR (27 downto 0);
    B   : in  STD_LOGIC_VECTOR (27 downto 0);
    A_S : in  STD_LOGIC; 
    Aa  : out  STD_LOGIC_VECTOR (27 downto 0);
    Bb  : out  STD_LOGIC_VECTOR (27 downto 0);
    C   : out  STD_LOGIC;--
    SO  : out  STD_LOGIC);
end component ;
                              
component adding_same_exp port ( 
    A      : in  STD_LOGIC_VECTOR (27 downto 0); 
    B      : in  STD_LOGIC_VECTOR (27 downto 0); 
    Cinput : in  STD_LOGIC;
    S      : out  STD_LOGIC_VECTOR (27 downto 0);
    Co     : out  STD_LOGIC);
end component ;


                                 
signal Aa_aux , Bb_aux , S_aux: STD_LOGIC_VECTOR (27 downto 0);
signal C_aux , SO_aux , Co_aux: STD_LOGIC;

begin

comp0 : signs port map ( SA => SA, 
                         SB => SB, 
                         A => A, 
                         B => B, 
                         A_S => A_S, 
                         Aa => Aa_aux, 
                         Bb => Bb_aux, 
                         C => C_aux, 
                         SO => SO_aux);
                                            
comp1 : adding_same_exp port map ( 
                         A => Aa_aux, 
                         B => Bb_aux, 
                         Cinput => C_aux, 
                         S => S_aux, 
                         Co => Co_aux);
---------------------------------------------
S <= S_aux ;
Co <= Co_aux ;
SO <= SO_aux ;
end Behavioral;
