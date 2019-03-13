library ieee;
use ieee.std_logic_1164.all;

entity shiftLeft2 is
	port (inputs : in std_logic_vector(31 downto 0);
	outputs : out std_logic_vector(31 downto 0));
end shiftLeft2;

architecture structural of shiftLeft2 is
begin
	outputs(31 downto 2) <= inputs(31 downto 2);
	outputs(1 downto 0) <= "00";
end structural;