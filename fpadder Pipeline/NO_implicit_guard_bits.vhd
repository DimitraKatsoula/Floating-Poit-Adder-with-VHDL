-- 6.1.8. comp7 - NO_implicit_guard_bits.vhd

-- Purpose of NO_implicit_guard_bits:
-- Subtracting implicit digit and guard bits 
-- (Output must be 32 bits)
-- Output is the final result of adding, 
-- if adding is possible.
-- Round MSB of 4 guard bits to the LSB of Result_32bit.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity NO_implicit_guard_bits is
    port ( Input_NO_implicit : in  STD_LOGIC_VECTOR (36 downto 0);
           exp_overflow2     : out  STD_LOGIC; 
         Result_32bit      : out  STD_LOGIC_VECTOR (31 downto 0));
end NO_implicit_guard_bits;

architecture Behavioral of NO_implicit_guard_bits is

signal Input_NO_implicit_aux : STD_LOGIC_VECTOR (31 downto 0);

begin
process (Input_NO_implicit)
begin
Input_NO_implicit_aux(31) <= Input_NO_implicit(36);
-- Rounding MSB of Guard Bits to the LSB of the Mantissa of Result_32bit
if Input_NO_implicit (3 downto 0) = "----" then
    Input_NO_implicit_aux(22 downto 0) <= "-----------------------";
    Input_NO_implicit_aux(30 downto 23) <= Input_NO_implicit(35 downto 28);
    exp_overflow2 <= '0';
elsif Input_NO_implicit = "-------------------------------------" then
   Input_NO_implicit_aux(22 downto 0) <= "-----------------------";
    Input_NO_implicit_aux(30 downto 23) <= Input_NO_implicit(35 downto 28);
    exp_overflow2 <= '0';
elsif Input_NO_implicit (3 downto 0) >= "1000" then 
  if Input_NO_implicit (26 downto 4) < "11111111111111111111111" then
     Input_NO_implicit_aux(22 downto 0) <= Input_NO_implicit (26 downto 4) + '1';
     Input_NO_implicit_aux(30 downto 23) <= Input_NO_implicit(35 downto 28);
    -- overflow mantissa  --shift right mantissa
  elsif Input_NO_implicit (26 downto 4) = "11111111111111111111111" then
        -- right shift mantissa 
        -- (mind that the implicit bit:10.00000000000000000000000 
        -- becomes 1.00000000000000000000000)
       Input_NO_implicit_aux(22 downto 0) <= "00000000000000000000000";
       -- increase exp by 1
    if Input_NO_implicit(35 downto 28) < "11111111" then
       Input_NO_implicit_aux(30 downto 23) <=Input_NO_implicit(35 downto 28)+'1';
       exp_overflow2 <= '0';
    elsif Input_NO_implicit(35 downto 28) = "11111111" then
          Input_NO_implicit_aux(30 downto 23) <= "11111111";
         exp_overflow2 <= '1'; 
    end if;
  end if;
else
    Input_NO_implicit_aux(22 downto 0) <= Input_NO_implicit (26 downto 4);
    Input_NO_implicit_aux(30 downto 23) <= Input_NO_implicit(35 downto 28);
    exp_overflow2 <= '0';
end if;
end process;
-- Removing Guard bits
Result_32bit <= Input_NO_implicit_aux;
end Behavioral;

