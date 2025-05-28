-- 6.1.4.1.1. comp3/comp0/comp0 - Sub_Norm_to_Norm_Norm.vhd

--  Purpose of Sub_Norm_to_Norm_Norm: 
--  shifting until Sub (1st Number=input of Sub_Norm_to_Norm_Norm) 
-- is Normal.
--  Sent Output to --> Mux_normalize
-- Shift left mantissa x_times_leftshift_s, and
-- substract from exponent:
-- exp_new = exp_in - x_times_leftshift_s
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Sub_Norm_to_Norm_Norm is
 port ( Subnormal1_A : in  STD_LOGIC_VECTOR (36 downto 0);
         Norm_Norm_01_A : out  STD_LOGIC_VECTOR (36 downto 0));
end Sub_Norm_to_Norm_Norm;

architecture Behavioral of Sub_Norm_to_Norm_Norm is

signal x_times_leftshift_s : STD_LOGIC_VECTOR (4 downto 0);
signal Mantissa_A_s  : STD_LOGIC_VECTOR (27 downto 0); 
signal shifted_A_s : STD_LOGIC_VECTOR (27 downto 0);
signal exp_A_s1,exp_A_s2 : STD_LOGIC_VECTOR (7 downto 0);

begin

Mantissa_A_s <= Subnormal1_A (27 downto 0);

