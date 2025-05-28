-- 6.2.1.1.1 comp5/comp3/comp1 - adding_same_exp_pipeline.vhd		

--pipeline adder: 

library ieee; 
use ieee.std_logic_1164.all; 
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity adding_same_exp_pipeline is 
    GENERIC (n: integer :=27); -- bits to be added are n+1
        port(A, B: in std_logic_vector(n downto 0);  
              CLK : in std_logic;
              RSTn : in std_logic;
           Cinput : in std_logic;             
              Co: out std_logic;  
              S: out std_logic_vector(n downto 0));  
              end entity; 

architecture behaviour of adding_same_exp_pipeline is 

component FA PORT (Cinput,A,B: IN STD_LOGIC ;  
                         S,Co: OUT STD_LOGIC ) ; 
                         end component; 
     
component reg port(D,CLK,RSTn: in std_logic;  
                   Q: out std_logic); 
                    end component; 
    
signal tmp_cout : std_logic_vector(n downto 0);
signal tmp_cin : std_logic_vector(n-1 downto 0);
-----------------------------------------------------
signal tmp_S0 : std_logic_vector(n downto 0);
signal tmp_S1 : std_logic_vector(n-1 downto 0);
signal tmp_S2 : std_logic_vector(n-2 downto 0);
signal tmp_S3 : std_logic_vector(n-3 downto 0);
signal tmp_S4 : std_logic_vector(n-4 downto 0);
signal tmp_S5 : std_logic_vector(n-5 downto 0);
signal tmp_S6 : std_logic_vector(n-6 downto 0);
signal tmp_S7 : std_logic_vector(n-7 downto 0);
signal tmp_S8 : std_logic_vector(n-8 downto 0);
signal tmp_S9 : std_logic_vector(n-9 downto 0);
signal tmp_S10 : std_logic_vector(n-10 downto 0);
signal tmp_S11 : std_logic_vector(n-11 downto 0);
signal tmp_S12 : std_logic_vector(n-12 downto 0);
signal tmp_S13 : std_logic_vector(n-13 downto 0);
signal tmp_S14 : std_logic_vector(n-14 downto 0);
signal tmp_S15 : std_logic_vector(n-15 downto 0);
signal tmp_S16 : std_logic_vector(n-16 downto 0);
signal tmp_S17 : std_logic_vector(n-17 downto 0);
signal tmp_S18 : std_logic_vector(n-18 downto 0);
signal tmp_S19 : std_logic_vector(n-19 downto 0);
signal tmp_S20 : std_logic_vector(n-20 downto 0);
signal tmp_S21 : std_logic_vector(n-21 downto 0);
signal tmp_S22 : std_logic_vector(n-22 downto 0);
signal tmp_S23 : std_logic_vector(n-23 downto 0);
signal tmp_S24 : std_logic_vector(n-24 downto 0);
signal tmp_S25 : std_logic_vector(n-25 downto 0);
signal tmp_S26 : std_logic_vector(n-26 downto 0);
signal tmp_S27 : std_logic;
-----------------------------------------------------
signal tmp_A1 : std_logic;
signal tmp_B1 : std_logic;
signal tmp_A2 : std_logic_vector(n-26 downto 0);
signal tmp_B2 : std_logic_vector(n-26 downto 0);
signal tmp_A3 : std_logic_vector(n-25 downto 0);
signal tmp_B3 : std_logic_vector(n-25 downto 0);
signal tmp_A4 : std_logic_vector(n-24 downto 0);
signal tmp_B4 : std_logic_vector(n-24 downto 0);
signal tmp_A5 : std_logic_vector(n-23 downto 0);
signal tmp_B5 : std_logic_vector(n-23 downto 0);
signal tmp_A6 : std_logic_vector(n-22 downto 0);
signal tmp_B6 : std_logic_vector(n-22 downto 0);
signal tmp_A7 : std_logic_vector(n-21 downto 0);
signal tmp_B7 : std_logic_vector(n-21 downto 0);
signal tmp_A8 : std_logic_vector(n-20 downto 0);
signal tmp_B8 : std_logic_vector(n-20 downto 0);
signal tmp_A9 : std_logic_vector(n-19 downto 0);
signal tmp_B9 : std_logic_vector(n-19 downto 0);
signal tmp_A10 : std_logic_vector(n-18 downto 0);
signal tmp_B10 : std_logic_vector(n-18 downto 0);
signal tmp_A11 : std_logic_vector(n-17 downto 0);
signal tmp_B11 : std_logic_vector(n-17 downto 0);
signal tmp_A12 : std_logic_vector(n-16 downto 0);
signal tmp_B12 : std_logic_vector(n-16 downto 0);
signal tmp_A13 : std_logic_vector(n-15 downto 0);
signal tmp_B13 : std_logic_vector(n-15 downto 0);
signal tmp_A14 : std_logic_vector(n-14 downto 0);
signal tmp_B14 : std_logic_vector(n-14 downto 0);
signal tmp_A15 : std_logic_vector(n-13 downto 0);
signal tmp_B15 : std_logic_vector(n-13 downto 0);
signal tmp_A16 : std_logic_vector(n-12 downto 0);
signal tmp_B16 : std_logic_vector(n-12 downto 0);
signal tmp_A17 : std_logic_vector(n-11 downto 0);
signal tmp_B17 : std_logic_vector(n-11 downto 0);
signal tmp_A18 : std_logic_vector(n-10 downto 0);
signal tmp_B18 : std_logic_vector(n-10 downto 0);
signal tmp_A19 : std_logic_vector(n-9 downto 0);
signal tmp_B19 : std_logic_vector(n-9 downto 0);
signal tmp_A20 : std_logic_vector(n-8 downto 0);
signal tmp_B20 : std_logic_vector(n-8 downto 0);
signal tmp_A21 : std_logic_vector(n-7 downto 0);
signal tmp_B21 : std_logic_vector(n-7 downto 0);
signal tmp_A22 : std_logic_vector(n-6 downto 0);
signal tmp_B22 : std_logic_vector(n-6 downto 0);
signal tmp_A23 : std_logic_vector(n-5 downto 0);
signal tmp_B23 : std_logic_vector(n-5 downto 0);
signal tmp_A24 : std_logic_vector(n-4 downto 0);
signal tmp_B24 : std_logic_vector(n-4 downto 0);
signal tmp_A25 : std_logic_vector(n-3 downto 0);
signal tmp_B25 : std_logic_vector(n-3 downto 0);
signal tmp_A26 : std_logic_vector(n-2 downto 0);
signal tmp_B26 : std_logic_vector(n-2 downto 0);
signal tmp_A27 : std_logic_vector(n-1 downto 0);
signal tmp_B27 : std_logic_vector(n-1 downto 0);

begin


