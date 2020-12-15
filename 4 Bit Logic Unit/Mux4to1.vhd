LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Mux4to1 IS 
  PORT(
       W_0 :  IN   STD_LOGIC_VECTOR(3 DOWNTO 0);
       W_1 :  IN   STD_LOGIC_VECTOR(3 DOWNTO 0);
       W_2 :  IN   STD_LOGIC_VECTOR(3 DOWNTO 0);
       W_3 :  IN   STD_LOGIC_VECTOR(3 DOWNTO 0);
       S :  IN   STD_LOGIC_VECTOR(1 DOWNTO 0);               
       F :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)); 
END Mux4to1;
ARCHITECTURE dataflow OF Mux4to1 IS 
 BEGIN
  WITH S  SELECT
    F <= W_0 WHEN "00",
         W_1 WHEN "01",
         W_2 WHEN "10",
         W_3 WHEN OTHERS;
 END dataflow;

