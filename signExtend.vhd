library ieee;
USE ieee.std_logic_1164.ALL;

entity signExtend is
	port(inputs : in std_logic_vector(15 downto 0);
	outputs : out std_logic_vector(31 downto 0));
end signExtend;



architecture structural of signExtend is
begin
	outputs(31 downto 16) <= "0000000000000000";
	outputs(15 downto 0) <= inputs;
end structural;