----------------------- S i ---------------------
------------------------------------------- S(0)
reg_s0_0: reg port map(tmp_S0(0),CLK,RSTn,tmp_S0(1)); 
reg_s0_1: reg port map(tmp_S0(1),CLK,RSTn,tmp_S0(2)); 
reg_s0_2: reg port map(tmp_S0(2),CLK,RSTn,tmp_S0(3));
reg_s0_3: reg port map(tmp_S0(3),CLK,RSTn,tmp_S0(4)); 
reg_s0_4: reg port map(tmp_S0(4),CLK,RSTn,tmp_S0(5));   
reg_s0_5: reg port map(tmp_S0(5),CLK,RSTn,tmp_S0(6));  
reg_s0_6: reg port map(tmp_S0(6),CLK,RSTn,tmp_S0(7)); 
reg_s0_7: reg port map(tmp_S0(7),CLK,RSTn,tmp_S0(8));   
reg_s0_8: reg port map(tmp_S0(8),CLK,RSTn,tmp_S0(9));  
reg_s0_9: reg port map(tmp_S0(9),CLK,RSTn,tmp_S0(10));   
reg_s0_10: reg port map(tmp_S0(10),CLK,RSTn,tmp_S0(11)); 
reg_s0_11: reg port map(tmp_S0(11),CLK,RSTn,tmp_S0(12)); 
reg_s0_12: reg port map(tmp_S0(12),CLK,RSTn,tmp_S0(13)); 
reg_s0_13: reg port map(tmp_S0(13),CLK,RSTn,tmp_S0(14)); 
reg_s0_14: reg port map(tmp_S0(14),CLK,RSTn,tmp_S0(15)); 
reg_s0_15: reg port map(tmp_S0(15),CLK,RSTn,tmp_S0(16));
reg_s0_16: reg port map(tmp_S0(16),CLK,RSTn,tmp_S0(17));
reg_s0_17: reg port map(tmp_S0(17),CLK,RSTn,tmp_S0(18)); 
reg_s0_18: reg port map(tmp_S0(18),CLK,RSTn,tmp_S0(19)); 
reg_s0_19: reg port map(tmp_S0(19),CLK,RSTn,tmp_S0(20)); 
reg_s0_20: reg port map(tmp_S0(20),CLK,RSTn,tmp_S0(21)); 
reg_s0_21: reg port map(tmp_S0(21),CLK,RSTn,tmp_S0(22)); 
reg_s0_22: reg port map(tmp_S0(22),CLK,RSTn,tmp_S0(23));
reg_s0_23: reg port map(tmp_S0(23),CLK,RSTn,tmp_S0(24));
reg_s0_24: reg port map(tmp_S0(24),CLK,RSTn,tmp_S0(25));
reg_s0_25: reg port map(tmp_S0(25),CLK,RSTn,tmp_S0(26));
reg_s0_26: reg port map(tmp_S0(26),CLK,RSTn,tmp_S0(27));
reg_s0_27: reg port map(tmp_S0(27),CLK,RSTn,S(0));       
------------------------------------------- S(1)
reg_s1_0: reg port map(tmp_S1(0),CLK,RSTn,tmp_S1(1));
reg_s1_1: reg port map(tmp_S1(1),CLK,RSTn,tmp_S1(2));  
reg_s1_2: reg port map(tmp_S1(2),CLK,RSTn,tmp_S1(3)); 
reg_s1_3: reg port map(tmp_S1(3),CLK,RSTn,tmp_S1(4)); 
reg_s1_4: reg port map(tmp_S1(4),CLK,RSTn,tmp_S1(5));
reg_s1_5: reg port map(tmp_S1(5),CLK,RSTn,tmp_S1(6)); 
reg_s1_6: reg port map(tmp_S1(6),CLK,RSTn,tmp_S1(7)); 
reg_s1_7: reg port map(tmp_S1(7),CLK,RSTn,tmp_S1(8)); 
reg_s1_8: reg port map(tmp_S1(8),CLK,RSTn,tmp_S1(9)); 
reg_s1_9: reg port map(tmp_S1(9),CLK,RSTn,tmp_S1(10)); 
reg_s1_10: reg port map(tmp_S1(10),CLK,RSTn,tmp_S1(11)); 
reg_s1_11: reg port map(tmp_S1(11),CLK,RSTn,tmp_S1(12)); 
reg_s1_12: reg port map(tmp_S1(12),CLK,RSTn,tmp_S1(13)); 
reg_s1_13: reg port map(tmp_S1(13),CLK,RSTn,tmp_S1(14)); 
reg_s1_14: reg port map(tmp_S1(14),CLK,RSTn,tmp_S1(15)); 
reg_s1_15: reg port map(tmp_S1(15),CLK,RSTn,tmp_S1(16)); 
reg_s1_16: reg port map(tmp_S1(16),CLK,RSTn,tmp_S1(17)); 
reg_s1_17: reg port map(tmp_S1(17),CLK,RSTn,tmp_S1(18)); 
reg_s1_18: reg port map(tmp_S1(18),CLK,RSTn,tmp_S1(19)); 
reg_s1_19: reg port map(tmp_S1(19),CLK,RSTn,tmp_S1(20)); 
reg_s1_20: reg port map(tmp_S1(20),CLK,RSTn,tmp_S1(21));
reg_s1_21: reg port map(tmp_S1(21),CLK,RSTn,tmp_S1(22));
reg_s1_22: reg port map(tmp_S1(22),CLK,RSTn,tmp_S1(23));
reg_s1_23: reg port map(tmp_S1(23),CLK,RSTn,tmp_S1(24));
reg_s1_24: reg port map(tmp_S1(24),CLK,RSTn,tmp_S1(25));
reg_s1_25: reg port map(tmp_S1(25),CLK,RSTn,tmp_S1(26));
reg_s1_26: reg port map(tmp_S1(26),CLK,RSTn,S(1));     
------------------------------------------- S(2)
reg_s2_0: reg port map(tmp_S2(0),CLK,RSTn,tmp_S2(1)); 
reg_s2_1: reg port map(tmp_S2(1),CLK,RSTn,tmp_S2(2));      
reg_s2_2: reg port map(tmp_S2(2),CLK,RSTn,tmp_S2(3));     
reg_s2_3: reg port map(tmp_S2(3),CLK,RSTn,tmp_S2(4)); 
reg_s2_4: reg port map(tmp_S2(4),CLK,RSTn,tmp_S2(5)); 
reg_s2_5: reg port map(tmp_S2(5),CLK,RSTn,tmp_S2(6)); 
reg_s2_6: reg port map(tmp_S2(6),CLK,RSTn,tmp_S2(7)); 
reg_s2_7: reg port map(tmp_S2(7),CLK,RSTn,tmp_S2(8)); 
reg_s2_8: reg port map(tmp_S2(8),CLK,RSTn,tmp_S2(9));
reg_s2_9: reg port map(tmp_S2(9),CLK,RSTn,tmp_S2(10)); 
reg_s2_10: reg port map(tmp_S2(10),CLK,RSTn,tmp_S2(11));
reg_s2_11: reg port map(tmp_S2(11),CLK,RSTn,tmp_S2(12));
reg_s2_12: reg port map(tmp_S2(12),CLK,RSTn,tmp_S2(13)); 
reg_s2_13: reg port map(tmp_S2(13),CLK,RSTn,tmp_S2(14));
reg_s2_14: reg port map(tmp_S2(14),CLK,RSTn,tmp_S2(15));
reg_s2_15: reg port map(tmp_S2(15),CLK,RSTn,tmp_S2(16)); 
reg_s2_16: reg port map(tmp_S2(16),CLK,RSTn,tmp_S2(17)); 
reg_s2_17: reg port map(tmp_S2(17),CLK,RSTn,tmp_S2(18)); 
reg_s2_18: reg port map(tmp_S2(18),CLK,RSTn,tmp_S2(19)); 
reg_s2_19: reg port map(tmp_S2(19),CLK,RSTn,tmp_S2(20)); 
reg_s2_20: reg port map(tmp_S2(20),CLK,RSTn,tmp_S2(21));
reg_s2_21: reg port map(tmp_S2(21),CLK,RSTn,tmp_S2(22));
reg_s2_22: reg port map(tmp_S2(22),CLK,RSTn,tmp_S2(23));
reg_s2_23: reg port map(tmp_S2(23),CLK,RSTn,tmp_S2(24));
reg_s2_24: reg port map(tmp_S2(24),CLK,RSTn,tmp_S2(25));
reg_s2_25: reg port map(tmp_S2(25),CLK,RSTn,S(2));     
------------------------------------------- S(3)
reg_s3_0: reg port map(tmp_S3(0),CLK,RSTn,tmp_S3(1)); 
reg_s3_1: reg port map(tmp_S3(1),CLK,RSTn,tmp_S3(2));    
reg_s3_2: reg port map(tmp_S3(2),CLK,RSTn,tmp_S3(3));     
reg_s3_3: reg port map(tmp_S3(3),CLK,RSTn,tmp_S3(4));
reg_s3_4: reg port map(tmp_S3(4),CLK,RSTn,tmp_S3(5)); 
reg_s3_5: reg port map(tmp_S3(5),CLK,RSTn,tmp_S3(6)); 
reg_s3_6: reg port map(tmp_S3(6),CLK,RSTn,tmp_S3(7)); 
reg_s3_7: reg port map(tmp_S3(7),CLK,RSTn,tmp_S3(8));
reg_s3_8: reg port map(tmp_S3(8),CLK,RSTn,tmp_S3(9)); 
reg_s3_9: reg port map(tmp_S3(9),CLK,RSTn,tmp_S3(10)); 
reg_s3_10: reg port map(tmp_S3(10),CLK,RSTn,tmp_S3(11)); 
reg_s3_11: reg port map(tmp_S3(11),CLK,RSTn,tmp_S3(12)); 
reg_s3_12: reg port map(tmp_S3(12),CLK,RSTn,tmp_S3(13)); 
reg_s3_13: reg port map(tmp_S3(13),CLK,RSTn,tmp_S3(14)); 
reg_s3_14: reg port map(tmp_S3(14),CLK,RSTn,tmp_S3(15)); 
reg_s3_15: reg port map(tmp_S3(15),CLK,RSTn,tmp_S3(16));
reg_s3_16: reg port map(tmp_S3(16),CLK,RSTn,tmp_S3(17)); 
reg_s3_17: reg port map(tmp_S3(17),CLK,RSTn,tmp_S3(18)); 
reg_s3_18: reg port map(tmp_S3(18),CLK,RSTn,tmp_S3(19));
reg_s3_19: reg port map(tmp_S3(19),CLK,RSTn,tmp_S3(20));
reg_s3_20: reg port map(tmp_S3(20),CLK,RSTn,tmp_S3(21));
reg_s3_21: reg port map(tmp_S3(21),CLK,RSTn,tmp_S3(22));
reg_s3_22: reg port map(tmp_S3(22),CLK,RSTn,tmp_S3(23));
reg_s3_23: reg port map(tmp_S3(23),CLK,RSTn,tmp_S3(24));
reg_s3_24: reg port map(tmp_S3(24),CLK,RSTn,S(3)); 
------------------------------------------- S(4)
reg_s4_0: reg port map(tmp_S4(0),CLK,RSTn,tmp_S4(1)); 
reg_s4_1: reg port map(tmp_S4(1),CLK,RSTn,tmp_S4(2));      
reg_s4_2: reg port map(tmp_S4(2),CLK,RSTn,tmp_S4(3));      
reg_s4_3: reg port map(tmp_S4(3),CLK,RSTn,tmp_S4(4)); 
reg_s4_4: reg port map(tmp_S4(4),CLK,RSTn,tmp_S4(5)); 
reg_s4_5: reg port map(tmp_S4(5),CLK,RSTn,tmp_S4(6)); 
reg_s4_6: reg port map(tmp_S4(6),CLK,RSTn,tmp_S4(7)); 
reg_s4_7: reg port map(tmp_S4(7),CLK,RSTn,tmp_S4(8)); 
reg_s4_8: reg port map(tmp_S4(8),CLK,RSTn,tmp_S4(9)); 
reg_s4_9: reg port map(tmp_S4(9),CLK,RSTn,tmp_S4(10));
reg_s4_10: reg port map(tmp_S4(10),CLK,RSTn,tmp_S4(11));
reg_s4_11: reg port map(tmp_S4(11),CLK,RSTn,tmp_S4(12)); 
reg_s4_12: reg port map(tmp_S4(12),CLK,RSTn,tmp_S4(13)); 
reg_s4_13: reg port map(tmp_S4(13),CLK,RSTn,tmp_S4(14)); 
reg_s4_14: reg port map(tmp_S4(14),CLK,RSTn,tmp_S4(15)); 
reg_s4_15: reg port map(tmp_S4(15),CLK,RSTn,tmp_S4(16)); 
reg_s4_16: reg port map(tmp_S4(16),CLK,RSTn,tmp_S4(17)); 
reg_s4_17: reg port map(tmp_S4(17),CLK,RSTn,tmp_S4(18)); 
reg_s4_18: reg port map(tmp_S4(18),CLK,RSTn,tmp_S4(19));
reg_s4_19: reg port map(tmp_S4(19),CLK,RSTn,tmp_S4(20));
reg_s4_20: reg port map(tmp_S4(20),CLK,RSTn,tmp_S4(21));
reg_s4_21: reg port map(tmp_S4(21),CLK,RSTn,tmp_S4(22));
reg_s4_22: reg port map(tmp_S4(22),CLK,RSTn,tmp_S4(23));
reg_s4_23: reg port map(tmp_S4(23),CLK,RSTn,S(4)); 
------------------------------------------- S(5)
reg_s5_0: reg port map(tmp_S5(0),CLK,RSTn,tmp_S5(1)); 
reg_s5_1: reg port map(tmp_S5(1),CLK,RSTn,tmp_S5(2));     
reg_s5_2: reg port map(tmp_S5(2),CLK,RSTn,tmp_S5(3));     
reg_s5_3: reg port map(tmp_S5(3),CLK,RSTn,tmp_S5(4)); 
reg_s5_4: reg port map(tmp_S5(4),CLK,RSTn,tmp_S5(5));
reg_s5_5: reg port map(tmp_S5(5),CLK,RSTn,tmp_S5(6)); 
reg_s5_6: reg port map(tmp_S5(6),CLK,RSTn,tmp_S5(7)); 
reg_s5_7: reg port map(tmp_S5(7),CLK,RSTn,tmp_S5(8)); 
reg_s5_8: reg port map(tmp_S5(8),CLK,RSTn,tmp_S5(9)); 
reg_s5_9: reg port map(tmp_S5(9),CLK,RSTn,tmp_S5(10)); 
reg_s5_10: reg port map(tmp_s5(10),CLK,RSTn,tmp_S5(11)); 
reg_s5_11: reg port map(tmp_S5(11),CLK,RSTn,tmp_S5(12)); 
reg_s5_12: reg port map(tmp_S5(12),CLK,RSTn,tmp_S5(13)); 
reg_s5_13: reg port map(tmp_S5(13),CLK,RSTn,tmp_S5(14)); 
reg_s5_14: reg port map(tmp_S5(14),CLK,RSTn,tmp_S5(15)); 
reg_s5_15: reg port map(tmp_S5(15),CLK,RSTn,tmp_S5(16)); 
reg_s5_16: reg port map(tmp_S5(16),CLK,RSTn,tmp_S5(17)); 
reg_s5_17: reg port map(tmp_S5(17),CLK,RSTn,tmp_S5(18));
reg_s5_18: reg port map(tmp_S5(18),CLK,RSTn,tmp_S5(19));
reg_s5_19: reg port map(tmp_S5(19),CLK,RSTn,tmp_S5(20));
reg_s5_20: reg port map(tmp_S5(20),CLK,RSTn,tmp_S5(21));
reg_s5_21: reg port map(tmp_S5(21),CLK,RSTn,tmp_S5(22));
reg_s5_22: reg port map(tmp_S5(22),CLK,RSTn,S(5)); 
------------------------------------------- S(6)
reg_s6_0: reg port map(tmp_S6(0),CLK,RSTn,tmp_S6(1)); 
reg_s6_1: reg port map(tmp_S6(1),CLK,RSTn,tmp_S6(2));     
reg_s6_2: reg port map(tmp_S6(2),CLK,RSTn,tmp_S6(3));     
reg_s6_3: reg port map(tmp_S6(3),CLK,RSTn,tmp_S6(4));     
reg_s6_4: reg port map(tmp_S6(4),CLK,RSTn,tmp_S6(5));    
reg_s6_5: reg port map(tmp_S6(5),CLK,RSTn,tmp_S6(6));     
reg_s6_6: reg port map(tmp_S6(6),CLK,RSTn,tmp_S6(7));   
reg_s6_7: reg port map(tmp_S6(7),CLK,RSTn,tmp_S6(8));     
reg_s6_8: reg port map(tmp_S6(8),CLK,RSTn,tmp_S6(9));     
reg_s6_9: reg port map(tmp_S6(9),CLK,RSTn,tmp_S6(10));    
reg_s6_10: reg port map(tmp_S6(10),CLK,RSTn,tmp_S6(11));     
reg_s6_11: reg port map(tmp_S6(11),CLK,RSTn,tmp_S6(12));      
reg_s6_12: reg port map(tmp_S6(12),CLK,RSTn,tmp_S6(13));      
reg_s6_13: reg port map(tmp_S6(13),CLK,RSTn,tmp_S6(14));  
reg_s6_14: reg port map(tmp_S6(14),CLK,RSTn,tmp_S6(15));   
reg_s6_15: reg port map(tmp_S6(15),CLK,RSTn,tmp_S6(16));  
reg_s6_16: reg port map(tmp_S6(16),CLK,RSTn,tmp_S6(17));
reg_s6_17: reg port map(tmp_S6(17),CLK,RSTn,tmp_S6(18));
reg_s6_18: reg port map(tmp_S6(18),CLK,RSTn,tmp_S6(19));
reg_s6_19: reg port map(tmp_S6(19),CLK,RSTn,tmp_S6(20));
reg_s6_20: reg port map(tmp_S6(20),CLK,RSTn,tmp_S6(21));
reg_s6_21: reg port map(tmp_S6(21),CLK,RSTn,S(6));        
------------------------------------------- S(7)
reg_s7_0: reg port map(tmp_S7(0),CLK,RSTn,tmp_S7(1)); 
reg_s7_1: reg port map(tmp_S7(1),CLK,RSTn,tmp_S7(2));     
reg_s7_2: reg port map(tmp_S7(2),CLK,RSTn,tmp_S7(3));      
reg_s7_3: reg port map(tmp_S7(3),CLK,RSTn,tmp_S7(4));      
reg_s7_4: reg port map(tmp_S7(4),CLK,RSTn,tmp_S7(5));     
reg_s7_5: reg port map(tmp_S7(5),CLK,RSTn,tmp_S7(6));     
reg_s7_6: reg port map(tmp_S7(6),CLK,RSTn,tmp_S7(7));      
reg_s7_7: reg port map(tmp_S7(7),CLK,RSTn,tmp_S7(8));    
reg_s7_8: reg port map(tmp_S7(8),CLK,RSTn,tmp_S7(9));    
reg_s7_9: reg port map(tmp_S7(9),CLK,RSTn,tmp_S7(10));   
reg_s7_10: reg port map(tmp_s7(10),CLK,RSTn,tmp_S7(11));      
reg_s7_11: reg port map(tmp_s7(11),CLK,RSTn,tmp_S7(12));      
reg_s7_12: reg port map(tmp_S7(12),CLK,RSTn,tmp_S7(13));     
reg_s7_13: reg port map(tmp_S7(13),CLK,RSTn,tmp_S7(14)); 
reg_s7_14: reg port map(tmp_S7(14),CLK,RSTn,tmp_S7(15));  
reg_s7_15: reg port map(tmp_S7(15),CLK,RSTn,tmp_S7(16));
reg_s7_16: reg port map(tmp_S7(16),CLK,RSTn,tmp_S7(17));
reg_s7_17: reg port map(tmp_S7(17),CLK,RSTn,tmp_S7(18));
reg_s7_18: reg port map(tmp_S7(18),CLK,RSTn,tmp_S7(19));
reg_s7_19: reg port map(tmp_S7(19),CLK,RSTn,tmp_S7(20));
reg_s7_20: reg port map(tmp_S7(20),CLK,RSTn,S(7));       
------------------------------------------- S(8)
reg_s8_0: reg port map(tmp_S8(0),CLK,RSTn,tmp_S8(1)); 
reg_s8_1: reg port map(tmp_S8(1),CLK,RSTn,tmp_S8(2));   
reg_s8_2: reg port map(tmp_S8(2),CLK,RSTn,tmp_S8(3));     
reg_s8_3: reg port map(tmp_S8(3),CLK,RSTn,tmp_S8(4));   
reg_s8_4: reg port map(tmp_S8(4),CLK,RSTn,tmp_S8(5));     
reg_s8_5: reg port map(tmp_S8(5),CLK,RSTn,tmp_S8(6));    
reg_s8_6: reg port map(tmp_S8(6),CLK,RSTn,tmp_S8(7));    
reg_s8_7: reg port map(tmp_S8(7),CLK,RSTn,tmp_S8(8));    
reg_s8_8: reg port map(tmp_S8(8),CLK,RSTn,tmp_S8(9));   
reg_s8_9: reg port map(tmp_S8(9),CLK,RSTn,tmp_S8(10));  
reg_s8_10: reg port map(tmp_S8(10),CLK,RSTn,tmp_S8(11));    
reg_s8_11: reg port map(tmp_S8(11),CLK,RSTn,tmp_S8(12));    
reg_s8_12: reg port map(tmp_S8(12),CLK,RSTn,tmp_S8(13));     
reg_s8_13: reg port map(tmp_S8(13),CLK,RSTn,tmp_S8(14));   
reg_s8_14: reg port map(tmp_S8(14),CLK,RSTn,tmp_S8(15));
reg_s8_15: reg port map(tmp_S8(15),CLK,RSTn,tmp_S8(16));
reg_s8_16: reg port map(tmp_S8(16),CLK,RSTn,tmp_S8(17));
reg_s8_17: reg port map(tmp_S8(17),CLK,RSTn,tmp_S8(18));
reg_s8_18: reg port map(tmp_S8(18),CLK,RSTn,tmp_S8(19));
reg_s8_19: reg port map(tmp_S8(19),CLK,RSTn,S(8));      
------------------------------------------- S(9)
reg_s9_0: reg port map(tmp_S9(0),CLK,RSTn,tmp_S9(1)); 
reg_s9_1: reg port map(tmp_S9(1),CLK,RSTn,tmp_S9(2));      
reg_s9_2: reg port map(tmp_S9(2),CLK,RSTn,tmp_S9(3));      
reg_s9_3: reg port map(tmp_S9(3),CLK,RSTn,tmp_S9(4));  
reg_s9_4: reg port map(tmp_S9(4),CLK,RSTn,tmp_S9(5));    
reg_s9_5: reg port map(tmp_S9(5),CLK,RSTn,tmp_S9(6));      
reg_s9_6: reg port map(tmp_S9(6),CLK,RSTn,tmp_S9(7));      
reg_s9_7: reg port map(tmp_S9(7),CLK,RSTn,tmp_S9(8));    
reg_s9_8: reg port map(tmp_S9(8),CLK,RSTn,tmp_S9(9));     
reg_s9_9: reg port map(tmp_S9(9),CLK,RSTn,tmp_S9(10));   
reg_s9_10: reg port map(tmp_S9(10),CLK,RSTn,tmp_S9(11));      
reg_s9_11: reg port map(tmp_S9(11),CLK,RSTn,tmp_S9(12));      
reg_s9_12: reg port map(tmp_S9(12),CLK,RSTn,tmp_S9(13));      
reg_s9_13: reg port map(tmp_S9(13),CLK,RSTn,tmp_S9(14));
reg_s9_14: reg port map(tmp_S9(14),CLK,RSTn,tmp_S9(15));
reg_s9_15: reg port map(tmp_S9(15),CLK,RSTn,tmp_S9(16));
reg_s9_16: reg port map(tmp_S9(16),CLK,RSTn,tmp_S9(17));
reg_s9_17: reg port map(tmp_S9(17),CLK,RSTn,tmp_S9(18));
reg_s9_18: reg port map(tmp_S9(18),CLK,RSTn,S(9));        
------------------------------------------- S(10)
reg_s10_0: reg port map(tmp_S10(0),CLK,RSTn,tmp_S10(1)); 
reg_s10_1: reg port map(tmp_S10(1),CLK,RSTn,tmp_S10(2));     
reg_s10_2: reg port map(tmp_S10(2),CLK,RSTn,tmp_S10(3));     
reg_s10_3: reg port map(tmp_S10(3),CLK,RSTn,tmp_S10(4));      
reg_s10_4: reg port map(tmp_S10(4),CLK,RSTn,tmp_S10(5));      
reg_s10_5: reg port map(tmp_S10(5),CLK,RSTn,tmp_S10(6));     
reg_s10_6: reg port map(tmp_S10(6),CLK,RSTn,tmp_S10(7));     
reg_s10_7: reg port map(tmp_S10(7),CLK,RSTn,tmp_S10(8));     
reg_s10_8: reg port map(tmp_S10(8),CLK,RSTn,tmp_S10(9));      
reg_s10_9: reg port map(tmp_S10(9),CLK,RSTn,tmp_S10(10));     
reg_s10_10: reg port map(tmp_S10(10),CLK,RSTn,tmp_S10(11));   
reg_s10_11: reg port map(tmp_S10(11),CLK,RSTn,tmp_S10(12));   
reg_s10_12: reg port map(tmp_S10(12),CLK,RSTn,tmp_S10(13));
reg_s10_13: reg port map(tmp_S10(13),CLK,RSTn,tmp_S10(14));
reg_s10_14: reg port map(tmp_S10(14),CLK,RSTn,tmp_S10(15));
reg_s10_15: reg port map(tmp_S10(15),CLK,RSTn,tmp_S10(16));
reg_s10_16: reg port map(tmp_S10(16),CLK,RSTn,tmp_S10(17));
reg_s10_17: reg port map(tmp_S10(17),CLK,RSTn,S(10));         
------------------------------------------- S(11)
reg_s11_0: reg port map(tmp_S11(0),CLK,RSTn,tmp_S11(1)); 
reg_s11_1: reg port map(tmp_S11(1),CLK,RSTn,tmp_S11(2));      
reg_s11_2: reg port map(tmp_S11(2),CLK,RSTn,tmp_S11(3));     
reg_s11_3: reg port map(tmp_S11(3),CLK,RSTn,tmp_S11(4));    
reg_s11_4: reg port map(tmp_S11(4),CLK,RSTn,tmp_S11(5));      
reg_s11_5: reg port map(tmp_S11(5),CLK,RSTn,tmp_S11(6));      
reg_s11_6: reg port map(tmp_S11(6),CLK,RSTn,tmp_S11(7));      
reg_s11_7: reg port map(tmp_S11(7),CLK,RSTn,tmp_S11(8));      
reg_s11_8: reg port map(tmp_S11(8),CLK,RSTn,tmp_S11(9));      
reg_s11_9: reg port map(tmp_s11(9),CLK,RSTn,tmp_S11(10));     
reg_s11_10: reg port map(tmp_S11(10),CLK,RSTn,tmp_S11(11));   
reg_s11_11: reg port map(tmp_S11(11),CLK,RSTn,tmp_S11(12)); 
reg_s11_12: reg port map(tmp_S11(12),CLK,RSTn,tmp_S11(13)); 
reg_s11_13: reg port map(tmp_S11(13),CLK,RSTn,tmp_S11(14)); 
reg_s11_14: reg port map(tmp_S11(14),CLK,RSTn,tmp_S11(15)); 
reg_s11_15: reg port map(tmp_S11(15),CLK,RSTn,tmp_S11(16)); 
reg_s11_16: reg port map(tmp_S11(16),CLK,RSTn,S(11));         
------------------------------------------- S(12)
reg_s12_0: reg port map(tmp_S12(0),CLK,RSTn,tmp_S12(1)); 
reg_s12_1: reg port map(tmp_S12(1),CLK,RSTn,tmp_S12(2));      
reg_s12_2: reg port map(tmp_S12(2),CLK,RSTn,tmp_S12(3));     
reg_s12_3: reg port map(tmp_S12(3),CLK,RSTn,tmp_S12(4));      
reg_s12_4: reg port map(tmp_S12(4),CLK,RSTn,tmp_S12(5));      
reg_s12_5: reg port map(tmp_S12(5),CLK,RSTn,tmp_S12(6));      
reg_s12_6: reg port map(tmp_S12(6),CLK,RSTn,tmp_S12(7));      
reg_s12_7: reg port map(tmp_S12(7),CLK,RSTn,tmp_S12(8));      
reg_s12_8: reg port map(tmp_S12(8),CLK,RSTn,tmp_S12(9));      
reg_s12_9: reg port map(tmp_S12(9),CLK,RSTn,tmp_S12(10));     
reg_s12_10: reg port map(tmp_S12(10),CLK,RSTn,tmp_S12(11)); 
reg_s12_11: reg port map(tmp_S12(11),CLK,RSTn,tmp_S12(12));
reg_s12_12: reg port map(tmp_S12(12),CLK,RSTn,tmp_S12(13));
reg_s12_13: reg port map(tmp_S12(13),CLK,RSTn,tmp_S12(14));
reg_s12_14: reg port map(tmp_S12(14),CLK,RSTn,tmp_S12(15));
reg_s12_15: reg port map(tmp_S12(15),CLK,RSTn,S(12));         
------------------------------------------- S(13)
reg_s13_0: reg port map(tmp_S13(0),CLK,RSTn,tmp_S13(1)); 
reg_s13_1: reg port map(tmp_S13(1),CLK,RSTn,tmp_S13(2));     
reg_s13_2: reg port map(tmp_S13(2),CLK,RSTn,tmp_S13(3));      
reg_s13_3: reg port map(tmp_S13(3),CLK,RSTn,tmp_S13(4));     
reg_s13_4: reg port map(tmp_S13(4),CLK,RSTn,tmp_S13(5));      
reg_s13_5: reg port map(tmp_S13(5),CLK,RSTn,tmp_S13(6));      
reg_s13_6: reg port map(tmp_S13(6),CLK,RSTn,tmp_S13(7));      
reg_s13_7: reg port map(tmp_S13(7),CLK,RSTn,tmp_S13(8));      
reg_s13_8: reg port map(tmp_S13(8),CLK,RSTn,tmp_S13(9));    
reg_s13_9: reg port map(tmp_S13(9),CLK,RSTn,tmp_S13(10)); 
reg_s13_10: reg port map(tmp_S13(10),CLK,RSTn,tmp_S13(11));  
reg_s13_11: reg port map(tmp_S13(11),CLK,RSTn,tmp_S13(12));  
reg_s13_12: reg port map(tmp_S13(12),CLK,RSTn,tmp_S13(13));  
reg_s13_13: reg port map(tmp_S13(13),CLK,RSTn,tmp_S13(14));  
reg_s13_14: reg port map(tmp_S13(14),CLK,RSTn,S(13));        
------------------------------------------- S(14)
reg_s14_0: reg port map(tmp_S14(0),CLK,RSTn,tmp_S14(1)); 
reg_s14_1: reg port map(tmp_S14(1),CLK,RSTn,tmp_S14(2));     
reg_s14_2: reg port map(tmp_S14(2),CLK,RSTn,tmp_S14(3));     
reg_s14_3: reg port map(tmp_S14(3),CLK,RSTn,tmp_S14(4));      
reg_s14_4: reg port map(tmp_S14(4),CLK,RSTn,tmp_S14(5));      
reg_s14_5: reg port map(tmp_S14(5),CLK,RSTn,tmp_S14(6));      
reg_s14_6: reg port map(tmp_S14(6),CLK,RSTn,tmp_S14(7));     
reg_s14_7: reg port map(tmp_S14(7),CLK,RSTn,tmp_S14(8));      
reg_s14_8: reg port map(tmp_S14(8),CLK,RSTn,tmp_S14(9)); 
reg_s14_9: reg port map(tmp_S14(9),CLK,RSTn,tmp_S14(10)); 
reg_s14_10: reg port map(tmp_S14(10),CLK,RSTn,tmp_S14(11)); 
reg_s14_11: reg port map(tmp_S14(11),CLK,RSTn,tmp_S14(12)); 
reg_s14_12: reg port map(tmp_S14(12),CLK,RSTn,tmp_S14(13)); 
reg_s14_13: reg port map(tmp_S14(13),CLK,RSTn,S(14));           
------------------------------------------- S(15)
reg_s15_0: reg port map(tmp_S15(0),CLK,RSTn,tmp_S15(1)); 
reg_s15_1: reg port map(tmp_s15(1),CLK,RSTn,tmp_S15(2));     
reg_s15_2: reg port map(tmp_S15(2),CLK,RSTn,tmp_S15(3));    
reg_s15_3: reg port map(tmp_S15(3),CLK,RSTn,tmp_S15(4));      
reg_s15_4: reg port map(tmp_S15(4),CLK,RSTn,tmp_S15(5));      
reg_s15_5: reg port map(tmp_S15(5),CLK,RSTn,tmp_S15(6));     
reg_s15_6: reg port map(tmp_S15(6),CLK,RSTn,tmp_S15(7));      
reg_s15_7: reg port map(tmp_S15(7),CLK,RSTn,tmp_S15(8));  
reg_s15_8: reg port map(tmp_S15(8),CLK,RSTn,tmp_S15(9)); 
reg_s15_9: reg port map(tmp_S15(9),CLK,RSTn,tmp_S15(10)); 
reg_s15_10: reg port map(tmp_S15(10),CLK,RSTn,tmp_S15(11)); 
reg_s15_11: reg port map(tmp_S15(11),CLK,RSTn,tmp_S15(12)); 
reg_s15_12: reg port map(tmp_S15(12),CLK,RSTn,S(15));            
------------------------------------------- S(16)
reg_s16_0: reg port map(tmp_S16(0),CLK,RSTn,tmp_S16(1)); 
reg_s16_1: reg port map(tmp_S16(1),CLK,RSTn,tmp_S16(2));     
reg_s16_2: reg port map(tmp_S16(2),CLK,RSTn,tmp_S16(3));    
reg_s16_3: reg port map(tmp_S16(3),CLK,RSTn,tmp_S16(4));      
reg_s16_4: reg port map(tmp_S16(4),CLK,RSTn,tmp_S16(5));   
reg_s16_5: reg port map(tmp_S16(5),CLK,RSTn,tmp_S16(6));     
reg_s16_6: reg port map(tmp_S16(6),CLK,RSTn,tmp_S16(7));    
reg_s16_7: reg port map(tmp_S16(7),CLK,RSTn,tmp_S16(8));    
reg_s16_8: reg port map(tmp_S16(8),CLK,RSTn,tmp_S16(9));    
reg_s16_9: reg port map(tmp_S16(9),CLK,RSTn,tmp_S16(10));    
reg_s16_10: reg port map(tmp_S16(10),CLK,RSTn,tmp_S16(11)); 
reg_s16_11: reg port map(tmp_S16(11),CLK,RSTn,S(16));            
------------------------------------------- S(17)
reg_s17_0: reg port map(tmp_S17(0),CLK,RSTn,tmp_S17(1)); 
reg_s17_1: reg port map(tmp_S17(1),CLK,RSTn,tmp_S17(2));      
reg_s17_2: reg port map(tmp_S17(2),CLK,RSTn,tmp_S17(3));      
reg_s17_3: reg port map(tmp_S17(3),CLK,RSTn,tmp_S17(4));      
reg_s17_4: reg port map(tmp_S17(4),CLK,RSTn,tmp_S17(5));    
reg_s17_5: reg port map(tmp_S17(5),CLK,RSTn,tmp_S17(6));    
reg_s17_6: reg port map(tmp_S17(6),CLK,RSTn,tmp_S17(7));   
reg_s17_7: reg port map(tmp_S17(7),CLK,RSTn,tmp_S17(8));   
reg_s17_8: reg port map(tmp_S17(8),CLK,RSTn,tmp_S17(9));   
reg_s17_9: reg port map(tmp_S17(9),CLK,RSTn,tmp_S17(10)); 
reg_s17_10: reg port map(tmp_S17(10),CLK,RSTn,S(17));            
------------------------------------------- S(18)
reg_s18_0: reg port map(tmp_S18(0),CLK,RSTn,tmp_S18(1)); 
reg_s18_1: reg port map(tmp_S18(1),CLK,RSTn,tmp_S18(2));     
reg_s18_2: reg port map(tmp_S18(2),CLK,RSTn,tmp_S18(3));      
reg_s18_3: reg port map(tmp_S18(3),CLK,RSTn,tmp_S18(4));     
reg_s18_4: reg port map(tmp_S18(4),CLK,RSTn,tmp_S18(5));  
reg_s18_5: reg port map(tmp_S18(5),CLK,RSTn,tmp_S18(6)); 
reg_s18_6: reg port map(tmp_S18(6),CLK,RSTn,tmp_S18(7));  
reg_s18_7: reg port map(tmp_S18(7),CLK,RSTn,tmp_S18(8));  
reg_s18_8: reg port map(tmp_S18(8),CLK,RSTn,tmp_S18(9));      
reg_s18_9: reg port map(tmp_S18(9),CLK,RSTn,S(18));             
------------------------------------------- S(19)
reg_s19_0: reg port map(tmp_S19(0),CLK,RSTn,tmp_S19(1)); 
reg_s19_1: reg port map(tmp_S19(1),CLK,RSTn,tmp_S19(2));      
reg_s19_2: reg port map(tmp_S19(2),CLK,RSTn,tmp_S19(3));      
reg_s19_3: reg port map(tmp_S19(3),CLK,RSTn,tmp_S19(4));
reg_s19_4: reg port map(tmp_S19(4),CLK,RSTn,tmp_S19(5)); 
reg_s19_5: reg port map(tmp_S19(5),CLK,RSTn,tmp_S19(6)); 
reg_s19_6: reg port map(tmp_S19(6),CLK,RSTn,tmp_S19(7)); 
reg_s19_7: reg port map(tmp_S19(7),CLK,RSTn,tmp_S19(8));      
reg_s19_8: reg port map(tmp_S19(8),CLK,RSTn,S(19));             
------------------------------------------- S(20)
reg_s20_0: reg port map(tmp_S20(0),CLK,RSTn,tmp_S20(1)); 
reg_s20_1: reg port map(tmp_S20(1),CLK,RSTn,tmp_S20(2)); 
reg_s20_2: reg port map(tmp_S20(2),CLK,RSTn,tmp_S20(3));   
reg_s20_3: reg port map(tmp_S20(3),CLK,RSTn,tmp_S20(4));
reg_s20_4: reg port map(tmp_S20(4),CLK,RSTn,tmp_S20(5));   
reg_s20_5: reg port map(tmp_S20(5),CLK,RSTn,tmp_S20(6));   
reg_s20_6: reg port map(tmp_S20(6),CLK,RSTn,tmp_S20(7));      
reg_s20_7: reg port map(tmp_S20(7),CLK,RSTn,S(20));              
------------------------------------------- S(21)
reg_s21_0: reg port map(tmp_S21(0),CLK,RSTn,tmp_S21(1)); 
reg_s21_1: reg port map(tmp_S21(1),CLK,RSTn,tmp_S21(2)); 
reg_s21_2: reg port map(tmp_S21(2),CLK,RSTn,tmp_S21(3));
reg_s21_3: reg port map(tmp_S21(3),CLK,RSTn,tmp_S21(4));
reg_s21_4: reg port map(tmp_S21(4),CLK,RSTn,tmp_S21(5));
reg_s21_5: reg port map(tmp_S21(5),CLK,RSTn,tmp_S21(6));
reg_s21_6: reg port map(tmp_S21(6),CLK,RSTn,S(21));              
------------------------------------------- S(22) 
reg_s22_0: reg port map(tmp_S22(0),CLK,RSTn,tmp_S22(1));    
reg_s22_1: reg port map(tmp_S22(1),CLK,RSTn,tmp_S22(2)); 
reg_s22_2: reg port map(tmp_S22(2),CLK,RSTn,tmp_S22(3));    
reg_s22_3: reg port map(tmp_S22(3),CLK,RSTn,tmp_S22(4));    
reg_s22_4: reg port map(tmp_S22(4),CLK,RSTn,tmp_S22(5));              
reg_s22_5: reg port map(tmp_S22(5),CLK,RSTn,S(22));                
------------------------------------------- S(23) 
reg_s23_0: reg port map(tmp_S23(0),CLK,RSTn,tmp_S23(1));
reg_s23_1: reg port map(tmp_S23(1),CLK,RSTn,tmp_S23(2));
reg_s23_2: reg port map(tmp_S23(2),CLK,RSTn,tmp_S23(3));
reg_s23_3: reg port map(tmp_S23(3),CLK,RSTn,tmp_S23(4));
reg_s23_4: reg port map(tmp_S23(4),CLK,RSTn,S(23));                 
------------------------------------------- S(24) 
reg_s24_0: reg port map(tmp_S24(0),CLK,RSTn,tmp_S24(1));
reg_s24_1: reg port map(tmp_S24(1),CLK,RSTn,tmp_S24(2));
reg_s24_2: reg port map(tmp_S24(2),CLK,RSTn,tmp_S24(3));
reg_s24_3: reg port map(tmp_S24(3),CLK,RSTn,S(24));     
------------------------------------------- S(25) 
reg_s25_0: reg port map(tmp_S25(0),CLK,RSTn,tmp_S25(1));
reg_s25_1: reg port map(tmp_S25(1),CLK,RSTn,tmp_S25(2));
reg_s25_2: reg port map(tmp_S25(2),CLK,RSTn,S(25));     
------------------------------------------- S(26) 
reg_s26_0: reg port map(tmp_S26(0),CLK,RSTn,tmp_S26(1));             
reg_s26_1: reg port map(tmp_S26(1),CLK,RSTn,S(26));                 
------------------------------------------- S(27) 
reg_s27_1: reg port map(tmp_S27,CLK,RSTn,S(27));                

