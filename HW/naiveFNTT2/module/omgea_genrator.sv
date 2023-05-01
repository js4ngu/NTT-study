module omgea_genrator(
    input reg     [7:0] omega       ,
    input         [7:0] mod         ,
    input         [7:0] array_size  [7:0],
    output reg    [7:0] omegas      [7:0]
);
    assign omegas[0] = ( omega ** 0 ) % mod;
    assign omegas[1] = ( omega ** 1 ) % mod;
    assign omegas[2] = ( omega ** 2 ) % mod;
    assign omegas[3] = ( omega ** 3 ) % mod;
    assign omegas[4] = ( omega ** 4 ) % mod;
    assign omegas[5] = ( omega ** 5 ) % mod;
    assign omegas[6] = ( omega ** 6 ) % mod;
    assign omegas[7] = ( omega ** 7 ) % mod;
endmodule;