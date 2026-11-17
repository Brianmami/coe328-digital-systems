LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY ALU2 IS
PORT (Clock : IN STD_LOGIC ;
A ,B : IN UNSIGNED(7 DOWNTO 0);
OP: IN UNSIGNED(15 DOWNTO 0);
Neg: OUT STD_LOGIC;
R1: OUT UNSIGNED(3 DOWNTO 0);--first 4bits of 8bits Result
R2: OUT UNSIGNED(3 DOWNTO 0));--later 4bits of 8bits Result
END ALU2;

ARCHITECTURE Behavior OF ALU2 IS
SIGNAL Reg1, Reg2, Result: UNSIGNED(7 DOWNTO 0) := (OTHERS => '0');
SIGNAL Reg4: UNSIGNED(0 TO 7);
SIGNAL Reg5: UNSIGNED(0 TO 3);

BEGIN 
Reg1 <= A; -- 31 / 00110001
Reg2 <= B; -- 26 / 00100110
PROCESS (Clock,OP,A,B)
BEGIN
--IF (rising_edge(Clock)) THEN
CASE OP IS
WHEN "0000000000000001" => --function 1 Swap the lower and upper 4 bits of A
Result(7 DOWNTO 4) <= Reg1(3 DOWNTO 0);
Result(3 DOWNTO 0) <= Reg1(7 DOWNTO 4);
WHEN "0000000000000010"  => --function 2 OR
neg <= '0';
Result <= (Reg1 OR Reg2);
WHEN "0000000000000100" =>--Function 3 Decrement B by 5.
if (Reg2 < 5) then
neg <= '1';
Result <= (5 - Reg2); -- if reg2 (B) is less than 5 a negative number will be displayed so this is to check that option and display a negative sign 
--then regularly subtract to get the correct answer 
else
neg <= '0';
Result <= (Reg2 - 5); --if reg2(B)  is greater than 5, regular subraction will work
end if;
WHEN "0000000000001000" =>--Function 4 Invert All Bits of A
neg <= '0';
Result <= NOT(Reg1);
WHEN "0000000000010000" =>--Function 5 Invert the bit significance order of A
neg <= '0';
Result <= Reg1(0)&Reg1(1)&Reg1(2)&Reg1(3)&Reg1(4)&Reg1(5)&Reg1(6)&Reg1(7); --the first bit in the code(MSB) will be changed to reresent the ast bit (LSB)
-- and the same with all other bits
WHEN "0000000000100000" =>--Function 6 Find the greater value of A or B and Output the Max
neg <= '0';
if (Reg1 < Reg2) then
Result <= Reg2;
else
Result <= Reg1;
end if;
WHEN "0000000001000000" =>--Function 7 Produce the Difference between A and B
if (Reg1 < Reg2) then
neg <= '1';
Result <= (Reg2 - Reg1);
else
neg <= '0';
Result <= (Reg1 - Reg2);
end if;
WHEN "0000000010000000" =>--Function 8 XNOR
neg <= '0';
Result <= (Reg1 XNOR Reg2);
WHEN "0000000100000000" =>--Function 9 Rotate B left by 3 bits (ROL)
neg <= '0';
Result <= Reg2(4)&Reg2(3)&Reg2(2)&Reg2(1)&Reg2(0)&Reg2(7)&Reg2(6)&Reg2(5); --Reg2(0) will be moved over 3 bits to the left, therefore ending in
-- 																									bit (3), Reg(5) will be lsb an reg(4) will be msb 
WHEN OTHERS =>-- Don't care
END CASE;
--END IF;
END PROCESS;

R1 <= Result(3 DOWNTO 0);
R2 <= Result(7 DOWNTO 4);

END Behavior;