library verilog;
use verilog.vl_types.all;
entity CU is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start           : in     vl_logic;
        cco             : in     vl_logic;
        oe              : in     vl_logic;
        LdT             : out    vl_logic;
        LdE             : out    vl_logic;
        LdQ             : out    vl_logic;
        selM            : out    vl_logic;
        selX            : out    vl_logic;
        selA            : out    vl_logic;
        selRom          : out    vl_logic;
        selQ            : out    vl_logic;
        selT            : out    vl_logic;
        sub             : out    vl_logic;
        I0c             : out    vl_logic;
        Inc             : out    vl_logic;
        ready           : out    vl_logic
    );
end CU;
