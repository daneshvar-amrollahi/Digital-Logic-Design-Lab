library verilog;
use verilog.vl_types.all;
entity FuncGenWithFreqAndAmp is
    port(
        dividedClock    : out    vl_logic;
        JKReset         : in     vl_logic;
        preset          : in     vl_logic;
        clk             : in     vl_logic;
        sw              : in     vl_logic_vector(12 downto 0);
        counted         : out    vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0);
        rst             : in     vl_logic
    );
end FuncGenWithFreqAndAmp;
