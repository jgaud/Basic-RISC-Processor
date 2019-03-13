library verilog;
use verilog.vl_types.all;
entity AdderNBits_vlg_check_tst is
    port(
        cout            : in     vl_logic;
        res             : in     vl_logic_vector(7 downto 0);
        sign            : in     vl_logic;
        zero            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end AdderNBits_vlg_check_tst;
