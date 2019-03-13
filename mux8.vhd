library ieee;
use ieee.std_logic_1164.all;

entity mux8 is
generic(busLength : integer := 8);
port(
a , b , c , d , e , f , g , h : in std_Logic_vector(busLength-1 downto 0);
selecteur : in std_logic_vector(2 downto 0);
output : out std_logic_vector(busLength-1 downto 0)
);
end mux8;

architecture rtl of mux8 is
begin

  -- Selection de la sortie en fonction d'une entrée.
  output <= a when selecteur = "000"
  else b when selecteur = "001"
  else c when selecteur = "010"
  else d when selecteur = "011"
  else e when selecteur = "100"
  else f when selecteur = "101"
  else g when selecteur = "110"
  else h;

end rtl;
