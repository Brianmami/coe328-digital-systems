LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY muxfile IS
PORT ( w0, w1, s : IN STD_LOGIC ;
f : OUT STD_LOGIC ) ;
END muxfile ;
ARCHITECTURE Behavior OF muxfile IS
BEGIN
WITH s SELECT -- using s as a selector
f <= w0 WHEN '0', --if s =0, f is selected as the value of w0
w1 WHEN OTHERS ; -- else, f is selected as w1
END Behavior ;

-- can be done with an if-then-else statement but this statement has to be put inside a process statement
-- (process statemtn is used to describe the behaviour of circuits that have memory (flipflops, etc))