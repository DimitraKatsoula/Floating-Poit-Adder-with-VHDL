-- 6.2.1.1.1.1. comp5/comp3/FA_n/component FA.vhd

-- pipeline CLA adder 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity FA is
Port ( Cinput : in  STD_LOGIC;
          A   : in  STD_LOGIC;
          B   : in  STD_LOGIC;
          S   : out  STD_LOGIC;
          Co  : out  STD_LOGIC);
end FA;
architecture Behavioral of FA is
signal c_g : STD_LOGIC;
signal c_p : std_logic;
    begin
    c_g <= A and B ;                  -- Carry generation
    c_p <= A xor B ;                  -- Carry propagation
    Co <= c_g or ( c_p and Cinput ) ; -- Carry out
    S <= c_p xor Cinput ;             --BitTs sum
end Behavioral;
-- pipeline FAU adder 
--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--entity FA is
--Port ( Cin  : in  STD_LOGIC;
--        A   : in  STD_LOGIC;
--        B   : in  STD_LOGIC;
--        S   : out  STD_LOGIC;
--       Cout : out  STD_LOGIC);
--end FA;
--ARCHITECTURE behaviour OF FA is
--begin
--    S <= A XOR B XOR Cin ;
--    Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B) ; 
--end architecture;


