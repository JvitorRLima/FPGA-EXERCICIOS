--Exercicio 2 decoder 3X8 when..else
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

	output_port <= "00000001" when input_port = "000" else "00000000"; -- deve-se usar o else???
	output_port <= "00000010" when input_port = "001" else "00000000";
	output_port <= "00000100" when input_port = "010" else "00000000";
	output_port <= "00001000" when input_port = "011" else "00000000";
	output_port <= "00010000" when input_port = "100" else "00000000";
	output_port <= "00100000" when input_port = "101" else "00000000";
	output_port <= "01000000" when input_port = "110" else "00000000";
	output_port <= "10000000" when input_port = "111" else "00000000";


end behavioral;
