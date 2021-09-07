library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity ram_3 is
port(
		clk		:	in 	std_logic;
		wr		:	in 	std_logic;
		addr		:	in 	std_logic;
		data		: 	inout 	std_logic_vector(7 downto 0)
	);

end ram_3;

architecture behavioral of ram_3 is

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

signal ram_address: integer := 0;

begin 
	

	process(clk, wr, addr)
	begin
		if clk'event and clk = '1' then
			if addr = '1' then
				ram_address <= to_integer(unsigned(data));
			elsif wr = '1' and addr = '0' then
				ram(ram_address) <= data;
			elsif wr = '0' and addr = '0' then
				data <= ram(ram_address);
			end if;
		end if;
	end process;
	
	


end behavioral;
