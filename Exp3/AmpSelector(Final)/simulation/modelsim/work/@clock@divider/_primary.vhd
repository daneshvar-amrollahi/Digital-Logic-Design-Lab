library verilog;
use verilog.vl_types.all;
entity ClockDivider is
    port(
        dividedClk      : out    vl_logic;
        JKreset         : in     vl_logic;
        enable          : in     vl_logic;
        inp             : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        count74193      : out    vl_logic_vector(7 downto 0)
    );
end ClockDivider;
