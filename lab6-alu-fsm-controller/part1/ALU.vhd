LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY ALU IS
PORT (Clock : IN STD_LOGIC ;
A ,B : IN UNSIGNED(7 DOWNTO 0);
OP: IN UNSIGNED(15 DOWNTO 0);
Neg: OUT STD_LOGIC;
R1: OUT UNSIGNED(3 DOWNTO 0);--first 4bits of 8bits Result
R2: OUT UNSIGNED(3 DOWNTO 0));--later 4bits of 8bits Result
END ALU;

ARCHITECTURE Behavior OF ALU IS
SIGNAL Reg1, Reg2, Result: UNSIGNED(7 DOWNTO 0) := (OTHERS => '0'); --reG1 AND REG2 ARE BEING USED TO represent the input registers A and B
SIGNAL Reg4: UNSIGNED(0 TO 7); --not needed

BEGIN -- within ALU, theres an acc that stores the inputs a and b 
Reg1 <= A; --31 /  00110001
Reg2 <= B; -- 26 / 00100110

PROCESS (Clock,OP,A,B) --op code is the operation, the state determines which operation will occur
BEGIN
--IF (rising_edge(Clock)) THEN
CASE OP IS
WHEN "0000000000000001" => --funtion 1 addition    (31 + 26 = 57)
neg <= '0';
Result <= Reg2 + Reg1;
WHEN "0000000000000010"  => --function 2 subtraction   (31 - 26 = 5) 
if (Reg1 > Reg2) then 
neg <= '0';
Result <= (Reg1 - Reg2);
else
neg <= '1';
Result <= (Reg2 - Reg1);
end if;
WHEN "0000000000000100" =>--Function 3 NOT  -- 00110001 not = 11001110 / 206 or CE
neg <= '0';
Result <= NOT(Reg1);
WHEN "0000000000001000" =>--Function 4 NAND -- 00110001 nand 00100110 = 11011111 / 223 or dF
neg <= '0';
Result <= (Reg1 NAND Reg2);
WHEN "0000000000010000" =>--Function 5 NOR -- 00110001 nor 00100110 = 11001000 / 200 or C8
neg <= '0';
Result <= (Reg1 NOR Reg2);
WHEN "0000000000100000" =>--Function 6 AND -- 00110001 and 00100110 == 00100000 / 32 or 20
neg <= '0';
Result <= (Reg1 AND Reg2);
WHEN "0000000001000000" =>--Function 7 XOR --00110001 XOR 00100110 = 00010111 / 23 or 17
neg <= '0';
Result <= (Reg1 XOR Reg2);
WHEN "0000000010000000" =>--Function 8 OR -- 00110001 or 00100110 = 00110111 / 55 or 37
neg <= '0';
Result <= (Reg1 OR Reg2);
WHEN "0000000100000000" =>--Function 9 XNOR -- 00110001 xnor 00100110 = 11101000 / 232 or E8
neg <= '0';
Result <= (Reg1 XNOR Reg2);
WHEN OTHERS =>-- Don't care
END CASE;
--END IF;
END PROCESS;

R1 <= Result(3 DOWNTO 0);
R2 <= Result(7 DOWNTO 4);

END Behavior;