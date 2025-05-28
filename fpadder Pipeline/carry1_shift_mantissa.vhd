-- 6.1.6.5. comp5/comp4 - carry1_shift_mantissa.vhd

-- Purpose of carry1_shift_mantissa:
-- Check if there is a current, and 
-- right shift 1 bit if needed.
-- Sent result to --> adder_mux.
-- Exp+1 is needed, in case of Coo=1.
-- Overflow of exponent, occurs only when:
-- exp_plus_one_in = "11111111" and Coo <= '1'
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity carry1_shift_mantissa is
    Port ( exp_plus_one_in  : in  STD_LOGIC_VECTOR (7 downto 0);
           SS               : in  STD_LOGIC_VECTOR (27 downto 0);
           SA               : in  STD_LOGIC;
           SB               : in  STD_LOGIC;
           A_S              : in  STD_LOGIC;
           Coo              : in  STD_LOGIC;
           no_overflow      : out  STD_LOGIC_VECTOR (27 downto 0);
           exp_overflow1    : out  STD_LOGIC;
           exp_plus_one_out : out  STD_LOGIC_VECTOR (7 downto 0));            
end carry1_shift_mantissa;

architecture Behavioral of carry1_shift_mantissa is

begin

process(SS, SA, SB, A_S, Coo, exp_plus_one_in)

begin
    if (SA='0' and SB/=A_S)    then    -- substraction
          no_overflow <= SS;
          exp_overflow1 <= '0';
          exp_plus_one_out <= exp_plus_one_in;
    elsif SA='1' and SB=A_S  then
          no_overflow <= SS;
          exp_overflow1 <= '0';
          exp_plus_one_out <= exp_plus_one_in;
    else                          -- addition
        if Coo ='1' then
            if exp_plus_one_in < "11111111" then
                no_overflow <= Coo&SS(27 downto 1);
                exp_plus_one_out <= exp_plus_one_in + "00000001";
                exp_overflow1 <= '0';
            elsif exp_plus_one_in = "11111111" then -- exp overflow
                exp_overflow1 <= '1';
                no_overflow <= Coo&SS(27 downto 1);
                exp_plus_one_out <= "--------" ;
            else
                no_overflow <= "----------------------------"; 
                exp_overflow1 <= '-';
                exp_plus_one_out <= "--------" ;
            end if;
        elsif Coo ='0' then 
          no_overflow <= SS; 
          exp_overflow1 <= '0';
          exp_plus_one_out <= exp_plus_one_in;
        end if;
    end if;
end process;
end Behavioral;
