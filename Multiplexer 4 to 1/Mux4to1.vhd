LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Mux4to1 IS
  PORT(
    w : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s : IN STD_LOGIC_VECTOR(2 DOWNTO 1);
    f : OUT STD_LOGIC);
end Mux4to1;

ARCHITECTURE dataflow OF Mux4to1 IS

BEGIN
  WITH s SELECT
    f <= w(0) WHEN "00",
         w(1) WHEN "01",
         w(2) WHEN "10",
         w(3) WHEN OTHERS;
END dataflow;
