-- 6.1.4.1. comp3/comp0 - DEMUX_normalize.vhd

-- Purpose of DEMUX_normalize:
-- Prepare to shift: Distribute to next blocks 
-- (Sub_Norm_to_Norm_Norm, Norm_Sub_to_Norm_Norm, 
-- and Sub_Sub_to_Norm_Norm). 
-- Then Normalize numbers (left shift), and 
-- send to next block --> MUX_normalize.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DEMUX_normalize is
    port ( DEMUX_normalize_01_A     : in  STD_LOGIC_VECTOR (36 downto 0);
           DEMUX_normalize_10_B     : in  STD_LOGIC_VECTOR (36 downto 0); 
           DEMUX_normalize_11_A     : in  STD_LOGIC_VECTOR (36 downto 0);
           DEMUX_normalize_11_B     : in  STD_LOGIC_VECTOR (36 downto 0); 
           DEMUX_normalize_out_01_A : out  STD_LOGIC_VECTOR (36 downto 0);
           DEMUX_normalize_out_10_B : out  STD_LOGIC_VECTOR (36 downto 0);
           DEMUX_normalize_out_11_A : out  STD_LOGIC_VECTOR (36 downto 0); 
           DEMUX_normalize_out_11_B : out  STD_LOGIC_VECTOR (36 downto 0));               
end DEMUX_normalize;

architecture Behavioral of DEMUX_normalize is
---------------------------------------------------------------- Sub_Norm_to_Norm_Norm : comp0
component Sub_Norm_to_Norm_Norm port ( 
	Subnormal1_A   : in  STD_LOGIC_VECTOR (36 downto 0);
	Norm_Norm_01_A : out  STD_LOGIC_VECTOR (36 downto 0));
end component ;

---------------------------------------------------------------- Norm_Sub_to_Norm_Norm : comp1
component Norm_Sub_to_Norm_Norm port ( 
	Subnormal2_B   : in  STD_LOGIC_VECTOR (36 downto 0);
	Norm_Norm_10_B : out  STD_LOGIC_VECTOR (36 downto 0));
end component ;

---------------------------------------------------------------- Sub_Sub_to_Norm_Norm : comp2
component Sub_Sub_to_Norm_Norm port ( 
	Subnormal3_A   : in  STD_LOGIC_VECTOR (36 downto 0);
	Subnormal3_B   : in  STD_LOGIC_VECTOR (36 downto 0);
	Norm_Norm_11_A : out  STD_LOGIC_VECTOR (36 downto 0);
	Norm_Norm_11_B : out  STD_LOGIC_VECTOR (36 downto 0));
end component ;                                               
begin

comp0 : Sub_Norm_to_Norm_Norm
    port map ( Subnormal1_A   => DEMUX_normalize_01_A, 
               Norm_Norm_01_A => DEMUX_normalize_out_01_A); 
--  Purpose of Sub_Norm_to_Norm_Norm: 
--  shifting until Sub (1st Number=input of Sub_Norm_to_Norm_Norm) 
-- is Normal.
--  Sent Output to --> Mux_normalize
-- Shift left mantissa x_times_leftshift_s, and
-- substract from exponent: exp_new = exp_in - x_times_leftshift_s.
-- Take care of excess 127 exponent (need to add "1111111" to exp_in).

comp1 : Norm_Sub_to_Norm_Norm
    port map ( Subnormal2_B   => DEMUX_normalize_10_B, 
               Norm_Norm_10_B => DEMUX_normalize_out_10_B);   
--  Purpose of Norm_Sub_to_Norm_Norm: 
--  shifting until Sub (2st Numer=input of Norm_Sub_to_Norm_Norm) 
-- is Normal.
--  Sent Output to --> Mux_normalize
-- Shift left mantissa x_times_leftshift_s, and
-- substract from exponent:
-- exp_new = exp_in - x_times_leftshift_s.
-- Take care of excess 127 exponent (need to add "1111111").
    
comp2 : Sub_Sub_to_Norm_Norm
    port map ( Subnormal3_A   => DEMUX_normalize_11_A, 
               Subnormal3_B   => DEMUX_normalize_11_B,            
               Norm_Norm_11_A => DEMUX_normalize_out_11_A, 
               Norm_Norm_11_B => DEMUX_normalize_out_11_B);  
-- Purpose of Sub_Sub_to_Norm_Norm: 
-- shifting both subnormal inputs(= inputs of Sub_Sub_to_Norm_Norm),
-- until both outputs of 2SubNs_to_Norm, are Normals.
-- Sent Output to --> Mux_normalize
-- Shift left mantissa x_times_leftshift_s, and
-- substract from exponent:
-- exp_new = exp_in - x_times_leftshift_s.
-- Take care of excess 127 exponent (need to add "1111111" to exp_in).
end Behavioral;
