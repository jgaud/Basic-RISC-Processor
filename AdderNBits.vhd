library ieee;
USE ieee.std_logic_1164.ALL;

entity AdderNBits is
	GENERIC( n : integer := 8);
	port(A : in std_logic_vector(n-1 downto 0);
	B : in std_logic_vector(n-1 downto 0);
	res : BUFFER std_logic_vector(n-1 downto 0);
	cin : in std_logic;
	cout,sign,zero : out std_logic);
end AdderNBits;



architecture structural of AdderNBits is

COMPONENT oneBitAdder
	PORT(
		i_CarryIn		: IN	STD_LOGIC;
		i_Ai, i_Bi		: IN	STD_LOGIC;
		o_Sum, o_CarryOut	: OUT	STD_LOGIC);
END COMPONENT;

SIGNAL temp,temp2 : std_logic_vector(n-1 downto 0);

begin
	AD0 : oneBitAdder port map(cin,A(0),B(0),res(0),temp(0));
	
	GEN: for i in 1 to n-2 generate
		AD : oneBitAdder port map(temp(i-1),A(i),B(i),res(i),temp(i));
	end generate GEN;
	
	ADN : oneBitAdder port map(temp(n-2),A(n-1),B(n-1),res(n-1),cout);
	
	sign <= res(n-1);
	
	temp2(0) <= res(0);
	GEN2: for i in 1 to n-1 generate
		temp2(i) <= temp2(i-1) OR res(i);
	end generate GEN2;
	
	zero <= NOT temp(n-1);
	
end structural;