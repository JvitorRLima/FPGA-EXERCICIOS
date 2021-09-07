library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity exercicio1 is
port(
		clk		:	in 	std_logic;
		rst		:	in 	std_logic;
		d		:	in 	std_logic;
		output		: 	out 	std_logic_vector(3 downto 0)
	);

end exercicio1;

architecture behavioral of exercicio1 is

signal	q 	: 	std_logic_vector(3 downto 0):="0000";
begin

		process(clk, rst)
			begin
				if rst = '1' then
					q <= "0000";
				elsif clk'event and clk = '1' then
					q(0) <= d;
					q(1) <= q(0);
					q(2) <= q(1);
					q(3) <= q(2);
				end if;
			output <= q;
		end process;

end behavioral;
