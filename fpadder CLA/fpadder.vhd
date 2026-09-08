-- Max difference of exponents is 255.
-- diff_of exp_max = |expA - expB| = 255.
-- Input exponents are excess 127, so that code can deal 
-- with either positive or negative exponents.
-- Range of 8bits exponent is 2^1 to 2^254, and
-- range of 8bits excess 127 exponent is 2^(-127) to 2^(126).
-- Value exp_in = "11111111" and mantissa_in=0, 
-- means --> +inf, with sign=+, and
--          --> +inf, with sign=-.
-- Value exp_in = "00000000" and mantissa_in=0, 
-- means --> +0, with sign=+, and
--          --> -0, with sign=-.
-- Other values can be mapped from the table of the theoritical 
-- discussion of this paper.
-- If excess_exp>0 then --> excess_exp = exp_no_excess - 127, and
-- if excess_exp<0 then --> excess_exp = exp_no_excess + 127.
-- If there is an exponent overflow, then output of fpdadder 
-- shows exp_overflow = '1' and the exponent of result is "--------". 
-- Then, the real value of the exponent of result is 
-- "100000000" = 256 in standard exponent, or
-- "100000000" = 129 in excess 127 exponent.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fpadder is
    Port ( NumberA       : in  STD_LOGIC_VECTOR (31 downto 0);
           NumberB       : in  STD_LOGIC_VECTOR(31 downto 0);
           A_S           : in  STD_LOGIC;
           Total_Result  : out  STD_LOGIC_VECTOR (31 downto 0);
           exp_overflow  : out  STD_LOGIC;
           exp_underflow : out  STD_LOGIC);
end fpadder;

