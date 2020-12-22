LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY regne IS
  GENERIC (N:INTEGER:=4);
  PORT(
    D      : IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
    Enable : IN  STD_LOGIC;
    Clock  : IN  STD_LOGIC;
    Q      : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
       );
end regne;

ARCHITECTURE behavioral OF regne IS
BEGIN
  PROCESS(Clock)
  BEGIN
    IF rising_edge(Clock)THEN
      IF Enable = '1' THEN
        Q <= D;
      END IF;
    END IF;
  END PROCESS;
END behavioral;