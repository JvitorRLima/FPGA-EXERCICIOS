library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity ram_2 is
port(
		clk		:	in 	std_logic;
		wr		:	in 	std_logic;
		data		: 	inout 	std_logic_vector(7 downto 0)
	);

end ram_2;

architecture behavioral of ram_2 is

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

signal ram_address_input : integer range 7 downto 0;
signal ram_address_output: integer range 7 downto 0;

begin 
	

	process(clk, wr)
	begin
		if clk'event and clk = '1' then
			if wr = '1' then
				ram(ram_address_input) <= data;
			else
				data <= ram(ram_address_output);
			end if;
		end if;
	end process;
	
	


end behavioral;
