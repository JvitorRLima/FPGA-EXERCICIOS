
-- Exercicio1 Or 4 portas with..select
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity or_exemplo_with_select is
	
	port(
		input_port:	in 	std_logic_vector(3 downto 0);
		output_port	: 	out std_logic
	);
end or_exemplo_with_select;

architecture behavioral of or_exemplo_with_select is
begin 

	with input_port select
	output_port <= '0' when "0000",
		       '1' when others;


end behavioral;
