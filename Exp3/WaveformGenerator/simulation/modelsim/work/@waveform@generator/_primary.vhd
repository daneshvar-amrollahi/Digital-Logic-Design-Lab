library verilog;
use verilog.vl_types.all;
entity WaveformGenerator is
    port(
        \out\           : out    vl_logic_vector(7 downto 0);
        sel             : in     vl_logic_vector(2 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end WaveformGenerator;
