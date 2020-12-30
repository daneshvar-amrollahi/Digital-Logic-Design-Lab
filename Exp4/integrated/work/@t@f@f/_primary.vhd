library verilog;
use verilog.vl_types.all;
entity TFF is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        t               : out    vl_logic
    );
end TFF;
