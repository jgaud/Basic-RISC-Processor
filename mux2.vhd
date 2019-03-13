LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux2 IS
	GENERIC(busLength : integer := 8);
	PORT(
		a , b : in std_Logic_vector(busLength-1 downto 0); 
		s0 : in std_Logic;
		output : out std_Logic_vector(busLength-1 downto 0));
END mux2;

ARCHITECTURE rtl OF mux2 IS
BEGIN
	output <= a when s0 = '0' else b;
END rtl;
