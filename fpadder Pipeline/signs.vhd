-- 6.1.6.4. 1. comp5/comp3/comp0 - signs.vhd

-- Purpose of signs:
-- Prepare normal numbers for addition 
-- or subtraction operation
-- Signout : Calculate the BTs and output ' s sign 
-- because of addition or subtraction
-- SO ='-' and output mantissas "----------------------------",
-- means result is zero.
---------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity signs is
    Port ( SA   : in  STD_LOGIC;
           SB   : in  STD_LOGIC;
           A    : in  STD_LOGIC_VECTOR (27 downto 0);
           B    : in  STD_LOGIC_VECTOR (27 downto 0);
           A_S  : in  STD_LOGIC;
           Aa   : out  STD_LOGIC_VECTOR (27 downto 0);
           Bb   : out  STD_LOGIC_VECTOR (27 downto 0);
           C    : out  STD_LOGIC;
           SO   : out  STD_LOGIC);
end signs;

architecture Behavioral of signs is

signal SB_aux : STD_LOGIC;
signal Aaux , Baux : STD_LOGIC_VECTOR (27 downto 0);
    begin   
    SB_aux <= SB xor A_S ;             -- Sign B because of the operation
    
    SO <= SA when A >= B else           -- A > B -- > SO = Sign A
            SB_aux when A < B else     -- B > A -- > SO = Sign B
            '-';        
    C <= '0';           -- C will become Cin in next block    (AS<=Cin=0)                             
    Aaux <= A when A >= B else          -- A > B then put A -> A
              B when A < B else        -- B > A then put A -> B
              "----------------------------";   
    Baux <= B when A >= B  else         -- A > B then put B -> B
              A when A < B  else       -- B > A then put B -> A
                "----------------------------";             
    process ( SA, SB, A_S, Aaux, Baux)
    -- in every pair here,|Aaux|>|Baux|
        begin
        if SA='0' then
            if SB=A_S then
                -- +SA+SB
                Aa <= Aaux;
                Bb <= Baux; 
            elsif SB/=A_S then
                -- +SA-SB
                Aa <= Aaux;
                Bb <= not(Baux) + "0000000000000000000000000001";   
            else
                Aa <= "----------------------------";   
                Bb <= "----------------------------"; 
            end if;
        elsif SA='1' then
            if SB=A_S then
                -- -SA+SB       
                Aa <= not(Aaux) + "0000000000000000000000000001";
                Bb <= Baux; 
            elsif SB/=A_S then
                -- -SA-SB       
                Aa <= Aaux;
                Bb <= Baux;
            else
                Aa <= "----------------------------";   
                Bb <= "----------------------------";               
            end if;
        else
            Aa <= "----------------------------";   
            Bb <= "----------------------------"; 
        end if;
    end process ;
end Behavioral;
