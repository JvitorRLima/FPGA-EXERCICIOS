library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity exercicio2 is
port(
		oe		:	in 	std_logic;
		rclk		:	in 	std_logic;
		srclr		:	in 	std_logic;
		srclk		:	in	std_logic;
		ser		:	in	std_logic;
		q_output	: 	out 	std_logic_vector(7 downto 0);
		qh_output	:	out	std_logic
	);

end exercicio2;

architecture behavioral of exercicio2 is

signal	q_sr 	: 	std_logic_vector(7 downto 0):="00000000";
signal 	q_out	:	std_logic_vector(7 downto 0):="00000000";
begin

		process(srclk, srclr)
			begin
				if srclr = '1' then
					q_sr <= "00000000";
				elsif srclk'event and srclk = '1' then
					q_sr(0) <= ser;
					q_sr(7 downto 1) <= q_sr(6 downto 0);
				end if;
		end process;

		process(rclk, oe)
		begin
			if oe = '1' then
				q_out <= "ZZZZZZZZ";
			elsif rclk'event and rclk = '1' then
				q_out <= q_sr;
			end if;
		end process;
		
		q_output <= q_out;
		qh_output <= q_sr(7);
				


end behavioral;
