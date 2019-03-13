library ieee;
use ieee.std_logic_1164.all;

entity controlUnit is
	port (instruction : in std_logic_vector(5 downto 0);
	Jump,Branch,MemRead,MemWrite,MemtoReg,ALUSRC,RegWrite,RegDst : out std_logic;
	ALUOP : out std_logic_vector(1 downto 0));
end controlUnit;

architecture structural of controlUnit is
begin
	ALUOP <= "00" when instruction = "100011"
		else "00" when instruction = "101011"
		else "01" when instruction = "000100"
		else "10" when instruction = "000000"
		else "00";
	
	Jump <= '1' when instruction = "000010"
		else '0';
		
	Branch <= '1' when instruction = "000100"
		else '0';
		
	MemRead <= '1' when instruction = "100011"
		else '0';
		
	MemWrite <= '1' when instruction = "101011"
		else '0';
		
	MemtoReg <= '1' when instruction = "100011"
		else '0';
		
	ALUSRC <= '1' when instruction = "100011"
			else '1' when instruction = "101011"
		else '0';
		
	RegWrite <= '1' when instruction = "000000"
			else '1' when instruction = "100011"
		else '0';
		
	RegDst <= '1' when instruction = "000000"
		else '0';
		
end structural;