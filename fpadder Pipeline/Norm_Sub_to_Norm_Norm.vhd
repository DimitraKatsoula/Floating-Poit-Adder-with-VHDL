-- 5.1.4.1.2. comp3/comp0/comp1 - Norm_Sub_to_Norm_Norm.vhd        

-- Purpose of Norm_Sub_to_Norm_Norm: 
-- shifting until Sub (2st Numer=input of Norm_Sub_to_Norm_Norm) 
-- is Normal.
-- Sent Output to --> Mux_normalize
-- Shift left mantissa x_times_leftshift_s, and
-- substract from exponent:
-- exp_new = exp_in - x_times_leftshift_s
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Norm_Sub_to_Norm_Norm is
    port ( Subnormal2_B   : in  STD_LOGIC_VECTOR (36 downto 0);
           Norm_Norm_10_B : out  STD_LOGIC_VECTOR (36 downto 0));
end Norm_Sub_to_Norm_Norm;

architecture Behavioral of Norm_Sub_to_Norm_Norm is

signal x_times_leftshift_s : STD_LOGIC_VECTOR (4 downto 0);
signal Mantissa_B_s, shifted_B_s : STD_LOGIC_VECTOR (27 downto 0);
signal exp_B_s1,exp_B_s2 : STD_LOGIC_VECTOR (7 downto 0);

begin

Mantissa_B_s <=Subnormal2_B (27 downto 0);
exp_B_s1 <= Subnormal2_B (35 downto 28);
x_times_leftshift_s <= 
"00000" when Mantissa_B_s(27) = '1'                                                   
                                else --  0
"00001" when Mantissa_B_s(27) = '0'              
    and Mantissa_B_s(26) = '1'  else --  1
"00010" when Mantissa_B_s(27 downto 26) = "00"    
    and Mantissa_B_s(25) = '1'  else --  2                              
"00011" when Mantissa_B_s(27 downto 25) = "000"   
    and Mantissa_B_s(24) = '1'  else --  3
"00100" when Mantissa_B_s(27 downto 24) = "0000"  
    and Mantissa_B_s(23) = '1'  else --  4
"00101" when Mantissa_B_s(27 downto 23) = "00000" 
    and Mantissa_B_s(22) = '1'  else --  5                      
"00110" when Mantissa_B_s(27 downto 22) = "000000"     
    and Mantissa_B_s(21) = '1'  else --  6
"00111" when Mantissa_B_s(27 downto 21) = "0000000"    
    and Mantissa_B_s(20) = '1'  else --  7
"01000" when Mantissa_B_s(27 downto 20) = "00000000"   
    and Mantissa_B_s(19) = '1'  else --  8                    
"01001" when Mantissa_B_s(27 downto 19) = "000000000"  
    and Mantissa_B_s(18) = '1'  else --  9
"01010" when Mantissa_B_s(27 downto 18) = "0000000000" 
    and Mantissa_B_s(17) = '1'  else -- 10
"01011" when Mantissa_B_s(27 downto 17) = "00000000000"     
    and Mantissa_B_s(16) = '1'  else -- 11                          
"01100" when Mantissa_B_s(27 downto 16) = "000000000000"    
    and Mantissa_B_s(15) = '1'  else -- 12
"01101" when Mantissa_B_s(27 downto 15) = "0000000000000"   
    and Mantissa_B_s(14) = '1'  else -- 13
"01110" when Mantissa_B_s(27 downto 14) = "00000000000000"  
    and Mantissa_B_s(13) = '1'  else -- 14
"01111" when Mantissa_B_s(27 downto 13) = "000000000000000" 
    and Mantissa_B_s(12) = '1'  else -- 15                          
"10000" when Mantissa_B_s(27 downto 12) = "0000000000000000"     
    and Mantissa_B_s(11) = '1'  else -- 16
"10001" when Mantissa_B_s(27 downto 11) = "00000000000000000"    
    and Mantissa_B_s(10) = '1'  else -- 17
"10010" when Mantissa_B_s(27 downto 10) = "000000000000000000"   
    and Mantissa_B_s(9)  = '1'  else -- 18
