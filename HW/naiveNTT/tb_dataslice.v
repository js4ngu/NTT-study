module dataslice_tb;
    reg [63:0] datain;
    wire [7:0] o0;
    wire [7:0] o1;
    wire [7:0] o2;
    wire [7:0] o3;
    wire [7:0] o4;
    wire [7:0] o5;
    wire [7:0] o6;
    wire [7:0] o7;

    initial begin
        datain = 64'h0102030405060708;
        #10
        datain = 64'h0807060504030201;
        #10
        datain = 64'h0A0B0C0D0E0F0908;
        #100
        $finish;
    end

    dataSlice u0 (
        .data_in(datain),
        .o0(o0),
        .o1(o1),
        .o2(o2),
        .o3(o3),
        .o4(o4),
        .o5(o5),
        .o6(o6),
        .o7(o7)
    );    
endmodule