module tb_4vs8_CMP;
    reg     [7:0] data_in     [7:0];

    reg     [7:0] omegas      [3:0];
    reg     [7:0] omegas_4    [1:0];
    reg     [7:0] mod;
    
    wire    [7:0] data_out    [7:0];
    wire    [7:0] data_out_4  [7:0];

    initial begin        
        data_in[0] = 0;
        data_in[1] = 4;
        data_in[2] = 2;
        data_in[3] = 6;
        data_in[4] = 1;
        data_in[5] = 5;
        data_in[6] = 3;
        data_in[7] = 7;

        mod = 29;
    
        omegas_4[0] = 1;
        omegas_4[1] = 13;

        omegas[0] = 1;
        omegas[1] = 9;
        omegas[2] = 13;
        omegas[3] = 15;
    end

    Butterfly_8point_network u1(
        .data_in (data_in),
        .omegas(omegas),
        .mod(mod),
        .data_out(data_out)
    );
    //6, 7, 7, 9, 2, 5, 6, 0

    Butterfly_4point_network u0(
        .data_in (data_in[3:0]),
        .omegas(omegas_4),
        .mod(mod),
        .data_out(data_out_4[3:0])
    );

    Butterfly_4point_network u1(
        .data_in (data_in[7:4]),
        .omegas(omegas_4),
        .mod(mod),
        .data_out(data_out_4[7:4])
    );
endmodule