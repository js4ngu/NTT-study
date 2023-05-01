library verilog;
use verilog.vl_types.all;
entity naiveFNTT is
    port(
        data_in         : in     vl_logic;
        array_size      : in     vl_logic_vector(7 downto 0);
        bit_length      : in     vl_logic_vector(7 downto 0);
        omegas          : in     vl_logic;
        \mod\           : in     vl_logic_vector(7 downto 0);
        data_out        : out    vl_logic
    );
end naiveFNTT;
