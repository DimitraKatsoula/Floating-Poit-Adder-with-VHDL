-- 6.1.5. comp4 - MUX_pre_Adder.vhd

-- Purpose of MUX_pre_adder:
-- for each enable, create pair of numbers again,
-- and send proper pair of numbers to --> adder_block.
-- Block MUX_pre_adder is a 6 to 2 mux.
-- Block similar(MUX) to block MUX_normalize, of block normalize, 
-- with a similar logic. Hence:
-- When input_A is '-', take NormSub_to_Norm_Norm_A, 
-- and send to Result_before_adding_A,
-- when input_B is '-', take SubNorm_to_Norm_Norm_B, 
-- and send to Result_before_adding_B, and
-- when both inputs /= '-' (were both subnormals), 
-- send them  to Result_before_adding_A, Result_before_adding_B.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MUX_pre_adder is
    port ( from_demux_A           : in  STD_LOGIC_VECTOR (36 downto 0);   
           -- Normal numberA from NormNorm 
           from_demux_B           : in  STD_LOGIC_VECTOR (36 downto 0);   
           -- Normal numberB from NormNorm
           from_distribute_01_B   : in  STD_LOGIC_VECTOR (36 downto 0);   
           -- Normal numberB from SubNorm
           from_distribute_10_A   : in  STD_LOGIC_VECTOR (36 downto 0);   
           -- Normal numberA from NormSub 
           from_normalize_A       : in  STD_LOGIC_VECTOR (36 downto 0);   
           -- Normalized NumberA from Normalize block 
           from_normalize_B       : in  STD_LOGIC_VECTOR (36 downto 0);   
           -- Normalized NumberB from Normalize block
           Result_before_adding_A : out  STD_LOGIC_VECTOR (36 downto 0);  
           -- Pair of numbers to be added
           Result_before_adding_B : out  STD_LOGIC_VECTOR (36 downto 0)); 
           -- Pair of numbers to be added
end MUX_pre_adder;

architecture Behavioral of MUX_pre_adder is

signal from_demux_A_s, from_demux_B_s :  STD_LOGIC_VECTOR (36 downto 0); 
signal from_distribute_01_B_s :  STD_LOGIC_VECTOR (36 downto 0);
signal from_distribute_10_A_s :  STD_LOGIC_VECTOR (36 downto 0);   
  
signal from_normalize_A_s, from_normalize_B_s  :  STD_LOGIC_VECTOR (36 downto 0);
signal Result_before_adding_A_s :  STD_LOGIC_VECTOR (36 downto 0);
signal Result_before_adding_B_s :  STD_LOGIC_VECTOR (36 downto 0);

begin

from_demux_A_s <= from_demux_A;
from_demux_B_s <= from_demux_B;
from_distribute_01_B_s <= from_distribute_01_B;
from_distribute_10_A_s <= from_distribute_10_A;
from_normalize_A_s <= from_normalize_A;
from_normalize_B_s <= from_normalize_B;

process (from_demux_A_s,from_demux_B_s,from_distribute_01_B_s,
         from_distribute_10_A_s,from_normalize_A_s,from_normalize_B_s) 
begin
    -- Norm - Norm Situation
    if (from_demux_A_s /= "-------------------------------------"  and 
        from_demux_B_s /= "-------------------------------------") then 
        Result_before_adding_A_s <= from_demux_A_s;
        Result_before_adding_B_s <= from_demux_B_s;
    -- Sub - Norm, Norm - Sub, Sub - Sub Situations          
    elsif (from_demux_A_s = "-------------------------------------" and 
        from_demux_B_s = "-------------------------------------") then
       -- Norm - Sub Situation               
        if (from_normalize_A_s =  "-------------------------------------"  and 
             from_normalize_B_s /= "-------------------------------------") then
             Result_before_adding_A_s <= from_distribute_10_A_s;
             Result_before_adding_B_s <= from_normalize_B_s ;
        -- Sub - Norm Situation
        elsif (from_normalize_B_s =  "-------------------------------------"  and 
             from_normalize_A_s /= "-------------------------------------") then 
             Result_before_adding_A_s <= from_normalize_A_s;
             Result_before_adding_B_s <= from_distribute_01_B_s;
        -- Sub - Sub Situation
        elsif (from_normalize_B_s /= "-------------------------------------"  and 
             from_normalize_A_s /= "-------------------------------------") then 
             Result_before_adding_A_s <= from_normalize_A_s;
             Result_before_adding_B_s <= from_normalize_B_s;
        -- Impossible Situation
        elsif (from_normalize_A_s = "-------------------------------------"  and 
             from_normalize_B_s = "-------------------------------------") then 
             Result_before_adding_A_s <= "-------------------------------------";
             Result_before_adding_B_s <= "-------------------------------------";
        -- Impossible Situation
        elsif (from_distribute_10_A_s = "-------------------------------------"  and 
             from_distribute_01_B_s = "-------------------------------------") then 
             Result_before_adding_A_s <= "-------------------------------------";
             Result_before_adding_B_s <= "-------------------------------------";       
        else
             Result_before_adding_A_s <= "-------------------------------------";
             Result_before_adding_B_s <= "-------------------------------------";                       
        end if;
    -- Impossible Situation
    elsif (from_demux_A_s = "-------------------------------------" and 
           from_demux_B_s /= "-------------------------------------") then
           Result_before_adding_A_s <= "-------------------------------------";
           Result_before_adding_B_s <= "-------------------------------------";
    -- Impossible Situation
    elsif (from_demux_A_s /= "-------------------------------------" and 
           from_demux_B_s = "-------------------------------------") then
           Result_before_adding_A_s <= "-------------------------------------";
           Result_before_adding_B_s <= "-------------------------------------";
    else
        Result_before_adding_A_s <= "-------------------------------------";
        Result_before_adding_B_s <= "-------------------------------------";    
    end if;
end process;
Result_before_adding_A <= Result_before_adding_A_s;
Result_before_adding_B <= Result_before_adding_B_s;
end Behavioral;