exp_A_s1 <= Subnormal1_A (35 downto 28);
x_times_leftshift_s <=  
"00000" when Mantissa_A_s(27) = '1'                                               				           else --  0
"00001" when Mantissa_A_s(27) = '0'               
and Mantissa_A_s(26) = '1'         else --  1
"00010" when Mantissa_A_s(27 downto 26) = "00"    
and Mantissa_A_s(25) = '1'         else --  2                               
"00011" when Mantissa_A_s(27 downto 25) = "000"   
and Mantissa_A_s(24) = '1'         else --  3
"00100" when Mantissa_A_s(27 downto 24) = "0000"  
and Mantissa_A_s(23) = '1'         else --  4
"00101" when Mantissa_A_s(27 downto 23) = "00000" 
and Mantissa_A_s(22) = '1'         else --  5                        
"00110" when Mantissa_A_s(27 downto 22) = "000000"     
and Mantissa_A_s(21) = '1'         else --  6
"00111" when Mantissa_A_s(27 downto 21) = "0000000"    
and Mantissa_A_s(20) = '1'         else --  7
"01000" when Mantissa_A_s(27 downto 20) = "00000000"   
and Mantissa_A_s(19) = '1'         else --  8                 
"01001" when Mantissa_A_s(27 downto 19) = "000000000"  
and Mantissa_A_s(18) = '1'         else --  9
"01010" when Mantissa_A_s(27 downto 18) = "0000000000" 
and Mantissa_A_s(17) = '1'         else -- 10
"01011" when Mantissa_A_s(27 downto 17) = "00000000000"     
and Mantissa_A_s(16) = '1'         else -- 11                          
"01100" when Mantissa_A_s(27 downto 16) = "000000000000"    
and Mantissa_A_s(15) = '1'         else -- 12
"01101" when Mantissa_A_s(27 downto 15) = "0000000000000"   
and Mantissa_A_s(14) = '1'         else -- 13
"01110" when Mantissa_A_s(27 downto 14) = "00000000000000"  
and Mantissa_A_s(13) = '1'         else -- 14
"01111" when Mantissa_A_s(27 downto 13) = "000000000000000" 
and Mantissa_A_s(12) = '1'         else -- 15                          
"10000" when Mantissa_A_s(27 downto 12) = "0000000000000000"     
and Mantissa_A_s(11) = '1'         else -- 16
"10001" when Mantissa_A_s(27 downto 11) = "00000000000000000"    
and Mantissa_A_s(10) = '1'         else -- 17
"10010" when Mantissa_A_s(27 downto 10) = "000000000000000000"   
and Mantissa_A_s(9)  = '1'         else -- 18
"10011" when Mantissa_A_s(27 downto 9)  = "0000000000000000000"  
and Mantissa_A_s(8)  = '1'         else -- 19                          
"10100" when Mantissa_A_s(27 downto 8)  = "00000000000000000000" 
and Mantissa_A_s(7)  = '1'         else -- 20
"10101" when Mantissa_A_s(27 downto 7)  = "000000000000000000000"     
and Mantissa_A_s(6)   = '1'        else -- 21
"10110" when Mantissa_A_s(27 downto 6)  = "0000000000000000000000"    
and Mantissa_A_s(5)   = '1'        else -- 22
"10111" when Mantissa_A_s(27 downto 5)  = "00000000000000000000000"   
and Mantissa_A_s(4)   = '1'        else -- 23                          
"11000" when Mantissa_A_s(27 downto 4)  = "000000000000000000000000"  
and Mantissa_A_s(3)   = '1'        else -- 24
"11001" when Mantissa_A_s(27 downto 3)  = "0000000000000000000000000" 
and Mantissa_A_s(2)   = '1'        else -- 25
"11010" when Mantissa_A_s(27 downto 2)  = "00000000000000000000000000"  
and Mantissa_A_s(1) = '1'          else -- 26
"11011" when Mantissa_A_s(27 downto 1)  = "000000000000000000000000000" 
and Mantissa_A_s(0) = '1'          else -- 27
"-----";                                
process (Subnormal1_A, Mantissa_A_s,x_times_leftshift_s,exp_A_s1)
    variable temp1: std_logic_vector (27 downto 0);
    variable temp2: std_logic_vector (27 downto 0);
    variable temp3: std_logic_vector (27 downto 0);
    variable temp4: std_logic_vector (27 downto 0);
    variable shifted_A: std_logic_vector (27 downto 0);
    begin
    
        if Subnormal1_A /= "-------------------------------------" then     
            --Shifting
            ---------------------------------------
            -- 1st shift stage
            if (x_times_leftshift_s(0)='0') then
                temp1 := Mantissa_A_s;
            else
                temp1(0) := '0';
                for i in 1 to Mantissa_A_s'high loop
                    temp1(i) := Mantissa_A_s(i-1);
                end loop;
            end if;
            ---------------------------------------
            -- 2nd shift stage
            if (x_times_leftshift_s(1)='0') then
                temp2 := temp1;
            else
                for i in 0 to 1 loop
                    temp2(i) := '0';
                end loop;
                for i in 2 to Mantissa_A_s'high loop
                    temp2(i) := temp1(i-2);
                end loop;
             end if;
             ---------------------------------------
             -- 3rd shift stage
             if (x_times_leftshift_s(2)='0') then
                 temp3 := temp2;
             else
                for i in 0 to 3 loop
                    temp3(i) := '0';
                end loop;
                for i in 4 to Mantissa_A_s'high loop
                    temp3(i) := temp2(i-4);
                end loop;
            end if;
         ---------------------------------------            
            -- 4th shift stage
            if (x_times_leftshift_s(3)='0') then
                temp4 := temp3;
            else
                for i in 0 to 7 loop
                    temp4(i) := '0';
                end loop;
                for i in 8 to Mantissa_A_s'high loop
                    temp4(i) := temp3(i-8);
                end loop;
            end if;
            ---------------------------------------
             -- 5th shift stage
             if (x_times_leftshift_s(4)='0') then
                shifted_A  := temp4;--
             else
                for i in 0 to 15 loop
                    shifted_A (i) := '0';--
                end loop;
                for i in 16 to Mantissa_A_s'high loop
                    shifted_A (i) := temp4(i-16);--
                end loop;
            end if; 
            if exp_A_s1>0 then
                shifted_A_s <= Subnormal1_A (27 downto 0);--
                exp_A_s2 <= exp_A_s1;
            elsif exp_A_s1=0 then
            shifted_A_s <=shifted_A; -- save variable to signal     
             exp_A_s2 <= exp_A_s1 - x_times_leftshift_s + "1111111";
            end if;
        end if;
    end process;
Norm_Norm_01_A (36) <= Subnormal1_A(36);     -- Sign
Norm_Norm_01_A (35 downto 28) <= exp_A_s2;   -- Increased exponent
Norm_Norm_01_A (27 downto 0) <= shifted_A_s; -- Shifted Mantissa
end Behavioral;
