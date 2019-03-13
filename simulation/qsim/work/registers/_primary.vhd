library verilog;
use verilog.vl_types.all;
entity registers is
    port(
        readRegister1   : in     vl_logic_vector(4 downto 0);
        readRegister2   : in     vl_logic_vector(4 downto 0);
        writeRegister   : in     vl_logic_vector(4 downto 0);
        writeData       : in     vl_logic_vector(31 downto 0);
        regWrite        : in     vl_logic;
        readData1       : out    vl_logic_vector(31 downto 0);
        readData2       : out    vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end registers;
