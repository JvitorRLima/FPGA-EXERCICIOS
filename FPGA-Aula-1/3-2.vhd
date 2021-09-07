--Exercicio 3 multiplicador 12 bits com sinal
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;
	use IEEE.std_logic_signed.all;
	use IEEE.std_logic_unsigned.all;

entity multiplicador is
	
	port(
		numero1		:	in 	std_logic_vector(11 downto 0);
		numero2		:	in 	std_logic_vector(11 downto 0);
		resultado	: 	out 	std_logic_vector(23 downto 0)
	);
end multiplicador;


architecture behavioral of multiplicador is

signal num_1, num_2	:	signed(11 downto 0);


begin

num_1 <= signed(numero1);
num_2 <= signed(numero2);

resultado <= std_logic_vector(signed' (num_1 * num_2));



end behavioral;
