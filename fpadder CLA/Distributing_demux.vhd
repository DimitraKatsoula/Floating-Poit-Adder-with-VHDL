-- 5.1.3. comp2 - Distributing_demux.vhd

--  Purpose of Distributing_demux: 
--  If adding is possible (ENABLE/="--"), then 
--  outputs of implicit_guard_bits are sent to:
--  enable = "00" NOrm_NormA --> 
--  sent to --> MUX_preadder,      comp4 : MUX_preadder,
--  enable = "00" NOrm_NormB --> 
--  sent to --> MUX_preadder,      comp4 : MUX_preadder,
--  enable = "01" Sub_NormA  --> 
--  sent to --> normalizing block, comp3 : normalize,
--  enable = "01" Sub_NormB  --> 
--  sent to --> normalizing block, comp3 : MUX_pre_adder,
--  enable = "10" NOrm_SubA  --> 
--  sent to --> normalizing block, comp4 : MUX_pre_adder,
--  enable = "10" NOrm_SubB  --> 
--  sent to --> normalizing block, comp4 : normalize,
--  enable = "11" Sub_Sub    --> 
--  sent to --> normalizing block, comp4 : normalize.
-- Block Distributing_demux is a 3 to 8 demux.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Distributing_demux is
Port ( Distributing_demux_A : in  STD_LOGIC_VECTOR (36 downto 0);
       Distributing_demux_B : in  STD_LOGIC_VECTOR (36 downto 0);
                     enable : in  STD_LOGIC_VECTOR (1 downto 0);
                Norm_Norm_A : out  STD_LOGIC_VECTOR (36 downto 0);
                Norm_Norm_B : out  STD_LOGIC_VECTOR (36 downto 0); 
                 Sub_Norm_A : out  STD_LOGIC_VECTOR (36 downto 0);
                 Sub_Norm_B : out  STD_LOGIC_VECTOR (36 downto 0); 
                 --does not need shifting
                 Norm_Sub_A : out  STD_LOGIC_VECTOR (36 downto 0); 
                 --does not need shifting
                 Norm_Sub_B : out  STD_LOGIC_VECTOR (36 downto 0);
                  Sub_Sub_A : out  STD_LOGIC_VECTOR (36 downto 0);
                  Sub_Sub_B : out  STD_LOGIC_VECTOR (36 downto 0));
end Distributing_demux;

architecture Behavioral of Distributing_demux is

signal Norm_Norm_s_A, Norm_Norm_s_B: std_logic_vector (36 downto 0);    
signal   Sub_Norm_s_A, Sub_Norm_s_B: std_logic_vector (36 downto 0);    
signal   Norm_Sub_s_A, Norm_Sub_s_B: std_logic_vector (36 downto 0);    
signal     Sub_Sub_s_A, Sub_Sub_s_B: std_logic_vector (36 downto 0);    

begin
    process ( enable, Distributing_demux_A, Distributing_demux_B )  
    begin
        case enable is
        -------------- 00 -> Norm+Norm
        when "00" => 
        Norm_Norm_s_A <= Distributing_demux_A;
        Norm_Norm_s_B <= Distributing_demux_B;
        Sub_Norm_s_A  <= "-------------------------------------";
        Sub_Norm_s_B  <= "-------------------------------------";
        Norm_Sub_s_A  <= "-------------------------------------";
        Norm_Sub_s_B  <= "-------------------------------------";
        Sub_Sub_s_A   <= "-------------------------------------";
        Sub_Sub_s_B   <= "-------------------------------------";   
        -------------- 01 -> Sub+Norm
      when "01" => 
        Norm_Norm_s_A <= "-------------------------------------";
        Norm_Norm_s_B <= "-------------------------------------";
        Sub_Norm_s_A  <= Distributing_demux_A;
        Sub_Norm_s_B  <= Distributing_demux_B;
        Norm_Sub_s_A  <= "-------------------------------------";
        Norm_Sub_s_B  <= "-------------------------------------";
        Sub_Sub_s_A   <= "-------------------------------------";
        Sub_Sub_s_B   <= "-------------------------------------";
        -------------- 10 -> Norm+Sub       
        when "10" => 
        Norm_Norm_s_A <= "-------------------------------------";
        Norm_Norm_s_B <= "-------------------------------------";
        Sub_Norm_s_A  <= "-------------------------------------";
        Sub_Norm_s_B  <= "-------------------------------------";
        Norm_Sub_s_A  <= Distributing_demux_A;
        Norm_Sub_s_B  <= Distributing_demux_B;
        Sub_Sub_s_A   <= "-------------------------------------";
        Sub_Sub_s_B   <= "-------------------------------------";
        -------------- 11 -> Sub+Sub
        when "11" => 
        Norm_Norm_s_A <= "-------------------------------------";
        Norm_Norm_s_B <= "-------------------------------------";
        Sub_Norm_s_A  <= "-------------------------------------";
        Sub_Norm_s_B  <= "-------------------------------------";
        Norm_Sub_s_A  <= "-------------------------------------";
        Norm_Sub_s_B  <= "-------------------------------------";
        Sub_Sub_s_A   <= Distributing_demux_A;
        Sub_Sub_s_B   <= Distributing_demux_B;
        -------------- "--" -> Adding/Subtracting not possible
        when others => --Z <= 'X';                          
        Norm_Norm_s_A <= "-------------------------------------";
        Norm_Norm_s_B <= "-------------------------------------";
        Sub_Norm_s_A  <= "-------------------------------------";
        Sub_Norm_s_B  <= "-------------------------------------";
        Norm_Sub_s_A  <= "-------------------------------------";
        Norm_Sub_s_B  <= "-------------------------------------";
        Sub_Sub_s_A   <= "-------------------------------------";
        Sub_Sub_s_B   <= "-------------------------------------";
        end case;                   
    end process;
Norm_Norm_A <= Norm_Norm_s_A;
Norm_Norm_B <= Norm_Norm_s_B;
Sub_Norm_A <= Sub_Norm_s_A;
Sub_Norm_B <= Sub_Norm_s_B;
Norm_Sub_A <= Norm_Sub_s_A;
Norm_Sub_B <= Norm_Sub_s_B;
Sub_Sub_A <= Sub_Sub_s_A;
Sub_Sub_B <= Sub_Sub_s_B;
end Behavioral;
