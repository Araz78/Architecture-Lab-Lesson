LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY bit_full_adder IS
  PORT(
    A0 : IN STD_LOGIC;
    B0 : IN STD_LOGIC;
    A1 : IN STD_LOGIC;
    B1 : IN STD_LOGIC;
    A2 : IN STD_LOGIC;
    B2 : IN STD_LOGIC;
    A3 : IN STD_LOGIC;
    B3 : IN STD_LOGIC;
    C_in : IN STD_LOGIC;
    S0 : OUT STD_LOGIC;
    S1 : OUT STD_LOGIC;
    S2 : OUT STD_LOGIC;
    S3 : OUT STD_LOGIC;
    C3 : OUT STD_LOGIC
       );
end bit_full_adder;

ARCHITECTURE structural OF bit_full_adder IS
SIGNAL C0 : STD_LOGIC;
SIGNAL C1 : STD_LOGIC;
SIGNAL C2 : STD_LOGIC;
BEGIN
  FA_A : entity work.Full_Adder(dataflow1)
    PORT MAP(
      X => A0,
      Y => B0,
      Cin => C_in,
      S => S0,
      Cout => C0
    );
    
  FA_B : entity work.Full_Adder(dataflow1)
    PORT MAP(
      X => A1,
      Y => B1,
      Cin => C0,
      S => S1,
      Cout => C1
    );
    
  FA_C : entity work.Full_Adder(dataflow1)
    PORT MAP(
      X => A2,
      Y => B2,
      Cin => C1,
      S => S2,
      Cout => C2
    );
    
  FA_D : entity work.Full_Adder(dataflow1)
    PORT MAP(
      X => A3,
      Y => B3,
      Cin => C2,
      S => S3,
      Cout => C3
    );
END structural;