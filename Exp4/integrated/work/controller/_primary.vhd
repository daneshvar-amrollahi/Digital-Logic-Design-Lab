library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        adjust          : in     vl_logic;
        kcalc           : in     vl_logic;
        cout            : in     vl_logic;
        valid           : out    vl_logic;
        LdCnt           : out    vl_logic;
        counten         : out    vl_logic
    );
end controller;