"10011" when Mantissa_B_s(27 downto 9)  = "0000000000000000000"  
    and Mantissa_B_s(8)  = '1'  else -- 19                           
"10100" when Mantissa_B_s(27 downto 8)  = "00000000000000000000" 
    and Mantissa_B_s(7)  = '1'  else -- 20
"10101" when Mantissa_B_s(27 downto 7)  = "000000000000000000000"     
    and Mantissa_B_s(6)   = '1' else -- 21
"10110" when Mantissa_B_s(27 downto 6)  = "0000000000000000000000"    
    and Mantissa_B_s(5)   = '1' else -- 22
"10111" when Mantissa_B_s(27 downto 5)  = "00000000000000000000000"   
    and Mantissa_B_s(4)   = '1' else -- 23                            
"11000" when Mantissa_B_s(27 downto 4)  = "000000000000000000000000"  
    and Mantissa_B_s(3)   = '1' else -- 24
"11001" when Mantissa_B_s(27 downto 3)  = "0000000000000000000000000" 
    and Mantissa_B_s(2)   = '1' else -- 25
"11010" when Mantissa_B_s(27 downto 2)  = "00000000000000000000000000"  
    and Mantissa_B_s(1) = '1'   else -- 26
"11011" when Mantissa_B_s(27 downto 1)  = "000000000000000000000000000" 
    and Mantissa_B_s(0) = '1'   else -- 27
"-----";            
    process (Mantissa_B_s,Subnormal2_B, x_times_leftshift_s, exp_B_s1)
     variable temp1: std_logic_vector (27 downto 0);
     variable temp2: std_logic_vector (27 downto 0);
     variable temp3: std_logic_vector (27 downto 0);
     variable temp4: std_logic_vector (27 downto 0);
     variable shifted_B: std_logic_vector (27 downto 0);
    begin
        if Subnormal2_B /= "-------------------------------------" then 
            --Shifting
            -- 1st shift stage
            if (x_times_leftshift_s(0)='0') then
                temp1 := Mantissa_B_s;
            else
                temp1(0) := '0';
                for i in 1 to Mantissa_B_s'high loop
                    temp1(i) := Mantissa_B_s(i-1);
                end loop;
            end if;
            -- 2nd shift stage
            if (x_times_leftshift_s(1)='0') then
                temp2 := temp1;
            else
                for i in 0 to 1 loop
                    temp2(i) := '0';
                end loop;
                for i in 2 to Mantissa_B_s'high loop
                    temp2(i) := temp1(i-2);
                end loop;
             end if;        
            -- 3rd shift stage
            if (x_times_leftshift_s(2)='0') then
                temp3 := temp2;
            else
                for i in 0 to 3 loop
                    temp3(i) := '0';
                end loop;
                for i in 4 to Mantissa_B_s'high loop
                    temp3(i) := temp2(i-4);
                end loop;
            end if;          
            -- 4th shift stage
            if (x_times_leftshift_s(3)='0') then
                temp4 := temp3;
            else
                for i in 0 to 7 loop
                    temp4(i) := '0';
                end loop;
                for i in 8 to Mantissa_B_s'high loop
                    temp4(i) := temp3(i-8);
                end loop;
            end if;         
            -- 5th shift stage
            if (x_times_leftshift_s(4)='0') then
                shifted_B := temp4;
            else
                for i in 0 to 15 loop
                    shifted_B(i) := '0';
                end loop;
                for i in 16 to Mantissa_B_s'high loop
                    shifted_B(i) := temp4(i-16);
                end loop;
            end if;
        if exp_B_s1>0 then
                shifted_B_s <= Subnormal2_B (27 downto 0);
                exp_B_s2 <= exp_B_s1;
            elsif exp_B_s1=0 then
            shifted_B_s <=shifted_B; -- save variable to signal
         exp_B_s2 <= exp_B_s1 - x_times_leftshift_s + "1111111";            
            end if;
        end if;
    end process;
Norm_Norm_10_B (36) <= Subnormal2_B(36);
Norm_Norm_10_B (35 downto 28) <= exp_B_s2; -- Subnormal with increased exponent
Norm_Norm_10_B (27 downto 0) <= Shifted_B_s (27 downto 0);
end Behavioral;