--------------------------------------------------------
-------------------------- C i : -----------------------
--------------------------------------------------------

------------------------------------------- Cout
reg_cout0: reg port map(tmp_cout(0),CLK,RSTn,tmp_cin(0));
reg_cout1: reg port map(tmp_cout(1),CLK,RSTn,tmp_cin(1));
reg_cout2: reg port map(tmp_cout(2),CLK,RSTn,tmp_cin(2)); 
reg_cout3: reg port map(tmp_cout(3),CLK,RSTn,tmp_cin(3)); 
reg_cout4: reg port map(tmp_cout(4),CLK,RSTn,tmp_cin(4)); 
reg_cout5: reg port map(tmp_cout(5),CLK,RSTn,tmp_cin(5)); 
reg_cout6: reg port map(tmp_cout(6),CLK,RSTn,tmp_cin(6)); 
reg_cout7: reg port map(tmp_cout(7),CLK,RSTn,tmp_cin(7)); 
reg_cout8: reg port map(tmp_cout(8),CLK,RSTn,tmp_cin(8));
reg_cout9: reg port map(tmp_cout(9),CLK,RSTn,tmp_cin(9));
reg_cout10: reg port map(tmp_cout(10),CLK,RSTn,tmp_cin(10)); 
reg_cout11: reg port map(tmp_cout(11),CLK,RSTn,tmp_cin(11)); 
reg_cout12: reg port map(tmp_cout(12),CLK,RSTn,tmp_cin(12)); 
reg_cout13: reg port map(tmp_cout(13),CLK,RSTn,tmp_cin(13)); 
reg_cout14: reg port map(tmp_cout(14),CLK,RSTn,tmp_cin(14)); 
reg_cout15: reg port map(tmp_cout(15),CLK,RSTn,tmp_cin(15)); 
reg_cout16: reg port map(tmp_cout(16),CLK,RSTn,tmp_cin(16)); 
reg_cout17: reg port map(tmp_cout(17),CLK,RSTn,tmp_cin(17)); 
reg_cout18: reg port map(tmp_cout(18),CLK,RSTn,tmp_cin(18));
reg_cout19: reg port map(tmp_cout(19),CLK,RSTn,tmp_cin(19)); 
reg_cout20: reg port map(tmp_cout(20),CLK,RSTn,tmp_cin(20)); 
reg_cout21: reg port map(tmp_cout(21),CLK,RSTn,tmp_cin(21)); 
reg_cout22: reg port map(tmp_cout(22),CLK,RSTn,tmp_cin(22)); 
reg_cout23: reg port map(tmp_cout(23),CLK,RSTn,tmp_cin(23));
reg_cout24: reg port map(tmp_cout(24),CLK,RSTn,tmp_cin(24));
reg_cout25: reg port map(tmp_cout(25),CLK,RSTn,tmp_cin(25));
reg_cout26: reg port map(tmp_cout(26),CLK,RSTn,tmp_cin(26));
reg_cout27: reg port map(tmp_cout(27),CLK,RSTn,Co);          

