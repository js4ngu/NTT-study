library verilog;
use verilog.vl_types.all;
entity naiveFNTT2_8point is
    port(
        clk             : in     vl_logic;
        data_in         : in     vl_logic;
        omega           : in     vl_logic_vector(7 downto 0);
        \mod\           : in     vl_logic_vector(7 downto 0);
        array_size      : in     vl_logic_vector(7 downto 0);
        data_out        : out    vl_logic
    );
end naiveFNTT2_8point;
