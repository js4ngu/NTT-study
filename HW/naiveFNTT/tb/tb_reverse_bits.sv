module reverse_bits_tb;
    reg     [7:0] data_in     [7:0];
    wire    [7:0] data_out    [7:0];
    reg     [7:0] array_size;
    reg     [7:0] bit_length;
    
    initial begin        
        data_in[0]  <= 0;
        data_in[1]  <= 1;
        data_in[2]  <= 2;
        data_in[3]  <= 3;
        data_in[4]  <= 4;
        data_in[5]  <= 5;
        data_in[6]  <= 6;
        data_in[7]  <= 7;

        array_size  <= 8;
        bit_length  <= 8;
    end


    reverse_bits u0 (
        .data_in(data_in),
        .array_size(array_size),
        .bit_length(bit_length),
        .data_out(data_out)
    );    
endmodule