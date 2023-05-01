module Butterfly_2point(
    input reg   [7:0] data_in     [1:0],
    input reg   [7:0] omegas,
    input reg   [7:0] mod,
    output reg  [7:0] data_out    [1:0]
);
    assign data_out[0] = ( data_in[0] + data_in[1] * omegas ) % mod;
    assign data_out[1] = ( data_in[0] + data_in[1] * (mod - omegas) ) % mod;
endmodule;

module Butterfly_4point(
    input reg   [7:0] data_in     [3:0],
    input reg   [7:0] omegas      [1:0],
    input reg   [7:0] mod,
    output reg  [7:0] data_out    [3:0]
);
    assign data_out[0] = (data_in[0] + data_in[2] * omegas[0]) % mod;
    assign data_out[1] = (data_in[1] + data_in[3] * omegas[1]) % mod;

    assign data_out[2] = (data_in[0] + data_in[2] * (mod - omegas[0])) % mod;
    assign data_out[3] = (data_in[1] + data_in[3] * (mod - omegas[1])) % mod;
endmodule

module Butterfly_4point_network (
    input reg   [7:0] data_in     [3:0],
    input reg   [7:0] omegas      [1:0],
    input reg   [7:0] mod,
    output reg  [7:0] data_out    [3:0]
);

    reg [7:0] BMtoBM       [3:0];

    Butterfly_2point u0(
        .data_in(data_in[1:0]),
        .omegas(omegas[0]),
        .mod(mod),
        .data_out(BMtoBM[1:0])
    );

    Butterfly_2point u1(
       .data_in(data_in[3:2]),
        .omegas(omegas[0]),
        .mod(mod),
        .data_out(BMtoBM[3:2])
    );

    Butterfly_4point u2(
        .data_in(BMtoBM),
        .omegas(omegas),
        .mod(mod),
        .data_out(data_out)
    );
endmodule