LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fulladder IS 
  PORT(
       X    :  IN  STD_LOGIC; -- INPUT 1
       Y    :  IN  STD_LOGIC; -- INPUT 2
       Ci   :  IN  STD_LOGIC; -- INPUT 3
       S    :  OUT STD_LOGIC; -- SUM 
       C    :  OUT STD_LOGIC  -- CARRY
      );
END fulladder;

ARCHITECTURE dataflow OF fulladder IS 
BEGIN
  S <= X XOR Y XOR Ci;
  C <= (X AND Y) OR (X AND Ci) OR (Ci AND Y);
END dataflow;