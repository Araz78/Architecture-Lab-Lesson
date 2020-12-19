LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux2to1 IS 
  PORT(
    X       :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    Y       :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    S       :  IN  STD_LOGIC;
    F       :  OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END mux2to1;

ARCHITECTURE dataflow_mux2to1 OF mux2to1 IS	
BEGIN
	F <=  X WHEN S = '0' ELSE Y ;
     
END dataflow_mux2to1 ;