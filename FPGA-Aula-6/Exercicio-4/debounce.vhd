LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity debounce is
    port (
        ck      : in  std_logic;
        deb_in  : in  std_logic;
        deb_out : out std_logic
    );
end debounce;

architecture rtl of debounce is

	signal debounce : std_logic_vector(7 downto 0) := (others=>'0');
	signal pulse    : std_logic := '0';

begin

	process(ck)
	begin
		if rising_edge(ck) then
			debounce <= debounce(6 downto 0) & deb_in;
			pulse <= debounce(7);
			deb_out <= '0';
			if debounce = x"FF" and pulse = '0' then
				deb_out <= '1';
			end if;
		end if;
	end process;

end rtl;