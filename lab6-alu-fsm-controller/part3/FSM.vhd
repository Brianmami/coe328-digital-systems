library ieee;
use ieee.std_logic_1164.all;

Entity FSM is 
	port (
		clk, reset	:	in	std_logic;
		data_in			:	in std_logic;
		student_id		:	out std_logic_vector(3 downto 0); --highest index to lowest (student_id(3) is msb (0) is lowest)
		current_state	:	out std_logic_vector(3 downto 0));
		
end FSM;

architecture Behaviour of FSM is 
	type	state_type	is	(s0, s1, s2, s3, s4, s5, s6, s7, s8); --setting all the different states
	signal	yfsm	:	state_type; --represents the current state of the machine 
begin
	process(clk, reset)
	begin
		if reset = '0' then --hit button (always at 1) to set to 0, which resets state
		yfsm <= s0; --the current state of machine gets reset to s0
	elsif (clk'EVENT And clk = '1') then --if theres an event on the clock, and this event is 0 -> 1, then its positive edged
		case yfsm is
			when s0 => --when current state (ysfm) is whatever state run this code 
							case data_in is 
								when '0' => yfsm <= s0; --if data_in is 0 then it stays at the current state 
								when '1' => yfsm <= s1; 	-- if data_in is 1, then it moves forward accorfing to state diagram
								
							end case; -- can be a "when others <= 'current state #' as a fail safe
			when s1 => 
							case data_in is 
								when '0' => yfsm <= s1;
								when '1' => yfsm <= s2;
								
							end case;
			when s2 => 
							case data_in is 
								when '0' => yfsm <= s2;
								when '1' => yfsm <= s3;
								
							end case;	
			when s3 => 
							case data_in is 
								when '0' => yfsm <= s3;
								when '1' => yfsm <= s4;
								
							end case;			
			when s4 => 
							case data_in is 
								when '0' => yfsm <= s4;
								when '1' => yfsm <= s5;
								
							end case;			
         when s5 => 
							case data_in is 
								when '0' => yfsm <= s5;
								when '1' => yfsm <= s6;
								
							end case;
			when s6 => 
							case data_in is 
								when '0' => yfsm <= s6;
								when '1' => yfsm <= s7;
								
							end case;
			when s7 => 
							case data_in is 
								when '0' => yfsm <= s7;
								when '1' => yfsm <= s8;
								
							end case;
			when s8 => 
							case data_in is 
								when '0' => yfsm <= s8;
								when '1' => yfsm <= s0;
								
							end case;
				end case;
			end if;
		end process;
		
		process (yfsm, data_in) --output 
		begin 
			case yfsm is --when current state (ysfm) is at that state, set its ID digit (placeholder 1-9) and current state to that value 
				when s0 =>
					student_id <= X"1"; --X"#" changes that number from hexadecimal to binary
					current_state <= X"0";
				when s1 =>
					student_id <= X"2";
					current_state <= X"1";
				when s2 =>
					student_id <= X"3";
					current_state <= X"2";
				when s3 =>
					student_id <= X"4";
					current_state <= X"3";
				when s4 =>
					student_id <= X"5";
					current_state <= X"4";
				when s5 =>
					student_id <= X"6";
					current_state <= X"5";
				when s6 =>
					student_id <= X"7";
					current_state <= X"6";
				when s7 =>
					student_id <= X"8";
					current_state <= X"7";
				when s8 =>
					student_id <= X"9";
					current_state <= X"8";
			end case;
		end process;
		
end Behaviour;