LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Full_Adder IS
  PORT(
    A : IN STD_LOGIC;
    B : IN STD_LOGIC;
    Cin : IN STD_LOGIC;
    Sum : OUT STD_LOGIC;
    Cout : OUT STD_LOGIC);
end Full_Adder;

ARCHITECTURE dataflow OF Full_Adder IS
SIGNAL XOR_A_B: STD_LOGIC;
SIGNAL AND_Cin_ABX: STD_LOGIC;
SIGNAL AND_A_B: STD_LOGIC;
BEGIN
    XOR_A_B <= A XOR B;
    Sum <= XOR_A_B XOR Cin;
    AND_Cin_ABX <= Cin AND XOR_A_B;
    AND_A_B <= A  AND B;
    Cout <= AND_A_B OR AND_Cin_ABX;
END dataflow;