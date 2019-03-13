library ieee;
use ieee.std_logic_1164.all;

entity decoder is
	port (z : out std_logic_vector(7 downto 0);
	s : in std_logic_vector(2 downto 0));
end decoder;

architecture structural of decoder is

begin
	z(0) <= (not s(2) and not s(1) and not s(0));
	z(1) <= (not s(2) and not s(1) and s(0));
	z(2) <= (not s(2) and s(1) and not s(0));
	z(3) <= (not s(2) and s(1) and s(0));
	z(4) <= (s(2) and not s(1) and not s(0));
	z(5) <= (s(2) and not s(1) and s(0));
	z(6) <= (s(2) and s(1) and not s(0));
	z(7) <= (s(2) and s(1) and s(0));
end structural;