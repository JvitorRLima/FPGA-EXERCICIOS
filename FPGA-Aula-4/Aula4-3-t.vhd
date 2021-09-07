library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

--declaramos a entidade
entity exercicio3_tb is
end exercicio3_tb;

--a arquitetura
architecture behavioral of exercicio3_tb is

	------------------------Não Mexer------------------------------
	signal clock	: std_logic := '0';
	signal estimulo_vector : std_logic_vector(15 downto 0) := x"A4B2";
	signal estimulo        : std_logic;
	signal signal_output	: std_logic_vector(7 downto 0);
	signal signal_rst	: std_logic := '0';
	
	----------------------------Mexer------------------------------
	component exercicio3

	port(
		input_port	:	in 	std_logic;
		rst		:	in 	std_logic;
		clk		:	in 	std_logic;
		output_port	: 	out 	std_logic_vector(7 downto 0)
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
	DUT : exercicio3
		port map(
			input_port	=>	estimulo,
			rst 		=> 	signal_rst,
			clk		=> 	clock,
			output_port  => 	signal_output
		);

end behavioral;				
		
		
