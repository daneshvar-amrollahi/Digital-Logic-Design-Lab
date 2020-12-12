library verilog;
use verilog.vl_types.all;
entity Processor is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        \select\        : in     vl_logic_vector(2 downto 0);
        count           : in     vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end Processor;
