module dataSlice (
    input [63:0] data_in,
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
reg [63:0] slice_temp;
reg [7:0] i,j;

always @(*) begin
    //slice array
    slice_temp = data_in;
    for (i=0; i<8; i=i+1) begin
        for (j=0; j<8; j=j+1) begin
            input_array[i][j] = slice_temp[0];
            slice_temp = slice_temp >> 1;
        end
    end
end

assign o0 = input_array[0];
assign o1 = input_array[1];
assign o2 = input_array[2];
assign o3 = input_array[3];
assign o4 = input_array[4];
assign o5 = input_array[5];
assign o6 = input_array[6];
assign o7 = input_array[7];

endmodule
