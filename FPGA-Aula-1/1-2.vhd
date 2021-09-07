
-- Exercicio1 Or 4 portas process.case
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity or_exemplo_process_case is
	
	port(
		input_port:	in 	std_logic_vector(3 downto 0);
		output_port	: 	out std_logic
	);
end or_exemplo_process_case;

architecture behavioral of or_exemplo_process_case is
begin 

	or_logic: process(input_port)
	begin
		case input_port is
			when "0000" => output_port <= '0';
			when others => output_port <= '1';
		end case;
	end process or_logic;

end behavioral;
