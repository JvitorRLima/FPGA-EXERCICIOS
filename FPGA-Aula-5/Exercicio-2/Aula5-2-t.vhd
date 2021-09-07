--Exemplo.
--Esse será um OR REDUTOR. Ele pega todas as entradas e faz um OR entre todas.
--Exemplo que usará GENERIC e FOR.
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

--declaramos a entidade
entity exercicio2_tb is
end exercicio2_tb;

--a arquitetura
architecture behavioral of exercicio2_tb is

	------------------------Não Mexer------------------------------
	signal signal_oe	: std_logic := '0';
	signal signal_rclk	: std_logic := '0';
	signal signal_srclr	: std_logic := '0';
	signal signal_srclk	: std_logic := '0';
	signal signal_q_output	: std_logic_vector(7 downto 0);
	signal signal_qh_output : std_logic;
	signal estimulo_vector 	: std_logic_vector(15 downto 0) := x"A4B2";
	signal estimulo        	: std_logic;
	
	
	----------------------------Mexer------------------------------
	component exercicio2

	port(
		oe		:	in 	std_logic;
		rclk		:	in 	std_logic;
		srclr		:	in 	std_logic;
		srclk		:	in	std_logic;
		ser		:	in	std_logic;
		q_output	: 	out 	std_logic_vector(7 downto 0);
		qh_output	:	out	std_logic
	);
	end component;

begin

	------------------------Não Mexer------------------------------
	--vamos criar um estímulo. duas partes. uma, rodar o vetor e a outra gerar o sinal "estimulo"
	--que deve ser ligado ao shift register
	estimulo_vector <= estimulo_vector(14 downto 0) & estimulo_vector(15) when rising_edge(signal_srclk);
	estimulo        <= estimulo_vector(15);

	----------------------------Mexer------------------------------

	--gerar sinal de relógio chamado 'clock' aqui.

	signal_srclk <= not signal_srclk after 1 ns;
	signal_rclk <= not signal_rclk after 16 ns; -- a cada 16 ms os 8 bits adquiridos que entraram pela serial aparece na saida
	

	-- bit sinal de saida
	process 
	begin
		signal_oe <= '0';
		wait for 50 ns;
		signal_oe <= '1';
		wait for 50 ns;
	end process;

	--colocar o componente do seu ShiftRegister aqui.
	DUT : exercicio2
		port map(
			oe		=>	signal_oe,
			rclk 		=> 	signal_rclk,
			srclr		=> 	signal_srclr,
			srclk		=>	signal_srclk,
			ser		=>	estimulo,
			q_output	=> 	signal_q_output,
			qh_output	=> 	signal_qh_output
		);

end behavioral;		
