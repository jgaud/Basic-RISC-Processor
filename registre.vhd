library ieee;
use ieee.std_logic_1164.all;

entity registre is
	generic( n : integer := 8);
	port (inputs : in std_logic_vector(n downto 0);
	clk,reset,enable : in std_logic;
	outputs,outputs_bar : out std_logic_vector(n downto 0));
end registre;

architecture structural of registre is

component enARdFF_2
	PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_d		: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
END component;

begin
	GEN: for i in 0 to n generate
		FF : enARdFF_2 port map(i_resetBar=>not reset, i_d=>inputs(i), i_enable=>enable, i_clock=>clk, o_q=>outputs(i), o_qBar=>outputs_bar(i));
	end generate GEN;

end structural;