
--Exercicio 2 decoder 3X8 case
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
		case input_port is
			when "000" => output_port <= "00000001";
			when "001" => output_port <= "00000010";
			when "010" => output_port <= "00000100";
			when "011" => output_port <= "00001000";
			when "100" => output_port <= "00010000";
			when "101" => output_port <= "00100000";
			when "110" => output_port <= "01000000";
			when "111" => output_port <= "10000000";
			when others => output_port <= "00000000";
		end case;	
	
	end process;


end behavioral;
