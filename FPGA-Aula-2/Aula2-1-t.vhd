library IEEE;
	use IEEE.std_logic_1164.all;

entity sinal_periodico is
	
	port(
		output_port	: 	out 	std_logic_vector(7 downto 0)
	);
end sinal_periodico;

architecture behavioral of sinal_periodico is
begin 

	process
	begin 
		output_port <= "ZZZZZZZZ";
		wait for 10 ns;
		output_port <= "00000000";
		wait for 10 ns;
		output_port <= "10100100";
		wait for 10 ns;
		output_port <= "ZZZZZZZZ";
		wait for 10 ns;
	end process;


end behavioral;
