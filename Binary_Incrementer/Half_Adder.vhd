LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Half_Adder IS
  PORT(
    X : IN STD_LOGIC;
    Y : IN STD_LOGIC;
    S : OUT STD_LOGIC;
    C : OUT STD_LOGIC);
end Half_Adder;

ARCHITECTURE dataflow OF Half_Adder IS

BEGIN
  S <= X XOR Y;
  C <= X AND Y;
END dataflow;
