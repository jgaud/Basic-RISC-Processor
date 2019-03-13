library ieee;
use ieee.std_logic_1164.all;

entity ALUControlBlock is
	port (
	f : in std_logic_vector(5 downto 0);
	ALUOP : in std_logic_vector(1 downto 0));
	ALUOP_OUT : out std_logic_vector(2 downto 0));
end ALUControlBlock;

architecture structural of ALUControlBlock is
	signal op0,op1,op2 : std_logic;
begin
	op0 <= ((f(0) or f(3)) and ALUOP(1));
	op1 <= (f(2) or ALUOP(1));
	op2 <= (ALUOP(0) or (ALUOP(1) and f(1)));
	ALUOP_OUT <= op2 & op1 & op0;
end structural;