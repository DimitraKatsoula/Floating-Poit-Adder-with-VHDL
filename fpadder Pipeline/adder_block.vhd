-- 6.2.1. comp5 - adder_block.vhd

-- Purpose of Adder_block:
-- Add 37 bit Normalized numbers and 
-- send to --> NO_implicit_guard_bits.
-- Block Adder is a 3 to 2 mux.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder_block is
    port ( Input_Adder_A : in  STD_LOGIC_VECTOR (36 downto 0);  
           Input_Adder_B : in  STD_LOGIC_VECTOR (36 downto 0);
           A_S           : in  STD_LOGIC;
           CLK : in std_logic;
           RSTn : in std_logic;
           Result_37bit  : out  STD_LOGIC_VECTOR (36 downto 0);
           exp_overflow1 : out  STD_LOGIC);                                                       
end adder_block;

architecture Behavioral of adder_block is
-------------------------------- comp_and_sub_exp : comp0                                         
component demux_sign_exp_mantissa port ( 
    Input_Adder_A         : in  STD_LOGIC_VECTOR (36 downto 0);
    Input_Adder_B         : in  STD_LOGIC_VECTOR (36 downto 0); 
    sign_A                : out  STD_LOGIC;
    sign_B                : out  STD_LOGIC;
    to_comp_and_sub_exp_A : out  STD_LOGIC_VECTOR (7 downto 0);
    to_comp_and_sub_exp_B : out  STD_LOGIC_VECTOR (7 downto 0);                                          
    to_shift_mantissa_A   : out  STD_LOGIC_VECTOR (27 downto 0);
    to_shift_mantissa_B   : out  STD_LOGIC_VECTOR (27 downto 0));
end component;  
-------------------------------- comp_and_sub_exp : comp1   
component comp_and_sub_exp port( 
    Input_exp_A     : in  STD_LOGIC_VECTOR (7 downto 0);
    Input_exp_B     : in  STD_LOGIC_VECTOR (7 downto 0);
    diff            : out STD_LOGIC_VECTOR (7 downto 0);
    which_is_bigger : out STD_LOGIC;
    to_adder_mux    : out  STD_LOGIC_VECTOR (7 downto 0)); 
end component;               
-------------------------------- shift_mantissa : comp2                                               
component right_shift_mantissa port ( 
    mantissa_in_A      : in  STD_LOGIC_VECTOR (27 downto 0);
    mantissa_in_B      : in  STD_LOGIC_VECTOR (27 downto 0);
    xtimes_right_shift : in  STD_LOGIC_VECTOR (7 downto 0);
    bigger_expA        : in  STD_LOGIC;
    to_adder_A         : out  STD_LOGIC_VECTOR (27 downto 0);
    to_adder_B         : out  STD_LOGIC_VECTOR (27 downto 0));
end component;  
-------------------------------- adder : comp3                                                
component Adder port ( 
    SA   : in  STD_LOGIC;
    SB   : in  STD_LOGIC;
    A    : in  STD_LOGIC_VECTOR (27 downto 0);
    B    : in  STD_LOGIC_VECTOR (27 downto 0);
    CLK : in std_logic;
    RSTn : in std_logic;
    A_S  : in  STD_LOGIC;
    S    : out  STD_LOGIC_VECTOR (27 downto 0);
    SO   : out  STD_LOGIC;
    Co   : out  STD_LOGIC);
end component;  
-------------------------------- mantissa_overflow : comp4                            
component carry1_shift_mantissa Port ( 
    exp_plus_one_in : in  STD_LOGIC_VECTOR (7 downto 0);
    SS              : in  STD_LOGIC_VECTOR (27 downto 0);
    SA              : in  STD_LOGIC;
    SB              : in  STD_LOGIC;
    A_S             : in  STD_LOGIC;
    Coo             : in  STD_LOGIC;
    no_overflow     : out  STD_LOGIC_VECTOR (27 downto 0);
    exp_overflow1   : out  STD_LOGIC;
    exp_plus_one_out: out  STD_LOGIC_VECTOR (7 downto 0)); 
end component;            
-------------------------------- adder_mux : comp5                                                
component adder_mux port ( 
    SOO            : in  STD_LOGIC;
    exp            : in  STD_LOGIC_VECTOR (7 downto 0);
    adder_mux_in   : in  STD_LOGIC_VECTOR (27 downto 0);    
    to_adder_block : out  STD_LOGIC_VECTOR (36 downto 0));
end component;                            
                                                                     
