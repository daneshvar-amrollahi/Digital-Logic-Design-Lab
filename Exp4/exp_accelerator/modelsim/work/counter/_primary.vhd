library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        zero            : in     vl_logic;
        ld              : in     vl_logic;
        enb             : in     vl_logic;
        \in\            : in     vl_logic_vector(2 downto 0);
        \out\           : out    vl_logic_vector(3 downto 0);
        co              : out    vl_logic
    );
end counter;
