library verilog;
use verilog.vl_types.all;
entity registers_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        readRegister1   : in     vl_logic_vector(4 downto 0);
        readRegister2   : in     vl_logic_vector(4 downto 0);
        regWrite        : in     vl_logic;
        reset           : in     vl_logic;
        writeData       : in     vl_logic_vector(31 downto 0);
        writeRegister   : in     vl_logic_vector(4 downto 0);
        sampler_tx      : out    vl_logic
    );
end registers_vlg_sample_tst;
