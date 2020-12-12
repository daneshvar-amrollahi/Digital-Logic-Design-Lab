library verilog;
use verilog.vl_types.all;
entity count113 is
    port(
        output0         : out    vl_logic;
        input3          : in     vl_logic;
        input2          : in     vl_logic;
        input1          : in     vl_logic;
        input0          : in     vl_logic;
        clk             : in     vl_logic;
        preset          : in     vl_logic;
        input7          : in     vl_logic;
        input6          : in     vl_logic;
        input5          : in     vl_logic;
        input4          : in     vl_logic;
        output1         : out    vl_logic;
        output2         : out    vl_logic;
        output3         : out    vl_logic;
        output4         : out    vl_logic;
        output5         : out    vl_logic;
        output6         : out    vl_logic;
        output7         : out    vl_logic;
        tff_out         : out    vl_logic;
        JKreset         : in     vl_logic;
        duration        : out    vl_logic_vector(7 downto 0);
        rst             : in     vl_logic
    );
end count113;
