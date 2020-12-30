library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        zx              : in     vl_logic;
        initx           : in     vl_logic;
        ldx             : in     vl_logic;
        zt              : in     vl_logic;
        initt           : in     vl_logic;
        ldt             : in     vl_logic;
        zr              : in     vl_logic;
        initr           : in     vl_logic;
        ldr             : in     vl_logic;
        zc              : in     vl_logic;
        ldc             : in     vl_logic;
        enc             : in     vl_logic;
        s               : in     vl_logic;
        x               : in     vl_logic_vector(15 downto 0);
        co              : out    vl_logic;
        result          : out    vl_logic_vector(17 downto 0)
    );
end datapath;
