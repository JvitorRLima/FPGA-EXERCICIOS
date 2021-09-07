library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity exercicio2 is
port(
		clk			:	in 	std_logic;
		rst			:	in 	std_logic;
		d			:	in 	std_logic;
		en			:	in	std_logic;
		output_a		: 	out 	std_logic_vector(7 downto 0);
		output_b		: 	out 	std_logic_vector(7 downto 0);
		output_c		: 	out 	std_logic_vector(7 downto 0)
	);

end exercicio2;

architecture behavioral of exercicio2 is

signal	q_a 	: 	std_logic_vector(7 downto 0):="00000000";
signal	q_b 	: 	std_logic_vector(7 downto 0):="00000000";
signal	q_c 	: 	std_logic_vector(7 downto 0):="00000000";
begin

		process(clk, rst)
			begin
				if rst = '1' then
					q_a <= x"00"; --x na frende do vetor é HEXA.
					q_b <= (others=>'0'); --jeito de zerar algo sem saber tamanho.
					q_c <= (others=>'0');
				elsif clk'event and clk = '1' then
					if en = '1' then
						--jeito 1
						q_a(0) <= d;
						q_a(7 downto 1) <= q_a(6 downto 0);
						--jeito 2: apimentado. igual o jeito 1, mas com uma
						--constante para o tamanho.
						q_b(0) <= d;
						q_b(q_b'high downto 1) <= q_b(q_a'high-1 downto 0);
						--jeito 3
						q_c <= q_c(q_c'high-1 downto 0) & d;
					end if;
				end if;
				output_a <= q_a;
				output_b <= q_b;
				output_c <= q_c;
		end process;

end behavioral;
