--Exercicio 2 decoder 3X8 if
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity decoder_3x8 is
	
	port(
		input_port	:	in 	std_logic_vector(2 downto 0);
		output_port	: 	out 	std_logic_vector(7 downto 0)
	);
end decoder_3x8;

architecture behavioral of decoder_3x8 is
begin 

	process(input_port)
	begin
		if input_port = "000" then
			output_port <= "00000001";
		elsif input_port = "001" then
			output_port <= "00000010";
		elsif input_port = "010" then
			output_port <= "00000100";
		elsif input_port = "011" then
			output_port <= "00001000";
		elsif input_port = "100" then
			output_port <= "00010000";
		elsif input_port = "101" then
			output_port <= "00100000";
		elsif input_port = "110" then
			output_port <= "01000000";
		else
			output_port <= "10000000";
		end if;
	
	end process;


end behavioral;
