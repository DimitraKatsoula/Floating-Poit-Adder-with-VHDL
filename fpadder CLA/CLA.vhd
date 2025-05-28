-- 6.1.6.4.2.1. comp5/comp3/comp1/adder_0comp, comp5/comp3/comp1/adder_icomp - CLA.vhd

-- Purpose of CLA:
-- Adder Carry LookAhead of each bit
-- c(n+1) = [g(n)] xor [p(n) and cin(n)]
-- cout(1) = [c_g(0)] xor [c_p(0) and cin(0)] 
--------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CLA is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end CLA;

architecture Behavioral of CLA is

signal c_g , c_p : STD_LOGIC;

    begin

    c_g <= A and B ;                 -- Carry generation
    c_p <= A xor B ;                 -- Carry propagation

    Cout <= c_g or ( c_p and Cin ) ; -- Carry out
    S <= c_p xor Cin ;               -- Bits sum

end Behavioral;
