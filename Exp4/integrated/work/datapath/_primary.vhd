library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        ref_clk         : in     vl_logic;
        rst             : in     vl_logic;
        cpu_clk         : in     vl_logic;
        n               : in     vl_logic_vector(2 downto 0);
        LdCnt           : in     vl_logic;
        counten         : in     vl_logic;
        cout            : out    vl_logic;
        kcalc           : out    vl_logic;
        k               : out    vl_logic_vector(7 downto 0);
        tff_out         : out    vl_logic
    );
end datapath;
