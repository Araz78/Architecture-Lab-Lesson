LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ALU_4BIT IS 
  PORT(
       A                  : IN   STD_LOGIC_VECTOR(3 DOWNTO 0);
       B                  : IN   STD_LOGIC_VECTOR(3 DOWNTO 0);
       M                  : IN   STD_LOGIC; 
       L_SEL_MUX_4to1     : IN   STD_LOGIC_VECTOR(1 DOWNTO 0);  
       L_SEL_MUX_2to1     : IN   STD_LOGIC;                    
       F_OUT              : OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
       Sum_ADD_SUB        : OUT  STD_LOGIC_VECTOR(3 downto 0);
       Sum_LOGIC_UNIT     : OUT  STD_LOGIC_VECTOR(3 downto 0);
       fINAL_Cout_ADD_SUB : OUT  STD_LOGIC                
      ); 
END ALU_4BIT;

ARCHITECTURE structural OF ALU_4BIT IS 

 SIGNAL U1 ,U1_SIGNAL : STD_LOGIC_VECTOR(3 DOWNTO 0); 
 SIGNAL c1,c2,c3      : STD_LOGIC;
 SIGNAL x0,x1,x2,x3   : STD_LOGIC;  
 
 SIGNAL U2 ,U2_SIGNAL : STD_LOGIC_VECTOR(3 DOWNTO 0); 
 SIGNAL W3 , W2 , W1 , W0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
 SIGNAL W3_AND , W2_OR , W1_NOT , W0_Unchanged : STD_LOGIC_VECTOR(3 DOWNTO 0);
 SIGNAL F0_FULLADDER_0 ,F1_LOGIC_1 : STD_LOGIC_VECTOR(3 DOWNTO 0); 
 BEGIN

  x0 <= B(0) XOR M;
  x1 <= B(1) XOR M;
  x2 <= B(2) XOR M;
  x3 <= B(3) XOR M; 
  
  FA0:entity work.fulladder(dataflow)
  PORT MAP
  (
    X   => A(0),
    Y   => x0,
    Ci  => M,
    S   => U1(0),
    CA  => c1
  );

  FA1_4bit:entity work.fulladder(dataflow)
  PORT MAP
  (
    X   => A(1),
    Y   => x1,
    Ci  => c1,
    S   => U1(1),
    CA  => c2
  );

  FA2_4bit:entity work.fulladder(dataflow)
  PORT MAP
  (
    X   =>  A(2),
    Y   =>  x2,
    Ci  =>  c2,
    S   =>  U1(2),
    CA  =>  c3
  );

  FA3_4bit:entity work.fulladder(dataflow)
  PORT MAP
  (
    X   =>  A(3),
    Y   =>  x3,
    Ci  =>  c3,
    S   =>  U1(3),
    CA  =>  fINAL_Cout_ADD_SUB
  );
  
 U1_SIGNAL <= U1(3) & U1(2) & U1(1) & U1(3);
 Sum_ADD_SUB <= U1_SIGNAL;                  

  W3(0) <= A(0) AND B(0);
  W3(1) <= A(1) AND B(1);
  W3(2) <= A(2) AND B(2);
  W3(3) <= A(3) AND B(3);

  W2(0) <= A(0) OR B(0);
  W2(1) <= A(1) OR B(1);
  W2(2) <= A(2) OR B(2);
  W2(3) <= A(3) OR B(3);

  W1(0) <= (NOT A(0));
  W1(1) <= (NOT A(1));
  W1(2) <= (NOT A(2));
  W1(3) <= (NOT A(3));
 
  W0(0) <= ( A(0));
  W0(1) <= ( A(1));
  W0(2) <= ( A(2));
  W0(3) <= ( A(3));
  
  W3_AND        <=  W3(3) & W3(2) & W3(1) & W3(0);
  W2_OR         <=  W2(3) & W2(2) & W2(1) & W2(0);
  W1_NOT        <=  W1(3) & W1(2) & W1(1) & W1(0);
  W0_Unchanged  <=  W0(3) & W0(2) & W0(1) & W0(0);
   
  
  LU4_4bit:entity work.mux4to1(dataflow_mux4to1) 
  PORT MAP
  (
    W_3 =>  W3_AND,
    W_2 =>  W2_OR,
    W_1 =>  W1_NOT,
    W_0 =>  W0_Unchanged,
    S   =>  L_SEL_MUX_4to1,
    F   =>  U2     
    );  

  U2_SIGNAL      <=  U2;        
  Sum_LOGIC_UNIT <=  U2_SIGNAL; 
  
  F0_FULLADDER_0 <= U1_SIGNAL;
  F1_LOGIC_1 <= U2_SIGNAL;
  ALU_4bit:entity work.mux2to1(dataflow_mux2to1) 
  PORT MAP
  (
    X => F0_FULLADDER_0,
    Y => F1_LOGIC_1,
    S => L_SEL_MUX_2to1,
    F => F_OUT     
    ); 

END structural;