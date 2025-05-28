6.1.2. comp1 - implicit_guard_bits.vhd

-- Purpose of implicit_guard_bits:
-- Add implicit bit and 4 guard  bits.
-- Guard bits are added, to increase accurecy.
-- Outputs are sent to --> Distributing_demux.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity implicit_guard_bit is
Port ( NumberAA : in  STD_LOGIC_VECTOR (31 downto 0);
       NumberBB : in  STD_LOGIC_VECTOR (31 downto 0);
       enable   : in  STD_LOGIC_vector(1 downto 0);
       NA       : out  STD_LOGIC_VECTOR (36 downto 0);
       NB       : out  STD_LOGIC_VECTOR (36 downto 0));
end implicit_guard_bit;

architecture Behavioral of implicit_guard_bit is

signal EA , EB : std_logic_vector (7 downto 0);  -- exponents
signal MA , MB : std_logic_vector (22 downto 0); -- mantissa
signal SA , SB : std_logic;                      -- signs 
signal NAs, NBs: std_logic_vector (36 downto 0); -- mantissa

begin
SA <= NumberAA (31);                             -- signs                                   
SB <= NumberBB (31);
EA <= NumberAA (30 downto 23);                   -- exponents                           
EB <= NumberBB (30 downto 23);
MA <= NumberAA (22 downto 0);                    -- mantissa
MB <= NumberBB (22 downto 0);

process ( SA, SB, EA, EB, MA, MB, enable )
begin
-- when enable is anything except "--", 
-- then adding/subtracting is posible and...
-- code for enable = 00, 01, 10, 11.
    case enable is
   -------------- 00 -> Norm+Norm
        when "00" =>   
                  NAs (36) <= SA;                -- Sign A
                     NAs (35 downto 28) <= EA;   -- Exponent A 
                     NBs (36) <= SB;             -- Sign B
                     NBs (35 downto 28) <= EB;   -- Exponent B               
                     ------------------------- Mantissa A
                     ------ If Exponent>0 and mantissa>0 --> A=Normal
                        NAs (27) <= '1';         -- Implicit bit
                        NAs (26 downto 4) <= MA; -- Mantissa
                        NAs (3 downto 0) <=  X"0"; --  "0000" Guard bits
                     ------------------------ Mantissa B
                     ------ If Exponent>0 and mantissa>0 --> B=Normal
                        NBs (27) <= '1';                 -- Implicit bit
                        NBs (26 downto 4) <= MB;         -- Mantissa
                        NBs (3 downto 0) <= X"0";        -- Guard bits                              
   -------------- 01 -> SubN+Norm
        when "01" =>    
                     NAs (36) <= SA;                     -- Sign A
                     NAs (35 downto 28) <= EA;           -- Exponent A              
                     NBs (36) <= SB;                     -- Sign B
                     NBs (35 downto 28) <= EB;           -- Exponent B                   
                     ------------------------- Mantissa A
                     ----- If Exponent=0 and mantissa>0 --> A=Subnormal
                        NAs (27) <= '0';                 -- Implicit bit
                        NAs (26 downto 4) <= MA;         -- Mantissa
                        NAs (3 downto 0) <= X"0";      -- "0000" Guard bits
                   ------------------------ Mantissa B
                    ------ If Exponent>0 and mantissa>0 --> B=Normal
                        NBs (27) <= '1';                 -- Implicit bit
                        NBs (26 downto 4) <= MB;         -- Mantissa
                        NBs (3 downto 0) <= X"0";        -- Guard bits                          
   -------------- 10 -> Norm+SubN
        when "10" =>   
                  NAs (36) <= SA;                        -- Sign A
                     NAs (35 downto 28) <= EA;           -- Exponent A                    
                     NBs (36) <= SB;                     -- Sign B
                     NBs (35 downto 28) <= EB;           -- Exponent B
                     ------------------------ Mantissa A
                     ----- If Exponent>0 and mantissa>0 --> A=Normal
                            NAs (27) <= '1';             -- Implicit bit
                            NAs (26 downto 4) <= MA;     -- Mantissa
                            NAs (3 downto 0) <=  X"0";  -- "0000" Guard bits
                        ------------------------ Mantissa B
                        ------ If Exponent=0 and mantissa>0 --> B=Subnormal
                            NBs (27 ) <= '0';            -- Implicit bit
                            NBs (26 downto 4) <= MB;     -- Mantissa
                            NBs (3 downto 0) <= X"0";    -- Guard bits
   -------------- 11    -> SubN+SubN
        when "11" =>   
                  NAs (36) <= SA;                        -- Sign A
                     NAs (35 downto 28) <= EA;           -- Exponent A                   
                     NBs (36) <= SB;                     -- Sign B
                     NBs (35 downto 28) <= EB;           -- Exponent B
                     ------------------------ Mantissa A
                     ----- If Exponent=0 and mantissa>0 --> A=Subnormal
                        NAs (27) <= '0';                 -- Implicit bit
                        NAs (26 downto 4) <= MA;         -- Mantissa
                        NAs (3 downto 0) <= X"0";      --  "0000" Guard bits
                     ------------------------ Mantissa B
                     ------ If Exponent=0 and mantissa>0 --> B=Subnormal
                        NBs (27 ) <= '0';                -- Implicit bit
                        NBs (26 downto 4) <= MB;         -- Mantissa
                        NBs (3 downto 0) <= X"0";        -- Guard bits 
        when others => --Z <= 'X';                          
                        NAs <= "-------------------------------------";
                        NBs <= "-------------------------------------";
    end case;
end process;
NA(36) <= NAs(36);
NA(35 downto 28) <= NAs(35 downto 28);
NA(27) <= NAs(27);
NA(26 downto 4) <= NAs(26 downto 4);
NA (3 downto 0) <= NAs (3 downto 0);
-----------------------------------
NB(36) <= NBs(36);
NB(35 downto 28) <= NBs(35 downto 28);
NB(27) <= NBs(27);
NB(26 downto 4) <= NBs(26 downto 4);
NB (3 downto 0) <= NBs (3 downto 0);
end Behavioral;
