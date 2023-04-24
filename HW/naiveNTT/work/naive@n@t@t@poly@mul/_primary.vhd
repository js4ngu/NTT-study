library verilog;
use verilog.vl_types.all;
entity naiveNTTPolyMul is
    port(
        data_a          : in     vl_logic_vector(63 downto 0);
        data_b          : in     vl_logic_vector(63 downto 0);
        \mod\           : in     vl_logic_vector(7 downto 0);
        omega           : in     vl_logic_vector(7 downto 0);
        invOmega        : in     vl_logic_vector(7 downto 0);
        invN            : in     vl_logic_vector(7 downto 0);
        result          : out    vl_logic_vector(63 downto 0)
    );
end naiveNTTPolyMul;
