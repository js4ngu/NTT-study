module reverse_bits (
    input               clk,
    input reg     [7:0] data_in     [7:0],
    input         [7:0] array_size,
    input         [7:0] bit_length,
    output reg    [7:0] data_out    [7:0]
);
    reg [7:0] i, j;
    always @(posedge clk) begin
        for (i = 0; i < array_size; i = i + 1) begin
            for (j = 0; j < bit_length; j = j + 1) begin
                data_out[i][j] = data_in[i][bit_length - 1 - j];
            end    
        end
    end
endmodule
