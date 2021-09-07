
-- Exercicio1 Or 4 portas when...else

library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity or_exemplo_when_else is
	
	port(
		input_port:	in 	std_logic_vector(3 downto 0);
		output_port	: 	out std_logic
	);
end or_exemplo_when_else;

architecture behavioral of or_exemplo_when_else is
begin 

	output_port <= '0' when input_port = "0000" else '1';

end behavioral;
