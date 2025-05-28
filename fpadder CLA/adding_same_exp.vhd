-- 6.1.6.4.2. comp5/comp3/comp1 - adding_same_exp.vhd	

-- Purpose of adding_same_exp:
-- Implement the addition with a CLA adder
-- if Co=1 then overflow occurs.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adding_same_exp is
    Port ( A      : in  STD_LOGIC_VECTOR (27 downto 0);
           B      : in  STD_LOGIC_VECTOR (27 downto 0);
           Cinput : in  STD_LOGIC;
           S      : out  STD_LOGIC_VECTOR (27 downto 0);
           Co     : out  STD_LOGIC);
end adding_same_exp;

architecture Behavioral of adding_same_exp is

component CLA port ( A , B , Cin : in STD_LOGIC; 
                     S , Cout    : out STD_LOGIC) ; 
                            end component ;
                            
signal aux , S_aux : STD_LOGIC_VECTOR (27 downto 0);

begin
    -- Components generation
    Compl : for i in 0 to 27 generate           
        adder_0 : if (i=0) generate -- first adder
                        adder_0comp : CLA port map ( 
                            A => A(i), 
                            B => B(i), 
                            Cin => Cinput, -- Cin = 0
                            S => S_aux(i), 
                            Cout => aux(i));
                            end generate ;
                            ---------------- other 27 adders
        adder_i : if ((i > 0) and (i < 28)) generate
                        adder_icomp : CLA port map ( 
                            A => A (i) , 
                            B => B (i) , 
                            Cin => aux(i-1), 
                            S => S_aux(i), 
                            Cout => aux(i));
                            end generate ;
    end generate;
Co <= aux(27);
S <= S_aux;
end Behavioral;
