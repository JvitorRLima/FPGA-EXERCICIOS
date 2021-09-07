library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity exercicio3 is
	
	port(
		input_port	:	in 	std_logic;
		rst		:	in 	std_logic;
		clk		:	in 	std_logic;
		output_port	: 	out 	std_logic_vector(7 downto 0)
	);
end exercicio3;

architecture behavioral of exercicio3 is

signal q	:	std_logic_vector(7 downto 0):= "00000000";

begin 

	process(clk, rst)
	begin
		if rst = '1' then
			q <= "00000000";
		elsif clk'event and clk = '1' then
			for i in q'high downto q'low + 1 loop
				q(i) <= q(i-1);
			end loop;
			q(0) <= input_port;
		end if;
		
		output_port <= q;
	end process;


end behavioral;