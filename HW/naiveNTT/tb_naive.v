`timescale 1ns/10ps

module naiveNTT_tb;
    reg [63:0] datain;
    reg [7:0] omega;
    reg [7:0] mod;

    wire [7:0] o0;
    wire [7:0] o1;
    wire [7:0] o2;
    wire [7:0] o3;
    wire [7:0] o4;
    wire [7:0] o5;
    wire [7:0] o6;
    wire [7:0] o7;

    initial begin
        mod = 17;
        omega = 9;
        //datain = 64'h03_01_02_06_00_00_00_00; //target
        datain = 64'h00_00_00_00_06_02_01_03; //target - Clear! ; output also reverse
        #10
        $finish;
    end

    naiveNTT u0 (
        .data_in(datain),
        .omega(omega),
        .mod(mod),
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


// 06  08 11 12  02  06 10  03