-------------------------------------------------------------
--------------------------- A i : ---------------------------
-------------------------------------------------------------

------------------------------------------- A1 --> tmp_A1,
reg_A1: reg port map(A(1),CLK,RSTn,tmp_A1);
------------------------------------------- A2 --> tmp_A2
reg_A2_0: reg port map(A(2),CLK,RSTn,tmp_A2(0)); 
reg_A2_1: reg port map(tmp_A2(0),CLK,RSTn,tmp_A2(1));
------------------------------------------- A3 --> tmp_A3
reg_A3_0: reg port map(A(3),CLK,RSTn,tmp_A3(0));
reg_A3_1: reg port map(tmp_A3(0),CLK,RSTn,tmp_A3(1)); 
reg_A3_2: reg port map(tmp_A3(1),CLK,RSTn,tmp_A3(2)); 
------------------------------------------- A4 --> tmp_A4
reg_A4_0: reg port map(A(4),CLK,RSTn,tmp_A4(0));
reg_A4_1: reg port map(tmp_A4(0),CLK,RSTn,tmp_A4(1)); 
reg_A4_2: reg port map(tmp_A4(1),CLK,RSTn,tmp_A4(2)); 
reg_A4_3: reg port map(tmp_A4(2),CLK,RSTn,tmp_A4(3)); 
------------------------------------------- A5 --> tmp_A5
reg_A5_0: reg port map(A(5),CLK,RSTn,tmp_A5(0));
reg_A5_1: reg port map(tmp_A5(0),CLK,RSTn,tmp_A5(1)); 
reg_A5_2: reg port map(tmp_A5(1),CLK,RSTn,tmp_A5(2)); 
reg_A5_3: reg port map(tmp_A5(2),CLK,RSTn,tmp_A5(3));
reg_A5_4: reg port map(tmp_A5(3),CLK,RSTn,tmp_A5(4));
------------------------------------------- A6 --> tmp_A6
reg_A6_0: reg port map(A(6),CLK,RSTn,tmp_A6(0));
reg_A6_1: reg port map(tmp_A6(0),CLK,RSTn,tmp_A6(1)); 
reg_A6_2: reg port map(tmp_A6(1),CLK,RSTn,tmp_A6(2)); 
reg_A6_3: reg port map(tmp_A6(2),CLK,RSTn,tmp_A6(3));
reg_A6_4: reg port map(tmp_A6(3),CLK,RSTn,tmp_A6(4));
reg_A6_5: reg port map(tmp_A6(4),CLK,RSTn,tmp_A6(5));
------------------------------------------- A7 --> tmp_A7
reg_A7_0: reg port map(A(7),CLK,RSTn,tmp_A7(0));
reg_A7_1: reg port map(tmp_A7(0),CLK,RSTn,tmp_A7(1)); 
reg_A7_2: reg port map(tmp_A7(1),CLK,RSTn,tmp_A7(2)); 
reg_A7_3: reg port map(tmp_A7(2),CLK,RSTn,tmp_A7(3));
reg_A7_4: reg port map(tmp_A7(3),CLK,RSTn,tmp_A7(4));
reg_A7_5: reg port map(tmp_A7(4),CLK,RSTn,tmp_A7(5));
reg_A7_6: reg port map(tmp_A7(5),CLK,RSTn,tmp_A7(6));
------------------------------------------- A8 --> tmp_A8
reg_A8_0: reg port map(A(8),CLK,RSTn,tmp_A8(0));
reg_A8_1: reg port map(tmp_A8(0),CLK,RSTn,tmp_A8(1)); 
reg_A8_2: reg port map(tmp_A8(1),CLK,RSTn,tmp_A8(2)); 
reg_A8_3: reg port map(tmp_A8(2),CLK,RSTn,tmp_A8(3));
reg_A8_4: reg port map(tmp_A8(3),CLK,RSTn,tmp_A8(4));
reg_A8_5: reg port map(tmp_A8(4),CLK,RSTn,tmp_A8(5));
reg_A8_6: reg port map(tmp_A8(5),CLK,RSTn,tmp_A8(6));
reg_A8_7: reg port map(tmp_A8(6),CLK,RSTn,tmp_A8(7));
------------------------------------------- A9 --> tmp_A9
reg_A9_0: reg port map(A(9),CLK,RSTn,tmp_A9(0));
reg_A9_1: reg port map(tmp_A9(0),CLK,RSTn,tmp_A9(1)); 
reg_A9_2: reg port map(tmp_A9(1),CLK,RSTn,tmp_A9(2)); 
reg_A9_3: reg port map(tmp_A9(2),CLK,RSTn,tmp_A9(3));
reg_A9_4: reg port map(tmp_A9(3),CLK,RSTn,tmp_A9(4));
reg_A9_5: reg port map(tmp_A9(4),CLK,RSTn,tmp_A9(5));
reg_A9_6: reg port map(tmp_A9(5),CLK,RSTn,tmp_A9(6));
reg_A9_7: reg port map(tmp_A9(6),CLK,RSTn,tmp_A9(7));
reg_A9_8: reg port map(tmp_A9(7),CLK,RSTn,tmp_A9(8));
------------------------------------------- A10 --> tmp_A10
reg_A10_0: reg port map(A(10),CLK,RSTn,tmp_A10(0));
reg_A10_1: reg port map(tmp_A10(0),CLK,RSTn,tmp_A10(1)); 
reg_A10_2: reg port map(tmp_A10(1),CLK,RSTn,tmp_A10(2)); 
reg_A10_3: reg port map(tmp_A10(2),CLK,RSTn,tmp_A10(3));
reg_A10_4: reg port map(tmp_A10(3),CLK,RSTn,tmp_A10(4));
reg_A10_5: reg port map(tmp_A10(4),CLK,RSTn,tmp_A10(5));
reg_A10_6: reg port map(tmp_A10(5),CLK,RSTn,tmp_A10(6));
reg_A10_7: reg port map(tmp_A10(6),CLK,RSTn,tmp_A10(7));
reg_A10_8: reg port map(tmp_A10(7),CLK,RSTn,tmp_A10(8));
reg_A10_9: reg port map(tmp_A10(8),CLK,RSTn,tmp_A10(9));
------------------------------------------- A11 --> tmp_A11
reg_A11_0: reg port map(A(11),CLK,RSTn,tmp_A11(0));
reg_A11_1: reg port map(tmp_A11(0),CLK,RSTn,tmp_A11(1)); 
reg_A11_2: reg port map(tmp_A11(1),CLK,RSTn,tmp_A11(2)); 
reg_A11_3: reg port map(tmp_A11(2),CLK,RSTn,tmp_A11(3));
reg_A11_4: reg port map(tmp_A11(3),CLK,RSTn,tmp_A11(4));
reg_A11_5: reg port map(tmp_A11(4),CLK,RSTn,tmp_A11(5));
reg_A11_6: reg port map(tmp_A11(5),CLK,RSTn,tmp_A11(6));
reg_A11_7: reg port map(tmp_A11(6),CLK,RSTn,tmp_A11(7));
reg_A11_8: reg port map(tmp_A11(7),CLK,RSTn,tmp_A11(8));
reg_A11_9: reg port map(tmp_A11(8),CLK,RSTn,tmp_A11(9));
reg_A11_10: reg port map(tmp_A11(9),CLK,RSTn,tmp_A11(10));
------------------------------------------- A12 --> tmp_A12
reg_A12_0: reg port map(A(12),CLK,RSTn,tmp_A12(0));
reg_A12_1: reg port map(tmp_A12(0),CLK,RSTn,tmp_A12(1)); 
reg_A12_2: reg port map(tmp_A12(1),CLK,RSTn,tmp_A12(2)); 
reg_A12_3: reg port map(tmp_A12(2),CLK,RSTn,tmp_A12(3));
reg_A12_4: reg port map(tmp_A12(3),CLK,RSTn,tmp_A12(4));
reg_A12_5: reg port map(tmp_A12(4),CLK,RSTn,tmp_A12(5));
reg_A12_6: reg port map(tmp_A12(5),CLK,RSTn,tmp_A12(6));
reg_A12_7: reg port map(tmp_A12(6),CLK,RSTn,tmp_A12(7));
reg_A12_8: reg port map(tmp_A12(7),CLK,RSTn,tmp_A12(8));
reg_A12_9: reg port map(tmp_A12(8),CLK,RSTn,tmp_A12(9));
reg_A12_10: reg port map(tmp_A12(9),CLK,RSTn,tmp_A12(10));
reg_A12_11: reg port map(tmp_A12(10),CLK,RSTn,tmp_A12(11));
------------------------------------------- A13 --> tmp_A13
reg_A13_0: reg port map(A(13),CLK,RSTn,tmp_A13(0));
reg_A13_1: reg port map(tmp_A13(0),CLK,RSTn,tmp_A13(1)); 
reg_A13_2: reg port map(tmp_A13(1),CLK,RSTn,tmp_A13(2)); 
reg_A13_3: reg port map(tmp_A13(2),CLK,RSTn,tmp_A13(3));
reg_A13_4: reg port map(tmp_A13(3),CLK,RSTn,tmp_A13(4));
reg_A13_5: reg port map(tmp_A13(4),CLK,RSTn,tmp_A13(5));
reg_A13_6: reg port map(tmp_A13(5),CLK,RSTn,tmp_A13(6));
reg_A13_7: reg port map(tmp_A13(6),CLK,RSTn,tmp_A13(7));
reg_A13_8: reg port map(tmp_A13(7),CLK,RSTn,tmp_A13(8));
reg_A13_9: reg port map(tmp_A13(8),CLK,RSTn,tmp_A13(9));
reg_A13_10: reg port map(tmp_A13(9),CLK,RSTn,tmp_A13(10));
reg_A13_11: reg port map(tmp_A13(10),CLK,RSTn,tmp_A13(11));
reg_A13_12: reg port map(tmp_A13(11),CLK,RSTn,tmp_A13(12));
------------------------------------------- A14 --> tmp_A14
reg_A14_0: reg port map(A(14),CLK,RSTn,tmp_A14(0));
reg_A14_1: reg port map(tmp_A14(0),CLK,RSTn,tmp_A14(1)); 
reg_A14_2: reg port map(tmp_A14(1),CLK,RSTn,tmp_A14(2)); 
reg_A14_3: reg port map(tmp_A14(2),CLK,RSTn,tmp_A14(3));
reg_A14_4: reg port map(tmp_A14(3),CLK,RSTn,tmp_A14(4));
reg_A14_5: reg port map(tmp_A14(4),CLK,RSTn,tmp_A14(5));
reg_A14_6: reg port map(tmp_A14(5),CLK,RSTn,tmp_A14(6));
reg_A14_7: reg port map(tmp_A14(6),CLK,RSTn,tmp_A14(7));
reg_A14_8: reg port map(tmp_A14(7),CLK,RSTn,tmp_A14(8));
reg_A14_9: reg port map(tmp_A14(8),CLK,RSTn,tmp_A14(9));
reg_A14_10: reg port map(tmp_A14(9),CLK,RSTn,tmp_A14(10));
reg_A14_11: reg port map(tmp_A14(10),CLK,RSTn,tmp_A14(11));
reg_A14_12: reg port map(tmp_A14(11),CLK,RSTn,tmp_A14(12));
reg_A14_13: reg port map(tmp_A14(12),CLK,RSTn,tmp_A14(13));
------------------------------------------- A15 --> tmp_A15
reg_A15_0: reg port map(A(15),CLK,RSTn,tmp_A15(0));
reg_A15_1: reg port map(tmp_A15(0),CLK,RSTn,tmp_A15(1)); 
reg_A15_2: reg port map(tmp_A15(1),CLK,RSTn,tmp_A15(2)); 
reg_A15_3: reg port map(tmp_A15(2),CLK,RSTn,tmp_A15(3));
reg_A15_4: reg port map(tmp_A15(3),CLK,RSTn,tmp_A15(4));
reg_A15_5: reg port map(tmp_A15(4),CLK,RSTn,tmp_A15(5));
reg_A15_6: reg port map(tmp_A15(5),CLK,RSTn,tmp_A15(6));
reg_A15_7: reg port map(tmp_A15(6),CLK,RSTn,tmp_A15(7));
reg_A15_8: reg port map(tmp_A15(7),CLK,RSTn,tmp_A15(8));
reg_A15_9: reg port map(tmp_A15(8),CLK,RSTn,tmp_A15(9));
reg_A15_10: reg port map(tmp_A15(9),CLK,RSTn,tmp_A15(10));
reg_A15_11: reg port map(tmp_A15(10),CLK,RSTn,tmp_A15(11));
reg_A15_12: reg port map(tmp_A15(11),CLK,RSTn,tmp_A15(12));
reg_A15_13: reg port map(tmp_A15(12),CLK,RSTn,tmp_A15(13));
reg_A15_14: reg port map(tmp_A15(13),CLK,RSTn,tmp_A15(14));
------------------------------------------- A16 --> tmp_A16
reg_A16_0: reg port map(A(16),CLK,RSTn,tmp_A16(0));
reg_A16_1: reg port map(tmp_A16(0),CLK,RSTn,tmp_A16(1)); 
reg_A16_2: reg port map(tmp_A16(1),CLK,RSTn,tmp_A16(2)); 
reg_A16_3: reg port map(tmp_A16(2),CLK,RSTn,tmp_A16(3));
reg_A16_4: reg port map(tmp_A16(3),CLK,RSTn,tmp_A16(4));
reg_A16_5: reg port map(tmp_A16(4),CLK,RSTn,tmp_A16(5));
reg_A16_6: reg port map(tmp_A16(5),CLK,RSTn,tmp_A16(6));
reg_A16_7: reg port map(tmp_A16(6),CLK,RSTn,tmp_A16(7));
reg_A16_8: reg port map(tmp_A16(7),CLK,RSTn,tmp_A16(8));
reg_A16_9: reg port map(tmp_A16(8),CLK,RSTn,tmp_A16(9));
reg_A16_10: reg port map(tmp_A16(9),CLK,RSTn,tmp_A16(10));
reg_A16_11: reg port map(tmp_A16(10),CLK,RSTn,tmp_A16(11));
reg_A16_12: reg port map(tmp_A16(11),CLK,RSTn,tmp_A16(12));
reg_A16_13: reg port map(tmp_A16(12),CLK,RSTn,tmp_A16(13));
reg_A16_14: reg port map(tmp_A16(13),CLK,RSTn,tmp_A16(14));
reg_A16_15: reg port map(tmp_A16(14),CLK,RSTn,tmp_A16(15));
------------------------------------------- A17 --> tmp_A17
reg_A17_0: reg port map(A(17),CLK,RSTn,tmp_A17(0));
reg_A17_1: reg port map(tmp_A17(0),CLK,RSTn,tmp_A17(1)); 
reg_A17_2: reg port map(tmp_A17(1),CLK,RSTn,tmp_A17(2)); 
reg_A17_3: reg port map(tmp_A17(2),CLK,RSTn,tmp_A17(3));
reg_A17_4: reg port map(tmp_A17(3),CLK,RSTn,tmp_A17(4));
reg_A17_5: reg port map(tmp_A17(4),CLK,RSTn,tmp_A17(5));
reg_A17_6: reg port map(tmp_A17(5),CLK,RSTn,tmp_A17(6));
reg_A17_7: reg port map(tmp_A17(6),CLK,RSTn,tmp_A17(7));
reg_A17_8: reg port map(tmp_A17(7),CLK,RSTn,tmp_A17(8));
reg_A17_9: reg port map(tmp_A17(8),CLK,RSTn,tmp_A17(9));
reg_A17_10: reg port map(tmp_A17(9),CLK,RSTn,tmp_A17(10));
reg_A17_11: reg port map(tmp_A17(10),CLK,RSTn,tmp_A17(11));
reg_A17_12: reg port map(tmp_A17(11),CLK,RSTn,tmp_A17(12));
reg_A17_13: reg port map(tmp_A17(12),CLK,RSTn,tmp_A17(13));
reg_A17_14: reg port map(tmp_A17(13),CLK,RSTn,tmp_A17(14));
reg_A17_15: reg port map(tmp_A17(14),CLK,RSTn,tmp_A17(15));
reg_A17_16: reg port map(tmp_A17(15),CLK,RSTn,tmp_A17(16));
------------------------------------------- A18 --> tmp_A18
reg_A18_0: reg port map(A(18),CLK,RSTn,tmp_A18(0));
reg_A18_1: reg port map(tmp_A18(0),CLK,RSTn,tmp_A18(1)); 
reg_A18_2: reg port map(tmp_A18(1),CLK,RSTn,tmp_A18(2)); 
reg_A18_3: reg port map(tmp_A18(2),CLK,RSTn,tmp_A18(3));
reg_A18_4: reg port map(tmp_A18(3),CLK,RSTn,tmp_A18(4));
reg_A18_5: reg port map(tmp_A18(4),CLK,RSTn,tmp_A18(5));
reg_A18_6: reg port map(tmp_A18(5),CLK,RSTn,tmp_A18(6));
reg_A18_7: reg port map(tmp_A18(6),CLK,RSTn,tmp_A18(7));
reg_A18_8: reg port map(tmp_A18(7),CLK,RSTn,tmp_A18(8));
reg_A18_9: reg port map(tmp_A18(8),CLK,RSTn,tmp_A18(9));
reg_A18_10: reg port map(tmp_A18(9),CLK,RSTn,tmp_A18(10));
reg_A18_11: reg port map(tmp_A18(10),CLK,RSTn,tmp_A18(11));
reg_A18_12: reg port map(tmp_A18(11),CLK,RSTn,tmp_A18(12));
reg_A18_13: reg port map(tmp_A18(12),CLK,RSTn,tmp_A18(13));
reg_A18_14: reg port map(tmp_A18(13),CLK,RSTn,tmp_A18(14));
reg_A18_15: reg port map(tmp_A18(14),CLK,RSTn,tmp_A18(15));
reg_A18_16: reg port map(tmp_A18(15),CLK,RSTn,tmp_A18(16));
reg_A18_17: reg port map(tmp_A18(16),CLK,RSTn,tmp_A18(17));
------------------------------------------- A19 --> tmp_A19
reg_A19_0: reg port map(A(19),CLK,RSTn,tmp_A19(0));
reg_A19_1: reg port map(tmp_A19(0),CLK,RSTn,tmp_A19(1)); 
reg_A19_2: reg port map(tmp_A19(1),CLK,RSTn,tmp_A19(2)); 
reg_A19_3: reg port map(tmp_A19(2),CLK,RSTn,tmp_A19(3));
reg_A19_4: reg port map(tmp_A19(3),CLK,RSTn,tmp_A19(4));
reg_A19_5: reg port map(tmp_A19(4),CLK,RSTn,tmp_A19(5));
reg_A19_6: reg port map(tmp_A19(5),CLK,RSTn,tmp_A19(6));
reg_A19_7: reg port map(tmp_A19(6),CLK,RSTn,tmp_A19(7));
reg_A19_8: reg port map(tmp_A19(7),CLK,RSTn,tmp_A19(8));
reg_A19_9: reg port map(tmp_A19(8),CLK,RSTn,tmp_A19(9));
reg_A19_10: reg port map(tmp_A19(9),CLK,RSTn,tmp_A19(10));
reg_A19_11: reg port map(tmp_A19(10),CLK,RSTn,tmp_A19(11));
reg_A19_12: reg port map(tmp_A19(11),CLK,RSTn,tmp_A19(12));
reg_A19_13: reg port map(tmp_A19(12),CLK,RSTn,tmp_A19(13));
reg_A19_14: reg port map(tmp_A19(13),CLK,RSTn,tmp_A19(14));
reg_A19_15: reg port map(tmp_A19(14),CLK,RSTn,tmp_A19(15));
reg_A19_16: reg port map(tmp_A19(15),CLK,RSTn,tmp_A19(16));
reg_A19_17: reg port map(tmp_A19(16),CLK,RSTn,tmp_A19(17));
reg_A19_18: reg port map(tmp_A19(17),CLK,RSTn,tmp_A19(18));
------------------------------------------- A20 --> tmp_A20
reg_A20_0: reg port map(A(20),CLK,RSTn,tmp_A20(0));
reg_A20_1: reg port map(tmp_A20(0),CLK,RSTn,tmp_A20(1)); 
reg_A20_2: reg port map(tmp_A20(1),CLK,RSTn,tmp_A20(2)); 
reg_A20_3: reg port map(tmp_A20(2),CLK,RSTn,tmp_A20(3));
reg_A20_4: reg port map(tmp_A20(3),CLK,RSTn,tmp_A20(4));
reg_A20_5: reg port map(tmp_A20(4),CLK,RSTn,tmp_A20(5));
reg_A20_6: reg port map(tmp_A20(5),CLK,RSTn,tmp_A20(6));
reg_A20_7: reg port map(tmp_A20(6),CLK,RSTn,tmp_A20(7));
reg_A20_8: reg port map(tmp_A20(7),CLK,RSTn,tmp_A20(8));
reg_A20_9: reg port map(tmp_A20(8),CLK,RSTn,tmp_A20(9));
reg_A20_10: reg port map(tmp_A20(9),CLK,RSTn,tmp_A20(10));
reg_A20_11: reg port map(tmp_A20(10),CLK,RSTn,tmp_A20(11));
reg_A20_12: reg port map(tmp_A20(11),CLK,RSTn,tmp_A20(12));
reg_A20_13: reg port map(tmp_A20(12),CLK,RSTn,tmp_A20(13));
reg_A20_14: reg port map(tmp_A20(13),CLK,RSTn,tmp_A20(14));
reg_A20_15: reg port map(tmp_A20(14),CLK,RSTn,tmp_A20(15));
reg_A20_16: reg port map(tmp_A20(15),CLK,RSTn,tmp_A20(16));
reg_A20_17: reg port map(tmp_A20(16),CLK,RSTn,tmp_A20(17));
reg_A20_18: reg port map(tmp_A20(17),CLK,RSTn,tmp_A20(18));
reg_A20_19: reg port map(tmp_A20(18),CLK,RSTn,tmp_A20(19));
------------------------------------------- A21 --> tmp_A21
reg_A21_0: reg port map(A(21),CLK,RSTn,tmp_A21(0));
reg_A21_1: reg port map(tmp_A21(0),CLK,RSTn,tmp_A21(1)); 
reg_A21_2: reg port map(tmp_A21(1),CLK,RSTn,tmp_A21(2)); 
reg_A21_3: reg port map(tmp_A21(2),CLK,RSTn,tmp_A21(3));
reg_A21_4: reg port map(tmp_A21(3),CLK,RSTn,tmp_A21(4));
reg_A21_5: reg port map(tmp_A21(4),CLK,RSTn,tmp_A21(5));
reg_A21_6: reg port map(tmp_A21(5),CLK,RSTn,tmp_A21(6));
reg_A21_7: reg port map(tmp_A21(6),CLK,RSTn,tmp_A21(7));
reg_A21_8: reg port map(tmp_A21(7),CLK,RSTn,tmp_A21(8));
reg_A21_9: reg port map(tmp_A21(8),CLK,RSTn,tmp_A21(9));
reg_A21_10: reg port map(tmp_A21(9),CLK,RSTn,tmp_A21(10));
reg_A21_11: reg port map(tmp_A21(10),CLK,RSTn,tmp_A21(11));
reg_A21_12: reg port map(tmp_A21(11),CLK,RSTn,tmp_A21(12));
reg_A21_13: reg port map(tmp_A21(12),CLK,RSTn,tmp_A21(13));
reg_A21_14: reg port map(tmp_A21(13),CLK,RSTn,tmp_A21(14));
reg_A21_15: reg port map(tmp_A21(14),CLK,RSTn,tmp_A21(15));
reg_A21_16: reg port map(tmp_A21(15),CLK,RSTn,tmp_A21(16));
reg_A21_17: reg port map(tmp_A21(16),CLK,RSTn,tmp_A21(17));
reg_A21_18: reg port map(tmp_A21(17),CLK,RSTn,tmp_A21(18));
reg_A21_19: reg port map(tmp_A21(18),CLK,RSTn,tmp_A21(19));
reg_A21_20: reg port map(tmp_A21(19),CLK,RSTn,tmp_A21(20));
------------------------------------------- A22 --> tmp_A22
reg_A22_0: reg port map(A(22),CLK,RSTn,tmp_A22(0));
reg_A22_1: reg port map(tmp_A22(0),CLK,RSTn,tmp_A22(1)); 
reg_A22_2: reg port map(tmp_A22(1),CLK,RSTn,tmp_A22(2)); 
reg_A22_3: reg port map(tmp_A22(2),CLK,RSTn,tmp_A22(3));
reg_A22_4: reg port map(tmp_A22(3),CLK,RSTn,tmp_A22(4));
reg_A22_5: reg port map(tmp_A22(4),CLK,RSTn,tmp_A22(5));
reg_A22_6: reg port map(tmp_A22(5),CLK,RSTn,tmp_A22(6));
reg_A22_7: reg port map(tmp_A22(6),CLK,RSTn,tmp_A22(7));
reg_A22_8: reg port map(tmp_A22(7),CLK,RSTn,tmp_A22(8));
reg_A22_9: reg port map(tmp_A22(8),CLK,RSTn,tmp_A22(9));
reg_A22_10: reg port map(tmp_A22(9),CLK,RSTn,tmp_A22(10));
reg_A22_11: reg port map(tmp_A22(10),CLK,RSTn,tmp_A22(11));
reg_A22_12: reg port map(tmp_A22(11),CLK,RSTn,tmp_A22(12));
reg_A22_13: reg port map(tmp_A22(12),CLK,RSTn,tmp_A22(13));
reg_A22_14: reg port map(tmp_A22(13),CLK,RSTn,tmp_A22(14));
reg_A22_15: reg port map(tmp_A22(14),CLK,RSTn,tmp_A22(15));
reg_A22_16: reg port map(tmp_A22(15),CLK,RSTn,tmp_A22(16));
reg_A22_17: reg port map(tmp_A22(16),CLK,RSTn,tmp_A22(17));
reg_A22_18: reg port map(tmp_A22(17),CLK,RSTn,tmp_A22(18));
reg_A22_19: reg port map(tmp_A22(18),CLK,RSTn,tmp_A22(19));
reg_A22_20: reg port map(tmp_A22(19),CLK,RSTn,tmp_A22(20));
reg_A22_21: reg port map(tmp_A22(20),CLK,RSTn,tmp_A22(21));
------------------------------------------- A23 --> tmp_A23
reg_A23_0: reg port map(A(23),CLK,RSTn,tmp_A23(0));
reg_A23_1: reg port map(tmp_A23(0),CLK,RSTn,tmp_A23(1)); 
reg_A23_2: reg port map(tmp_A23(1),CLK,RSTn,tmp_A23(2)); 
reg_A23_3: reg port map(tmp_A23(2),CLK,RSTn,tmp_A23(3));
reg_A23_4: reg port map(tmp_A23(3),CLK,RSTn,tmp_A23(4));
reg_A23_5: reg port map(tmp_A23(4),CLK,RSTn,tmp_A23(5));
reg_A23_6: reg port map(tmp_A23(5),CLK,RSTn,tmp_A23(6));
reg_A23_7: reg port map(tmp_A23(6),CLK,RSTn,tmp_A23(7));
reg_A23_8: reg port map(tmp_A23(7),CLK,RSTn,tmp_A23(8));
reg_A23_9: reg port map(tmp_A23(8),CLK,RSTn,tmp_A23(9));
reg_A23_10: reg port map(tmp_A23(9),CLK,RSTn,tmp_A23(10));
reg_A23_11: reg port map(tmp_A23(10),CLK,RSTn,tmp_A23(11));
reg_A23_12: reg port map(tmp_A23(11),CLK,RSTn,tmp_A23(12));
reg_A23_13: reg port map(tmp_A23(12),CLK,RSTn,tmp_A23(13));
reg_A23_14: reg port map(tmp_A23(13),CLK,RSTn,tmp_A23(14));
reg_A23_15: reg port map(tmp_A23(14),CLK,RSTn,tmp_A23(15));
reg_A23_16: reg port map(tmp_A23(15),CLK,RSTn,tmp_A23(16));
reg_A23_17: reg port map(tmp_A23(16),CLK,RSTn,tmp_A23(17));
reg_A23_18: reg port map(tmp_A23(17),CLK,RSTn,tmp_A23(18));
reg_A23_19: reg port map(tmp_A23(18),CLK,RSTn,tmp_A23(19));
reg_A23_20: reg port map(tmp_A23(19),CLK,RSTn,tmp_A23(20));
reg_A23_21: reg port map(tmp_A23(20),CLK,RSTn,tmp_A23(21));
reg_A23_22: reg port map(tmp_A23(21),CLK,RSTn,tmp_A23(22));
------------------------------------------- A24 --> tmp_A24
reg_A24_0: reg port map(A(24),CLK,RSTn,tmp_A24(0));
reg_A24_1: reg port map(tmp_A24(0),CLK,RSTn,tmp_A24(1)); 
reg_A24_2: reg port map(tmp_A24(1),CLK,RSTn,tmp_A24(2)); 
reg_A24_3: reg port map(tmp_A24(2),CLK,RSTn,tmp_A24(3));
reg_A24_4: reg port map(tmp_A24(3),CLK,RSTn,tmp_A24(4));
reg_A24_5: reg port map(tmp_A24(4),CLK,RSTn,tmp_A24(5));
reg_A24_6: reg port map(tmp_A24(5),CLK,RSTn,tmp_A24(6));
reg_A24_7: reg port map(tmp_A24(6),CLK,RSTn,tmp_A24(7));
reg_A24_8: reg port map(tmp_A24(7),CLK,RSTn,tmp_A24(8));
reg_A24_9: reg port map(tmp_A24(8),CLK,RSTn,tmp_A24(9));
reg_A24_10: reg port map(tmp_A24(9),CLK,RSTn,tmp_A24(10));
reg_A24_11: reg port map(tmp_A24(10),CLK,RSTn,tmp_A24(11));
reg_A24_12: reg port map(tmp_A24(11),CLK,RSTn,tmp_A24(12));
reg_A24_13: reg port map(tmp_A24(12),CLK,RSTn,tmp_A24(13));
reg_A24_14: reg port map(tmp_A24(13),CLK,RSTn,tmp_A24(14));
reg_A24_15: reg port map(tmp_A24(14),CLK,RSTn,tmp_A24(15));
reg_A24_16: reg port map(tmp_A24(15),CLK,RSTn,tmp_A24(16));
reg_A24_17: reg port map(tmp_A24(16),CLK,RSTn,tmp_A24(17));
reg_A24_18: reg port map(tmp_A24(17),CLK,RSTn,tmp_A24(18));
reg_A24_19: reg port map(tmp_A24(18),CLK,RSTn,tmp_A24(19));
reg_A24_20: reg port map(tmp_A24(19),CLK,RSTn,tmp_A24(20));
reg_A24_21: reg port map(tmp_A24(20),CLK,RSTn,tmp_A24(21));
reg_A24_22: reg port map(tmp_A24(21),CLK,RSTn,tmp_A24(22));
reg_A24_23: reg port map(tmp_A24(22),CLK,RSTn,tmp_A24(23));
------------------------------------------- A25 --> tmp_A25
reg_A25_0: reg port map(A(25),CLK,RSTn,tmp_A25(0));
reg_A25_1: reg port map(tmp_A25(0),CLK,RSTn,tmp_A25(1)); 
reg_A25_2: reg port map(tmp_A25(1),CLK,RSTn,tmp_A25(2)); 
reg_A25_3: reg port map(tmp_A25(2),CLK,RSTn,tmp_A25(3));
reg_A25_4: reg port map(tmp_A25(3),CLK,RSTn,tmp_A25(4));
reg_A25_5: reg port map(tmp_A25(4),CLK,RSTn,tmp_A25(5));
reg_A25_6: reg port map(tmp_A25(5),CLK,RSTn,tmp_A25(6));
reg_A25_7: reg port map(tmp_A25(6),CLK,RSTn,tmp_A25(7));
reg_A25_8: reg port map(tmp_A25(7),CLK,RSTn,tmp_A25(8));
reg_A25_9: reg port map(tmp_A25(8),CLK,RSTn,tmp_A25(9));
reg_A25_10: reg port map(tmp_A25(9),CLK,RSTn,tmp_A25(10));
reg_A25_11: reg port map(tmp_A25(10),CLK,RSTn,tmp_A25(11));
reg_A25_12: reg port map(tmp_A25(11),CLK,RSTn,tmp_A25(12));
reg_A25_13: reg port map(tmp_A25(12),CLK,RSTn,tmp_A25(13));
reg_A25_14: reg port map(tmp_A25(13),CLK,RSTn,tmp_A25(14));
reg_A25_15: reg port map(tmp_A25(14),CLK,RSTn,tmp_A25(15));
reg_A25_16: reg port map(tmp_A25(15),CLK,RSTn,tmp_A25(16));
reg_A25_17: reg port map(tmp_A25(16),CLK,RSTn,tmp_A25(17));
reg_A25_18: reg port map(tmp_A25(17),CLK,RSTn,tmp_A25(18));
reg_A25_19: reg port map(tmp_A25(18),CLK,RSTn,tmp_A25(19));
reg_A25_20: reg port map(tmp_A25(19),CLK,RSTn,tmp_A25(20));
reg_A25_21: reg port map(tmp_A25(20),CLK,RSTn,tmp_A25(21));
reg_A25_22: reg port map(tmp_A25(21),CLK,RSTn,tmp_A25(22));
reg_A25_23: reg port map(tmp_A25(22),CLK,RSTn,tmp_A25(23));
reg_A25_24: reg port map(tmp_A25(23),CLK,RSTn,tmp_A25(24));
------------------------------------------- A26 --> tmp_A26
reg_A26_0: reg port map(A(26),CLK,RSTn,tmp_A26(0));
reg_A26_1: reg port map(tmp_A26(0),CLK,RSTn,tmp_A26(1)); 
reg_A26_2: reg port map(tmp_A26(1),CLK,RSTn,tmp_A26(2)); 
reg_A26_3: reg port map(tmp_A26(2),CLK,RSTn,tmp_A26(3));
reg_A26_4: reg port map(tmp_A26(3),CLK,RSTn,tmp_A26(4));
reg_A26_5: reg port map(tmp_A26(4),CLK,RSTn,tmp_A26(5));
reg_A26_6: reg port map(tmp_A26(5),CLK,RSTn,tmp_A26(6));
reg_A26_7: reg port map(tmp_A26(6),CLK,RSTn,tmp_A26(7));
reg_A26_8: reg port map(tmp_A26(7),CLK,RSTn,tmp_A26(8));
reg_A26_9: reg port map(tmp_A26(8),CLK,RSTn,tmp_A26(9));
reg_A26_10: reg port map(tmp_A26(9),CLK,RSTn,tmp_A26(10));
reg_A26_11: reg port map(tmp_A26(10),CLK,RSTn,tmp_A26(11));
reg_A26_12: reg port map(tmp_A26(11),CLK,RSTn,tmp_A26(12));
reg_A26_13: reg port map(tmp_A26(12),CLK,RSTn,tmp_A26(13));
reg_A26_14: reg port map(tmp_A26(13),CLK,RSTn,tmp_A26(14));
reg_A26_15: reg port map(tmp_A26(14),CLK,RSTn,tmp_A26(15));
reg_A26_16: reg port map(tmp_A26(15),CLK,RSTn,tmp_A26(16));
reg_A26_17: reg port map(tmp_A26(16),CLK,RSTn,tmp_A26(17));
reg_A26_18: reg port map(tmp_A26(17),CLK,RSTn,tmp_A26(18));
reg_A26_19: reg port map(tmp_A26(18),CLK,RSTn,tmp_A26(19));
reg_A26_20: reg port map(tmp_A26(19),CLK,RSTn,tmp_A26(20));
reg_A26_21: reg port map(tmp_A26(20),CLK,RSTn,tmp_A26(21));
reg_A26_22: reg port map(tmp_A26(21),CLK,RSTn,tmp_A26(22));
reg_A26_23: reg port map(tmp_A26(22),CLK,RSTn,tmp_A26(23));
reg_A26_24: reg port map(tmp_A26(23),CLK,RSTn,tmp_A26(24));
reg_A26_25: reg port map(tmp_A26(24),CLK,RSTn,tmp_A26(25));
------------------------------------------- A27 --> tmp_A27
reg_A27_0: reg port map(A(27),CLK,RSTn,tmp_A27(0));
reg_A27_1: reg port map(tmp_A27(0),CLK,RSTn,tmp_A27(1)); 
reg_A27_2: reg port map(tmp_A27(1),CLK,RSTn,tmp_A27(2)); 
reg_A27_3: reg port map(tmp_A27(2),CLK,RSTn,tmp_A27(3));
reg_A27_4: reg port map(tmp_A27(3),CLK,RSTn,tmp_A27(4));
reg_A27_5: reg port map(tmp_A27(4),CLK,RSTn,tmp_A27(5));
reg_A27_6: reg port map(tmp_A27(5),CLK,RSTn,tmp_A27(6));
reg_A27_7: reg port map(tmp_A27(6),CLK,RSTn,tmp_A27(7));
reg_A27_8: reg port map(tmp_A27(7),CLK,RSTn,tmp_A27(8));
reg_A27_9: reg port map(tmp_A27(8),CLK,RSTn,tmp_A27(9));
reg_A27_10: reg port map(tmp_A27(9),CLK,RSTn,tmp_A27(10));
reg_A27_11: reg port map(tmp_A27(10),CLK,RSTn,tmp_A27(11));
reg_A27_12: reg port map(tmp_A27(11),CLK,RSTn,tmp_A27(12));
reg_A27_13: reg port map(tmp_A27(12),CLK,RSTn,tmp_A27(13));
reg_A27_14: reg port map(tmp_A27(13),CLK,RSTn,tmp_A27(14));
reg_A27_15: reg port map(tmp_A27(14),CLK,RSTn,tmp_A27(15));
reg_A27_16: reg port map(tmp_A27(15),CLK,RSTn,tmp_A27(16));
reg_A27_17: reg port map(tmp_A27(16),CLK,RSTn,tmp_A27(17));
reg_A27_18: reg port map(tmp_A27(17),CLK,RSTn,tmp_A27(18));
reg_A27_19: reg port map(tmp_A27(18),CLK,RSTn,tmp_A27(19));
reg_A27_20: reg port map(tmp_A27(19),CLK,RSTn,tmp_A27(20));
reg_A27_21: reg port map(tmp_A27(20),CLK,RSTn,tmp_A27(21));
reg_A27_22: reg port map(tmp_A27(21),CLK,RSTn,tmp_A27(22));
reg_A27_23: reg port map(tmp_A27(22),CLK,RSTn,tmp_A27(23));
reg_A27_24: reg port map(tmp_A27(23),CLK,RSTn,tmp_A27(24));
reg_A27_25: reg port map(tmp_A27(24),CLK,RSTn,tmp_A27(25));
reg_A27_26: reg port map(tmp_A27(25),CLK,RSTn,tmp_A27(26));

