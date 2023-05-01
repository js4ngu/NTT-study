library verilog;
use verilog.vl_types.all;
entity data_bit_reverse_order is
    port(
        data_in         : in     vl_logic;
        data_out        : out    vl_logic
    );
end data_bit_reverse_order;
