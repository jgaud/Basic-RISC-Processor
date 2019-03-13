library verilog;
use verilog.vl_types.all;
entity Lab2 is
    port(
        A               : out    vl_logic_vector(31 downto 0);
        CLK_MEM_IN      : in     vl_logic;
        CLK_IN          : in     vl_logic;
        B               : out    vl_logic_vector(31 downto 0)
    );
end Lab2;
