library ieee;
use ieee.std_logic_1164.all;

entity rec_testbench is
end rec_testbench;

architecture testbench of rec_testbench is

	signal x0,x1,clk,reset, y : std_logic;
	signal input_sequencex0 : std_logic_vector(0 to 15) := "0111110110001101";
    signal input_sequencex1 : std_logic_vector(0 to 15) := "0001110001001100";
	constant clk_period : time := 50 ns;

	component rec is	
		port(	
			x0,x1,clk,reset : in std_logic;
			y   : out std_logic
			);
	end component;

begin

	u1 : rec port map (x0,x1,clk,reset,y);
	
	genclk : process
		begin
			clk <= '0';
			wait for clk_period/2;
			clk <= '1';
			wait for clk_period/2;
	end process;
	
	tb : process
		begin
			reset <= '1';
			x0 <= '0';
            x1 <= '0'; 
			wait for 5*clk_period/2;
			reset <= '0';
			for i in 0 to 15 loop
				x0 <= input_sequencex0(i);
                x1 <= input_sequencex1(i);
				wait for clk_period;
			end loop;
			wait;
	end process;

end testbench;