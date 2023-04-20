module naiveINTT (
    input [63:0] data_in,
    input [7:0] invN,
    input [7:0] invOmega, //original's inv value
    input [7:0] mod,

    output [63:0] data_out
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
        temp = 0;

        //calc INTT
        for (j = 0;j < 8;j = j + 1) begin
            factor = 1;
            //pow
            for (k = 0; k < i*j; k = k+1) begin
                factor = (factor * invOmega) % mod;
            end

            temp = (temp + (input_array[j] * factor)) % mod;
        end
        temp = (invN * temp) % mod;

        //move to another array
        for (j=0; j<8; j=j+1) begin
            output_array[i][j] = temp[0];
            temp = temp >> 1;
        end
    end
end
assign data_out = {output_array[7],output_array[6],output_array[5],output_array[4],output_array[3],output_array[2],output_array[1],output_array[0]};
endmodule