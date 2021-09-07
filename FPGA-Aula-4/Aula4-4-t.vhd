library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

--declaramos a entidade
entity exercicio4_tb is
end exercicio4_tb;

--a arquitetura
architecture behavioral of exercicio4_tb is

	------------------------N√£o Mexer------------------------------
	signal clock				: std_logic := '0';
	signal estimulo_vector 			: std_logic_vector(15 downto 0) := x"A4B2";
	signal estimulo        			: std_logic;
	signal signal_rst			: std_logic := '0';
	signal signal_en			: std_logic := '0';
	signal signal_parallel_load		: std_logic := '0';
	signal signal_force_0			: std_logic := '0';
	signal signal_force_1			: std_logic := '0';
	signal signal_direction			: std_logic := '0';
	signal signal_parallel_data		: std_logic_vector(1023 downto 0):= (others=>'1');
	signal signal_parallel_out		: std_logic_vector(1023 downto 0);
	signal signal_shift_register_out 	: std_logic;
	
	----------------------------Mexer------------------------------
	component exercicio4

	port(
		clk			:	in 	std_logic;
		rst			:	in 	std_logic;
		shift_register_in	:	in 	std_logic;
		en			:	in	std_logic;
		parallel_load 		: 	in	std_logic;
		force_0			:	in	std_logic;
		force_1			:	in	std_logic;
		direction		:	in 	std_logic;
		parallel_data		:	in 	std_logic_vector(1023 downto 0);
		parallel_out		:	out 	std_logic_vector(1023 downto 0);
		shift_register_out	: 	out 	std_logic
	);
	end component;

begin

	------------------------N√£o Mexer------------------------------
	--vamos criar um est√≠mulo. duas partes. uma, rodar o vetor e a outra gerar o sinal "estimulo"
	--que deve ser ligado ao shift register
	estimulo_vector <= estimulo_vector(14 downto 0) & estimulo_vector(15) when rising_edge(clock);
	estimulo        <= estimulo_vector(15);

	----------------------------Mexer------------------------------

	--gerar sinal de rel√≥gio chamado 'clock' aqui.

	clock <= not clock after 1 ns;



	--simulaÁ„o de situaÁıes
	
	--process(en, parallel_load, force_0, force_1, direction)
		--begin
			

		--end process;
	
	--colocar o componente do seu ShiftRegister aqui.
	DUT : exercicio4
		port map(
			clk			=> 	clock,
			rst			=> 	signal_rst,
			shift_register_in	=> 	estimulo,
			en			=> 	signal_en,
			parallel_load		=> 	signal_parallel_load,
			force_0			=> 	signal_force_0,
			force_1			=> 	signal_force_1,
			direction		=> 	signal_direction,
			parallel_data		=> 	signal_parallel_data,
			parallel_out		=> 	signal_parallel_out,
			shift_register_out  	=> 	signal_shift_register_out
		);

end behavioral;				
		
		
