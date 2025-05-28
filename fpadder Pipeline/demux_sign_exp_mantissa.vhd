-- 6.1.6.1. comp5/comp0 - demux_sign_exp_mantissa.vhd

-- Purpose of demux_sign_exp_mantissa:
-- Distribute Number A and Number B to its contents, 
-- and send signA, signB, to ----------> Adder,
-- expA, expB, to ------------> comp_and_sub_exp, 
-- and mantissaA, mantissaB, to --> shift_mantissa.
-- Block demux_sign_exp_mantissa is a 2 to 6 demux.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity demux_sign_exp_mantissa is
    port ( Input_Adder_A         : in  STD_LOGIC_VECTOR (36 downto 0);
           Input_Adder_B         : in  STD_LOGIC_VECTOR (36 downto 0); 
           sign_A                : out  STD_LOGIC;
           sign_B                : out  STD_LOGIC;
           to_comp_and_sub_exp_A : out  STD_LOGIC_VECTOR (7 downto 0);
           to_comp_and_sub_exp_B : out  STD_LOGIC_VECTOR (7 downto 0);                                             
           to_shift_mantissa_A   : out  STD_LOGIC_VECTOR (27 downto 0);
           to_shift_mantissa_B   : out  STD_LOGIC_VECTOR (27 downto 0));
end demux_sign_exp_mantissa;

architecture Behavioral of demux_sign_exp_mantissa is

begin
sign_A                <= Input_Adder_A(36);
sign_B                <= Input_Adder_B(36);
to_comp_and_sub_exp_A <= Input_Adder_A (35 downto 28);
to_comp_and_sub_exp_B <= Input_Adder_B (35 downto 28);                                       
to_shift_mantissa_A   <= Input_Adder_A (27 downto 0);
to_shift_mantissa_B   <= Input_Adder_B (27 downto 0);
end Behavioral;


6.1.6.2. comp5/comp1 - comp_and_sub_exp.vhd

-- Purpose of comp_and_sub_exp: 
-- Take exps from demux_sign_exp_mantissa.
-- Compare expA, expB and send: 
-- absolute of difference |expA-expB|, to --> right_shift_mantissa, 
-- which_is_bigger, to ---------------------> right_shift_mantissa, 
-- and final exp, to ---------------------------> adder_mux.
-- which_is_bigger = '0' when expB > expA,
-- which_is_bigger = '1' when expA > expB.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity comp_and_sub_exp is
    port ( Input_exp_A  : in  STD_LOGIC_VECTOR (7 downto 0);
           Input_exp_B  : in  STD_LOGIC_VECTOR (7 downto 0);
           diff         : out STD_LOGIC_VECTOR (7 downto 0);
           which_is_bigger : out STD_LOGIC;
           to_adder_mux : out  STD_LOGIC_VECTOR (7 downto 0));
end comp_and_sub_exp;

architecture Behavioral of comp_and_sub_exp is

signal to_adder_mux_s: STD_LOGIC_VECTOR (7 downto 0);

begin

process(Input_exp_A, Input_exp_B)
begin
    if Input_exp_A < Input_exp_B then
        diff <= Input_exp_B - Input_exp_A;
        which_is_bigger <= '0';
        to_adder_mux_s <= Input_exp_B;
    elsif Input_exp_A > Input_exp_B then
        diff <= Input_exp_A - Input_exp_B;
        which_is_bigger <= '1';
        to_adder_mux_s <= Input_exp_A;
    elsif Input_exp_A = Input_exp_B then
        diff <= "00000000";
        which_is_bigger <= '1';
        to_adder_mux_s <= Input_exp_A;
    else
        diff <= "--------";
        which_is_bigger <= '-';
        to_adder_mux_s <= "--------";
    end if;
end process;
to_adder_mux <= to_adder_mux_s;
end Behavioral;
