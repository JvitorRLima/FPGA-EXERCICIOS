--Exercicio 3 somador/subtrator 4 bits sem sinal
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;
	use IEEE.std_logic_signed.all;

entity somador is
	
	port(
		numero1		:	in 	std_logic_vector(3 downto 0);
		numero2		:	in 	std_logic_vector(3 downto 0);
		operacao	:	in	std_logic;
		resultado	: 	out 	std_logic_vector(3 downto 0)
	);
end somador;


architecture behavioral of somador is

begin



	process(numero1,numero2,operacao)
	begin
		if operacao = '0' then
			resultado <= numero1 + numero2;
		else
			resultado <= numero1 - numero2;
		end if;
	
	end process;

end behavioral;
