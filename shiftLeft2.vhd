library ieee;
use ieee.std_logic_1164.all;

entity shiftLeft2 is
	GENERIC( n : integer := 8);
	port (inputs : in std_logic_vector(n downto 0);
	outputs : out std_logic_vector(n downto 0));
end shiftLeft2;

architecture structural of shiftLeft2 is
begin
	outputs(0)    <= '0';
   outputs(1)    <= '0';
   finish: for i in n downto 2 generate
       outputs(i) <= inputs(i-2);
   end generate;
end structural;