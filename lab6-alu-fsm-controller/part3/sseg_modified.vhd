LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY sseg_modified IS
PORT ( bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
sign : IN STD_LOGIC;
ledsn: OUT STD_LOGIC_VECTOR(1 TO 7);
leds : OUT STD_LOGIC_VECTOR(1 TO 7) ) ;

END sseg_modified ;

ARCHITECTURE Behavior OF sseg_modified IS
BEGIN
PROCESS ( bcd )
BEGIN
CASE bcd IS -- abcdefg
WHEN "0000" => leds <= not"0010101";
WHEN "0001" => leds <= not"0111011";
WHEN OTHERS => leds <= not"0110110";
END CASE ;

IF(sign='1') THEN
ledsn <= not"0000001";
ELSE
 ledsn <= not"0000000";
 END IF;
 
END PROCESS ;
END Behavior ;