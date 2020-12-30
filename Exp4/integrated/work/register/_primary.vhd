library verilog;
use verilog.vl_types.all;
entity \register\ is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        zero            : in     vl_logic;
        init            : in     vl_logic;
        ld              : in     vl_logic;
        r_in            : in     vl_logic_vector(15 downto 0);
        r_out           : out    vl_logic_vector(15 downto 0)
    );
end \register\;
