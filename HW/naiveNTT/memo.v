module naiveNTT (
    input [63:0] data_in,
    
    input [7:0] omega,
    input [7:0] mod,

    output [7:0] o0,
    output [7:0] o1,
    output [7:0] o2,
    output [7:0] o3,
    output [7:0] o4,
    output [7:0] o5,
    output [7:0] o6,
    output [7:0] o7
);

reg [7:0] input_array [7:0];
reg [7:0] output_array [7:0];
reg [31:0] factor;
reg [63:0] slice_temp;
reg [7:0] i,j,k,temp;

always @(*) begin
    slice_temp = data_in;
    for (i=0; i<8; i=i+1) begin
        for (j=0; j<8; j=j+1) begin
            input_array[i][j] = slice_temp[0];
            slice_temp = slice_temp >> 1;
        end
    end

    for (i = 0; i < 8; i = i + 1) begin
        temp <= input_array[i] * 2;
        
        for (j=0; j<8; j=j+1) begin
            output_array[i][j] = temp[0];
            temp = temp >> 1;
        end
    end
end

assign o0 = output_array[0];
assign o1 = output_array[1];
assign o2 = output_array[2];
assign o3 = output_array[3];
assign o4 = output_array[4];
assign o5 = output_array[5];
assign o6 = output_array[6];
assign o7 = output_array[7];
endmodule