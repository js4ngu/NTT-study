module tb_4point_BM;
    reg     [7:0] data_in     [3:0];
    reg     [7:0] omegas      [1:0];
    reg     [7:0] mod;
    wire    [7:0] data_out    [3:0];
    reg     [7:0] test1, test2;

    initial begin        
        data_in[0] = 1;
        data_in[1] = 2;
        data_in[2] = 3;
        data_in[3] = 4;

        mod = 5;
        
        omegas[0] = 1;
        omegas[1] = 2;

        test1 = -1;
        test2 = (test1 % 5);
    end

    Butterfly_4point_network u1(
        .data_in (data_in),
        .omegas(omegas),
        .mod(mod),
        .data_out(data_out)
    );

endmodule