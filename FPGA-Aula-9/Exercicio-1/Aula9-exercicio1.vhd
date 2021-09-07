LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

-- Counter
entity exercicio1 is
    port (
        clk		: in std_logic;
	sensor     	: in std_logic;
	rst		: in std_logic;
	to_close	: in std_logic;
	to_open		: in std_logic;
	led_opened	: out std_logic;
	led_closing	: out std_logic;
	led_closed	: out std_logic;
	led_opening	: out std_logic

    );
end exercicio1;


architecture behavioral of exercicio1 is
			
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
		process(rst, clk, sensor)
		begin
			if rst = '1' then
				mq_estados <= opened;
			elsif clk'event and clk = '1' then
				case mq_estados is
					when opened =>

						led_opened <= '1';
						led_closing <= '0';
						led_closed <= '0';
						led_opening <= '0';

						if to_close = '1' then
							mq_estados <= closing;
						--vamos adicionar um "failsafe: se por alguma medonhice (falta de luz por exemplo)
						-- o portão estiver fechado mas a máquina entende ele como aberto, vamos pular ao
						--estado correto.
						elsif sensor = '0' then 
							mq_estados <= closed;
						end if;
					when opening =>

						led_opened <= '0';
						led_closing <= '0';
						led_closed <= '0';
						led_opening <= '1';

						if to_close = '1' then
							mq_estados <= closing;
						elsif sensor = '1' then
							mq_estados <= opened;
						end if;
					when closed =>

						led_opened <= '0';
						led_closing <= '0';
						led_closed <= '1';
						led_opening <= '0';

						if to_open = '1' then
							mq_estados <= opening;
						--mesmo caso do opened. mas aqui é menos crítico.
						elsif sensor = '1' then 
							mq_estados <= opened;
						end if;
					when closing =>

						led_opened <= '0';
						led_closing <= '1';
						led_closed <= '0';
						led_opening <= '0';

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
end behavioral;