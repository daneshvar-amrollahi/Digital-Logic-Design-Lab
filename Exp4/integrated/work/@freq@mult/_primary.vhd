library verilog;
use verilog.vl_types.all;
entity FreqMult is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        f               : in     vl_logic;
        adjust          : in     vl_logic;
        n               : in     vl_logic_vector(2 downto 0);
        valid           : out    vl_logic;
        acc_out         : out    vl_logic;
        k               : out    vl_logic_vector(7 downto 0)
    );
end FreqMult;
