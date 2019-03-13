library verilog;
use verilog.vl_types.all;
entity PCPlusFour is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        res             : out    vl_logic_vector(7 downto 0);
        cin             : in     vl_logic;
        cout            : out    vl_logic;
        sign            : out    vl_logic;
        zero            : out    vl_logic
    );
end PCPlusFour;
