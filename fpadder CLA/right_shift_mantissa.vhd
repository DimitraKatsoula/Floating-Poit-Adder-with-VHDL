-- 6.1.6.3. comp5/comp2 - right_shift_mantissa.vhd

-- Purpose of right_shift_mantissa:
-- Right Shift mantissa xtimes_right_shift = |expA-expB|.
-- Send shifted (the one with smaller exp), to  --> Adder, and 
-- unshifted (the one with bigger exp), to --> Adder.
-- If right shifting is done more than 27 times, there is not a non 
-- zero digit left, in shifted mantissa.
-- which_is_bigger = '0' when expB > expA,
-- which_is_bigger = '1' when expA > expB.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity right_shift_mantissa is
    port ( mantissa_in_A      : in  STD_LOGIC_VECTOR (27 downto 0);
           mantissa_in_B      : in  STD_LOGIC_VECTOR (27 downto 0);
           xtimes_right_shift : in  STD_LOGIC_VECTOR (7 downto 0);
           bigger_expA        : in  STD_LOGIC;
           to_adder_A         : out  STD_LOGIC_VECTOR (27 downto 0);
           to_adder_B         : out  STD_LOGIC_VECTOR (27 downto 0));
end right_shift_mantissa;

architecture Behavioral of right_shift_mantissa is

signal x_times_right_shift_s : STD_LOGIC_VECTOR (7 downto 0);
signal mantissa_in_A_s,mantissa_in_B_s : STD_LOGIC_VECTOR (27 downto 0);
signal shifted_A_s, shifted_B_s : STD_LOGIC_VECTOR (27 downto 0);

begin
mantissa_in_A_s <=mantissa_in_A (27 downto 0);
mantissa_in_B_s <=mantissa_in_B (27 downto 0);
x_times_right_shift_s <= xtimes_right_shift;

process ( mantissa_in_A_s, mantissa_in_B_s,mantissa_in_A, 
          mantissa_in_B, bigger_expA, x_times_right_shift_s)
    variable temp1: std_logic_vector (27 downto 0);
    variable temp2: std_logic_vector (27 downto 0);
    variable temp3: std_logic_vector (27 downto 0);
    variable temp4: std_logic_vector (27 downto 0);
    variable shifted_A: std_logic_vector (27 downto 0);
    variable shifted_B: std_logic_vector (27 downto 0);
begin
-- ... taking care whether difference of exponents, is
--     bigger than the ability of mantissa to right 
--     shift. If shifting needs to be done more than 27 times, 
--     there is not a non zero digit left, in shifted mantissa. 
if x_times_right_shift_s > "11011" then
    if bigger_expA = '0' then
        shifted_A_s <= "0000000000000000000000000000";
        -- Shifted number much smaller than unshift, so equals zero.
       shifted_B_s <= mantissa_in_B_s;               
        -- Not Shifted Mantissa saved in signal to send to output
        elsif bigger_expA = '1' then
        shifted_A_s <= mantissa_in_A_s;               
        -- Not Shifted Mantissa saved in signal to send to output.
        shifted_B_s <= "0000000000000000000000000000";
        -- Shifted number much smaller than unshift, so equals zero.        
   end if;
