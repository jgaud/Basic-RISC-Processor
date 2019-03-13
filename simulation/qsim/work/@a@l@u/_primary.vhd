library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        ALUOP           : in     vl_logic_vector(2 downto 0);
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        ALUOUT          : out    vl_logic_vector(31 downto 0);
        zero            : out    vl_logic
    );
end ALU;
