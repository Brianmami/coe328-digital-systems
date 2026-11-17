LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY johns IS 

PORT (Clrn, E, Clkn: IN STD_LOGIC; --clrn is reset button, E is enable, clkn is clock
	STUDENT_ID : out std_logic_vector(3 downto 0); --represents the student number output 
	Q : OUT STD_LOGIC_VECTOR (0 TO 2)); -- represents the output of the shift registers
END johns;

ARCHITECTURE Behaviour OF johns IS 
	signal Qreg : STD_LOGIC_VECTOR (0 TO 2); --stores the state of the shift register
BEGIN
	PROCESS (Clrn, Clkn)
	BEGIN
		IF Clrn = '0' THEN --if reset signal(clrn) is active (low) the shift register is set 000 
		Qreg <= "000"; 
	ELSIF (Clkn'EVENT AND Clkn = '0') THEN --if theres an event on the clock, and this event is 1 -> 0, then its negATIVE edged or falling
		IF E = '1' THEN -- if theres that above event and Enable is 1, the shift does a right shift operation
			Qreg(0) <= NOT Qreg(2);
			Qreg(1) <= Qreg (0);
			Qreg(2) <= Qreg (1);
		ELSE 
			Qreg <= Qreg; --ensures that if E is not active, qreg is not changed / shifted
		END IF;
	END IF;
	
	-- STUDENT_ID variable represents the last 6 digits of your student ID hence d4 is the fourth digit of your
--student ID in four bits, d5 is the fifth and so on. For example, for Student ID 500435429,
--d4 is 0100, d5 is 0011 and so on
	
		CASE Qreg IS --maps each outcome of the shift register combinations to one of the last 6 ID digits (placeholder 123456789)
			WHEN "000" => STUDENT_ID <= "0100"; --4
			WHEN "100" => STUDENT_ID <= "0101"; --5
			WHEN "110" => STUDENT_ID <= "0110"; --6
			WHEN "111" => STUDENT_ID <= "0111"; --7
			WHEN "011" => STUDENT_ID <= "1000"; --8
			WHEN "001" => STUDENT_ID <= "1001"; --9
			WHEN OTHERS => STUDENT_ID <= "----"; --error
		END CASE;
	END PROCESS;
	Q <= Qreg; --current state of shift register is assigned to output signal Q to be printed 
END Behaviour;