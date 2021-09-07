-----------------------------------------------------------------------------------------------------------------
--ESTE ARQUIVO NÃO FUNCIONA.
--Apenas serve como base para copiarem e colarem as construções aqui contidas.
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--ROM
-----------------------------------------------------------------------------------------------------------------
		architecture behavioral of rom is
		
			type vector_of_vector is array 7 downto 0 of std_logic_vector(7 downto 0);
			constant rom : vector_of_vector := (
				x"AA",
				x"55",
				x"10",
				x"16",
				x"44",
				x"00",
				x"FF",
				x"FC",
			);
			
			signal rom_output : std_logic_vector(7 downto 0);
			signal rom_address :  integer range 7 downto 0;
		
		begin
		
			rom_output <= rom(rom_address)
		
		end behavioral;
		
		q <= d until clk'event and clk = '1';

-----------------------------------------------------------------------------------------------------------------
--FFD e LATCH
-----------------------------------------------------------------------------------------------------------------
		
		process
		begin
			q <= d;
			wait until clk'event and clk = '1';
		end process;
		
-----------------------------------------------------------------------------------------------------------------
		
		process(clk)
			begin
				if clk'event and clk = '1' then
					q <= d;
				end if;
		end process;
		
-----------------------------------------------------------------------------------------------------------------
		
		process(clk)
			begin
				if rising_edge(clk) then
					q <= d;
				end if;
		end process;
		
-----------------------------------------------------------------------------------------------------------------
		
		process(clk)
			begin
				if falling_edge(clk) then
					q <= d;
				end if;
		end process;
		
-----------------------------------------------------------------------------------------------------------------
		
		process(clk)
			begin
				if clk = '1' then
					q <= d;
				end if;
		end process;
		
-----------------------------------------------------------------------------------------------------------------
		
		process(clk)
			begin
				if clk'event and clk = '1' then
					q <= d;
				end if;
		end process;

-----------------------------------------------------------------------------------------------------------------
--SHIFT REGISTER
-----------------------------------------------------------------------------------------------------------------
		
		process(clk, rst)
			begin
				if rst = '1' then
					q <= "0000";
				elsif clk'event and clk = '1' then
					q(1) <= d;
					q(2) <= q(1);
					q(3) <= q(2);
					q(4) <= q(3);
				end if;
		end process;
		
