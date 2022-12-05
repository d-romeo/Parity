library ieee;
use ieee.std_logic_1164.all;

entity rec is
	port(	
		x0,x1,clk,reset : in std_logic;
		y   : out std_logic
		);
		
end rec;

architecture arch of rec is
	
	type state is (A, B);
	signal actual_state, next_state : state;
	
	begin
	
	stare_register : process(clk, reset)
	begin
		if(reset ='1') then
			actual_state <= A;
		else if(rising_edge(clk)) then
			actual_state <= next_state;
			end if;
		end if;
	end process;
	
	next_state_proc : process(x0,x1, actual_state)
	begin
		case actual_state is
			when A =>
				if(x0='1' and  x1='0') then
					next_state <= B;
                    y <= '1'; 
				elsif(x0 = '1' and x1 = '1')then
				    next_state <= A;
                    y<= '1'; 
				else
                next_state <= A;
                y<= '0'; 
                end if;

			when B =>
				if(x0 = '0' and x1 = '0') then
					next_state <= B;
                    y <= '1'; 
				elsif(x0 = '0' and x1 = '1')then 
				    next_state <= A;
                    y <= '1';
                else
				next_state <= A;
                y <= '0';  
				end if;
			end case;
	end process;
	 
	
end arch;