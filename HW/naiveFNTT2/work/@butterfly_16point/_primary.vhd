library verilog;
use verilog.vl_types.all;
entity Butterfly_16point is
    port(
        clk             : in     vl_logic;
        data_in         : in     vl_logic;
        omegas          : in     vl_logic_vector(7 downto 0);
        \mod\           : in     vl_logic_vector(7 downto 0);
        data_out        : out    vl_logic
    );
end Butterfly_16point;
