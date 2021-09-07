library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity ram_1 is
port(
		input_port	:	in 	std_logic_vector(7 downto 0);
		clk		:	in 	std_logic;
		output_port	: 	out 	std_logic_vector(7 downto 0)
	);

end ram_1;

architecture behavioral of ram_1 is

type vector_ram is array (7 downto 0) of std_logic_vector(7 downto 0);
signal ram : vector_ram := (
	x"AA",
	x"55",
	x"10",
	x"16",
	x"44",
	x"00",
	x"FF",
	x"FC"
);

signal ram_output : std_logic_vector(7 downto 0);
signal ram_input  : std_logic_vector(7 downto 0);
signal ram_address_input : integer range 7 downto 0;
signal ram_address_output: integer range 7 downto 0;

begin 
	
	ram_input <= input_port;
	output_port <= ram_output;

	process(clk)
	begin
		if clk'event and clk = '1' then
			ram(ram_address_input) <= ram_input;
			ram_output <= ram(ram_address_output);
		end if;
	end process;
	
	


end behavioral;