architecture Behavioral of fpadder is
-------------------------------------- N_case : comp0
component ncase port ( 
    NumberA  : in  STD_LOGIC_VECTOR (31 downto 0);
    NumberB  : in  STD_LOGIC_VECTOR (31 downto 0);
    A_S      : in std_logic;
    enable   : out  STD_LOGIC_VECTOR (1 downto 0);
    S1_ncase : out  STD_LOGIC_VECTOR (31 downto 0);
    S2_ncase : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
-------------------------------------- implicit_guard_bits : comp1
component implicit_guard_bit port ( 
    NumberAA : in  STD_LOGIC_VECTOR (31 downto 0);                                          
    NumberBB : in  STD_LOGIC_VECTOR (31 downto 0);
    enable   : in  STD_LOGIC_VECTOR(1 downto 0);
    NA       : out  STD_LOGIC_VECTOR (36 downto 0);
    NB       : out  STD_LOGIC_VECTOR (36 downto 0));                                                    
end component;
-------------------------------------- Distributing_demux : comp2                                
component Distributing_demux port ( 
    Distributing_demux_A : in  STD_LOGIC_VECTOR (36 downto 0);
    Distributing_demux_B : in  STD_LOGIC_VECTOR (36 downto 0);
    enable               : in  STD_LOGIC_VECTOR (1 downto 0);
    Norm_Norm_A          : out  STD_LOGIC_VECTOR (36 downto 0);
    Norm_Norm_B          : out  STD_LOGIC_VECTOR (36 downto 0);
    Sub_Norm_A           : out  STD_LOGIC_VECTOR (36 downto 0);
    Sub_Norm_B           : out  STD_LOGIC_VECTOR (36 downto 0);
    Norm_Sub_A           : out  STD_LOGIC_VECTOR (36 downto 0);
    Norm_Sub_B           : out  STD_LOGIC_VECTOR (36 downto 0);
    Sub_Sub_A            : out  STD_LOGIC_VECTOR (36 downto 0);
    Sub_Sub_B            : out  STD_LOGIC_VECTOR (36 downto 0));
end component ; 
-------------------------------------- normalize : comp3                                                  
component normalize port ( 
    Sub_Norm_A : in  STD_LOGIC_VECTOR (36 downto 0);
    Norm_Sub_B : in  STD_LOGIC_VECTOR (36 downto 0);
    Sub_Sub_A  : in  STD_LOGIC_VECTOR (36 downto 0);
    Sub_Sub_B  : in  STD_LOGIC_VECTOR (36 downto 0);    
    Normal_A   : out  STD_LOGIC_VECTOR (36 downto 0);
    Normal_B   : out  STD_LOGIC_VECTOR (36 downto 0));      
end component;                                               
-------------------------------------- MUX_pre_adder : comp4
component MUX_pre_adder port ( 
    from_demux_A           : in  STD_LOGIC_VECTOR (36 downto 0);   
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
end component;
-------------------------------------- Adder : comp5
component adder_block port ( 
    Input_Adder_A : in  STD_LOGIC_VECTOR (36 downto 0);  
    Input_Adder_B : in  STD_LOGIC_VECTOR (36 downto 0);
    A_S           : in  STD_LOGIC;
    Result_37bit  : out  STD_LOGIC_VECTOR (36 downto 0);
    exp_overflow1 : out  STD_LOGIC);    
end component;      
-------------------------------------- normalize_result : comp6
component normalize_result port ( 
    Maybe_Subnormal : in  STD_LOGIC_VECTOR (36 downto 0);
    exp_underflow   : out  STD_LOGIC; 
    Normal          : out  STD_LOGIC_VECTOR (36 downto 0));
end component;                                        
-------------------------------------- NO_implicit_guard_bits : comp7
component NO_implicit_guard_bits port ( 
    Input_NO_implicit : in  STD_LOGIC_VECTOR (36 downto 0);
    exp_overflow2     : out  STD_LOGIC; 
    Result_32bit      : out  STD_LOGIC_VECTOR (31 downto 0));
end component ; 
-------------------------------------- pre_final : comp8
component pre_final port ( 
    Adding_imposible : in  STD_LOGIC_VECTOR (31 downto 0); 
    Adding_result    : in  STD_LOGIC_VECTOR (31 downto 0);
    enable           : in  STD_LOGIC_VECTOR (1 downto 0);
    exp_overflow1    : in  STD_LOGIC;
    exp_overflow2    : in  STD_LOGIC;
    exp_overflow     : out  STD_LOGIC;
    Result_pre_final : out  STD_LOGIC_VECTOR (31 downto 0));
end component ;

------------------------- S I G N A L S ------------------
signal exp_overflow1, exp_overflow2 : STD_LOGIC;
signal enable_aux : STD_LOGIC_VECTOR(1 downto 0);
signal N1case, N2case, Result : STD_LOGIC_VECTOR (31 downto 0);
signal to_destribute_A, to_destribute_B : STD_LOGIC_VECTOR (36 downto 0);
signal Result_37bit_A,Result_37bit_B : STD_LOGIC_VECTOR (36 downto 0);
signal SubNorm_to_Norm_Norm_A : STD_LOGIC_VECTOR (36 downto 0);
signal SubNorm_to_Norm_Norm_B : STD_LOGIC_VECTOR (36 downto 0);
signal NormSub_to_Norm_Norm_A : STD_LOGIC_VECTOR (36 downto 0);
signal NormSub_to_Norm_Norm_B : STD_LOGIC_VECTOR (36 downto 0);
signal SubSub_to_Norm_Norm_A  : STD_LOGIC_VECTOR (36 downto 0);
signal SubSub_to_Norm_Norm_B  : STD_LOGIC_VECTOR (36 downto 0);
signal MUX_pre_adder_A_00 : STD_LOGIC_VECTOR (36 downto 0);
signal MUX_pre_adder_B_00 : STD_LOGIC_VECTOR (36 downto 0);
signal normalized_A, normalized_B : STD_LOGIC_VECTOR (36 downto 0);
signal Result_37bit_to_normalize_result: STD_LOGIC_VECTOR (36 downto 0);
signal normalized_result_37bits : STD_LOGIC_VECTOR (36 downto 0);
----------------------------------------------------------
begin

comp0 : ncase
    port map ( NumberA  => NumberA, 
               NumberB  => NumberB, 
               A_S      => A_S,
               enable   => enable_aux, 
               S1_ncase => N1case, 
               S2_ncase => N2case);
-- Purpose of ncase:
-- Identify these types of data :
-- NaN       --->     E = 255   &  M > 0
-- Infinity  --->     E = 255   &  M = 0
-- Normal    --->  0 < E < 255  &  M > 0
-- Subnormal --->     E = 0     &  M > 0
-- Zero      --->     E = 0     &  M = 0.
-- If adding is impossible, S1_ncase 
-- is sent to  --> pre_final block, else,
-- if adding is possible, S1_ncase and S2_ncase, 
-- are sent to --> to normalize block.
                  
comp1 : implicit_guard_bit
    port map ( NumberAA => N1case,
               NumberBB => N2case, 
               enable   => enable_aux,
               NA       => to_destribute_A, 
               NB       => to_destribute_B);
-- Purpose of implicit_guard_bits:
-- Add implicit bit and 4 guard  bits.
-- Guard bits are added, to increase accurecy.
-- Outputs are sent to --> Distributing_demux.

comp2 : Distributing_demux
    port map ( 
    Distributing_demux_A => to_destribute_A, 
    Distributing_demux_B => to_destribute_B, 
    enable               => enable_aux,
    Norm_Norm_A          => MUX_pre_adder_A_00,    
    -- no need of shifting/ to MUX_preadder
    Norm_Norm_B          => MUX_pre_adder_B_00,    
    -- no need of shifting/ to MUX_preadder               
    Sub_Norm_A           => SubNorm_to_Norm_Norm_A,
    Sub_Norm_B           => SubNorm_to_Norm_Norm_B,
    -- no need of shifting/ to MUX_preadder
    Norm_Sub_A           => NormSub_to_Norm_Norm_A,
    -- no need of shifting/ to MUX_preadder
    Norm_Sub_B           => NormSub_to_Norm_Norm_B, 
    Sub_Sub_A            => SubSub_to_Norm_Norm_A, 
    Sub_Sub_B            => SubSub_to_Norm_Norm_B);           
--  Purpose of Distributing_demux: 
--  If adding is possible (ENABLE/="--"), 
-- then outputs of implicit_guard_bits are sent to:
--  enable = "00" NOrm_NormA --> to  MUX_preadder,      comp4 : MUX_preadder,
--  enable = "00" NOrm_NormB --> to  MUX_preadder,      comp4 : MUX_preadder,
--  enable = "01" Sub_NormA  --> to  normalizing block, comp3 : normalize,
--  enable = "01" Sub_NormB  --> to  normalizing block, comp3 : MUX_pre_adder,
--  enable = "10" NOrm_SubA  --> to  normalizing block, comp4 : MUX_pre_adder,
--  enable = "10" NOrm_SubB  --> to  normalizing block, comp4 : normalize,
--  enable = "11" Sub_Sub    --> to  normalizing block, comp4 : normalize.
-- Block Distributing_demux is a 3 to 8 demux.

comp3 : normalize
    port map ( Sub_Norm_A => SubNorm_to_Norm_Norm_A,
               Norm_Sub_B => NormSub_to_Norm_Norm_B, 
               Sub_Sub_A  => SubSub_to_Norm_Norm_A, 
               Sub_Sub_B  => SubSub_to_Norm_Norm_B,
               Normal_A   => normalized_A, 
               Normal_B   => normalized_B);
-- Purpose of normalize:
-- Normalize a pair of numbers with 
-- at least one subnormal number.
-- exponents of inputs and outputs are 
-- an excess 127 (weighted) exponent.
-- Block normalize is a 4 to 2 mux.

comp4 : MUX_pre_adder
    port map ( from_demux_A           => MUX_pre_adder_A_00,    
               -- Normal numberA from NormNorm
               from_demux_B           => MUX_pre_adder_B_00,    
               -- Normal numberB from NormNorm
               from_distribute_01_B   => SubNorm_to_Norm_Norm_B,
               -- Normal numberB from SubNorm   
               from_distribute_10_A   => NormSub_to_Norm_Norm_A,
               -- Normal numberA from NormSub
               from_normalize_A       => normalized_A,    
               -- Normalized NumberA from Normalize block
               from_normalize_B       => normalized_B,    
               -- Normalized NumberB from Normalize block
               Result_before_adding_A => Result_37bit_A,  
               -- Pair of numbers to be added              
               Result_before_adding_B => Result_37bit_B); 
               -- Pair of numbers to be added
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

comp5 : adder_block
   port map ( Input_Adder_A => Result_37bit_A,
              Input_Adder_B => Result_37bit_B,
              A_S           => A_S,
              Result_37bit  => Result_37bit_to_normalize_result,
              exp_overflow1 => exp_overflow1);
-- Purpose of Adder_block:
-- Add 37 bit Normalized numbers and 
-- send to NO_implicit_guard_bits
-- Block Adder is a 3 to 2 mux.

comp6 : normalize_result
    port map ( Maybe_Subnormal => Result_37bit_to_normalize_result,
               exp_underflow   => exp_underflow,
               Normal          => normalized_result_37bits);
--  Purpose of normalize_result: 
-- To normalize result of Adder, if needed.
-- Input exponent of normalize_result is a weighted exponent.
--
comp7 : NO_implicit_guard_bits
   port map ( Input_NO_implicit => normalized_result_37bits, 
              exp_overflow2 => exp_overflow2,
              Result_32bit      => Result);
-- Purpose of NO_implicit_guard_bits:
-- Subtracting implicit digit and guard bits ( Output must be 32 bits)
-- Output is the final result of adding, if adding is possible.
-- Should add a code for rounding 4 guard bits 
-- to the 2 LSB of Result_32bit.

comp8 : pre_final
   port map ( Adding_imposible => N1case, 
              Adding_result    => Result,
              enable           => enable_aux,
              exp_overflow1 => exp_overflow1,
              exp_overflow2 => exp_overflow2,
              exp_overflow => exp_overflow,
              Result_pre_final => Total_Result);
-- Purpose of pre_final:
-- Sending Final Result to output of fpadder,
-- weather adding is posible or not

end Behavioral;

