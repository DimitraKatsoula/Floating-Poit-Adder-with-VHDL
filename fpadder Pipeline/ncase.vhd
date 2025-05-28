library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ncase is
    Port (
        NumberA  : in  STD_LOGIC_VECTOR(31 downto 0);
        NumberB  : in  STD_LOGIC_VECTOR(31 downto 0);
        A_S      : in  std_logic;
        enable   : out STD_LOGIC_VECTOR(1 downto 0);
        S1_ncase : out STD_LOGIC_VECTOR(31 downto 0);
        S2_ncase : out STD_LOGIC_VECTOR(31 downto 0)
    );
end ncase;

architecture Behavioral of ncase is
    signal expA, expB : STD_LOGIC_VECTOR(7 downto 0);
    signal manA, manB : STD_LOGIC_VECTOR(22 downto 0);
begin
    process(NumberA, NumberB)
    begin
        expA <= NumberA(30 downto 23);
        manA <= NumberA(22 downto 0);
        expB <= NumberB(30 downto 23);
        manB <= NumberB(22 downto 0);

        S1_ncase <= NumberA;
        S2_ncase <= NumberB;

        if ((expA = "11111111" and manA /= "00000000000000000000000") or
            (expB = "11111111" and manB /= "00000000000000000000000")) then
            enable <= "--"; -- NaN
        elsif ((expA = "11111111" and manA = "00000000000000000000000") or
               (expB = "11111111" and manB = "00000000000000000000000")) then
            enable <= "--"; -- Inf
        elsif ((expA = "00000000" and manA = "00000000000000000000000") or
               (expB = "00000000" and manB = "00000000000000000000000")) then
            enable <= "--"; -- Zero
        elsif (expA = "00000000" and manA /= "00000000000000000000000" and
               expB = "00000000" and manB /= "00000000000000000000000") then
            enable <= "11"; -- sub-sub
        elsif (expA = "00000000" and manA /= "00000000000000000000000") then
            enable <= "01"; -- sub-norm
        elsif (expB = "00000000" and manB /= "00000000000000000000000") then
            enable <= "10"; -- norm-sub
        else
            enable <= "00"; -- norm-norm
        end if;
    end process;
end Behavioral;
