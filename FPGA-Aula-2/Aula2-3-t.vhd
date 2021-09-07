--Exercicio 2 decoder 3X8 when..else
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;


library work;
	use work.all;

entity decoder_3x8_tb is
end decoder_3x8_tb;

architecture behavioral of decoder_3x8_tb is


	--sinal de clock
	signal clock1				: std_logic := '0';
	

	
	--contador de 0 a 7
	signal contador				: integer range 0 to 7 := 0; 

	--declaramos sinais para podermos conectar a entidade no mundo.
	signal signal_input_port	: std_logic_vector(2 downto 0);
	signal signal_output_port	: std_logic_vector(7 downto 0);

	--declaramos a entidade.
	component decoder_3x8

		port(
			input_port	: 	in	std_logic_vector(2 downto 0);
			output_port	:	out	std_logic_vector(7 downto 0)
		);
	end component;
	
begin
-----------------------------------------------------------------------------
--CLOCK
-----------------------------------------------------------------------------
clock1 <= not clock1 after 1 ns; --cria o nosso relógio.
	
	process
	begin
		
		if contador = 7 then
			contador <= 0;
		else
			contador <= contador + 1;
		end if;
		wait until clock1 = '1';
		wait until clock1 = '0'; 
	end process;

	process(contador, clock1)
	begin
		
		signal_input_port <= std_logic_vector(to_unsigned(contador, 3));


	end process;


	DUT : decoder_3x8
		port map(
			input_port	=> signal_input_port,
			output_port	=> signal_output_port
		);

end behavioral;
