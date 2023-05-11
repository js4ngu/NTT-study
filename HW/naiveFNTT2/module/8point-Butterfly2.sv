module Butterfly_8point_rev2(
    input reg   [7:0] data_in     [7:0],
    input reg   [7:0] omegas      [3:0],
    input reg   [7:0] mod,
    output reg  [7:0] data_out    [7:0]
);
    reg [7:0] stage1_FF [7:0];

    assign stage1_FF[0] = ( data_in[0] + data_in[1] * omegas[0] ) % mod;
    assign stage1_FF[1] = ( data_in[0] + data_in[1] * (mod - omegas[0]) ) % mod;

    assign stage1_FF[2] = ( data_in[2] + data_in[3] * omegas[0] ) % mod;
    assign stage1_FF[3] = ( data_in[2] + data_in[3] * (mod - omegas[0]) ) % mod;

    assign stage1_FF[4] = ( data_in[4] + data_in[5] * omegas[0] ) % mod;
    assign stage1_FF[5] = ( data_in[4] + data_in[5] * (mod - omegas[0]) ) % mod;

    assign stage1_FF[6] = ( data_in[6] + data_in[7] * omegas[0] ) % mod;
    assign stage1_FF[7] = ( data_in[6] + data_in[7] * (mod - omegas[0]) ) % mod;


    reg [7:0] stage2_FF [7:0];
    //뭔가 값이 이상하게 나옴.
    assign stage2_FF[0] = (stage1_FF[0] + stage1_FF[2] * omegas[0]) % mod;
    assign stage2_FF[1] = (stage1_FF[1] + stage1_FF[3] * omegas[2]) % mod;
    assign stage2_FF[2] = (stage1_FF[0] + stage1_FF[2] * (mod - omegas[0])) % mod;
    assign stage2_FF[3] = (stage1_FF[1] + stage1_FF[3] * (mod - omegas[2])) % mod;

    assign stage2_FF[4] = (stage1_FF[4] + stage1_FF[6] * omegas[0]) % mod;
    assign stage2_FF[5] = (stage1_FF[5] + stage1_FF[7] * omegas[2]) % mod;
    assign stage2_FF[6] = (stage1_FF[4] + stage1_FF[6] * (mod - omegas[0])) % mod;
    assign stage2_FF[7] = (stage1_FF[5] + stage1_FF[7] * (mod - omegas[2])) % mod;

    //stage3
    assign data_out[0] = (stage2_FF[0] + stage2_FF[4] * omegas[0]) % mod;
    assign data_out[1] = (stage2_FF[1] + stage2_FF[5] * omegas[1]) % mod;
    assign data_out[2] = (stage2_FF[2] + stage2_FF[6] * omegas[2]) % mod;
    assign data_out[3] = (stage2_FF[3] + stage2_FF[7] * omegas[3]) % mod;
    assign data_out[4] = (stage2_FF[0] + stage2_FF[4] * (mod - omegas[0]) ) % mod;
    assign data_out[5] = (stage2_FF[1] + stage2_FF[5] * (mod - omegas[1]) ) % mod;
    assign data_out[6] = (stage2_FF[2] + stage2_FF[6] * (mod - omegas[2]) ) % mod;
    assign data_out[7] = (stage2_FF[3] + stage2_FF[7] * (mod - omegas[3]) ) % mod;

endmodule

