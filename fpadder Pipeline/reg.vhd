-- 6.2.1.1.1.2. comp5/comp3/reg_xi_j/component reg.vhd

-- flip flops
----------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg is port( D,CLK,RSTn : in std_logic;
                    Q          : out std_logic);
                    end entity;
                         
architecture behaviour of reg is

begin
    process(CLK,RSTn)
    begin
         if RSTn = '0' then
            Q <= '0';
         elsif rising_edge(clk) then
            Q <= D;
         end if;
    end process;
end architecture;
