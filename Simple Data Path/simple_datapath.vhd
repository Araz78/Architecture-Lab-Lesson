LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY simple_datapath IS 
  GENERIC (N:INTEGER:=4);
  PORT(
       Aa    :  IN   STD_LOGIC_VECTOR(N-1 DOWNTO 0);
       Bb    :  IN   STD_LOGIC_VECTOR(N-1 DOWNTO 0);
       Cc    :  IN   STD_LOGIC_VECTOR(N-1 DOWNTO 0);
       Dd    :  IN   STD_LOGIC_VECTOR(N-1 DOWNTO 0);
       sel   :  IN   STD_LOGIC_VECTOR(1 DOWNTO 0);
       Load  :  IN   STD_LOGIC_VECTOR(4 DOWNTO 0);
       clk   :  IN   STD_LOGIC;               
       f     :  OUT  STD_LOGIC_VECTOR(N-1 DOWNTO 0)
      ); 
END simple_datapath;

ARCHITECTURE structural OF simple_datapath IS
SIGNAL x0: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
SIGNAL x1: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
SIGNAL x2: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
SIGNAL x3: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
SIGNAL x4: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
 BEGIN
   
   R_0: entity work.regne(behavioral)
              PORT MAP (
                D      => Aa,
                Enable => Load(0),
                Clock  => clk,
                Q      => x0
              );
              
   R_1: entity work.regne(behavioral)
              PORT MAP (
                D      => Bb,
                Enable => Load(1),
                Clock  => clk,
                Q      => x1
              );

   R_2: entity work.regne(behavioral)
              PORT MAP (
                D      => Cc,
                Enable => Load(2),
                Clock  => clk,
                Q      => x2
              );
              
   R_3: entity work.regne(behavioral)
              PORT MAP (
                D      => Dd,
                Enable => Load(3),
                Clock  => clk,
                Q      => x3
              );

   R_4: entity work.regne(behavioral)
              PORT MAP (
                D      => x4,
                Enable => Load(4),
                Clock  => clk,
                Q      => f
              );              

   Mux: entity work.mux4to1(dataflow)
              PORT MAP (
                w0 => x0,
                w1 => x1,
                w2 => x2,
                w3 => x3,
                s  => sel,
                f  => x4
              );             
 END structural;