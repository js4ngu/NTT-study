library verilog;
use verilog.vl_types.all;
entity Butterfly_8point_network is
    port(
        data_in         : in     vl_logic;
        omegas          : in     vl_logic;
        \mod\           : in     vl_logic_vector(7 downto 0);
        data_out        : out    vl_logic
    );
end Butterfly_8point_network;
