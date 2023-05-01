library verilog;
use verilog.vl_types.all;
entity omgea_genrator is
    port(
        omega           : in     vl_logic_vector(7 downto 0);
        \mod\           : in     vl_logic_vector(7 downto 0);
        array_size      : in     vl_logic;
        omegas          : out    vl_logic
    );
end omgea_genrator;