-----------------------------------------------------------
----------------------------B i ---------------------------
-----------------------------------------------------------

------------------------------------------- B1 --> tmp_B1
reg_B1: reg port map(B(1),CLK,RSTn,tmp_B1);
------------------------------------------- B2 --> tmp_B2
reg_B2_0: reg port map(B(2),CLK,RSTn,tmp_B2(0)); 
reg_B2_1: reg port map(tmp_B2(0),CLK,RSTn,tmp_B2(1)); 
------------------------------------------- B3 --> tmp_B3
reg_B3_0: reg port map(B(3),CLK,RSTn,tmp_B3(0));
reg_B3_1: reg port map(tmp_B3(0),CLK,RSTn,tmp_B3(1)); 
reg_B3_2: reg port map(tmp_B3(1),CLK,RSTn,tmp_B3(2)); 
------------------------------------------- B4 --> tmp_B4
reg_B4_0: reg port map(B(4),CLK,RSTn,tmp_B4(0));
reg_B4_1: reg port map(tmp_B4(0),CLK,RSTn,tmp_B4(1)); 
reg_B4_2: reg port map(tmp_B4(1),CLK,RSTn,tmp_B4(2)); 
reg_B4_3: reg port map(tmp_B4(2),CLK,RSTn,tmp_B4(3)); 
------------------------------------------- B5 --> tmp_B5
reg_B5_0: reg port map(B(5),CLK,RSTn,tmp_B5(0));
reg_B5_1: reg port map(tmp_B5(0),CLK,RSTn,tmp_B5(1)); 
reg_B5_2: reg port map(tmp_B5(1),CLK,RSTn,tmp_B5(2)); 
reg_B5_3: reg port map(tmp_B5(2),CLK,RSTn,tmp_B5(3));
reg_B5_4: reg port map(tmp_B5(3),CLK,RSTn,tmp_B5(4));
------------------------------------------- B6 --> tmp_B6
reg_B6_0: reg port map(B(6),CLK,RSTn,tmp_B6(0));
reg_B6_1: reg port map(tmp_B6(0),CLK,RSTn,tmp_B6(1)); 
reg_B6_2: reg port map(tmp_B6(1),CLK,RSTn,tmp_B6(2)); 
reg_B6_3: reg port map(tmp_B6(2),CLK,RSTn,tmp_B6(3));
reg_B6_4: reg port map(tmp_B6(3),CLK,RSTn,tmp_B6(4));
reg_B6_5: reg port map(tmp_B6(4),CLK,RSTn,tmp_B6(5));
------------------------------------------- B7 --> tmp_B7
reg_B7_0: reg port map(B(7),CLK,RSTn,tmp_B7(0));
reg_B7_1: reg port map(tmp_B7(0),CLK,RSTn,tmp_B7(1)); 
reg_B7_2: reg port map(tmp_B7(1),CLK,RSTn,tmp_B7(2)); 
reg_B7_3: reg port map(tmp_B7(2),CLK,RSTn,tmp_B7(3));
reg_B7_4: reg port map(tmp_B7(3),CLK,RSTn,tmp_B7(4));
reg_B7_5: reg port map(tmp_B7(4),CLK,RSTn,tmp_B7(5));
reg_B7_6: reg port map(tmp_B7(5),CLK,RSTn,tmp_B7(6));
------------------------------------------- B8 --> tmp_B8
reg_B8_0: reg port map(B(8),CLK,RSTn,tmp_B8(0));
reg_B8_1: reg port map(tmp_B8(0),CLK,RSTn,tmp_B8(1)); 
reg_B8_2: reg port map(tmp_B8(1),CLK,RSTn,tmp_B8(2)); 
reg_B8_3: reg port map(tmp_B8(2),CLK,RSTn,tmp_B8(3));
reg_B8_4: reg port map(tmp_B8(3),CLK,RSTn,tmp_B8(4));
reg_B8_5: reg port map(tmp_B8(4),CLK,RSTn,tmp_B8(5));
reg_B8_6: reg port map(tmp_B8(5),CLK,RSTn,tmp_B8(6));
reg_B8_7: reg port map(tmp_B8(6),CLK,RSTn,tmp_B8(7));
------------------------------------------- B9 --> tmp_B9
reg_B9_0: reg port map(B(9),CLK,RSTn,tmp_B9(0));
reg_B9_1: reg port map(tmp_B9(0),CLK,RSTn,tmp_B9(1)); 
reg_B9_2: reg port map(tmp_B9(1),CLK,RSTn,tmp_B9(2)); 
reg_B9_3: reg port map(tmp_B9(2),CLK,RSTn,tmp_B9(3));
reg_B9_4: reg port map(tmp_B9(3),CLK,RSTn,tmp_B9(4));
reg_B9_5: reg port map(tmp_B9(4),CLK,RSTn,tmp_B9(5));
reg_B9_6: reg port map(tmp_B9(5),CLK,RSTn,tmp_B9(6));
reg_B9_7: reg port map(tmp_B9(6),CLK,RSTn,tmp_B9(7));
reg_B9_8: reg port map(tmp_B9(7),CLK,RSTn,tmp_B9(8));
------------------------------------------- B10 --> tmp_B10
reg_B10_0: reg port map(B(10),CLK,RSTn,tmp_B10(0));
reg_B10_1: reg port map(tmp_B10(0),CLK,RSTn,tmp_B10(1)); 
reg_B10_2: reg port map(tmp_B10(1),CLK,RSTn,tmp_B10(2)); 
reg_B10_3: reg port map(tmp_B10(2),CLK,RSTn,tmp_B10(3));
reg_B10_4: reg port map(tmp_B10(3),CLK,RSTn,tmp_B10(4));
reg_B10_5: reg port map(tmp_B10(4),CLK,RSTn,tmp_B10(5));
reg_B10_6: reg port map(tmp_B10(5),CLK,RSTn,tmp_B10(6));
reg_B10_7: reg port map(tmp_B10(6),CLK,RSTn,tmp_B10(7));
reg_B10_8: reg port map(tmp_B10(7),CLK,RSTn,tmp_B10(8));
reg_B10_9: reg port map(tmp_B10(8),CLK,RSTn,tmp_B10(9));
------------------------------------------- B11 --> tmp_B11
reg_B11_0: reg port map(B(11),CLK,RSTn,tmp_B11(0));
reg_B11_1: reg port map(tmp_B11(0),CLK,RSTn,tmp_B11(1)); 
reg_B11_2: reg port map(tmp_B11(1),CLK,RSTn,tmp_B11(2)); 
reg_B11_3: reg port map(tmp_B11(2),CLK,RSTn,tmp_B11(3));
reg_B11_4: reg port map(tmp_B11(3),CLK,RSTn,tmp_B11(4));
reg_B11_5: reg port map(tmp_B11(4),CLK,RSTn,tmp_B11(5));
reg_B11_6: reg port map(tmp_B11(5),CLK,RSTn,tmp_B11(6));
reg_B11_7: reg port map(tmp_B11(6),CLK,RSTn,tmp_B11(7));
reg_B11_8: reg port map(tmp_B11(7),CLK,RSTn,tmp_B11(8));
reg_B11_9: reg port map(tmp_B11(8),CLK,RSTn,tmp_B11(9));
reg_B11_10: reg port map(tmp_B11(9),CLK,RSTn,tmp_B11(10));
------------------------------------------- B12 --> tmp_B12
reg_B12_0: reg port map(B(12),CLK,RSTn,tmp_B12(0));
reg_B12_1: reg port map(tmp_B12(0),CLK,RSTn,tmp_B12(1)); 
reg_B12_2: reg port map(tmp_B12(1),CLK,RSTn,tmp_B12(2)); 
reg_B12_3: reg port map(tmp_B12(2),CLK,RSTn,tmp_B12(3));
reg_B12_4: reg port map(tmp_B12(3),CLK,RSTn,tmp_B12(4));
reg_B12_5: reg port map(tmp_B12(4),CLK,RSTn,tmp_B12(5));
reg_B12_6: reg port map(tmp_B12(5),CLK,RSTn,tmp_B12(6));
reg_B12_7: reg port map(tmp_B12(6),CLK,RSTn,tmp_B12(7));
reg_B12_8: reg port map(tmp_B12(7),CLK,RSTn,tmp_B12(8));
reg_B12_9: reg port map(tmp_B12(8),CLK,RSTn,tmp_B12(9));
reg_B12_10: reg port map(tmp_B12(9),CLK,RSTn,tmp_B12(10));
reg_B12_11: reg port map(tmp_B12(10),CLK,RSTn,tmp_B12(11));
------------------------------------------- B13 --> tmp_B13
reg_B13_0: reg port map(B(13),CLK,RSTn,tmp_B13(0));
reg_B13_1: reg port map(tmp_B13(0),CLK,RSTn,tmp_B13(1)); 
reg_B13_2: reg port map(tmp_B13(1),CLK,RSTn,tmp_B13(2)); 
reg_B13_3: reg port map(tmp_B13(2),CLK,RSTn,tmp_B13(3));
reg_B13_4: reg port map(tmp_B13(3),CLK,RSTn,tmp_B13(4));
reg_B13_5: reg port map(tmp_B13(4),CLK,RSTn,tmp_B13(5));
reg_B13_6: reg port map(tmp_B13(5),CLK,RSTn,tmp_B13(6));
reg_B13_7: reg port map(tmp_B13(6),CLK,RSTn,tmp_B13(7));
reg_B13_8: reg port map(tmp_B13(7),CLK,RSTn,tmp_B13(8));
reg_B13_9: reg port map(tmp_B13(8),CLK,RSTn,tmp_B13(9));
reg_B13_10: reg port map(tmp_B13(9),CLK,RSTn,tmp_B13(10));
reg_B13_11: reg port map(tmp_B13(10),CLK,RSTn,tmp_B13(11));
reg_B13_12: reg port map(tmp_B13(11),CLK,RSTn,tmp_B13(12));
------------------------------------------- B14 --> tmp_B14
reg_B14_0: reg port map(B(14),CLK,RSTn,tmp_B14(0));
reg_B14_1: reg port map(tmp_B14(0),CLK,RSTn,tmp_B14(1)); 
reg_B14_2: reg port map(tmp_B14(1),CLK,RSTn,tmp_B14(2)); 
reg_B14_3: reg port map(tmp_B14(2),CLK,RSTn,tmp_B14(3));
reg_B14_4: reg port map(tmp_B14(3),CLK,RSTn,tmp_B14(4));
reg_B14_5: reg port map(tmp_B14(4),CLK,RSTn,tmp_B14(5));
reg_B14_6: reg port map(tmp_B14(5),CLK,RSTn,tmp_B14(6));
reg_B14_7: reg port map(tmp_B14(6),CLK,RSTn,tmp_B14(7));
reg_B14_8: reg port map(tmp_B14(7),CLK,RSTn,tmp_B14(8));
reg_B14_9: reg port map(tmp_B14(8),CLK,RSTn,tmp_B14(9));
reg_B14_10: reg port map(tmp_B14(9),CLK,RSTn,tmp_B14(10));
reg_B14_11: reg port map(tmp_B14(10),CLK,RSTn,tmp_B14(11));
reg_B14_12: reg port map(tmp_B14(11),CLK,RSTn,tmp_B14(12));
reg_B14_13: reg port map(tmp_B14(12),CLK,RSTn,tmp_B14(13));
------------------------------------------- B15 --> tmp_B15
reg_B15_0: reg port map(B(15),CLK,RSTn,tmp_B15(0));
reg_B15_1: reg port map(tmp_B15(0),CLK,RSTn,tmp_B15(1)); 
reg_B15_2: reg port map(tmp_B15(1),CLK,RSTn,tmp_B15(2)); 
reg_B15_3: reg port map(tmp_B15(2),CLK,RSTn,tmp_B15(3));
reg_B15_4: reg port map(tmp_B15(3),CLK,RSTn,tmp_B15(4));
reg_B15_5: reg port map(tmp_B15(4),CLK,RSTn,tmp_B15(5));
reg_B15_6: reg port map(tmp_B15(5),CLK,RSTn,tmp_B15(6));
reg_B15_7: reg port map(tmp_B15(6),CLK,RSTn,tmp_B15(7));
reg_B15_8: reg port map(tmp_B15(7),CLK,RSTn,tmp_B15(8));
reg_B15_9: reg port map(tmp_B15(8),CLK,RSTn,tmp_B15(9));
reg_B15_10: reg port map(tmp_B15(9),CLK,RSTn,tmp_B15(10));
reg_B15_11: reg port map(tmp_B15(10),CLK,RSTn,tmp_B15(11));
reg_B15_12: reg port map(tmp_B15(11),CLK,RSTn,tmp_B15(12));
reg_B15_13: reg port map(tmp_B15(12),CLK,RSTn,tmp_B15(13));
reg_B15_14: reg port map(tmp_B15(13),CLK,RSTn,tmp_B15(14));
------------------------------------------- B16 --> tmp_B16
reg_B16_0: reg port map(B(16),CLK,RSTn,tmp_B16(0));
reg_B16_1: reg port map(tmp_B16(0),CLK,RSTn,tmp_B16(1)); 
reg_B16_2: reg port map(tmp_B16(1),CLK,RSTn,tmp_B16(2)); 
reg_B16_3: reg port map(tmp_B16(2),CLK,RSTn,tmp_B16(3));
reg_B16_4: reg port map(tmp_B16(3),CLK,RSTn,tmp_B16(4));
reg_B16_5: reg port map(tmp_B16(4),CLK,RSTn,tmp_B16(5));
reg_B16_6: reg port map(tmp_B16(5),CLK,RSTn,tmp_B16(6));
reg_B16_7: reg port map(tmp_B16(6),CLK,RSTn,tmp_B16(7));
reg_B16_8: reg port map(tmp_B16(7),CLK,RSTn,tmp_B16(8));
reg_B16_9: reg port map(tmp_B16(8),CLK,RSTn,tmp_B16(9));
reg_B16_10: reg port map(tmp_B16(9),CLK,RSTn,tmp_B16(10));
reg_B16_11: reg port map(tmp_B16(10),CLK,RSTn,tmp_B16(11));
reg_B16_12: reg port map(tmp_B16(11),CLK,RSTn,tmp_B16(12));
reg_B16_13: reg port map(tmp_B16(12),CLK,RSTn,tmp_B16(13));
reg_B16_14: reg port map(tmp_B16(13),CLK,RSTn,tmp_B16(14));
reg_B16_15: reg port map(tmp_B16(14),CLK,RSTn,tmp_B16(15));
------------------------------------------- B17 --> tmp_B17
reg_B17_0: reg port map(B(17),CLK,RSTn,tmp_B17(0));
reg_B17_1: reg port map(tmp_B17(0),CLK,RSTn,tmp_B17(1)); 
reg_B17_2: reg port map(tmp_B17(1),CLK,RSTn,tmp_B17(2)); 
reg_B17_3: reg port map(tmp_B17(2),CLK,RSTn,tmp_B17(3));
reg_B17_4: reg port map(tmp_B17(3),CLK,RSTn,tmp_B17(4));
reg_B17_5: reg port map(tmp_B17(4),CLK,RSTn,tmp_B17(5));
reg_B17_6: reg port map(tmp_B17(5),CLK,RSTn,tmp_B17(6));
reg_B17_7: reg port map(tmp_B17(6),CLK,RSTn,tmp_B17(7));
reg_B17_8: reg port map(tmp_B17(7),CLK,RSTn,tmp_B17(8));
reg_B17_9: reg port map(tmp_B17(8),CLK,RSTn,tmp_B17(9));
reg_B17_10: reg port map(tmp_B17(9),CLK,RSTn,tmp_B17(10));
reg_B17_11: reg port map(tmp_B17(10),CLK,RSTn,tmp_B17(11));
reg_B17_12: reg port map(tmp_B17(11),CLK,RSTn,tmp_B17(12));
reg_B17_13: reg port map(tmp_B17(12),CLK,RSTn,tmp_B17(13));
reg_B17_14: reg port map(tmp_B17(13),CLK,RSTn,tmp_B17(14));
reg_B17_15: reg port map(tmp_B17(14),CLK,RSTn,tmp_B17(15));
reg_B17_16: reg port map(tmp_B17(15),CLK,RSTn,tmp_B17(16));
------------------------------------------- B18 --> tmp_B18
reg_B18_0: reg port map(B(18),CLK,RSTn,tmp_B18(0));
reg_B18_1: reg port map(tmp_B18(0),CLK,RSTn,tmp_B18(1)); 
reg_B18_2: reg port map(tmp_B18(1),CLK,RSTn,tmp_B18(2)); 
reg_B18_3: reg port map(tmp_B18(2),CLK,RSTn,tmp_B18(3));
reg_B18_4: reg port map(tmp_B18(3),CLK,RSTn,tmp_B18(4));
reg_B18_5: reg port map(tmp_B18(4),CLK,RSTn,tmp_B18(5));
reg_B18_6: reg port map(tmp_B18(5),CLK,RSTn,tmp_B18(6));
reg_B18_7: reg port map(tmp_B18(6),CLK,RSTn,tmp_B18(7));
reg_B18_8: reg port map(tmp_B18(7),CLK,RSTn,tmp_B18(8));
reg_B18_9: reg port map(tmp_B18(8),CLK,RSTn,tmp_B18(9));
reg_B18_10: reg port map(tmp_B18(9),CLK,RSTn,tmp_B18(10));
reg_B18_11: reg port map(tmp_B18(10),CLK,RSTn,tmp_B18(11));
reg_B18_12: reg port map(tmp_B18(11),CLK,RSTn,tmp_B18(12));
reg_B18_13: reg port map(tmp_B18(12),CLK,RSTn,tmp_B18(13));
reg_B18_14: reg port map(tmp_B18(13),CLK,RSTn,tmp_B18(14));
reg_B18_15: reg port map(tmp_B18(14),CLK,RSTn,tmp_B18(15));
reg_B18_16: reg port map(tmp_B18(15),CLK,RSTn,tmp_B18(16));
reg_B18_17: reg port map(tmp_B18(16),CLK,RSTn,tmp_B18(17));
------------------------------------------- B19 --> tmp_B19
reg_B19_0: reg port map(B(19),CLK,RSTn,tmp_B19(0));
reg_B19_1: reg port map(tmp_B19(0),CLK,RSTn,tmp_B19(1)); 
reg_B19_2: reg port map(tmp_B19(1),CLK,RSTn,tmp_B19(2)); 
reg_B19_3: reg port map(tmp_B19(2),CLK,RSTn,tmp_B19(3));
reg_B19_4: reg port map(tmp_B19(3),CLK,RSTn,tmp_B19(4));
reg_B19_5: reg port map(tmp_B19(4),CLK,RSTn,tmp_B19(5));
reg_B19_6: reg port map(tmp_B19(5),CLK,RSTn,tmp_B19(6));
reg_B19_7: reg port map(tmp_B19(6),CLK,RSTn,tmp_B19(7));
reg_B19_8: reg port map(tmp_B19(7),CLK,RSTn,tmp_B19(8));
reg_B19_9: reg port map(tmp_B19(8),CLK,RSTn,tmp_B19(9));
reg_B19_10: reg port map(tmp_B19(9),CLK,RSTn,tmp_B19(10));
reg_B19_11: reg port map(tmp_B19(10),CLK,RSTn,tmp_B19(11));
reg_B19_12: reg port map(tmp_B19(11),CLK,RSTn,tmp_B19(12));
reg_B19_13: reg port map(tmp_B19(12),CLK,RSTn,tmp_B19(13));
reg_B19_14: reg port map(tmp_B19(13),CLK,RSTn,tmp_B19(14));
reg_B19_15: reg port map(tmp_B19(14),CLK,RSTn,tmp_B19(15));
reg_B19_16: reg port map(tmp_B19(15),CLK,RSTn,tmp_B19(16));
reg_B19_17: reg port map(tmp_B19(16),CLK,RSTn,tmp_B19(17));
reg_B19_18: reg port map(tmp_B19(17),CLK,RSTn,tmp_B19(18));
------------------------------------------- B20 --> tmp_B20
reg_B20_0: reg port map(B(20),CLK,RSTn,tmp_B20(0));
reg_B20_1: reg port map(tmp_B20(0),CLK,RSTn,tmp_B20(1)); 
reg_B20_2: reg port map(tmp_B20(1),CLK,RSTn,tmp_B20(2)); 
reg_B20_3: reg port map(tmp_B20(2),CLK,RSTn,tmp_B20(3));
reg_B20_4: reg port map(tmp_B20(3),CLK,RSTn,tmp_B20(4));
reg_B20_5: reg port map(tmp_B20(4),CLK,RSTn,tmp_B20(5));
reg_B20_6: reg port map(tmp_B20(5),CLK,RSTn,tmp_B20(6));
reg_B20_7: reg port map(tmp_B20(6),CLK,RSTn,tmp_B20(7));
reg_B20_8: reg port map(tmp_B20(7),CLK,RSTn,tmp_B20(8));
reg_B20_9: reg port map(tmp_B20(8),CLK,RSTn,tmp_B20(9));
reg_B20_10: reg port map(tmp_B20(9),CLK,RSTn,tmp_B20(10));
reg_B20_11: reg port map(tmp_B20(10),CLK,RSTn,tmp_B20(11));
reg_B20_12: reg port map(tmp_B20(11),CLK,RSTn,tmp_B20(12));
reg_B20_13: reg port map(tmp_B20(12),CLK,RSTn,tmp_B20(13));
reg_B20_14: reg port map(tmp_B20(13),CLK,RSTn,tmp_B20(14));
reg_B20_15: reg port map(tmp_B20(14),CLK,RSTn,tmp_B20(15));
reg_B20_16: reg port map(tmp_B20(15),CLK,RSTn,tmp_B20(16));
reg_B20_17: reg port map(tmp_B20(16),CLK,RSTn,tmp_B20(17));
reg_B20_18: reg port map(tmp_B20(17),CLK,RSTn,tmp_B20(18));
reg_B20_19: reg port map(tmp_B20(18),CLK,RSTn,tmp_B20(19));
------------------------------------------- B21 --> tmp_B21
reg_B21_0: reg port map(B(21),CLK,RSTn,tmp_B21(0));
reg_B21_1: reg port map(tmp_B21(0),CLK,RSTn,tmp_B21(1)); 
reg_B21_2: reg port map(tmp_B21(1),CLK,RSTn,tmp_B21(2)); 
reg_B21_3: reg port map(tmp_B21(2),CLK,RSTn,tmp_B21(3));
reg_B21_4: reg port map(tmp_B21(3),CLK,RSTn,tmp_B21(4));
reg_B21_5: reg port map(tmp_B21(4),CLK,RSTn,tmp_B21(5));
reg_B21_6: reg port map(tmp_B21(5),CLK,RSTn,tmp_B21(6));
reg_B21_7: reg port map(tmp_B21(6),CLK,RSTn,tmp_B21(7));
reg_B21_8: reg port map(tmp_B21(7),CLK,RSTn,tmp_B21(8));
reg_B21_9: reg port map(tmp_B21(8),CLK,RSTn,tmp_B21(9));
reg_B21_10: reg port map(tmp_B21(9),CLK,RSTn,tmp_B21(10));
reg_B21_11: reg port map(tmp_B21(10),CLK,RSTn,tmp_B21(11));
reg_B21_12: reg port map(tmp_B21(11),CLK,RSTn,tmp_B21(12));
reg_B21_13: reg port map(tmp_B21(12),CLK,RSTn,tmp_B21(13));
reg_B21_14: reg port map(tmp_B21(13),CLK,RSTn,tmp_B21(14));
reg_B21_15: reg port map(tmp_B21(14),CLK,RSTn,tmp_B21(15));
reg_B21_16: reg port map(tmp_B21(15),CLK,RSTn,tmp_B21(16));
reg_B21_17: reg port map(tmp_B21(16),CLK,RSTn,tmp_B21(17));
reg_B21_18: reg port map(tmp_B21(17),CLK,RSTn,tmp_B21(18));
reg_B21_19: reg port map(tmp_B21(18),CLK,RSTn,tmp_B21(19));
reg_B21_20: reg port map(tmp_B21(19),CLK,RSTn,tmp_B21(20));
------------------------------------------- B22 --> tmp_B22
reg_B22_0: reg port map(B(22),CLK,RSTn,tmp_B22(0));
reg_B22_1: reg port map(tmp_B22(0),CLK,RSTn,tmp_B22(1)); 
reg_B22_2: reg port map(tmp_B22(1),CLK,RSTn,tmp_B22(2)); 
reg_B22_3: reg port map(tmp_B22(2),CLK,RSTn,tmp_B22(3));
reg_B22_4: reg port map(tmp_B22(3),CLK,RSTn,tmp_B22(4));
reg_B22_5: reg port map(tmp_B22(4),CLK,RSTn,tmp_B22(5));
reg_B22_6: reg port map(tmp_B22(5),CLK,RSTn,tmp_B22(6));
reg_B22_7: reg port map(tmp_B22(6),CLK,RSTn,tmp_B22(7));
reg_B22_8: reg port map(tmp_B22(7),CLK,RSTn,tmp_B22(8));
reg_B22_9: reg port map(tmp_B22(8),CLK,RSTn,tmp_B22(9));
reg_B22_10: reg port map(tmp_B22(9),CLK,RSTn,tmp_B22(10));
reg_B22_11: reg port map(tmp_B22(10),CLK,RSTn,tmp_B22(11));
reg_B22_12: reg port map(tmp_B22(11),CLK,RSTn,tmp_B22(12));
reg_B22_13: reg port map(tmp_B22(12),CLK,RSTn,tmp_B22(13));
reg_B22_14: reg port map(tmp_B22(13),CLK,RSTn,tmp_B22(14));
reg_B22_15: reg port map(tmp_B22(14),CLK,RSTn,tmp_B22(15));
reg_B22_16: reg port map(tmp_B22(15),CLK,RSTn,tmp_B22(16));
reg_B22_17: reg port map(tmp_B22(16),CLK,RSTn,tmp_B22(17));
reg_B22_18: reg port map(tmp_B22(17),CLK,RSTn,tmp_B22(18));
reg_B22_19: reg port map(tmp_B22(18),CLK,RSTn,tmp_B22(19));
reg_B22_20: reg port map(tmp_B22(19),CLK,RSTn,tmp_B22(20));
reg_B22_21: reg port map(tmp_B22(20),CLK,RSTn,tmp_B22(21));
------------------------------------------- B23 --> tmp_B23
reg_B23_0: reg port map(B(23),CLK,RSTn,tmp_B23(0));
reg_B23_1: reg port map(tmp_B23(0),CLK,RSTn,tmp_B23(1)); 
reg_B23_2: reg port map(tmp_B23(1),CLK,RSTn,tmp_B23(2)); 
reg_B23_3: reg port map(tmp_B23(2),CLK,RSTn,tmp_B23(3));
reg_B23_4: reg port map(tmp_B23(3),CLK,RSTn,tmp_B23(4));
reg_B23_5: reg port map(tmp_B23(4),CLK,RSTn,tmp_B23(5));
reg_B23_6: reg port map(tmp_B23(5),CLK,RSTn,tmp_B23(6));
reg_B23_7: reg port map(tmp_B23(6),CLK,RSTn,tmp_B23(7));
reg_B23_8: reg port map(tmp_B23(7),CLK,RSTn,tmp_B23(8));
reg_B23_9: reg port map(tmp_B23(8),CLK,RSTn,tmp_B23(9));
reg_B23_10: reg port map(tmp_B23(9),CLK,RSTn,tmp_B23(10));
reg_B23_11: reg port map(tmp_B23(10),CLK,RSTn,tmp_B23(11));
reg_B23_12: reg port map(tmp_B23(11),CLK,RSTn,tmp_B23(12));
reg_B23_13: reg port map(tmp_B23(12),CLK,RSTn,tmp_B23(13));
reg_B23_14: reg port map(tmp_B23(13),CLK,RSTn,tmp_B23(14));
reg_B23_15: reg port map(tmp_B23(14),CLK,RSTn,tmp_B23(15));
reg_B23_16: reg port map(tmp_B23(15),CLK,RSTn,tmp_B23(16));
reg_B23_17: reg port map(tmp_B23(16),CLK,RSTn,tmp_B23(17));
reg_B23_18: reg port map(tmp_B23(17),CLK,RSTn,tmp_B23(18));
reg_B23_19: reg port map(tmp_B23(18),CLK,RSTn,tmp_B23(19));
reg_B23_20: reg port map(tmp_B23(19),CLK,RSTn,tmp_B23(20));
reg_B23_21: reg port map(tmp_B23(20),CLK,RSTn,tmp_B23(21));
reg_B23_22: reg port map(tmp_B23(21),CLK,RSTn,tmp_B23(22));
------------------------------------------- B24 --> tmp_B24
reg_B24_0: reg port map(B(24),CLK,RSTn,tmp_B24(0));
reg_B24_1: reg port map(tmp_B24(0),CLK,RSTn,tmp_B24(1)); 
reg_B24_2: reg port map(tmp_B24(1),CLK,RSTn,tmp_B24(2)); 
reg_B24_3: reg port map(tmp_B24(2),CLK,RSTn,tmp_B24(3));
reg_B24_4: reg port map(tmp_B24(3),CLK,RSTn,tmp_B24(4));
reg_B24_5: reg port map(tmp_B24(4),CLK,RSTn,tmp_B24(5));
reg_B24_6: reg port map(tmp_B24(5),CLK,RSTn,tmp_B24(6));
reg_B24_7: reg port map(tmp_B24(6),CLK,RSTn,tmp_B24(7));
reg_B24_8: reg port map(tmp_B24(7),CLK,RSTn,tmp_B24(8));
reg_B24_9: reg port map(tmp_B24(8),CLK,RSTn,tmp_B24(9));
reg_B24_10: reg port map(tmp_B24(9),CLK,RSTn,tmp_B24(10));
reg_B24_11: reg port map(tmp_B24(10),CLK,RSTn,tmp_B24(11));
reg_B24_12: reg port map(tmp_B24(11),CLK,RSTn,tmp_B24(12));
reg_B24_13: reg port map(tmp_B24(12),CLK,RSTn,tmp_B24(13));
reg_B24_14: reg port map(tmp_B24(13),CLK,RSTn,tmp_B24(14));
reg_B24_15: reg port map(tmp_B24(14),CLK,RSTn,tmp_B24(15));
reg_B24_16: reg port map(tmp_B24(15),CLK,RSTn,tmp_B24(16));
reg_B24_17: reg port map(tmp_B24(16),CLK,RSTn,tmp_B24(17));
reg_B24_18: reg port map(tmp_B24(17),CLK,RSTn,tmp_B24(18));
reg_B24_19: reg port map(tmp_B24(18),CLK,RSTn,tmp_B24(19));
reg_B24_20: reg port map(tmp_B24(19),CLK,RSTn,tmp_B24(20));
reg_B24_21: reg port map(tmp_B24(20),CLK,RSTn,tmp_B24(21));
reg_B24_22: reg port map(tmp_B24(21),CLK,RSTn,tmp_B24(22));
reg_B24_23: reg port map(tmp_B24(22),CLK,RSTn,tmp_B24(23));
------------------------------------------- B25 --> tmp_B25
reg_B25_0: reg port map(B(25),CLK,RSTn,tmp_B25(0));
reg_B25_1: reg port map(tmp_B25(0),CLK,RSTn,tmp_B25(1)); 
reg_B25_2: reg port map(tmp_B25(1),CLK,RSTn,tmp_B25(2)); 
reg_B25_3: reg port map(tmp_B25(2),CLK,RSTn,tmp_B25(3));
reg_B25_4: reg port map(tmp_B25(3),CLK,RSTn,tmp_B25(4));
reg_B25_5: reg port map(tmp_B25(4),CLK,RSTn,tmp_B25(5));
reg_B25_6: reg port map(tmp_B25(5),CLK,RSTn,tmp_B25(6));
reg_B25_7: reg port map(tmp_B25(6),CLK,RSTn,tmp_B25(7));
reg_B25_8: reg port map(tmp_B25(7),CLK,RSTn,tmp_B25(8));
reg_B25_9: reg port map(tmp_B25(8),CLK,RSTn,tmp_B25(9));
reg_B25_10: reg port map(tmp_B25(9),CLK,RSTn,tmp_B25(10));
reg_B25_11: reg port map(tmp_B25(10),CLK,RSTn,tmp_B25(11));
reg_B25_12: reg port map(tmp_B25(11),CLK,RSTn,tmp_B25(12));
reg_B25_13: reg port map(tmp_B25(12),CLK,RSTn,tmp_B25(13));
reg_B25_14: reg port map(tmp_B25(13),CLK,RSTn,tmp_B25(14));
reg_B25_15: reg port map(tmp_B25(14),CLK,RSTn,tmp_B25(15));
reg_B25_16: reg port map(tmp_B25(15),CLK,RSTn,tmp_B25(16));
reg_B25_17: reg port map(tmp_B25(16),CLK,RSTn,tmp_B25(17));
reg_B25_18: reg port map(tmp_B25(17),CLK,RSTn,tmp_B25(18));
reg_B25_19: reg port map(tmp_B25(18),CLK,RSTn,tmp_B25(19));
reg_B25_20: reg port map(tmp_B25(19),CLK,RSTn,tmp_B25(20));
reg_B25_21: reg port map(tmp_B25(20),CLK,RSTn,tmp_B25(21));
reg_B25_22: reg port map(tmp_B25(21),CLK,RSTn,tmp_B25(22));
reg_B25_23: reg port map(tmp_B25(22),CLK,RSTn,tmp_B25(23));
reg_B25_24: reg port map(tmp_B25(23),CLK,RSTn,tmp_B25(24));
------------------------------------------- B26 --> tmp_B26
reg_B26_0: reg port map(B(26),CLK,RSTn,tmp_B26(0));
reg_B26_1: reg port map(tmp_B26(0),CLK,RSTn,tmp_B26(1)); 
reg_B26_2: reg port map(tmp_B26(1),CLK,RSTn,tmp_B26(2)); 
reg_B26_3: reg port map(tmp_B26(2),CLK,RSTn,tmp_B26(3));
reg_B26_4: reg port map(tmp_B26(3),CLK,RSTn,tmp_B26(4));
reg_B26_5: reg port map(tmp_B26(4),CLK,RSTn,tmp_B26(5));
reg_B26_6: reg port map(tmp_B26(5),CLK,RSTn,tmp_B26(6));
reg_B26_7: reg port map(tmp_B26(6),CLK,RSTn,tmp_B26(7));
reg_B26_8: reg port map(tmp_B26(7),CLK,RSTn,tmp_B26(8));
reg_B26_9: reg port map(tmp_B26(8),CLK,RSTn,tmp_B26(9));
reg_B26_10: reg port map(tmp_B26(9),CLK,RSTn,tmp_B26(10));
reg_B26_11: reg port map(tmp_B26(10),CLK,RSTn,tmp_B26(11));
reg_B26_12: reg port map(tmp_B26(11),CLK,RSTn,tmp_B26(12));
reg_B26_13: reg port map(tmp_B26(12),CLK,RSTn,tmp_B26(13));
reg_B26_14: reg port map(tmp_B26(13),CLK,RSTn,tmp_B26(14));
reg_B26_15: reg port map(tmp_B26(14),CLK,RSTn,tmp_B26(15));
reg_B26_16: reg port map(tmp_B26(15),CLK,RSTn,tmp_B26(16));
reg_B26_17: reg port map(tmp_B26(16),CLK,RSTn,tmp_B26(17));
reg_B26_18: reg port map(tmp_B26(17),CLK,RSTn,tmp_B26(18));
reg_B26_19: reg port map(tmp_B26(18),CLK,RSTn,tmp_B26(19));
reg_B26_20: reg port map(tmp_B26(19),CLK,RSTn,tmp_B26(20));
reg_B26_21: reg port map(tmp_B26(20),CLK,RSTn,tmp_B26(21));
reg_B26_22: reg port map(tmp_B26(21),CLK,RSTn,tmp_B26(22));
reg_B26_23: reg port map(tmp_B26(22),CLK,RSTn,tmp_B26(23));
reg_B26_24: reg port map(tmp_B26(23),CLK,RSTn,tmp_B26(24));
reg_B26_25: reg port map(tmp_B26(24),CLK,RSTn,tmp_B26(25));
------------------------------------------- B27 --> tmp_B27
reg_B27_0: reg port map(B(27),CLK,RSTn,tmp_B27(0));
reg_B27_1: reg port map(tmp_B27(0),CLK,RSTn,tmp_B27(1)); 
reg_B27_2: reg port map(tmp_B27(1),CLK,RSTn,tmp_B27(2)); 
reg_B27_3: reg port map(tmp_B27(2),CLK,RSTn,tmp_B27(3));
reg_B27_4: reg port map(tmp_B27(3),CLK,RSTn,tmp_B27(4));
reg_B27_5: reg port map(tmp_B27(4),CLK,RSTn,tmp_B27(5));
reg_B27_6: reg port map(tmp_B27(5),CLK,RSTn,tmp_B27(6));
reg_B27_7: reg port map(tmp_B27(6),CLK,RSTn,tmp_B27(7));
reg_B27_8: reg port map(tmp_B27(7),CLK,RSTn,tmp_B27(8));
reg_B27_9: reg port map(tmp_B27(8),CLK,RSTn,tmp_B27(9));
reg_B27_10: reg port map(tmp_B27(9),CLK,RSTn,tmp_B27(10));
reg_B27_11: reg port map(tmp_B27(10),CLK,RSTn,tmp_B27(11));
reg_B27_12: reg port map(tmp_B27(11),CLK,RSTn,tmp_B27(12));
reg_B27_13: reg port map(tmp_B27(12),CLK,RSTn,tmp_B27(13));
reg_B27_14: reg port map(tmp_B27(13),CLK,RSTn,tmp_B27(14));
reg_B27_15: reg port map(tmp_B27(14),CLK,RSTn,tmp_B27(15));
reg_B27_16: reg port map(tmp_B27(15),CLK,RSTn,tmp_B27(16));
reg_B27_17: reg port map(tmp_B27(16),CLK,RSTn,tmp_B27(17));
reg_B27_18: reg port map(tmp_B27(17),CLK,RSTn,tmp_B27(18));
reg_B27_19: reg port map(tmp_B27(18),CLK,RSTn,tmp_B27(19));
reg_B27_20: reg port map(tmp_B27(19),CLK,RSTn,tmp_B27(20));
reg_B27_21: reg port map(tmp_B27(20),CLK,RSTn,tmp_B27(21));
reg_B27_22: reg port map(tmp_B27(21),CLK,RSTn,tmp_B27(22));
reg_B27_23: reg port map(tmp_B27(22),CLK,RSTn,tmp_B27(23));
reg_B27_24: reg port map(tmp_B27(23),CLK,RSTn,tmp_B27(24));
reg_B27_25: reg port map(tmp_B27(24),CLK,RSTn,tmp_B27(25));
reg_B27_26: reg port map(tmp_B27(25),CLK,RSTn,tmp_B27(26));
-----------------------------------------------------------
----------------------- 23 Full Adders : ------------------
-----------------------------------------------------------

