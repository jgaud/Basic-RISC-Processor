library ieee;
use ieee.std_logic_1164.all;

entity mux4 is
	GENERIC(busLength : integer := 8);
	port(
		a , b , c , d : in std_logic_vector(busLength-1 downto 0);
		s1, s0 : in std_Logic;
		output : out std_logic_vector(busLength-1 downto 0));
end mux4;

architecture rtl of mux4 is
begin

  -- Selection de la sortie en fonction d'une entrée.
  output <= a when s1 = '0' and s0 = '0'
  else b when s1 = '0' and s0 = '1'
  else c when s1 = '1' and s0 = '0'
  else d;

end rtl;
