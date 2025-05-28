-- 6.1.4.2. comp3/comp1 - MUX_normalize.vhd

-- Purpose of MUX_normalize:
-- Pick proper output of DEMUX_normalize,
-- and send to next block --> MUX_pre_adder.
-- Block MUX_normalize is a 4 to 2 mux.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MUX_normalize is
port ( MUX_normalize_01_A  : in  STD_LOGIC_VECTOR (36 downto 0);   
       -- 1st number is Sub
       MUX_normalize_10_B  : in  STD_LOGIC_VECTOR (36 downto 0);   
       -- 2nd number is Sub
       MUX_normalize_11_A  : in  STD_LOGIC_VECTOR (36 downto 0);   
       -- Both numbers are Subs
       MUX_normalize_11_B  : in  STD_LOGIC_VECTOR (36 downto 0);   
       -- Both numbers are Subs
       MUX_normalize_out_A : out  STD_LOGIC_VECTOR (36 downto 0);  
       -- Normalized Pair of Numbers
       MUX_normalize_out_B : out  STD_LOGIC_VECTOR (36 downto 0)); 
       -- Normalized Pair of Numbers
end MUX_normalize;

architecture Behavioral of MUX_normalize is

signal MUX_normalize_01_A_s  :  STD_LOGIC_VECTOR (36 downto 0);
signal MUX_normalize_10_B_s  :  STD_LOGIC_VECTOR (36 downto 0);
signal MUX_normalize_11_A_s  :  STD_LOGIC_VECTOR (36 downto 0);
signal MUX_normalize_11_B_s  :  STD_LOGIC_VECTOR (36 downto 0);
signal MUX_normalize_out_A_s :  STD_LOGIC_VECTOR (36 downto 0);
signal MUX_normalize_out_B_s :  STD_LOGIC_VECTOR (36 downto 0);

begin

MUX_normalize_01_A_s <= MUX_normalize_01_A;
MUX_normalize_10_B_s <= MUX_normalize_10_B;
MUX_normalize_11_A_s <= MUX_normalize_11_A;
MUX_normalize_11_B_s <= MUX_normalize_11_B;

process (MUX_normalize_01_A_s,MUX_normalize_11_A_s,
         MUX_normalize_10_B_s,MUX_normalize_11_B_s)
    begin
    -- Sub_Norm
    if MUX_normalize_01_A_s /= "-------------------------------------" then
        MUX_normalize_out_A_s <= MUX_normalize_01_A_s;
        MUX_normalize_out_B_s <= "-------------------------------------";
    end if;
    -- Norm_sub
    if MUX_normalize_10_B_s /=  "-------------------------------------"  then 
        MUX_normalize_out_A_s <= "-------------------------------------";
        MUX_normalize_out_B_s <= MUX_normalize_10_B_s;
    end if;
    -- Sub_Sub
    if (MUX_normalize_11_A_s /= "-------------------------------------"  and 
        MUX_normalize_11_B_s /= "-------------------------------------") then   
         MUX_normalize_out_A_s <= MUX_normalize_11_A_s;
         MUX_normalize_out_B_s <= MUX_normalize_11_B_s;
    end if;
    if ( MUX_normalize_01_A = "-------------------------------------" and 
         MUX_normalize_10_B = "-------------------------------------" and 
         MUX_normalize_11_A = "-------------------------------------" and 
         MUX_normalize_11_B = "-------------------------------------") then 
          MUX_normalize_out_A_s <= "-------------------------------------";
          MUX_normalize_out_B_s <= "-------------------------------------";
    end if;
end process;
MUX_normalize_out_A <=MUX_normalize_out_A_s;
MUX_normalize_out_B <=MUX_normalize_out_B_s;
end Behavioral;