FA_0:  FA port map(Cinput=>Cinput,     A=>A(0),       B=>B(0),       
                         S=>tmp_S0(0),  Co=>tmp_cout(0));
FA_1:  FA port map(Cinput=>tmp_cin(0), A=>tmp_A1,     B=>tmp_B1,     
                         S=>tmp_S1(0),  Co=>tmp_cout(1));
FA_2:  FA port map(Cinput=>tmp_cin(1), A=>tmp_A2(1),  B=>tmp_B2(1),  
                         S=>tmp_S2(0),  Co=>tmp_cout(2));
FA_3:  FA port map(Cinput=>tmp_cin(2), A=>tmp_A3(2),  B=>tmp_B3(2),  
                         S=>tmp_S3(0),  Co=>tmp_cout(3));
FA_4:  FA port map(Cinput=>tmp_cin(3), A=>tmp_A4(3),  B=>tmp_B4(3),  
                         S=>tmp_S4(0),  Co=>tmp_cout(4));
FA_5:  FA port map(Cinput=>tmp_cin(4), A=>tmp_A5(4),  B=>tmp_B5(4),  
                         S=>tmp_S5(0),  Co=>tmp_cout(5));
FA_6:  FA port map(Cinput=>tmp_cin(5), A=>tmp_A6(5),  B=>tmp_B6(5),  
                         S=>tmp_S6(0),  Co=>tmp_cout(6));
