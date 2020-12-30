library verilog;
use verilog.vl_types.all;
entity LUT is
    port(
        adr             : in     vl_logic_vector(3 downto 0);
        data            : out    vl_logic_vector(15 downto 0)
    );
end LUT;
