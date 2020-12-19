LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fulladder IS 
  PORT( 
       X     :  IN  STD_LOGIC; 
       Y     :  IN  STD_LOGIC; 
       Ci    :  IN  STD_LOGIC; 
       S     :  OUT STD_LOGIC; 
       CA    :  OUT STD_LOGIC  
      );
END fulladder;

ARCHITECTURE dataflow OF fulladder IS 
BEGIN
  S  <=   X XOR Y XOR Ci;
  CA <= ((X AND Y) OR (X AND Ci) OR (Ci AND Y));
END dataflow;
