library verilog;
use verilog.vl_types.all;
entity exponential is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start           : in     vl_logic;
        x               : in     vl_logic_vector(15 downto 0);
        done            : out    vl_logic;
        intpart         : out    vl_logic_vector(1 downto 0);
        fracpart        : out    vl_logic_vector(15 downto 0)
    );
end exponential;
