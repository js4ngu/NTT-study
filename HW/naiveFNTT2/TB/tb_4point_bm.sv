module tb_4point_BM;
    reg     [7:0] data_in     [7:0];
    reg     [7:0] omegas      [3:0];
    reg     [7:0] omegas_4    [1:0];
    reg     [7:0] mod;
    wire    [7:0] data_out    [7:0];
    
    initial begin        
        data_in[4] = 1;
        data_in[5] = 5;
        data_in[6] = 3;
        data_in[7] = 7;


        omegas_4[0] = 1;
        omegas_4[1] = 13;

        mod = 17;
        #30;
        
    end

    Butterfly_4point_network u0(
        .data_in (data_in[3:0]),
        .omegas(omegas),
        .mod(mod),
        .data_out(data_out[3:0])
    );

    Butterfly_4point_network u1(
        .data_in (data_in[7:4]),
        .omegas(omegas),
        .mod(mod),
        .data_out(data_out[7:4])
    );
endmodule