library verilog;
use verilog.vl_types.all;
entity naiveNTT is
    port(
        data_in         : in     vl_logic_vector(63 downto 0);
        omega           : in     vl_logic_vector(7 downto 0);
        \mod\           : in     vl_logic_vector(7 downto 0);
        data_out        : out    vl_logic_vector(63 downto 0)
    );
end naiveNTT;
