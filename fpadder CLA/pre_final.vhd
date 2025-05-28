-- 6.1.9. comp8 - pre_final.vhd

-- Purpose of pre_final:
-- Sending Final Result to output of fpadder,
-- weather adding is posible or not
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pre_final is
    port ( Adding_imposible : in  STD_LOGIC_VECTOR (31 downto 0); 
             Adding_result    : in  STD_LOGIC_VECTOR (31 downto 0); 
             enable           : in  STD_LOGIC_VECTOR (1 downto 0);
             exp_overflow1    : in  STD_LOGIC;
             exp_overflow2    : in  STD_LOGIC;
             exp_overflow     : out  STD_LOGIC;
             Result_pre_final : out  STD_LOGIC_VECTOR (31 downto 0));
end pre_final;

architecture Behavioral of pre_final is
signal Result_pre_final_s: STD_LOGIC_VECTOR (31 downto 0);
signal exp_overflow_s : STD_LOGIC;
begin
    process (enable,exp_overflow1, exp_overflow2, Adding_imposible, Adding_result)  
        begin
        exp_overflow_s <= exp_overflow1 or exp_overflow2;
            if enable /= "--" then
                Result_pre_final_s <= Adding_result;
            else Result_pre_final_s <= Adding_imposible;
            end if;
    end process;
exp_overflow <= exp_overflow_s;
Result_pre_final <= Result_pre_final_s;
end Behavioral;

