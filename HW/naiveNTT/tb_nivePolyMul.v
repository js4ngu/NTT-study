`timescale 1ns/10ps

module naiveNTTPolyMul_tb;
    reg [63:0] data_a;
    reg [63:0] data_b;

    reg [7:0] mod;
    reg [7:0] omega;
    reg [7:0] invOmega;

    reg [7:0] invN;

    initial begin
        data_a      = 64'h00_00_00_00_02_01_00_03; //3,0,1,2,0,0,0,0
        data_b      = 64'h00_00_00_00_03_02_02_00; //0,2,2,3,0,0,0,0
        mod         = 17;
        
        omega       = 15;
        invOmega    = 8;
        invN        = 15; 

        #10
        $finish;
    end
    naiveNTTPolyMul u0 (
        .data_a     (data_a),
        .data_b     (data_b),
        .mod        (mod),
        .omega      (omega),
        .invOmega   (invOmega),
        .invN       (invN)
        //.data_out   (dataout)
    );    
endmodule


// 06  08 11 12  02  06 10  03