FA_7:  FA port map(Cinput=>tmp_cin(6), A=>tmp_A7(6),  B=>tmp_B7(6),  
                         S=>tmp_S7(0),  Co=>tmp_cout(7));
FA_8:  FA port map(Cinput=>tmp_cin(7), A=>tmp_A8(7),  B=>tmp_B8(7),  
                         S=>tmp_S8(0),  Co=>tmp_cout(8));
FA_9:  FA port map(Cinput=>tmp_cin(8), A=>tmp_A9(8),  B=>tmp_B9(8),  
                         S=>tmp_S9(0),  Co=>tmp_cout(9));
FA_10: FA port map(Cinput=>tmp_cin(9), A=>tmp_A10(9), B=>tmp_B10(9), 
                         S=>tmp_S10(0), Co=>tmp_cout(10));
FA_11: FA port map(Cinput=>tmp_cin(10),A=>tmp_A11(10),B=>tmp_B11(10),
                         S=>tmp_S11(0),Co=>tmp_cout(11));
FA_12: FA port map(Cinput=>tmp_cin(11),A=>tmp_A12(11),B=>tmp_B12(11),
                         S=>tmp_S12(0),Co=>tmp_cout(12));
FA_13: FA port map(Cinput=>tmp_cin(12),A=>tmp_A13(12),B=>tmp_B13(12),
                         S=>tmp_S13(0),Co=>tmp_cout(13));
