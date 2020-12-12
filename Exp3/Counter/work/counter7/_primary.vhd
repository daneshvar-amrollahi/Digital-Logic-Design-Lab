library verilog;
use verilog.vl_types.all;
entity counter7 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end counter7;
