library ieee;
USE ieee.std_logic_1164.ALL;

entity ORNBits is
	GENERIC( n : integer := 32);
	port(A : in std_logic_vector(n-1 downto 0);
	B : in std_logic_vector(n-1 downto 0);
	res : out std_logic_vector(n-1 downto 0));
end ORNBits;



architecture structural of ORNBits is
	
begin
	GEN: for i in n-1 downto 0 generate
		res(i) <= A(i) OR B(i);
	end generate GEN;
end structural;