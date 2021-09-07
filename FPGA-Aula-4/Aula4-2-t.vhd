library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

--declaramos a entidade
entity exercicio2_tb is
end exercicio2_tb;

--a arquitetura
architecture behavioral of exercicio2_tb is

	------------------------Não Mexer------------------------------
	signal clock	: std_logic := '0';
	signal estimulo_vector : std_logic_vector(15 downto 0) := x"A4B2";
	signal estimulo        : std_logic;
	signal signal_output_a	: std_logic_vector(7 downto 0);
	signal signal_output_b	: std_logic_vector(7 downto 0);
	signal signal_output_c	: std_logic_vector(7 downto 0);
	signal signal_rst	: std_logic := '0';
	signal signal_en	: std_logic := '1';
	
	----------------------------Mexer------------------------------
	component exercicio2

	port(
		clk			:	in 	std_logic;
		rst			:	in 	std_logic;
		d			:	in 	std_logic;
		en			:	in	std_logic;
		output_a		: 	out 	std_logic_vector(7 downto 0);
		output_b		: 	out 	std_logic_vector(7 downto 0);
		output_c		: 	out 	std_logic_vector(7 downto 0)
	);
	end component;

begin

	------------------------Não Mexer------------------------------
	--vamos criar um estímulo. duas partes. uma, rodar o vetor e a outra gerar o sinal "estimulo"
	--que deve ser ligado ao shift register
	estimulo_vector <= estimulo_vector(14 downto 0) & estimulo_vector(15) when rising_edge(clock);
	estimulo        <= estimulo_vector(15);

	----------------------------Mexer------------------------------

	--gerar sinal de relógio chamado 'clock' aqui.

	clock <= not clock after 1 ns;
	
	--colocar o componente do seu ShiftRegister aqui.
	DUT : exercicio2
		port map(
			clk		=>	clock,
			rst 		=> 	signal_rst,
			d		=> 	estimulo,
			en		=> 	signal_en,
			output_a  	=> 	signal_output_a,
			output_b  	=> 	signal_output_b,
			output_c  	=> 	signal_output_c
		);

end behavioral;
