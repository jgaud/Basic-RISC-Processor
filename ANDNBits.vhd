library ieee;
USE ieee.std_logic_1164.ALL;

entity ANDNBits is
	GENERIC( n : integer := 32);
	port(A : in std_logic_vector(n-1 downto 0);
	B : in std_logic_vector(n-1 downto 0);
	res : out std_logic_vector(n-1 downto 0));
end ANDNBits;



architecture structural of ANDNBits is
	
begin
	GEN: for i in n-1 downto 0 generate
		res(i) <= A(i) AND B(i);
	end generate GEN;
end structural;