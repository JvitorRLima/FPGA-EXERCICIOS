--Exemplo.
--Esse será um OR REDUTOR. Ele pega todas as entradas e faz um OR entre todas.
--Exemplo que usará GENERIC e FOR.
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

--declaramos a entidade
entity exercicio5_tb is
end exercicio5_tb;

--a arquitetura
architecture behavioral of exercicio5_tb is

	signal signal_we		: std_logic;
	signal clock			: std_logic:= '0';
	signal signal_ram_input		: std_logic_vector(7 downto 0);
	signal signal_ram_address	: std_logic_vector(2 downto 0);
	signal signal_ram_output	: std_logic_vector(7 downto 0);
	signal address			: integer range 0 to 7 := 0;




	----------------------------Mexer------------------------------
	component exercicio5

	port(
		we 		: 	in 	std_logic;
		clk		:	in 	std_logic;
		ram_input 	:	in 	std_logic_vector(7 downto 0);
		ram_address	: 	in 	std_logic_vector(2 downto 0);
		ram_output	:	out	std_logic_vector(7 downto 0)
	);
	end component;

begin

	----------------------------Mexer------------------------------

	--gerar sinal de relógio

	clock <= not clock after 1 ns;

	
	
	--Criar um processo para andar com endereço e dado. Exemplo abaixo
	--trocar we pelo sinal de gravação escolhido.
	process
	begin
		if address < 7 then
			address <= address + 1;
		else 
			address <= 0;
		end if;

		signal_ram_address <= (others=>'0');
		signal_ram_input  <= (others=>'0');
		signal_we <= '0';
		--exemplo escrita
		signal_ram_address <=  std_logic_vector(to_unsigned(address,3));
		signal_ram_input  <= "11110000";
			signal_we       <= '1';
			wait for 3 ns;
			signal_we       <= '0';
		--exemplo leitura
		signal_ram_address <=  std_logic_vector(to_unsigned(address,3));
			wait for 3 ns;
		--wait;
	end process;

	--colocar o componente da RAM aqui.
	DUT : exercicio5
		port map(
			we		=>	signal_we,
			clk 		=> 	clock,
			ram_input	=> 	signal_ram_input,
			ram_address	=>	signal_ram_address,
			ram_output 	=> 	signal_ram_output
		);



end behavioral;				
		
		