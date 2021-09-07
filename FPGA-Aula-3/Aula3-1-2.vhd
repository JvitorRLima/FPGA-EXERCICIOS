library IEEE;
	use IEEE.std_logic_1164.all;

entity shift_register_while is
	
	port(
		input_port	:	in 	std_logic;
		rst		:	in 	std_logic;
		clk		:	in 	std_logic;
		output_port	: 	out 	std_logic_vector(7 downto 0)
	);
end shift_register_while;

architecture behavioral of shift_register_while is

signal q	:	std_logic_vector(7 downto 0):= "00000000";
--signal i	:	integer range 0 to 7 := 7; 
signal clock1				: std_logic := '0';

begin 

-----------------------------------------------------------------------------
--CLOCK
-----------------------------------------------------------------------------
clock1 <= not clock1 after 1 ns; --cria o nosso relógio.

	process(clock1, rst, q)
	variable i: 	integer range 7 downto 0 := 7;
	begin
		if rst = '1' then
			q <= "00000000";
		elsif clock1'event and clock1 = '1' then
			i := 7;
			while (i /= 0) loop
				q(i) <= q(i-1);
				i := i - 1;
			end loop;
			q(0) <= input_port;
		end if;
		
		output_port <= q;
	end process;


end behavioral;