signal to_shift_mantissa_A_s : STD_LOGIC_VECTOR (27 downto 0);
signal to_shift_mantissa_B_s : STD_LOGIC_VECTOR (27 downto 0);
signal Result_28bit : STD_LOGIC_VECTOR (27 downto 0);
signal Result_28bit_overflow : STD_LOGIC_VECTOR (27 downto 0);
signal to_comp_and_sub_exp_A_s : STD_LOGIC_VECTOR (7 downto 0);
signal to_comp_and_sub_exp_B_s : STD_LOGIC_VECTOR (7 downto 0);
signal final_exp1, final_exp2 : STD_LOGIC_VECTOR (7 downto 0);
signal xtimes_right_shift_s: STD_LOGIC_VECTOR (7 downto 0);
signal to_adder_A_s,to_adder_B_s : STD_LOGIC_VECTOR (27 downto 0);
signal sign_A_s,sign_B_s, final_sign, Co_s,bigger_expA_s : STD_LOGIC;
begin

comp0 : demux_sign_exp_mantissa
   port map ( Input_Adder_A => Input_Adder_A,
              Input_Adder_B => Input_Adder_B,
              sign_A        => sign_A_s,
              sign_B        => sign_B_s,
              to_comp_and_sub_exp_A => to_comp_and_sub_exp_A_s,
              to_comp_and_sub_exp_B => to_comp_and_sub_exp_B_s,
              to_shift_mantissa_A   => to_shift_mantissa_A_s,
              to_shift_mantissa_B   => to_shift_mantissa_B_s);
-- Purpose of demux_sign_exp_mantissa:
-- Distribute Number A and Number B to its contents, and send 
--      signA, signB, to ----------> Adder,
--      expA, expB, to ------------> comp_and_sub_exp, and
--      mantissaA, mantissaB, to --> shift_mantissa.
-- Block demux_sign_exp_mantissa is a 2 to 6 demux.

comp1 : comp_and_sub_exp
     port map ( Input_exp_A     => to_comp_and_sub_exp_A_s,
                Input_exp_B     => to_comp_and_sub_exp_B_s,
                diff            => xtimes_right_shift_s,
                which_is_bigger => bigger_expA_s,
                to_adder_mux    => final_exp1);
-- Purpose of comp_and_sub_exp: 
-- Take exps from demux_sign_exp_mantissa.
-- Compare expA, expB and send: 
-- absolute of difference |expA-expB|, to --> right_shift_mantissa, 
-- which_is_bigger, to ---------------------> right_shift_mantissa, 
-- and final exp, to ---------------------------> adder_mux.
-- which_is_bigger = '0' when expB > expA,
-- which_is_bigger = '1' when expA > expB.
     
comp2 : right_shift_mantissa
    port map ( mantissa_in_A      => to_shift_mantissa_A_s,
               mantissa_in_B      => to_shift_mantissa_B_s,
               xtimes_right_shift => xtimes_right_shift_s,
               bigger_expA        => bigger_expA_s,                 
               to_adder_A         => to_adder_A_s,
                  to_adder_B    => to_adder_B_s);
--  Purpose of shift_mantissa:
-- Right Shift mantissa xtimes_right_shift = |expA-expB|.
-- Send shifted (the one with smaller exp), to  --> Adder, and 
--    unshifted (the one with bigger exp), to --> Adder.

comp3 : Adder
    port map ( SA  => sign_A_s,
               SB  => sign_B_s,
                  A   => to_adder_A_s,
                  B   => to_adder_B_s,
                  CLK => CLK,
                  RSTn => RSTn,
                  A_S => A_S,
                  S   => Result_28bit_overflow,
                  SO  => final_sign,
                  CO  => Co_s);
-- Purpose of Adder:
-- Add mantissa's of numbers with equal exps, and send the
-- result of adding and carry bit, to --> mantissa_overflow.
-- Addition implemented with a CLA adder

comp4 : carry1_shift_mantissa
    port map ( exp_plus_one_in  => final_exp1,
               SS               => Result_28bit_overflow,
               SA               => sign_A_s,          
               SB               => sign_B_s,           
               A_S              => A_S,             
               Coo              => Co_s,
               no_overflow      => Result_28bit,
               exp_overflow1    => exp_overflow1,
               exp_plus_one_out => final_exp2);
-- Purpose of mantissa_overflow:
-- Check if an overflow occurs, and right shift 1 bit if needed.
-- Send Results to --> adder_mux.

comp5 : adder_mux
    port map ( SOO            => final_sign,
               exp            => final_exp2,
               adder_mux_in   => Result_28bit,
               to_adder_block => Result_37bit);
--  Purpose of adder_mux:
-- Combine final sign, final exp, and 
-- final mantissa, to final result of 37 bits.
-- Result sent to --> normalize_result
end Behavioral;
