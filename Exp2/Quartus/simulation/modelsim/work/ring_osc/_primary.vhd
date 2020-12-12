library verilog;
use verilog.vl_types.all;
entity ring_osc is
    port(
        delay           : in     vl_logic_vector(7 downto 0);
        rst             : in     vl_logic;
        \out\           : out    vl_logic
    );
end ring_osc;
