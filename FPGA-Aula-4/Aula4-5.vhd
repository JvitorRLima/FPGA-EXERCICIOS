library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity exercicio5 is
	port(
		we 		: 	in 	std_logic;
		clk		:	in 	std_logic;
		ram_input 	:	in 	std_logic_vector(7 downto 0);
		ram_address	: 	in 	std_logic_vector(2 downto 0);
		ram_output	:	out	std_logic_vector(7 downto 0)
	);
end exercicio5;

architecture behavioral of exercicio5 is
		
type vector_of_vector is array(7 downto 0) of std_logic_vector(7 downto 0);
			--esta ram carrega valor inicial. posso fazer assim ou usando reset.
signal ram : vector_of_vector := (
	x"AA",
	x"55",
	x"10",
	x"16",
	x"44",
	x"00",
	x"FF",
	x"FC"
);
		
			
		
begin
			
	process(clk,we)
	begin
		if clk'event and clk = '1' then
			if we = '1' then
				ram(to_integer(unsigned(ram_address))) <= ram_input;
			end if;
		end if;
	end process;
			--saída assíncrona. pode ser síncrona.
	ram_output <= ram(to_integer(unsigned(ram_address)));
		
end behavioral;
