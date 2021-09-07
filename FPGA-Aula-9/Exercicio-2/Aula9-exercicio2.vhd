library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity exercicio2 is
	port(
		we 		: 	in 	std_logic;
		clk		:	in 	std_logic;
		ram_input 	:	in 	std_logic_vector(7 downto 0);
		ram_address	: 	in 	std_logic_vector(3 downto 0);
		ram_output	:	out	std_logic_vector(7 downto 0)
	);
end exercicio2;

architecture behavioral of exercicio2 is
		
type vector_of_vector is array(15 downto 0) of std_logic_vector(7 downto 0);
			--esta ram carrega valor inicial. posso fazer assim ou usando reset.
signal ram : vector_of_vector := (
	x"AA",
	x"55",
	x"10",
	x"16",
	x"44",
	x"00",
	x"FF",
	x"FC",
	x"00",
	x"00",
	x"00",
	x"00",
	x"00",
	x"00",
	x"00",
	x"00"
);

signal we_deb : std_logic;
		
		
		component debounce

			port (
				  ck      : in  std_logic;
				  deb_in  : in  std_logic;
				  deb_out : out std_logic
			 );
			 
		end component;
			
		
begin


	DUT : debounce
		port map(
				ck  => clk,
				deb_in => we,
				deb_out => we_deb
		);
			
	process(clk,we)
	begin
		if clk'event and clk = '1' then
			if we_deb = '1' then
				ram(to_integer(unsigned(ram_address))) <= ram_input;
			end if;
		end if;
	end process;
			--saída assíncrona. pode ser síncrona.
	ram_output <= ram(to_integer(unsigned(ram_address)));
	
	
	
		
end behavioral;
