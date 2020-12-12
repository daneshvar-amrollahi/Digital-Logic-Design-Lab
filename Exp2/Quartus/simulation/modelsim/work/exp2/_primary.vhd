library verilog;
use verilog.vl_types.all;
entity exp2 is
    port(
        inc             : out    vl_logic;
        clk_regulator   : in     vl_logic;
        rst_regulator   : in     vl_logic;
        JKreset         : in     vl_logic;
        enable          : in     vl_logic;
        clk_divider     : in     vl_logic;
        fset_max        : in     vl_logic_vector(7 downto 0);
        fset_min        : in     vl_logic_vector(7 downto 0);
        fset_ref        : in     vl_logic_vector(7 downto 0);
        dec             : out    vl_logic;
        TFF_out         : out    vl_logic;
        adjustedLoad    : out    vl_logic_vector(7 downto 0);
        cnt             : out    vl_logic_vector(7 downto 0);
        duration        : out    vl_logic_vector(15 downto 0);
        set_period      : out    vl_logic_vector(7 downto 0)
    );
end exp2;