FA_14: FA port map(Cinput=>tmp_cin(13),A=>tmp_A14(13),B=>tmp_B14(13),
                         S=>tmp_S14(0),Co=>tmp_cout(14));
FA_15: FA port map(Cinput=>tmp_cin(14),A=>tmp_A15(14),B=>tmp_B15(14),
                         S=>tmp_S15(0),Co=>tmp_cout(15));
FA_16: FA port map(Cinput=>tmp_cin(15),A=>tmp_A16(15),B=>tmp_B16(15),
                         S=>tmp_S16(0),Co=>tmp_cout(16));
FA_17: FA port map(Cinput=>tmp_cin(16),A=>tmp_A17(16),B=>tmp_B17(16),
                         S=>tmp_S17(0),Co=>tmp_cout(17));
FA_18: FA port map(Cinput=>tmp_cin(17),A=>tmp_A18(17),B=>tmp_B18(17),
                         S=>tmp_S18(0),Co=>tmp_cout(18));
FA_19: FA port map(Cinput=>tmp_cin(18),A=>tmp_A19(18),B=>tmp_B19(18),
                         S=>tmp_S19(0),Co=>tmp_cout(19));
FA_20: FA port map(Cinput=>tmp_cin(19),A=>tmp_A20(19),B=>tmp_B20(19),
                         S=>tmp_S20(0),Co=>tmp_cout(20));
FA_21: FA port map(Cinput=>tmp_cin(20),A=>tmp_A21(20),B=>tmp_B21(20),
                         S=>tmp_S21(0),Co=>tmp_cout(21));
FA_22: FA port map(Cinput=>tmp_cin(21),A=>tmp_A22(21),B=>tmp_B22(21),
                         S=>tmp_S22(0),Co=>tmp_cout(22));
FA_23: FA port map(Cinput=>tmp_cin(22),A=>tmp_A23(22),B=>tmp_B23(22),
                         S=>tmp_S23(0),Co=>tmp_cout(23));
FA_24: FA port map(Cinput=>tmp_cin(23),A=>tmp_A24(23),B=>tmp_B24(23),
                         S=>tmp_S24(0),Co=>tmp_cout(24));
FA_25: FA port map(Cinput=>tmp_cin(24),A=>tmp_A25(24),B=>tmp_B25(24),
                         S=>tmp_S25(0),Co=>tmp_cout(25));
FA_26: FA port map(Cinput=>tmp_cin(25),A=>tmp_A26(25),B=>tmp_B26(25),
                         S=>tmp_S26(0),Co=>tmp_cout(26));
FA_27: FA port map(Cinput=>tmp_cin(26),A=>tmp_A27(26),B=>tmp_B27(26),
                         S=>tmp_S27,   Co=>tmp_cout(27));
end architecture;
