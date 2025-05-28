-- 6.1.4. comp3 - normalize.vhd

-- Purpose of normalize:
-- Normalize a pair of numbers with 
-- at least one subnormal number.
-- Exponents of inputs and outputs are 
-- an excess 127 (weighted) exponent.
-- Block normalize is a 4 to 2 mux.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity normalize is
    port ( Sub_Norm_A   : in  STD_LOGIC_VECTOR (36 downto 0);
             Norm_Sub_B : in  STD_LOGIC_VECTOR (36 downto 0);
             Sub_Sub_A  : in  STD_LOGIC_VECTOR (36 downto 0);
             Sub_Sub_B  : in  STD_LOGIC_VECTOR (36 downto 0);   
             Normal_A   : out  STD_LOGIC_VECTOR (36 downto 0);
             Normal_B   : out  STD_LOGIC_VECTOR (36 downto 0));              
end normalize;

architecture Behavioral of normalize is
------------------------------------ DEMUX_normalize : comp0                                          
component DEMUX_normalize port ( 
    DEMUX_normalize_01_A     : in  STD_LOGIC_VECTOR (36 downto 0);
    DEMUX_normalize_10_B     : in  STD_LOGIC_VECTOR (36 downto 0); 
    DEMUX_normalize_11_A     : in  STD_LOGIC_VECTOR (36 downto 0);
    DEMUX_normalize_11_B     : in  STD_LOGIC_VECTOR (36 downto 0); 
    DEMUX_normalize_out_01_A : out  STD_LOGIC_VECTOR (36 downto 0);
    DEMUX_normalize_out_10_B : out  STD_LOGIC_VECTOR (36 downto 0);
    DEMUX_normalize_out_11_A : out  STD_LOGIC_VECTOR (36 downto 0); 
    DEMUX_normalize_out_11_B : out  STD_LOGIC_VECTOR (36 downto 0));
end component ;                                               
------------------------------------ MUX_normalize : comp1                                                
component MUX_normalize port ( 
    MUX_normalize_01_A  : in  STD_LOGIC_VECTOR (36 downto 0);
    MUX_normalize_10_B  : in  STD_LOGIC_VECTOR (36 downto 0);
    MUX_normalize_11_A  : in  STD_LOGIC_VECTOR (36 downto 0);
    MUX_normalize_11_B  : in  STD_LOGIC_VECTOR (36 downto 0);
    MUX_normalize_out_A : out  STD_LOGIC_VECTOR (36 downto 0);
    MUX_normalize_out_B : out  STD_LOGIC_VECTOR (36 downto 0));
end component ; 

signal Normal_01_A : STD_LOGIC_VECTOR (36 downto 0); 
signal Normal_10_B : STD_LOGIC_VECTOR (36 downto 0);
signal Normal_11_A, Normal_11_B : STD_LOGIC_VECTOR (36 downto 0);
                                                  
begin

comp0 : DEMUX_normalize
    port map ( DEMUX_normalize_01_A     => Sub_Norm_A, 
               DEMUX_normalize_10_B     => Norm_Sub_B, 
               DEMUX_normalize_11_A     => Sub_Sub_A,
                  DEMUX_normalize_11_B     => Sub_Sub_B, 
                  DEMUX_normalize_out_01_A => Normal_01_A,  
                  DEMUX_normalize_out_10_B => Normal_10_B,
                  DEMUX_normalize_out_11_A => Normal_11_A,  
                  DEMUX_normalize_out_11_B => Normal_11_B); 
-- Purpose of DEMUX_normalize:
-- Prepare to shift: Distribute to next blocks 
-- (Sub_Norm_to_Norm_Norm, Norm_Sub_to_Norm_Norm, and 
-- Sub_Sub_to_Norm_Norm). 
-- Then Normalize numbers (left shift), and 
-- send to next block --> MUX_normalize.

comp1 : MUX_normalize
    port map ( MUX_normalize_01_A => Normal_01_A, 
               MUX_normalize_10_B => Normal_10_B, 
               MUX_normalize_11_A => Normal_11_A,
               MUX_normalize_11_B => Normal_11_B, 
               MUX_normalize_out_A => Normal_A,  
               MUX_normalize_out_B => Normal_B); 
-- Purpose of MUX_normalize:
-- Pick proper output of DEMUX_normalize,
-- and send to next block --> MUX_pre_adder.
-- Block MUX_normalize is a 4 to 2 mux.
end Behavioral;
