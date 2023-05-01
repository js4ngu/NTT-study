module naiveFNTT2_8point(
    input               clk,
    input reg     [7:0] data_in     [7:0],
    input               omega       [7:0],
    input               mod         [7:0],
    input               array_size  [7:0],
    output reg    [7:0] data_out    [7:0]
);
    reg [7:0] reverse_order [7:0];
    wire [7:0] omegas [7:0];

    data_bit_reverse_order u0(
        .data_in(data_in),
        .data_out(reverse_order)
    );

    omgea_genrator u1(
        .omega(omega),
        .mod(mod),
        .array_size(array_size),
        .omegas(omegas)
    );

    Butterfly_8point_network u2(
        .data_in(reverse_order),
        .omegas(omegas),
        .mod(mod),
        .data_out(data_out)
    );

endmodule;