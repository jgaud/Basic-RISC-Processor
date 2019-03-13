library ieee;
use ieee.std_logic_1164.all;

entity registers is
	port (readRegister1,readRegister2,writeRegister : in std_logic_vector(4 downto 0);
	writeData : in std_logic_vector(31 downto 0);
	regWrite : in std_logic;
	readData1,readData2 : out std_logic_vector(31 downto 0);
	clk,reset : in std_logic);
end registers;

architecture structural of registers is

component registre
	generic( n : integer := 8);
	port (inputs : in std_logic_vector(n downto 0);
	clk,reset,enable : in std_logic;
	outputs,outputs_bar : out std_logic_vector(n downto 0));
end component;

component mux8
generic(busLength : integer := 8);
port(
a , b , c , d , e , f , g , h : in std_Logic_vector(busLength-1 downto 0);
selecteur : in std_logic_vector(2 downto 0);
output : out std_logic_vector(busLength-1 downto 0)
);
end component;

component decoder
	port (z : out std_logic_vector(7 downto 0);
	s : in std_logic_vector(2 downto 0));
end component;

signal tempin : std_logic_vector(7 downto 0);
signal tempout0,tempout1,tempout2,tempout3,tempout4,tempout5,tempout6,tempout7 : std_Logic_vector(31 downto 0);

begin

	dec : decoder port map(s=>writeRegister(2 downto 0),z=>tempin);
	
	reg0 : registre generic map (n=>31) port map(inputs => writeData, clk=>clk, reset=>reset, enable=>tempin(0) and regWrite, outputs=>tempout0);
	reg1 : registre generic map (n=>31) port map(inputs => writeData, clk=>clk, reset=>reset, enable=>tempin(1) and regWrite, outputs=>tempout1);
	reg2 : registre generic map (n=>31) port map(inputs => writeData, clk=>clk, reset=>reset, enable=>tempin(2) and regWrite, outputs=>tempout2);
	reg3 : registre generic map (n=>31) port map(inputs => writeData, clk=>clk, reset=>reset, enable=>tempin(3) and regWrite, outputs=>tempout3);
	reg4 : registre generic map (n=>31) port map(inputs => writeData, clk=>clk, reset=>reset, enable=>tempin(4) and regWrite, outputs=>tempout4);
	reg5 : registre generic map (n=>31) port map(inputs => writeData, clk=>clk, reset=>reset, enable=>tempin(5) and regWrite, outputs=>tempout5);
	reg6 : registre generic map (n=>31) port map(inputs => writeData, clk=>clk, reset=>reset, enable=>tempin(6) and regWrite, outputs=>tempout6);
	reg7 : registre generic map (n=>31) port map(inputs => writeData, clk=>clk, reset=>reset, enable=>tempin(7) and regWrite, outputs=>tempout7);
	
	mux1 : mux8 generic map (busLength=>32) port map(a=>tempout0,b=>tempout1,c=>tempout2,d=>tempout3,e=>tempout4,f=>tempout5,g=>tempout6,h=>tempout7,selecteur=>readRegister1(2 downto 0),output=>readData1);
	mux2 : mux8 generic map (busLength=>32) port map(a=>tempout0,b=>tempout1,c=>tempout2,d=>tempout3,e=>tempout4,f=>tempout5,g=>tempout6,h=>tempout7,selecteur=>readRegister2(2 downto 0),output=>readData2);

end structural;