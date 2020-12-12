library verilog;
use verilog.vl_types.all;
entity ring_oscillator is
    generic(
        number_of_inverters: integer := 5;
        delay           : integer := 10
    );
    port(
        rst             : in     vl_logic;
        \out\           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of number_of_inverters : constant is 1;
    attribute mti_svvh_generic_type of delay : constant is 1;
end ring_oscillator;
