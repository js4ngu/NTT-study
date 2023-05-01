module tb_bit_reverse_ordered;
    reg     [7:0] data_in      [7:0];
    reg    [7:0] data_out     [7:0];

    initial begin        
        data_in[0] = 0;
        data_in[1] = 1;
        data_in[2] = 2;
        data_in[3] = 3;
        data_in[4] = 4;
        data_in[5] = 5;
        data_in[6] = 6;
        data_in[7] = 7;
    end

    data_bit_reverse_order u1(
        .data_in(data_in),
        .data_out(data_out)
    );

endmodule