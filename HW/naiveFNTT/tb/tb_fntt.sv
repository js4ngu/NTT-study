module tb_fntt;
    reg     [7:0] data_in     [7:0];
    reg     [7:0] array_size;
    reg     [7:0] bit_length;

    reg     [7:0] omegas      [7:0];
    reg     [7:0] mod;

    wire    [7:0] data_out    [7:0];

    initial begin        
        data_in[0]  <= 1;
        data_in[1]  <= 2;
        data_in[2]  <= 3;
        data_in[3]  <= 0;
        data_in[4]  <= 0;
        data_in[5]  <= 0;
        data_in[6]  <= 0;
        data_in[7]  <= 0;
        
        omegas[0]  <= 1;
        omegas[1]  <= 9;
        omegas[2]  <= 13;
        omegas[3]  <= 15;
        omegas[4]  <= 16;
        omegas[5]  <= 8;
        omegas[6]  <= 4;
        omegas[7]  <= 2;
        
        mod        <= 17;
        
        array_size <= 8;
        bit_length <= 8;
    end

    naiveFNTT u1(
        .data_in(data_in),
        .array_size(array_size),
        .bit_length(bit_length),
        .omegas(omegas),
        .mod(mod),
        .data_out(data_out)
    );

endmodule