library verilog;
use verilog.vl_types.all;
entity controller is
    generic(
        Idle            : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi0);
        Initialization  : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi1);
        \Begin\         : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi0);
        Mult1           : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi1);
        Mult2           : vl_logic_vector(2 downto 0) := (Hi1, Hi0, Hi0);
        Add             : vl_logic_vector(2 downto 0) := (Hi1, Hi0, Hi1)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start           : in     vl_logic;
        co              : in     vl_logic;
        done            : out    vl_logic;
        zx              : out    vl_logic;
        initx           : out    vl_logic;
        ldx             : out    vl_logic;
        zt              : out    vl_logic;
        initt           : out    vl_logic;
        ldt             : out    vl_logic;
        zr              : out    vl_logic;
        initr           : out    vl_logic;
        ldr             : out    vl_logic;
        zc              : out    vl_logic;
        ldc             : out    vl_logic;
        enc             : out    vl_logic;
        s               : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Idle : constant is 2;
    attribute mti_svvh_generic_type of Initialization : constant is 2;
    attribute mti_svvh_generic_type of \Begin\ : constant is 2;
    attribute mti_svvh_generic_type of Mult1 : constant is 2;
    attribute mti_svvh_generic_type of Mult2 : constant is 2;
    attribute mti_svvh_generic_type of Add : constant is 2;
end controller;
