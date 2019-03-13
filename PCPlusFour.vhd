library ieee;
USE ieee.std_logic_1164.ALL;

entity PCPlusFour is
	port(A : in std_logic_vector(31 downto 0);
	res : BUFFER std_logic_vector(31 downto 0);
	cin : in std_logic;
	cout,sign,zero : out std_logic);
end PCPlusFour;



architecture structural of PCPlusFour is

COMPONENT oneBitAdder
	PORT(
		i_CarryIn		: IN	STD_LOGIC;
		i_Ai, i_Bi		: IN	STD_LOGIC;
		o_Sum, o_CarryOut	: OUT	STD_LOGIC);
END COMPONENT;

SIGNAL temp,temp2,B : std_logic_vector(31 downto 0);

begin

	B <= "00000000000000000000000000000100";
	
	AD0 : oneBitAdder port map(cin,A(0),B(0),res(0),temp(0));
	
	GEN: for i in 1 to 30 generate
		AD : oneBitAdder port map(temp(i-1),A(i),B(i),res(i),temp(i));
	end generate GEN;
	
	ADN : oneBitAdder port map(temp(30),A(31),B(31),res(31),cout);
	
	sign <= res(31);
	
	temp2(0) <= res(0);
	GEN2: for i in 1 to 31 generate
		temp2(i) <= temp2(i-1) OR res(i);
	end generate GEN2;
	
	zero <= NOT temp2(31);
	
end structural;