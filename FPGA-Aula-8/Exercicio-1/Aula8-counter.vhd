LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

-- Counter
entity counter is
    port (
        CLK_in      : in std_logic

    );
end counter;

architecture rtl of counter is

    	signal contador0 : integer range 0 to 15 := 0;
	signal contador1 : integer range 0 to 15 := 0;
	signal contador2 : integer range 0 to 15 := 0;
	signal contador3 : integer range 0 to 15 := 0;
	signal areset_sig: std_logic;
	signal c0_sig : std_logic;
	signal c1_sig : std_logic;
	signal c2_sig : std_logic;
	signal c3_sig : std_logic;
	signal locked_sig : std_logic;

	component exemplo_pll
		PORT
	(
		areset		: IN STD_LOGIC  := '0';
		inclk0		: IN STD_LOGIC  := '0';
		c0		: OUT STD_LOGIC ;
		c1		: OUT STD_LOGIC ;
		c2		: OUT STD_LOGIC ;
		c3		: OUT STD_LOGIC ;
		locked		: OUT STD_LOGIC 
	);
	end component;

	
begin

	exemplo_pll_inst : exemplo_pll PORT MAP (
		areset	 => areset_sig,
		inclk0	 => CLK_in,
		c0	 => c0_sig,
		c1	 => c1_sig,
		c2	 => c2_sig,
		c3	 => c3_sig,
		locked	 => locked_sig
	);

	
    -- Counter process
    process(c0_sig)
    begin
        if (c0_sig'event and c0_sig='1') then           
           	if contador0 = 15 then
			contador0 <= 0;
		else
			contador0 <= contador0 +1;
		end if;
        end if;
    end process;

	process(c1_sig)
    begin
        if (c1_sig'event and c1_sig='1') then           
           	if contador1 = 15 then
			contador1 <= 0;
		else
			contador1 <= contador1 +1;
		end if;
        end if;
    end process;

	process(c2_sig)
    begin
        if (c2_sig'event and c2_sig='1') then           
           	if contador2 = 15 then
			contador2 <= 0;
		else
			contador2 <= contador2 +1;
		end if;
        end if;
    end process;

	process(c3_sig)
    begin
        if (c3_sig'event and c3_sig='1') then           
           	if contador3 = 15 then
			contador3 <= 0;
		else
			contador3 <= contador3 +1;
		end if;
        end if;
    end process;

end rtl;
