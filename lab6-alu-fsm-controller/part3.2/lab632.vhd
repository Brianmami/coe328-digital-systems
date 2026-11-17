library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity ALUmodified2 is
port (Clock: in std_logic;
		A,B: in unsigned(7 downto 0);
		student_id: in unsigned(3 downto 0);
		idcheck: out unsigned(3 downto 0);
		OP: in unsigned(15 downto 0);
		Neg: out std_logic;
		R1: out unsigned(3 downto 0);
		R2: out unsigned(3 downto 0));
end ALUmodified2;
architecture calculation of ALUmodified2 is 
signal Reg1,Reg2,Result: unsigned(7 downto 0):= (others => '0');
signal Reg4: unsigned (0 to 7);
begin
Reg1 <= A;
Reg2 <= B;
process(Clock,OP)
begin
	if(rising_edge(Clock)) then
		case OP is
		 when "0000000000000001" =>
		 if (student_id > Reg2(7 downto 4) or student_id > Reg2(3 downto 0) ) then
		idcheck <= "0001";
		else
		idcheck <= "0000";
		end if;
		 when "0000000000000010" =>
		 if (student_id > Reg2(7 downto 4) or student_id > Reg2(3 downto 0) ) then
		idcheck <= "0001";
		else
		idcheck <= "0000";
		end if;
		 when "0000000000000100" =>
		 if (student_id > Reg2(7 downto 4) or student_id > Reg2(3 downto 0) ) then
		idcheck <= "0001";
		else
		idcheck <= "0000";
		end if;
		 when "0000000000001000" =>
		 if (student_id > Reg2(7 downto 4) or student_id > Reg2(3 downto 0) ) then
		idcheck <= "0001";
		else
		idcheck <= "0000";
		end if;
		 when "0000000000010000" =>
		if (student_id > Reg2(7 downto 4) or student_id > Reg2(3 downto 0) ) then
		idcheck <= "0001";
		else
		idcheck <= "0000";
		end if;
		 when "0000000000100000" =>
		if (student_id > Reg2(7 downto 4) or student_id > Reg2(3 downto 0) ) then
		idcheck <= "0001";
		else
		idcheck <= "0000";
		end if;
		 when "0000000001000000" =>
		 if (student_id > Reg2(7 downto 4) or student_id > Reg2(3 downto 0) ) then
		idcheck <= "0001";
		else
		idcheck <= "0000";
		end if;
		 when "0000000010000000" =>
		 if (student_id > Reg2(7 downto 4) or student_id > Reg2(3 downto 0) ) then
		idcheck <= "0001";
		else
		idcheck <= "0000";
		end if;
		 when "0000000100000000" =>
		if (student_id > Reg2(7 downto 4) or student_id > Reg2(3 downto 0) ) then
		idcheck <= "0001";
		else
		idcheck <= "0000";
		end if;
		 when others => 
		 
		 end case;
	 end if;
 end process;
 end calculation;