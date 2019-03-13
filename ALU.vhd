library ieee;
USE ieee.std_logic_1164.ALL;

entity ALU is
	port(ALUOP : in std_logic_vector(2 downto 0);
	A,B : in std_logic_vector(31 downto 0);
	ALUOUT : out std_logic_vector(31 downto 0);
	zero : out std_logic);
end ALU;



architecture structural of ALU is

component AdderNBits
	GENERIC( n : integer := 8);
	port(A : in std_logic_vector(n-1 downto 0);
	B : in std_logic_vector(n-1 downto 0);
	res : BUFFER std_logic_vector(n-1 downto 0);
	cin : in std_logic;
	cout,sign,zero : out std_logic);
end component;

component ORNBits
	GENERIC( n : integer := 32);
	port(A : in std_logic_vector(n-1 downto 0);
	B : in std_logic_vector(n-1 downto 0);
	res : out std_logic_vector(n-1 downto 0));
end component;

component ANDNBits
	GENERIC( n : integer := 32);
	port(A : in std_logic_vector(n-1 downto 0);
	B : in std_logic_vector(n-1 downto 0);
	res : out std_logic_vector(n-1 downto 0));
end component;

component mux8
generic(busLength : integer := 8);
port(
a , b , c , d , e , f , g , h : in std_Logic_vector(busLength-1 downto 0);
selecteur : in std_logic_vector(2 downto 0);
output : out std_logic_vector(busLength-1 downto 0));
end component;

component mux2
	GENERIC(busLength : integer := 8);
	PORT(
		a , b : in std_Logic_vector(busLength-1 downto 0); 
		s0 : in std_Logic;
		output : out std_Logic_vector(busLength-1 downto 0));
END component;

component complementerNBits
	generic( n : integer := 6);
	port(
	en : in std_logic;
	inputs : in std_logic_vector(n downto 0);
	outputs : out std_logic_vector(n downto 0));
end component;

signal B_comp,B_adder,less_out,add_out,and_out,or_out : std_logic_vector(31 downto 0);

begin

	less_out(31 downto 1) <= "0000000000000000000000000000000";
	
	ADD : AdderNBits generic map(n=>32) port map(A=>A,B=>B_adder,res=>add_out,cin=>ALUOP(2),sign=>less_out(0),zero=>zero);
	
	AND1 : ANDNBits generic map(n=>32) port map(A=>A,B=>B,res=>and_out);
	
	OR1 : ORNBits generic map(n=>32) port map(A=>A,B=>B,res=>or_out);
	
	MUX_8 : mux8 generic map(busLength=>32) port map(a=>and_out, b=>or_out, c=>add_out, d=>"00000000000000000000000000000000", e=>"00000000000000000000000000000000", f=>"00000000000000000000000000000000", g=>add_out, h=>less_out, selecteur => ALUOP, output => ALUOUT);
	
	MUX_2 : mux2 generic map(busLength=>32) port map(a=>B,b=>B_comp,s0=>ALUOP(2),output=>B_adder);
	
	comp : complementerNBits generic map(31) port map(inputs=>B,en=>'1',outputs=>B_comp);
	
	
end structural;