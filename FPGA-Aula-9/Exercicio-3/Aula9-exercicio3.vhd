library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity exercicio3 is
	port(
		clk			:	in 	std_logic;
		rst			:	in 	std_logic;
		shift_register_in	:	in 	std_logic;
		en			:	in	std_logic;
		parallel_load 		: 	in	std_logic;
		direction		:	in 	std_logic;
		parallel_data		:	in 	std_logic_vector(7 downto 0);
		parallel_out		:	out 	std_logic_vector(7 downto 0);
		shift_register_out	: 	out 	std_logic
	);

end exercicio3;

architecture behavioral of exercicio3 is

signal 	data_selected		:	std_logic;
signal  shift_register  	:	std_logic_vector(7 downto 0);
signal  en_deb			:	std_logic;
signal	parallel_load_deb	:	std_logic;
signal	rst_deb			: 	std_logic;

component debounce
		port (
        ck      : in  std_logic;
        deb_in  : in  std_logic;
        deb_out : out std_logic
    );
	end component;

begin
		
		denounce1 : debounce PORT MAP (
		ck	 => clk,
		deb_in	 => en,
		deb_out	 => en_deb
	);

		denounce2 : debounce PORT MAP (
		ck	 => clk,
		deb_in	 => parallel_load,
		deb_out	 => parallel_load_deb
	);

		denounce3 : debounce PORT MAP (
		ck	 => clk,
		deb_in	 => rst,
		deb_out	 => rst_deb
	);
			
		--primeiro seleciono o que vai entrar no SR, conforme espec.
		--deste jeito, forçar 0 tem prioridade.
		data_selected <= shift_register_in;
		
		process(rst, clk)
		begin
			if rst_deb = '1' then
				shift_register <= (others=>'0');
			elsif clk'event and clk = '1' then
				--intencionalmente faremos com que eu possa carregar
				--paralelamente independente do enable.
				--para fazer a carga depender do enable, basta colocar
				--ela 'dentro' do if.
				if parallel_load_deb = '1' then
					shift_register <= parallel_data;
				elsif en_deb = '1' then
					if direction = '0' then --saída pelo LSB, roda para o LSB.
						shift_register <= data_selected & shift_register(7 downto 1);
					else
						shift_register <= shift_register(6 downto 0) & data_selected;
					end if;
				else
					parallel_out <= shift_register;
				end if;
			end if;
		end process;
		
		shift_register_out <=	shift_register(0) 		when direction = '0' else
								shift_register(7);

end behavioral;
