library verilog;
use verilog.vl_types.all;
entity FuncGenWithFreqSel is
    port(
        dividedClock    : out    vl_logic;
        JKReset         : in     vl_logic;
        preset          : in     vl_logic;
        clk             : in     vl_logic;
        pl              : in     vl_logic_vector(7 downto 0);
        count74193      : out    vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0);
        sel             : in     vl_logic_vector(2 downto 0);
        rst             : in     vl_logic
    );
end FuncGenWithFreqSel;
