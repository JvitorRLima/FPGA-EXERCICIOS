LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity counterupdown is
    port (
        clk_in		     : in  std_logic;
		botao_count      : in  std_logic;
		botao_load       : in  std_logic;
		seletor_ud_input : in  std_logic;
		load		 : in  std_logic_vector(3 downto 0);	
		leds_saida       : out std_logic_vector(3 downto 0)
    );
end counterupdown;

architecture rtl of counterupdown is

	signal signal_deb_out	: std_logic;
	signal contador 			: integer range 0 to 15 := 0;

	--o bloco de debounce estÃ¡ aqui porque ao apertar o botÃ£o, temos ruido.
	--avaliar o bloco de debounce.
	component debounce
		port (
			ck      : in  std_logic;
			deb_in  : in  std_logic;
			deb_out : out std_logic
		);
	end component;

	
begin

	deb_u : debounce
		port map(
			ck      => clk_in,
			deb_in  => botao_count,--bloco de debounce, entrada
			deb_out => signal_deb_out--bloco de debounce, saÃ­da
		);
	

	process(botao_load, seletor_ud_input, signal_deb_out, clk_in)
	begin
		if botao_load = '1' then
			contador <= to_integer(unsigned(load));
		elsif seletor_ud_input = '0' and signal_deb_out = '1' and rising_edge(clk_in) then
			if contador = 15 then 
				contador <= 0;
			else
				contador <= contador + 1;
			end if;
		elsif seletor_ud_input = '1' and signal_deb_out = '0' and rising_edge(clk_in) then
			if contador = 0 then
				contador <= 15;
			else
				contador <= contador - 1;
			end if;
		end if;

		 leds_saida <= std_logic_vector(to_unsigned(contador,4));

	end process;
	

end rtl;