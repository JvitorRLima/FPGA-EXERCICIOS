LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

-- Counter
entity counter is
    port (
        CLK_in      : in std_logic;
		stop		: in std_logic;
        led         : out std_logic_vector(3 downto 0)
    );
end counter;

architecture rtl of counter is

    signal iCounter : unsigned(28 downto 0);
	
begin

	
    -- Counter process
    COUNT_SHIFT: process (clk_in)
    begin
        if (clk_in'event and clk_in='1') then           
            if stop = '0' then else                                    -- Count down
				iCounter <= iCounter + 1;
            end if;
        end if;
    end process;
	led <= std_logic_vector(iCounter(iCounter'high downto iCounter'high - 3));

end rtl;

