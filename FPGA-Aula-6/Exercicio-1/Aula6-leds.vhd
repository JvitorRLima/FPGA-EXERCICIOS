LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity chavesleds is
    port (
        chaves      : in  std_logic_vector(4 downto 0);
        leds        : out std_logic_vector(4 downto 0)
    );
end chavesleds;

architecture rtl of chavesleds is

begin

	leds <= chaves;

end rtl;