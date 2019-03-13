library verilog;
use verilog.vl_types.all;
entity Lab2_vlg_sample_tst is
    port(
        CLK_IN          : in     vl_logic;
        CLK_MEM_IN      : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Lab2_vlg_sample_tst;
