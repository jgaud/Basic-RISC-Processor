library verilog;
use verilog.vl_types.all;
entity shiftLeft2 is
    port(
        inputs          : in     vl_logic_vector(8 downto 0);
        outputs         : out    vl_logic_vector(8 downto 0)
    );
end shiftLeft2;
