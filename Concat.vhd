library ieee;
USE ieee.std_logic_1164.ALL;

entity Concat is
	port(A : in std_logic_vector(27 downto 0);
		B : in std_logic_vector(31 downto 0);
		outputs : out std_logic_vector(31 downto 0));
end Concat;



architecture structural of Concat is

begin
	outputs(27 downto 0) <= A;
	outputs(31 downto 28) <= B(31 downto 28);
end structural;