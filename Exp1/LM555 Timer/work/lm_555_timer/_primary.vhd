library verilog;
use verilog.vl_types.all;
entity lm_555_timer is
    generic(
        Resistor1       : integer := 1;
        Resistor2       : integer := 1;
        capacitor       : integer := 10
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        pulse           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Resistor1 : constant is 1;
    attribute mti_svvh_generic_type of Resistor2 : constant is 1;
    attribute mti_svvh_generic_type of capacitor : constant is 1;
end lm_555_timer;
