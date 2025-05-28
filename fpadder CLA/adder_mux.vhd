-- 6.1.6.6. comp5/comp5 - adder_mux.vhd

-- Purpose of adder_mux:
-- Combine final sign, final exp, and 
-- final mantissa, to final result of 37 bits.
-- Result sent to --> normalize_result
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder_mux is
    port ( SOO            : in  STD_LOGIC;
           exp            : in  STD_LOGIC_VECTOR (7 downto 0);
           adder_mux_in   : in  STD_LOGIC_VECTOR (27 downto 0);   
           to_adder_block : out  STD_LOGIC_VECTOR (36 downto 0));
end adder_mux;

architecture Behavioral of adder_mux is

begin
to_adder_block <= SOO&exp&adder_mux_in;
end Behavioral;
