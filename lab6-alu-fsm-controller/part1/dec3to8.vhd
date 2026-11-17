LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY dec3to8 IS
PORT ( w : IN STD_LOGIC_VECTOR(1 DOWNTO 0) ;
En : IN STD_LOGIC ;
y : OUT STD_LOGIC_VECTOR(0 TO 3) ) ;
END dec3to8 ;
ARCHITECTURE Behavior OF dec3to8 IS
SIGNAL Enw : STD_LOGIC_VECTOR(2 DOWNTO 0) ;
BEGIN
Enw <= En & w ; --concatnates En and w to combine them into the Enw signal (Enw(2) = En, Enw(1)= w1, etc)
WITH Enw SELECT -- using En anded with w ( w = w2, w1, w0) as the selector
y <= "1000" WHEN "100", --y is = 00001000 when Enw=100
"0100" WHEN "101", --y = 00000100 when Enw = 101 
"0010" WHEN "110", -- y = 00000010 when Enw = 110
"0001" WHEN "111", -- y = 00000001 when Enw = 111
"0000" WHEN OTHERS ; -- when En is 0 and w[1..0] is any other number, it will give out 00000000
END Behavior ; 