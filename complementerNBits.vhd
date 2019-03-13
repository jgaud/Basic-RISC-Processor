library ieee;
USE ieee.std_logic_1164.ALL;

entity complementerNBits is
	generic( n : integer := 6);
	port(
	en : in std_logic;
	inputs : in std_logic_vector(n downto 0);
	outputs : out std_logic_vector(n downto 0));
end complementerNBits;
	
architecture structural of complementerNBits is
begin
	GEN: for i in 0 to n generate
		outputs(i) <= en xor inputs(i);
	end generate GEN;
end structural;