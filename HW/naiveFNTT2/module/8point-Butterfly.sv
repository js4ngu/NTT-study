module Butterfly_8point(
    input reg   [7:0] data_in     [7:0],
    input reg   [7:0] omegas      [3:0],
    input reg   [7:0] mod,
    output reg  [7:0] data_out    [7:0]
);
    assign data_out[0] = (data_in[0] + data_in[4] * omegas[0]) % mod;
    assign data_out[1] = (data_in[1] + data_in[5] * omegas[1]) % mod;
    assign data_out[2] = (data_in[2] + data_in[6] * omegas[2]) % mod;
    assign data_out[3] = (data_in[3] + data_in[7] * omegas[3]) % mod;

    assign data_out[4] = (data_in[0] + data_in[4] * (mod - omegas[0]) ) % mod;
    assign data_out[5] = (data_in[1] + data_in[5] * (mod - omegas[1]) ) % mod;
    assign data_out[6] = (data_in[2] + data_in[6] * (mod - omegas[2]) ) % mod;
    assign data_out[7] = (data_in[3] + data_in[7] * (mod - omegas[3]) ) % mod;
endmodule


module Butterfly_8point_network (
    input reg   [7:0] data_in     [7:0],
    input reg   [7:0] omegas      [3:0],
    input reg   [7:0] mod,
    output reg  [7:0] data_out    [7:0]
);
    reg [7:0] BMtoBM       [7:0];
    reg [7:0] w4_to_w8 [1:0];

    assign w4_to_w8 = {omegas[0],omegas[2]};

    Butterfly_4point_network u0(
        .data_in(data_in[3:0]),
        .omegas(w4_to_w8),
        .mod(mod),
        .data_out(BMtoBM[3:0])  
    );

    Butterfly_4point_network u1(
       .data_in(data_in[7:4]),
        .omegas(w4_to_w8),
        .mod(mod),
        .data_out(BMtoBM[7:4])
    );

    Butterfly_8point u2(
        .data_in(BMtoBM),
        .omegas(omegas),
        .mod(mod),
        .data_out(data_out)
    );

endmodule