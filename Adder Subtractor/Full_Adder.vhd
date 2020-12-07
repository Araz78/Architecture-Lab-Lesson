LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Full_Adder IS
  PORT(
    X : IN STD_LOGIC;
    Y : IN STD_LOGIC;
    Cin : IN STD_LOGIC;
    S : OUT STD_LOGIC;
    Cout : OUT STD_LOGIC
       );
end Full_Adder;

ARCHITECTURE dataflow1 OF Full_Adder IS

BEGIN
    S <= X XOR Y XOR Cin;
    Cout <= (X AND Y) OR (Cin AND X) OR (Cin AND Y);
END dataflow1;

