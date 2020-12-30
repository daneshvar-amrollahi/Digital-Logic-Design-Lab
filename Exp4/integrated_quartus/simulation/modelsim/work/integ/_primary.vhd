library verilog;
use verilog.vl_types.all;
entity integ is
    port(
        done            : out    vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        f               : in     vl_logic;
        adjust          : in     vl_logic;
        n               : in     vl_logic_vector(2 downto 0);
        start           : in     vl_logic;
        x               : in     vl_logic_vector(15 downto 0);
        valid           : out    vl_logic;
        acc_out         : out    vl_logic;
        curState        : out    vl_logic_vector(2 downto 0);
        fracpart        : out    vl_logic_vector(15 downto 0);
        intpart         : out    vl_logic_vector(1 downto 0);
        k               : out    vl_logic_vector(7 downto 0)
    );
end integ;
