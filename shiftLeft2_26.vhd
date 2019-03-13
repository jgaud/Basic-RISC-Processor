library ieee;
use ieee.std_logic_1164.all;

entity shiftLeft2_26 is
	port (inputs : in std_logic_vector(25 downto 0);
	outputs : out std_logic_vector(27 downto 0));
end shiftLeft2_26;

architecture structural of shiftLeft2_26 is
begin
	outputs(27 downto 2) <= inputs(31 downto 2);
	outputs(1 downto 0) <= "00";
end structural;