-- Shifting with a non zero mantissa result...
elsif x_times_right_shift_s <= "11011" then
    if bigger_expA = '0' then
    --Shifting A
                -- 1st shift stage
                if (x_times_right_shift_s(0)='0') then
                    temp1 := mantissa_in_A_s;
                else
                    temp1(mantissa_in_A_s'high) := '0';
                    for i in 1 to mantissa_in_A_s'high loop
                        temp1(i-1) := mantissa_in_A_s(i);
                    end loop;
                end if;
                -- 2nd shift stage
                if (x_times_right_shift_s(1)='0') then
                    temp2 := temp1;
                else
                    for i in 0 to 1 loop
                        temp2(mantissa_in_A_s'high-i) := '0';
                    end loop;
                    for i in 2 to mantissa_in_A_s'high loop
                        temp2(i-2) := temp1(i);
                    end loop;
                 end if;
                 -- 3rd shift stage
                 if (x_times_right_shift_s(2)='0') then
                     temp3 := temp2;
                 else
                    for i in 0 to 3 loop
                        temp3(mantissa_in_A_s'high-i) := '0';
                    end loop;
                    for i in 4 to mantissa_in_A_s'high loop
                        temp3(i-4) := temp2(i);
                    end loop;
                end if;              
                -- 4th shift stage
                if (x_times_right_shift_s(3)='0') then
                    temp4 := temp3;
                else
                    for i in 0 to 7 loop
                        temp4(mantissa_in_A_s'high-i) := '0';
                    end loop;
                    for i in 8 to mantissa_in_A_s'high loop
                        temp4(i-8) := temp3(i);
                    end loop;
                end if;
                -- 5th shift stage
                 if (x_times_right_shift_s(4)='0') then
                    shifted_A := temp4;
                 else
                    for i in 0 to 15 loop
                        shifted_A (mantissa_in_A_s'high-i) := '0';
                    end loop;
                    for i in 16 to mantissa_in_A_s'high loop
                        shifted_A (i-16) := temp4(i);
                    end loop;
                end if;             
        shifted_A_s <= shifted_A;       
        -- Shifted Mantissa saved in signal to send to output
        shifted_B_s <= mantissa_in_B_s; 
        -- Not Shifted Mantissa saved in signal to send to output
        --end if;
    elsif bigger_expA = '1' then
    --------------------------------
    --Shifting B
                -- 1st shift stage
                if (x_times_right_shift_s(0)='0') then
                    temp1 := mantissa_in_B;
                else
                    temp1(mantissa_in_B'high) := '0';
                    --right shift needs temp1(27) := '0'
                    for i in 1 to mantissa_in_B'high loop
                        temp1(i-1) := mantissa_in_B(i);
                    end loop;
                end if;
                -- 2nd shift stage
                if (x_times_right_shift_s(1)='0') then
                    temp2 := temp1;
                else
                    for i in 0 to 1 loop
                        temp2(mantissa_in_B'high-i) := '0';
                    end loop;
                    for i in 2 to mantissa_in_B'high loop
                        temp2(i-2) := temp1(i);
                    end loop;
                 end if;
                 -- 3rd shift stage
                 if (x_times_right_shift_s(2)='0') then
                     temp3 := temp2;
                 else
                    for i in 0 to 3 loop
                        temp3(mantissa_in_B'high-i) := '0';
                    end loop;
                    for i in 4 to mantissa_in_B'high loop
                        temp3(i-4) := temp2(i);
                    end loop;
                end if;              
                -- 4th shift stage
                if (x_times_right_shift_s(3)='0') then
                    temp4 := temp3;
                else
                    for i in 0 to 7 loop
                        temp4(mantissa_in_B'high-i) := '0';
                    end loop;
                    for i in 8 to mantissa_in_B'high loop
                        temp4(i-8) := temp3(i);
                    end loop;
                end if;
                 -- 5th shift stage
                 if (x_times_right_shift_s(4)='0') then
                    shifted_B  := temp4;
                 else
                    for i in 0 to 15 loop
                        shifted_B (mantissa_in_B'high-i) := '0';
                    end loop;
                    for i in 16 to mantissa_in_B_s'high loop
                        shifted_B (i-16) := temp4(i);
                    end loop;
                end if;
        shifted_A_s <= mantissa_in_A_s; 
        -- not Shifted Mantissa saved in signal to send to output
        shifted_B_s <= shifted_B;       
        -- Shifted Mantissa saved in signal to send to output.
    end if;
end if;
end process;
to_adder_A (27 downto 0) <= shifted_A_s; 
-- Shifted or unshifted Mantissa output
to_adder_B (27 downto 0) <= shifted_B_s; 
-- Shifted or unshifted Mantissa output
end Behavioral;