-----------------------------------------------------------------------------------------------------------------
		
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
						q_c <= q_c(q_c'high-2 downto 0) & d;
					end if;
				end if;
		end process;
		
-----------------------------------------------------------------------------------------------------------------
						
		process(clk, rst)
			begin
				if rst = '1' then
					q_a <= (others=>'0'); --x na frende do vetor é HEXA.
				elsif clk'event and clk = '1' then
					if en = '1' then
						q_a(0) <= d;
						q_a(7 downto 1) <= q_a(6 downto 0);
					end if;
				end if;
		end process;
		--seleciona a saída do shift register com um seletor
		sr_output <= q_a(seletor);
		
-----------------------------------------------------------------------------------------------------------------
				
		--primeiro seleciono o que vai entrar no SR, conforme espec.
		--deste jeito, forçar 0 tem prioridade.
		data_selected <= '0'                  when force_0 = '1'     else
						 '1'                  when force_1 = '1'     else
						 shift_register_in	  when force_input = '1' else
						 shift_register(0)    when direction = '0'   else
						 shift_register(1023);
		
		process(rst, clk)
		begin
			if rst = '1' then
				shift_register <= (others=>'0');
			elsif clk'event and clk = '1' then
				--intencionalmente faremos com que eu possa carregar
				--paralelamente independente do enable.
				--para fazer a carga depender do enable, basta colocar
				--ela 'dentro' do if.
				if parallel_load = '1' then
					shift_register <= parallel_data;
				elsif en = '1' then
					if direction = '0' then --saída pelo LSB, roda para o LSB.
						shift_register <= data_selected & shift_register(1023 downto 1);
					else
						shift_register <= shift_register(1022 downto 0) & data_selected;
					end if;
				else
					parallel_out <= shift_register;
				end if;
			end if;
		end process;
		
		shift_register_out <=	shift_register(0) 		when direction = '0' else
								shift_register(1023);
		
		
-----------------------------------------------------------------------------------------------------------------
--RAM
-----------------------------------------------------------------------------------------------------------------		
		
		architecture behavioral of ram is
		
			type vector_of_vector is array 7 downto 0 of std_logic_vector(7 downto 0);
			--esta ram carrega valor inicial. posso fazer assim ou usando reset.
			signal ram : vector_of_vector := (
				x"AA",
				x"55",
				x"10",
				x"16",
				x"44",
				x"00",
				x"FF",
				x"FC",
			);
			--caso eu não queira essa ram com valor inicial, posso ignorar e usar apenas
			--signal ram : vector_of_vector := (others => (others=>'0'));
			--por questões de construção, raramente usamos reset em RAMs. Então eu sempre tenho que
			--inicializar elas para não dar erro.
			
			signal ram_output  : std_logic_vector(7 downto 0); --pode estar declarado como porta.
			signal ram_input   : std_logic_vector(7 downto 0); --pode estar declarado como porta
			signal ram_address :  integer range 7 downto 0;	   --pode estar declarado como porta
		
		begin
			
			process(clk)
			begin
				if clk'event and clk = '1' then
					ram(ram_address) <= ram_input;
				end if;
			end process;
			--saída assíncrona. pode ser síncrona.
			rom_output <= ram(ram_address)
		
		end behavioral;

-----------------------------------------------------------------------------------------------------------------
--CONTADORES
-----------------------------------------------------------------------------------------------------------------

		architecture behavioral of contadores is
			
			--não atribui valor aqui pois farei isso no RESET.
			signal contador1 : signed(7 downto 0);
			signal contador2 : unsigned(7 downto 0);
			signal contador3 : integer range 0 to 255;
			signal contador4 : signed(7 downto 0);
			signal contador5 : unsigned(7 downto 0);
		
		begin
			
			process(rst, clk)
			begin
				if rst = '1' then
					contador1 <= (others=>'0');
					contador2 <= (others=>'0');
					contador3 <= 0;
					contador4 <= to_signed(0,contador4'length);
					contador5 <= to_unsigned(0,contador5'length);
				elsif clk'event and clk = '1' then
					contador1 <= contador1 + 1; --note que eu posso somar um integer com um signed.
					contador2 <= contador2 + 1; --note que eu posso somar um integer com um unsigned.
					
					--integers são perigosos. eu delimitei o integer na declaração, mas isso só
					--vale para simulação. para o sintetizador, integer é todo o range.
					--em simulação, eu não posso permitir que o integer caia fora do range.
					--posso usar if-else ou outras forma para garantir que nunca conte até 256
					if contador3 < 255 then
						contador3 <= contador3 + 1;
					else
						contador3 <= 0;
					end if;
					
					contador4 <= contador4 - 1;
					contador5 <= contador5 - 1;
				end if;
			end process;
		
		end behavioral;
		
-----------------------------------------------------------------------------------------------------------------
--MAQUINA DE ESTADOS
-----------------------------------------------------------------------------------------------------------------
		architecture behavioral of mq_entity is
			
			--não atribui valor aqui pois farei isso no RESET.
			type estados is (
				closing,
				closed,
				opening,
				opened
			);
			signal mq_estados : estados;
		
		begin
		--vimos isso no início da disciplina.
		process(rst, clk)
		begin
			if rst = '1' then
				mq_estados <= opened;
			elsif clk'event and clk = '1' then
				case mq_estados is
					when opened =>
						if to_close = '1' then
							mq_estados <= closing;
						--vamos adicionar um "failsafe: se por alguma medonhice (falta de luz por exemplo)
						-- o portão estiver fechado mas a máquina entende ele como aberto, vamos pular ao
						--estado correto.
						elsif sensor = 0 then 
							mq_estados <= closed;
						end if;
					when opening =>
						if to_close = '1' then
							mq_estados <= closing;
						elsif sensor = '1' then
							mq_estados <= opened;
						end if;
					when closed =>
						if to_open = '1' then
							mq_estados <= opening;
						--mesmo caso do opened. mas aqui é menos crítico.
						elsif sensor = 1 then 
							mq_estados <= opened;
						end if;
					when closing =>
						if to_open = '1' then
							mq_estados <= opening;
						elsif sensor = '0' then
							mq_estados <= closed;
						end if;						
					when others =>
						--isso aqui é tipo um failsafe. se por algum motivo o one-hot virar "two-hot",
						--vai para estado conhecido. normalmente para o estado do reset.
						mq_estados <= opened;
				end case;
			end if;
		end process;						
		
		