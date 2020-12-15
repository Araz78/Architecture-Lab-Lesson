LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
ENTITY FourBitLogicUnit IS 
  PORT(
    A : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    B : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    Sin : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
    Fout : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END FourBitLogicUnit;

ARCHITECTURE structural OF FourBitLogicUnit IS 
SIGNAL I3,I2,I1,I0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL I3_AND : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL I2_OR : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL I1_NOT : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL I0_STATIC : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN

I3(0) <= A(0) AND B(0);
I3(1) <= A(1) AND B(1);
I3(2) <= A(2) AND B(2);
I3(3) <= A(3) AND B(3);

I2(0) <= A(0) OR B(0);
I2(1) <= A(1) OR B(1);
I2(2) <= A(2) OR B(2);
I2(3) <= A(3) OR B(3);

I1(0) <= (NOT A(0));
I1(1) <= (NOT A(1));
I1(2) <= (NOT A(2));
I1(3) <= (NOT A(3));
 
I0(0) <= ( A(0));
I0(1) <= ( A(1));
I0(2) <= ( A(2));
I0(3) <= ( A(3));
  
I3_AND        <=  I3(3) & I3(2) & I3(1) & I3(0);
I2_OR         <=  I2(3) & I2(2) & I2(1) & I2(0);
I1_NOT        <=  I1(3) & I1(2) & I1(1) & I1(0);
I0_STATIC     <=  I0(3) & I0(2) & I0(1) & I0(0);


FourBitLogicUnit:entity work.Mux4to1(dataflow) 
  PORT MAP
  (
    W_3 => I3_AND,
    W_2 => I2_OR,
    W_1 => I1_NOT,
    W_0 => I0_STATIC,
    S => Sin,
    F => Fout
    );       
END structural;