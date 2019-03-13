--------------------------------------------------------------------------------
-- Title         : signextend
-- Project       : Laboratory 02
-------------------------------------------------------------------------------
-- File          : signextend.vhd
-- Author        : Group 19  <fgaud013@uottawa.ca> <gstei090@uottawa.ca>
-- Created       : 2019/01/
-- Last modified : 2019/02/
-------------------------------------------------------------------------------
-- Description : Do an "and" between 2 values
-------------------------------------------------------------------------------
-- Modification history :
-- 2019.01		Creation			Group 19
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY signExtend IS
	GENERIC( n : integer := 15);
	PORT(	i_value			: IN	STD_LOGIC_VECTOR(n downto 0);
			o_value			: OUT	STD_LOGIC_VECTOR(((n*2)+1) downto 0));
END signExtend;

ARCHITECTURE rtl OF signExtend IS

BEGIN

	filler: for i in ((n*2)+1) downto (n + 1) generate
		o_value(i) <= '0';
	end generate;
	
	o_value(n downto 0) <= i_value;

END rtl;
