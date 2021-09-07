--Exemplo.
--Esse será um OR REDUTOR. Ele pega todas as entradas e faz um OR entre todas.
--Exemplo que usará GENERIC e FOR.
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

--declaramos a entidade
entity exercicio1_tb is
end exercicio1_tb;

--a arquitetura
architecture behavioral of exercicio1_tb is

	------------------------Não Mexer------------------------------
	signal clock	: std_logic := '0';
	signal estimulo_vector : std_logic_vector(15 downto 0) := x"A4B2";
	signal estimulo        : std_logic;
	signal signal_output	: std_logic_vector(3 downto 0);
	signal signal_rst	: std_logic := '0';
	
	----------------------------Mexer------------------------------
	component exercicio1

	port(
		clk		:	in 	std_logic;
		rst		:	in 	std_logic;
		d		:	in 	std_logic;
		output		: 	out 	std_logic_vector(3 downto 0)
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
	DUT : exercicio1
		port map(
			clk	=>	clock,
			rst 	=> 	signal_rst,
			d	=> 	estimulo,
			output  => 	signal_output
		);

end behavioral;				
		
		