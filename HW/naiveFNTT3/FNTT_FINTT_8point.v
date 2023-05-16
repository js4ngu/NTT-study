module BitReverseOrder(
  input  [7:0] io_inData_0,
  input  [7:0] io_inData_1,
  input  [7:0] io_inData_2,
  input  [7:0] io_inData_3,
  input  [7:0] io_inData_4,
  input  [7:0] io_inData_5,
  input  [7:0] io_inData_6,
  input  [7:0] io_inData_7,
  output [7:0] io_outData_0,
  output [7:0] io_outData_1,
  output [7:0] io_outData_2,
  output [7:0] io_outData_3,
  output [7:0] io_outData_4,
  output [7:0] io_outData_5,
  output [7:0] io_outData_6,
  output [7:0] io_outData_7
);
  assign io_outData_0 = io_inData_0; // @[BitReverseOrder.scala 8:17]
  assign io_outData_1 = io_inData_4; // @[BitReverseOrder.scala 9:17]
  assign io_outData_2 = io_inData_2; // @[BitReverseOrder.scala 10:17]
  assign io_outData_3 = io_inData_6; // @[BitReverseOrder.scala 11:17]
  assign io_outData_4 = io_inData_1; // @[BitReverseOrder.scala 12:17]
  assign io_outData_5 = io_inData_5; // @[BitReverseOrder.scala 13:17]
  assign io_outData_6 = io_inData_3; // @[BitReverseOrder.scala 14:17]
  assign io_outData_7 = io_inData_7; // @[BitReverseOrder.scala 15:17]
endmodule
module Butterfly_2point(
  input        clock,
  input        reset,
  input  [7:0] io_inData_0,
  input  [7:0] io_inData_1,
  input  [7:0] io_mod,
  output [7:0] io_outData_0,
  output [7:0] io_outData_1
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] modReg; // @[FNTT_2point.scala 11:23]
  reg [7:0] InBuffer_0; // @[FNTT_2point.scala 13:25]
  reg [7:0] InBuffer_1; // @[FNTT_2point.scala 13:25]
  reg [7:0] OutBuffer_0; // @[FNTT_2point.scala 14:26]
  reg [7:0] OutBuffer_1; // @[FNTT_2point.scala 14:26]
  wire [7:0] _OutBuffer_0_T_1 = InBuffer_0 + InBuffer_1; // @[FNTT_2point.scala 21:31]
  wire [7:0] _OutBuffer_1_T_1 = modReg - InBuffer_1; // @[FNTT_2point.scala 22:27]
  wire [7:0] _OutBuffer_1_T_3 = _OutBuffer_1_T_1 + InBuffer_0; // @[FNTT_2point.scala 22:42]
  assign io_outData_0 = OutBuffer_0; // @[FNTT_2point.scala 24:17]
  assign io_outData_1 = OutBuffer_1; // @[FNTT_2point.scala 25:17]
  always @(posedge clock) begin
    if (reset) begin // @[FNTT_2point.scala 11:23]
      modReg <= 8'h0; // @[FNTT_2point.scala 11:23]
    end else begin
      modReg <= io_mod; // @[FNTT_2point.scala 16:10]
    end
    if (reset) begin // @[FNTT_2point.scala 13:25]
      InBuffer_0 <= 8'h0; // @[FNTT_2point.scala 13:25]
    end else begin
      InBuffer_0 <= io_inData_0; // @[FNTT_2point.scala 18:15]
    end
    if (reset) begin // @[FNTT_2point.scala 13:25]
      InBuffer_1 <= 8'h0; // @[FNTT_2point.scala 13:25]
    end else begin
      InBuffer_1 <= io_inData_1; // @[FNTT_2point.scala 19:15]
    end
    if (reset) begin // @[FNTT_2point.scala 14:26]
      OutBuffer_0 <= 8'h0; // @[FNTT_2point.scala 14:26]
    end else begin
      OutBuffer_0 <= _OutBuffer_0_T_1; // @[FNTT_2point.scala 21:16]
    end
    if (reset) begin // @[FNTT_2point.scala 14:26]
      OutBuffer_1 <= 8'h0; // @[FNTT_2point.scala 14:26]
    end else begin
      OutBuffer_1 <= _OutBuffer_1_T_3; // @[FNTT_2point.scala 22:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  modReg = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  InBuffer_0 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  InBuffer_1 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  OutBuffer_0 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  OutBuffer_1 = _RAND_4[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module modular(
  input        clock,
  input        reset,
  input  [7:0] io_inData,
  input  [7:0] io_mod,
  output [7:0] io_outData
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] modReg; // @[modular.scala 14:23]
  reg [7:0] outBuffer; // @[modular.scala 15:26]
  wire [7:0] _outBuffer_T = io_inData % modReg; // @[modular.scala 21:26]
  assign io_outData = outBuffer; // @[modular.scala 23:14]
  always @(posedge clock) begin
    if (reset) begin // @[modular.scala 14:23]
      modReg <= 8'h0; // @[modular.scala 14:23]
    end else begin
      modReg <= io_mod; // @[modular.scala 17:10]
    end
    if (reset) begin // @[modular.scala 15:26]
      outBuffer <= 8'h0; // @[modular.scala 15:26]
    end else begin
      outBuffer <= _outBuffer_T; // @[modular.scala 21:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  modReg = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  outBuffer = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FNTT_2point(
  input        clock,
  input        reset,
  input  [7:0] io_inData_0,
  input  [7:0] io_inData_1,
  input  [7:0] io_mod,
  output [7:0] io_outData_0,
  output [7:0] io_outData_1
);
  wire  BF_clock; // @[FNTT_2point.scala 34:18]
  wire  BF_reset; // @[FNTT_2point.scala 34:18]
  wire [7:0] BF_io_inData_0; // @[FNTT_2point.scala 34:18]
  wire [7:0] BF_io_inData_1; // @[FNTT_2point.scala 34:18]
  wire [7:0] BF_io_mod; // @[FNTT_2point.scala 34:18]
  wire [7:0] BF_io_outData_0; // @[FNTT_2point.scala 34:18]
  wire [7:0] BF_io_outData_1; // @[FNTT_2point.scala 34:18]
  wire  modular_0_clock; // @[FNTT_2point.scala 35:39]
  wire  modular_0_reset; // @[FNTT_2point.scala 35:39]
  wire [7:0] modular_0_io_inData; // @[FNTT_2point.scala 35:39]
  wire [7:0] modular_0_io_mod; // @[FNTT_2point.scala 35:39]
  wire [7:0] modular_0_io_outData; // @[FNTT_2point.scala 35:39]
  wire  modular_1_clock; // @[FNTT_2point.scala 35:39]
  wire  modular_1_reset; // @[FNTT_2point.scala 35:39]
  wire [7:0] modular_1_io_inData; // @[FNTT_2point.scala 35:39]
  wire [7:0] modular_1_io_mod; // @[FNTT_2point.scala 35:39]
  wire [7:0] modular_1_io_outData; // @[FNTT_2point.scala 35:39]
  Butterfly_2point BF ( // @[FNTT_2point.scala 34:18]
    .clock(BF_clock),
    .reset(BF_reset),
    .io_inData_0(BF_io_inData_0),
    .io_inData_1(BF_io_inData_1),
    .io_mod(BF_io_mod),
    .io_outData_0(BF_io_outData_0),
    .io_outData_1(BF_io_outData_1)
  );
  modular modular_0 ( // @[FNTT_2point.scala 35:39]
    .clock(modular_0_clock),
    .reset(modular_0_reset),
    .io_inData(modular_0_io_inData),
    .io_mod(modular_0_io_mod),
    .io_outData(modular_0_io_outData)
  );
  modular modular_1 ( // @[FNTT_2point.scala 35:39]
    .clock(modular_1_clock),
    .reset(modular_1_reset),
    .io_inData(modular_1_io_inData),
    .io_mod(modular_1_io_mod),
    .io_outData(modular_1_io_outData)
  );
  assign io_outData_0 = modular_0_io_outData; // @[FNTT_2point.scala 47:17]
  assign io_outData_1 = modular_1_io_outData; // @[FNTT_2point.scala 48:17]
  assign BF_clock = clock;
  assign BF_reset = reset;
  assign BF_io_inData_0 = io_inData_0; // @[FNTT_2point.scala 37:19]
  assign BF_io_inData_1 = io_inData_1; // @[FNTT_2point.scala 38:19]
  assign BF_io_mod = io_mod; // @[FNTT_2point.scala 40:13]
  assign modular_0_clock = clock;
  assign modular_0_reset = reset;
  assign modular_0_io_inData = BF_io_outData_0; // @[FNTT_2point.scala 44:24]
  assign modular_0_io_mod = io_mod; // @[FNTT_2point.scala 41:21]
  assign modular_1_clock = clock;
  assign modular_1_reset = reset;
  assign modular_1_io_inData = BF_io_outData_1; // @[FNTT_2point.scala 45:24]
  assign modular_1_io_mod = io_mod; // @[FNTT_2point.scala 42:21]
endmodule
module FNTT_4point(
  input        clock,
  input        reset,
  input  [7:0] io_inData_0,
  input  [7:0] io_inData_1,
  input  [7:0] io_inData_2,
  input  [7:0] io_inData_3,
  input  [7:0] io_omega_0,
  input  [7:0] io_omega_1,
  input  [7:0] io_mod,
  output [7:0] io_outData_0,
  output [7:0] io_outData_1,
  output [7:0] io_outData_2,
  output [7:0] io_outData_3
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  BF_0_clock; // @[FNTT_4point.scala 13:34]
  wire  BF_0_reset; // @[FNTT_4point.scala 13:34]
  wire [7:0] BF_0_io_inData_0; // @[FNTT_4point.scala 13:34]
  wire [7:0] BF_0_io_inData_1; // @[FNTT_4point.scala 13:34]
  wire [7:0] BF_0_io_mod; // @[FNTT_4point.scala 13:34]
  wire [7:0] BF_0_io_outData_0; // @[FNTT_4point.scala 13:34]
  wire [7:0] BF_0_io_outData_1; // @[FNTT_4point.scala 13:34]
  wire  BF_1_clock; // @[FNTT_4point.scala 13:34]
  wire  BF_1_reset; // @[FNTT_4point.scala 13:34]
  wire [7:0] BF_1_io_inData_0; // @[FNTT_4point.scala 13:34]
  wire [7:0] BF_1_io_inData_1; // @[FNTT_4point.scala 13:34]
  wire [7:0] BF_1_io_mod; // @[FNTT_4point.scala 13:34]
  wire [7:0] BF_1_io_outData_0; // @[FNTT_4point.scala 13:34]
  wire [7:0] BF_1_io_outData_1; // @[FNTT_4point.scala 13:34]
  wire  modBuffer_0_0_clock; // @[FNTT_4point.scala 14:43]
  wire  modBuffer_0_0_reset; // @[FNTT_4point.scala 14:43]
  wire [7:0] modBuffer_0_0_io_inData; // @[FNTT_4point.scala 14:43]
  wire [7:0] modBuffer_0_0_io_mod; // @[FNTT_4point.scala 14:43]
  wire [7:0] modBuffer_0_0_io_outData; // @[FNTT_4point.scala 14:43]
  wire  modBuffer_0_1_clock; // @[FNTT_4point.scala 14:43]
  wire  modBuffer_0_1_reset; // @[FNTT_4point.scala 14:43]
  wire [7:0] modBuffer_0_1_io_inData; // @[FNTT_4point.scala 14:43]
  wire [7:0] modBuffer_0_1_io_mod; // @[FNTT_4point.scala 14:43]
  wire [7:0] modBuffer_0_1_io_outData; // @[FNTT_4point.scala 14:43]
  wire  modBuffer_0_2_clock; // @[FNTT_4point.scala 14:43]
  wire  modBuffer_0_2_reset; // @[FNTT_4point.scala 14:43]
  wire [7:0] modBuffer_0_2_io_inData; // @[FNTT_4point.scala 14:43]
  wire [7:0] modBuffer_0_2_io_mod; // @[FNTT_4point.scala 14:43]
  wire [7:0] modBuffer_0_2_io_outData; // @[FNTT_4point.scala 14:43]
  wire  modBuffer_0_3_clock; // @[FNTT_4point.scala 14:43]
  wire  modBuffer_0_3_reset; // @[FNTT_4point.scala 14:43]
  wire [7:0] modBuffer_0_3_io_inData; // @[FNTT_4point.scala 14:43]
  wire [7:0] modBuffer_0_3_io_mod; // @[FNTT_4point.scala 14:43]
  wire [7:0] modBuffer_0_3_io_outData; // @[FNTT_4point.scala 14:43]
  wire  modBuffer_1_0_clock; // @[FNTT_4point.scala 36:43]
  wire  modBuffer_1_0_reset; // @[FNTT_4point.scala 36:43]
  wire [7:0] modBuffer_1_0_io_inData; // @[FNTT_4point.scala 36:43]
  wire [7:0] modBuffer_1_0_io_mod; // @[FNTT_4point.scala 36:43]
  wire [7:0] modBuffer_1_0_io_outData; // @[FNTT_4point.scala 36:43]
  wire  modBuffer_1_1_clock; // @[FNTT_4point.scala 36:43]
  wire  modBuffer_1_1_reset; // @[FNTT_4point.scala 36:43]
  wire [7:0] modBuffer_1_1_io_inData; // @[FNTT_4point.scala 36:43]
  wire [7:0] modBuffer_1_1_io_mod; // @[FNTT_4point.scala 36:43]
  wire [7:0] modBuffer_1_1_io_outData; // @[FNTT_4point.scala 36:43]
  wire  modBuffer_1_2_clock; // @[FNTT_4point.scala 36:43]
  wire  modBuffer_1_2_reset; // @[FNTT_4point.scala 36:43]
  wire [7:0] modBuffer_1_2_io_inData; // @[FNTT_4point.scala 36:43]
  wire [7:0] modBuffer_1_2_io_mod; // @[FNTT_4point.scala 36:43]
  wire [7:0] modBuffer_1_2_io_outData; // @[FNTT_4point.scala 36:43]
  wire  modBuffer_1_3_clock; // @[FNTT_4point.scala 36:43]
  wire  modBuffer_1_3_reset; // @[FNTT_4point.scala 36:43]
  wire [7:0] modBuffer_1_3_io_inData; // @[FNTT_4point.scala 36:43]
  wire [7:0] modBuffer_1_3_io_mod; // @[FNTT_4point.scala 36:43]
  wire [7:0] modBuffer_1_3_io_outData; // @[FNTT_4point.scala 36:43]
  wire  modBuffer_1_4_clock; // @[FNTT_4point.scala 36:43]
  wire  modBuffer_1_4_reset; // @[FNTT_4point.scala 36:43]
  wire [7:0] modBuffer_1_4_io_inData; // @[FNTT_4point.scala 36:43]
  wire [7:0] modBuffer_1_4_io_mod; // @[FNTT_4point.scala 36:43]
  wire [7:0] modBuffer_1_4_io_outData; // @[FNTT_4point.scala 36:43]
  wire  modBuffer_1_5_clock; // @[FNTT_4point.scala 36:43]
  wire  modBuffer_1_5_reset; // @[FNTT_4point.scala 36:43]
  wire [7:0] modBuffer_1_5_io_inData; // @[FNTT_4point.scala 36:43]
  wire [7:0] modBuffer_1_5_io_mod; // @[FNTT_4point.scala 36:43]
  wire [7:0] modBuffer_1_5_io_outData; // @[FNTT_4point.scala 36:43]
  wire  modBuffer_2_0_clock; // @[FNTT_4point.scala 50:42]
  wire  modBuffer_2_0_reset; // @[FNTT_4point.scala 50:42]
  wire [7:0] modBuffer_2_0_io_inData; // @[FNTT_4point.scala 50:42]
  wire [7:0] modBuffer_2_0_io_mod; // @[FNTT_4point.scala 50:42]
  wire [7:0] modBuffer_2_0_io_outData; // @[FNTT_4point.scala 50:42]
  wire  modBuffer_2_1_clock; // @[FNTT_4point.scala 50:42]
  wire  modBuffer_2_1_reset; // @[FNTT_4point.scala 50:42]
  wire [7:0] modBuffer_2_1_io_inData; // @[FNTT_4point.scala 50:42]
  wire [7:0] modBuffer_2_1_io_mod; // @[FNTT_4point.scala 50:42]
  wire [7:0] modBuffer_2_1_io_outData; // @[FNTT_4point.scala 50:42]
  wire  modBuffer_2_2_clock; // @[FNTT_4point.scala 50:42]
  wire  modBuffer_2_2_reset; // @[FNTT_4point.scala 50:42]
  wire [7:0] modBuffer_2_2_io_inData; // @[FNTT_4point.scala 50:42]
  wire [7:0] modBuffer_2_2_io_mod; // @[FNTT_4point.scala 50:42]
  wire [7:0] modBuffer_2_2_io_outData; // @[FNTT_4point.scala 50:42]
  wire  modBuffer_2_3_clock; // @[FNTT_4point.scala 50:42]
  wire  modBuffer_2_3_reset; // @[FNTT_4point.scala 50:42]
  wire [7:0] modBuffer_2_3_io_inData; // @[FNTT_4point.scala 50:42]
  wire [7:0] modBuffer_2_3_io_mod; // @[FNTT_4point.scala 50:42]
  wire [7:0] modBuffer_2_3_io_outData; // @[FNTT_4point.scala 50:42]
  reg [7:0] omeaaReg_0; // @[FNTT_4point.scala 15:25]
  reg [7:0] omeaaReg_1; // @[FNTT_4point.scala 15:25]
  wire [15:0] _modBuffer_0_2_io_inData_T = BF_1_io_outData_0 * omeaaReg_0; // @[FNTT_4point.scala 32:51]
  wire [15:0] _modBuffer_0_3_io_inData_T = BF_1_io_outData_1 * omeaaReg_1; // @[FNTT_4point.scala 33:51]
  reg [7:0] modReg; // @[FNTT_4point.scala 37:23]
  FNTT_2point BF_0 ( // @[FNTT_4point.scala 13:34]
    .clock(BF_0_clock),
    .reset(BF_0_reset),
    .io_inData_0(BF_0_io_inData_0),
    .io_inData_1(BF_0_io_inData_1),
    .io_mod(BF_0_io_mod),
    .io_outData_0(BF_0_io_outData_0),
    .io_outData_1(BF_0_io_outData_1)
  );
  FNTT_2point BF_1 ( // @[FNTT_4point.scala 13:34]
    .clock(BF_1_clock),
    .reset(BF_1_reset),
    .io_inData_0(BF_1_io_inData_0),
    .io_inData_1(BF_1_io_inData_1),
    .io_mod(BF_1_io_mod),
    .io_outData_0(BF_1_io_outData_0),
    .io_outData_1(BF_1_io_outData_1)
  );
  modular modBuffer_0_0 ( // @[FNTT_4point.scala 14:43]
    .clock(modBuffer_0_0_clock),
    .reset(modBuffer_0_0_reset),
    .io_inData(modBuffer_0_0_io_inData),
    .io_mod(modBuffer_0_0_io_mod),
    .io_outData(modBuffer_0_0_io_outData)
  );
  modular modBuffer_0_1 ( // @[FNTT_4point.scala 14:43]
    .clock(modBuffer_0_1_clock),
    .reset(modBuffer_0_1_reset),
    .io_inData(modBuffer_0_1_io_inData),
    .io_mod(modBuffer_0_1_io_mod),
    .io_outData(modBuffer_0_1_io_outData)
  );
  modular modBuffer_0_2 ( // @[FNTT_4point.scala 14:43]
    .clock(modBuffer_0_2_clock),
    .reset(modBuffer_0_2_reset),
    .io_inData(modBuffer_0_2_io_inData),
    .io_mod(modBuffer_0_2_io_mod),
    .io_outData(modBuffer_0_2_io_outData)
  );
  modular modBuffer_0_3 ( // @[FNTT_4point.scala 14:43]
    .clock(modBuffer_0_3_clock),
    .reset(modBuffer_0_3_reset),
    .io_inData(modBuffer_0_3_io_inData),
    .io_mod(modBuffer_0_3_io_mod),
    .io_outData(modBuffer_0_3_io_outData)
  );
  modular modBuffer_1_0 ( // @[FNTT_4point.scala 36:43]
    .clock(modBuffer_1_0_clock),
    .reset(modBuffer_1_0_reset),
    .io_inData(modBuffer_1_0_io_inData),
    .io_mod(modBuffer_1_0_io_mod),
    .io_outData(modBuffer_1_0_io_outData)
  );
  modular modBuffer_1_1 ( // @[FNTT_4point.scala 36:43]
    .clock(modBuffer_1_1_clock),
    .reset(modBuffer_1_1_reset),
    .io_inData(modBuffer_1_1_io_inData),
    .io_mod(modBuffer_1_1_io_mod),
    .io_outData(modBuffer_1_1_io_outData)
  );
  modular modBuffer_1_2 ( // @[FNTT_4point.scala 36:43]
    .clock(modBuffer_1_2_clock),
    .reset(modBuffer_1_2_reset),
    .io_inData(modBuffer_1_2_io_inData),
    .io_mod(modBuffer_1_2_io_mod),
    .io_outData(modBuffer_1_2_io_outData)
  );
  modular modBuffer_1_3 ( // @[FNTT_4point.scala 36:43]
    .clock(modBuffer_1_3_clock),
    .reset(modBuffer_1_3_reset),
    .io_inData(modBuffer_1_3_io_inData),
    .io_mod(modBuffer_1_3_io_mod),
    .io_outData(modBuffer_1_3_io_outData)
  );
  modular modBuffer_1_4 ( // @[FNTT_4point.scala 36:43]
    .clock(modBuffer_1_4_clock),
    .reset(modBuffer_1_4_reset),
    .io_inData(modBuffer_1_4_io_inData),
    .io_mod(modBuffer_1_4_io_mod),
    .io_outData(modBuffer_1_4_io_outData)
  );
  modular modBuffer_1_5 ( // @[FNTT_4point.scala 36:43]
    .clock(modBuffer_1_5_clock),
    .reset(modBuffer_1_5_reset),
    .io_inData(modBuffer_1_5_io_inData),
    .io_mod(modBuffer_1_5_io_mod),
    .io_outData(modBuffer_1_5_io_outData)
  );
  modular modBuffer_2_0 ( // @[FNTT_4point.scala 50:42]
    .clock(modBuffer_2_0_clock),
    .reset(modBuffer_2_0_reset),
    .io_inData(modBuffer_2_0_io_inData),
    .io_mod(modBuffer_2_0_io_mod),
    .io_outData(modBuffer_2_0_io_outData)
  );
  modular modBuffer_2_1 ( // @[FNTT_4point.scala 50:42]
    .clock(modBuffer_2_1_clock),
    .reset(modBuffer_2_1_reset),
    .io_inData(modBuffer_2_1_io_inData),
    .io_mod(modBuffer_2_1_io_mod),
    .io_outData(modBuffer_2_1_io_outData)
  );
  modular modBuffer_2_2 ( // @[FNTT_4point.scala 50:42]
    .clock(modBuffer_2_2_clock),
    .reset(modBuffer_2_2_reset),
    .io_inData(modBuffer_2_2_io_inData),
    .io_mod(modBuffer_2_2_io_mod),
    .io_outData(modBuffer_2_2_io_outData)
  );
  modular modBuffer_2_3 ( // @[FNTT_4point.scala 50:42]
    .clock(modBuffer_2_3_clock),
    .reset(modBuffer_2_3_reset),
    .io_inData(modBuffer_2_3_io_inData),
    .io_mod(modBuffer_2_3_io_mod),
    .io_outData(modBuffer_2_3_io_outData)
  );
  assign io_outData_0 = modBuffer_2_0_io_outData; // @[FNTT_4point.scala 60:38]
  assign io_outData_1 = modBuffer_2_1_io_outData; // @[FNTT_4point.scala 60:38]
  assign io_outData_2 = modBuffer_2_2_io_outData; // @[FNTT_4point.scala 60:38]
  assign io_outData_3 = modBuffer_2_3_io_outData; // @[FNTT_4point.scala 60:38]
  assign BF_0_clock = clock;
  assign BF_0_reset = reset;
  assign BF_0_io_inData_0 = io_inData_0; // @[FNTT_4point.scala 25:22]
  assign BF_0_io_inData_1 = io_inData_1; // @[FNTT_4point.scala 26:22]
  assign BF_0_io_mod = io_mod; // @[FNTT_4point.scala 17:16]
  assign BF_1_clock = clock;
  assign BF_1_reset = reset;
  assign BF_1_io_inData_0 = io_inData_2; // @[FNTT_4point.scala 27:22]
  assign BF_1_io_inData_1 = io_inData_3; // @[FNTT_4point.scala 28:22]
  assign BF_1_io_mod = io_mod; // @[FNTT_4point.scala 18:16]
  assign modBuffer_0_0_clock = clock;
  assign modBuffer_0_0_reset = reset;
  assign modBuffer_0_0_io_inData = BF_0_io_outData_0; // @[FNTT_4point.scala 30:28]
  assign modBuffer_0_0_io_mod = io_mod; // @[FNTT_4point.scala 19:46]
  assign modBuffer_0_1_clock = clock;
  assign modBuffer_0_1_reset = reset;
  assign modBuffer_0_1_io_inData = BF_0_io_outData_1; // @[FNTT_4point.scala 31:28]
  assign modBuffer_0_1_io_mod = io_mod; // @[FNTT_4point.scala 19:46]
  assign modBuffer_0_2_clock = clock;
  assign modBuffer_0_2_reset = reset;
  assign modBuffer_0_2_io_inData = _modBuffer_0_2_io_inData_T[7:0]; // @[FNTT_4point.scala 32:28]
  assign modBuffer_0_2_io_mod = io_mod; // @[FNTT_4point.scala 19:46]
  assign modBuffer_0_3_clock = clock;
  assign modBuffer_0_3_reset = reset;
  assign modBuffer_0_3_io_inData = _modBuffer_0_3_io_inData_T[7:0]; // @[FNTT_4point.scala 33:28]
  assign modBuffer_0_3_io_mod = io_mod; // @[FNTT_4point.scala 19:46]
  assign modBuffer_1_0_clock = clock;
  assign modBuffer_1_0_reset = reset;
  assign modBuffer_1_0_io_inData = modBuffer_0_0_io_outData; // @[FNTT_4point.scala 41:28]
  assign modBuffer_1_0_io_mod = io_mod; // @[FNTT_4point.scala 38:46]
  assign modBuffer_1_1_clock = clock;
  assign modBuffer_1_1_reset = reset;
  assign modBuffer_1_1_io_inData = modBuffer_0_1_io_outData; // @[FNTT_4point.scala 42:28]
  assign modBuffer_1_1_io_mod = io_mod; // @[FNTT_4point.scala 38:46]
  assign modBuffer_1_2_clock = clock;
  assign modBuffer_1_2_reset = reset;
  assign modBuffer_1_2_io_inData = modBuffer_0_2_io_outData; // @[FNTT_4point.scala 43:28]
  assign modBuffer_1_2_io_mod = io_mod; // @[FNTT_4point.scala 38:46]
  assign modBuffer_1_3_clock = clock;
  assign modBuffer_1_3_reset = reset;
  assign modBuffer_1_3_io_inData = modBuffer_0_3_io_outData; // @[FNTT_4point.scala 44:28]
  assign modBuffer_1_3_io_mod = io_mod; // @[FNTT_4point.scala 38:46]
  assign modBuffer_1_4_clock = clock;
  assign modBuffer_1_4_reset = reset;
  assign modBuffer_1_4_io_inData = modReg - modBuffer_0_2_io_outData; // @[FNTT_4point.scala 46:38]
  assign modBuffer_1_4_io_mod = io_mod; // @[FNTT_4point.scala 38:46]
  assign modBuffer_1_5_clock = clock;
  assign modBuffer_1_5_reset = reset;
  assign modBuffer_1_5_io_inData = modReg - modBuffer_0_3_io_outData; // @[FNTT_4point.scala 47:38]
  assign modBuffer_1_5_io_mod = io_mod; // @[FNTT_4point.scala 38:46]
  assign modBuffer_2_0_clock = clock;
  assign modBuffer_2_0_reset = reset;
  assign modBuffer_2_0_io_inData = modBuffer_1_0_io_outData + modBuffer_1_2_io_outData; // @[FNTT_4point.scala 52:57]
  assign modBuffer_2_0_io_mod = io_mod; // @[FNTT_4point.scala 51:46]
  assign modBuffer_2_1_clock = clock;
  assign modBuffer_2_1_reset = reset;
  assign modBuffer_2_1_io_inData = modBuffer_1_1_io_outData + modBuffer_1_3_io_outData; // @[FNTT_4point.scala 53:57]
  assign modBuffer_2_1_io_mod = io_mod; // @[FNTT_4point.scala 51:46]
  assign modBuffer_2_2_clock = clock;
  assign modBuffer_2_2_reset = reset;
  assign modBuffer_2_2_io_inData = modBuffer_1_4_io_outData + modBuffer_1_0_io_outData; // @[FNTT_4point.scala 55:57]
  assign modBuffer_2_2_io_mod = io_mod; // @[FNTT_4point.scala 51:46]
  assign modBuffer_2_3_clock = clock;
  assign modBuffer_2_3_reset = reset;
  assign modBuffer_2_3_io_inData = modBuffer_1_5_io_outData + modBuffer_1_1_io_outData; // @[FNTT_4point.scala 56:57]
  assign modBuffer_2_3_io_mod = io_mod; // @[FNTT_4point.scala 51:46]
  always @(posedge clock) begin
    if (reset) begin // @[FNTT_4point.scala 15:25]
      omeaaReg_0 <= 8'h0; // @[FNTT_4point.scala 15:25]
    end else begin
      omeaaReg_0 <= io_omega_0; // @[FNTT_4point.scala 21:15]
    end
    if (reset) begin // @[FNTT_4point.scala 15:25]
      omeaaReg_1 <= 8'h0; // @[FNTT_4point.scala 15:25]
    end else begin
      omeaaReg_1 <= io_omega_1; // @[FNTT_4point.scala 22:15]
    end
    if (reset) begin // @[FNTT_4point.scala 37:23]
      modReg <= 8'h0; // @[FNTT_4point.scala 37:23]
    end else begin
      modReg <= io_mod; // @[FNTT_4point.scala 39:10]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  omeaaReg_0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  omeaaReg_1 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  modReg = _RAND_2[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FNTT_8point(
  input        clock,
  input        reset,
  input  [7:0] io_inData_0,
  input  [7:0] io_inData_1,
  input  [7:0] io_inData_2,
  input  [7:0] io_inData_3,
  input  [7:0] io_inData_4,
  input  [7:0] io_inData_5,
  input  [7:0] io_inData_6,
  input  [7:0] io_inData_7,
  input  [7:0] io_omega_0,
  input  [7:0] io_omega_1,
  input  [7:0] io_omega_2,
  input  [7:0] io_omega_3,
  input  [7:0] io_mod,
  output [7:0] io_outData_0,
  output [7:0] io_outData_1,
  output [7:0] io_outData_2,
  output [7:0] io_outData_3,
  output [7:0] io_outData_4,
  output [7:0] io_outData_5,
  output [7:0] io_outData_6,
  output [7:0] io_outData_7
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire [7:0] reOrder_io_inData_0; // @[FNTT_8point.scala 14:23]
  wire [7:0] reOrder_io_inData_1; // @[FNTT_8point.scala 14:23]
  wire [7:0] reOrder_io_inData_2; // @[FNTT_8point.scala 14:23]
  wire [7:0] reOrder_io_inData_3; // @[FNTT_8point.scala 14:23]
  wire [7:0] reOrder_io_inData_4; // @[FNTT_8point.scala 14:23]
  wire [7:0] reOrder_io_inData_5; // @[FNTT_8point.scala 14:23]
  wire [7:0] reOrder_io_inData_6; // @[FNTT_8point.scala 14:23]
  wire [7:0] reOrder_io_inData_7; // @[FNTT_8point.scala 14:23]
  wire [7:0] reOrder_io_outData_0; // @[FNTT_8point.scala 14:23]
  wire [7:0] reOrder_io_outData_1; // @[FNTT_8point.scala 14:23]
  wire [7:0] reOrder_io_outData_2; // @[FNTT_8point.scala 14:23]
  wire [7:0] reOrder_io_outData_3; // @[FNTT_8point.scala 14:23]
  wire [7:0] reOrder_io_outData_4; // @[FNTT_8point.scala 14:23]
  wire [7:0] reOrder_io_outData_5; // @[FNTT_8point.scala 14:23]
  wire [7:0] reOrder_io_outData_6; // @[FNTT_8point.scala 14:23]
  wire [7:0] reOrder_io_outData_7; // @[FNTT_8point.scala 14:23]
  wire  BF_0_clock; // @[FNTT_8point.scala 26:33]
  wire  BF_0_reset; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_0_io_inData_0; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_0_io_inData_1; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_0_io_inData_2; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_0_io_inData_3; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_0_io_omega_0; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_0_io_omega_1; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_0_io_mod; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_0_io_outData_0; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_0_io_outData_1; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_0_io_outData_2; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_0_io_outData_3; // @[FNTT_8point.scala 26:33]
  wire  BF_1_clock; // @[FNTT_8point.scala 26:33]
  wire  BF_1_reset; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_1_io_inData_0; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_1_io_inData_1; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_1_io_inData_2; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_1_io_inData_3; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_1_io_omega_0; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_1_io_omega_1; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_1_io_mod; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_1_io_outData_0; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_1_io_outData_1; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_1_io_outData_2; // @[FNTT_8point.scala 26:33]
  wire [7:0] BF_1_io_outData_3; // @[FNTT_8point.scala 26:33]
  wire  modBuffer_0_0_clock; // @[FNTT_8point.scala 27:42]
  wire  modBuffer_0_0_reset; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_0_io_inData; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_0_io_mod; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_0_io_outData; // @[FNTT_8point.scala 27:42]
  wire  modBuffer_0_1_clock; // @[FNTT_8point.scala 27:42]
  wire  modBuffer_0_1_reset; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_1_io_inData; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_1_io_mod; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_1_io_outData; // @[FNTT_8point.scala 27:42]
  wire  modBuffer_0_2_clock; // @[FNTT_8point.scala 27:42]
  wire  modBuffer_0_2_reset; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_2_io_inData; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_2_io_mod; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_2_io_outData; // @[FNTT_8point.scala 27:42]
  wire  modBuffer_0_3_clock; // @[FNTT_8point.scala 27:42]
  wire  modBuffer_0_3_reset; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_3_io_inData; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_3_io_mod; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_3_io_outData; // @[FNTT_8point.scala 27:42]
  wire  modBuffer_0_4_clock; // @[FNTT_8point.scala 27:42]
  wire  modBuffer_0_4_reset; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_4_io_inData; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_4_io_mod; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_4_io_outData; // @[FNTT_8point.scala 27:42]
  wire  modBuffer_0_5_clock; // @[FNTT_8point.scala 27:42]
  wire  modBuffer_0_5_reset; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_5_io_inData; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_5_io_mod; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_5_io_outData; // @[FNTT_8point.scala 27:42]
  wire  modBuffer_0_6_clock; // @[FNTT_8point.scala 27:42]
  wire  modBuffer_0_6_reset; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_6_io_inData; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_6_io_mod; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_6_io_outData; // @[FNTT_8point.scala 27:42]
  wire  modBuffer_0_7_clock; // @[FNTT_8point.scala 27:42]
  wire  modBuffer_0_7_reset; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_7_io_inData; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_7_io_mod; // @[FNTT_8point.scala 27:42]
  wire [7:0] modBuffer_0_7_io_outData; // @[FNTT_8point.scala 27:42]
  wire  modBuffer_1_0_clock; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_0_reset; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_0_io_inData; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_0_io_mod; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_0_io_outData; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_1_clock; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_1_reset; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_1_io_inData; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_1_io_mod; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_1_io_outData; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_2_clock; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_2_reset; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_2_io_inData; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_2_io_mod; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_2_io_outData; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_3_clock; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_3_reset; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_3_io_inData; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_3_io_mod; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_3_io_outData; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_4_clock; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_4_reset; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_4_io_inData; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_4_io_mod; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_4_io_outData; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_5_clock; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_5_reset; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_5_io_inData; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_5_io_mod; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_5_io_outData; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_6_clock; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_6_reset; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_6_io_inData; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_6_io_mod; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_6_io_outData; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_7_clock; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_7_reset; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_7_io_inData; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_7_io_mod; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_7_io_outData; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_8_clock; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_8_reset; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_8_io_inData; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_8_io_mod; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_8_io_outData; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_9_clock; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_9_reset; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_9_io_inData; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_9_io_mod; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_9_io_outData; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_10_clock; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_10_reset; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_10_io_inData; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_10_io_mod; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_10_io_outData; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_11_clock; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_1_11_reset; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_11_io_inData; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_11_io_mod; // @[FNTT_8point.scala 55:44]
  wire [7:0] modBuffer_1_11_io_outData; // @[FNTT_8point.scala 55:44]
  wire  modBuffer_2_0_clock; // @[FNTT_8point.scala 64:42]
  wire  modBuffer_2_0_reset; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_0_io_inData; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_0_io_mod; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_0_io_outData; // @[FNTT_8point.scala 64:42]
  wire  modBuffer_2_1_clock; // @[FNTT_8point.scala 64:42]
  wire  modBuffer_2_1_reset; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_1_io_inData; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_1_io_mod; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_1_io_outData; // @[FNTT_8point.scala 64:42]
  wire  modBuffer_2_2_clock; // @[FNTT_8point.scala 64:42]
  wire  modBuffer_2_2_reset; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_2_io_inData; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_2_io_mod; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_2_io_outData; // @[FNTT_8point.scala 64:42]
  wire  modBuffer_2_3_clock; // @[FNTT_8point.scala 64:42]
  wire  modBuffer_2_3_reset; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_3_io_inData; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_3_io_mod; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_3_io_outData; // @[FNTT_8point.scala 64:42]
  wire  modBuffer_2_4_clock; // @[FNTT_8point.scala 64:42]
  wire  modBuffer_2_4_reset; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_4_io_inData; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_4_io_mod; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_4_io_outData; // @[FNTT_8point.scala 64:42]
  wire  modBuffer_2_5_clock; // @[FNTT_8point.scala 64:42]
  wire  modBuffer_2_5_reset; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_5_io_inData; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_5_io_mod; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_5_io_outData; // @[FNTT_8point.scala 64:42]
  wire  modBuffer_2_6_clock; // @[FNTT_8point.scala 64:42]
  wire  modBuffer_2_6_reset; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_6_io_inData; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_6_io_mod; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_6_io_outData; // @[FNTT_8point.scala 64:42]
  wire  modBuffer_2_7_clock; // @[FNTT_8point.scala 64:42]
  wire  modBuffer_2_7_reset; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_7_io_inData; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_7_io_mod; // @[FNTT_8point.scala 64:42]
  wire [7:0] modBuffer_2_7_io_outData; // @[FNTT_8point.scala 64:42]
  reg [7:0] omegaReg_0; // @[FNTT_8point.scala 28:25]
  reg [7:0] omegaReg_1; // @[FNTT_8point.scala 28:25]
  reg [7:0] omegaReg_2; // @[FNTT_8point.scala 28:25]
  reg [7:0] omegaReg_3; // @[FNTT_8point.scala 28:25]
  wire [15:0] _modBuffer_0_4_io_inData_T = BF_1_io_outData_0 * omegaReg_0; // @[FNTT_8point.scala 49:51]
  wire [15:0] _modBuffer_0_5_io_inData_T = BF_1_io_outData_1 * omegaReg_1; // @[FNTT_8point.scala 50:51]
  wire [15:0] _modBuffer_0_6_io_inData_T = BF_1_io_outData_2 * omegaReg_2; // @[FNTT_8point.scala 51:51]
  wire [15:0] _modBuffer_0_7_io_inData_T = BF_1_io_outData_3 * omegaReg_3; // @[FNTT_8point.scala 52:51]
  reg [7:0] modReg; // @[FNTT_8point.scala 56:23]
  BitReverseOrder reOrder ( // @[FNTT_8point.scala 14:23]
    .io_inData_0(reOrder_io_inData_0),
    .io_inData_1(reOrder_io_inData_1),
    .io_inData_2(reOrder_io_inData_2),
    .io_inData_3(reOrder_io_inData_3),
    .io_inData_4(reOrder_io_inData_4),
    .io_inData_5(reOrder_io_inData_5),
    .io_inData_6(reOrder_io_inData_6),
    .io_inData_7(reOrder_io_inData_7),
    .io_outData_0(reOrder_io_outData_0),
    .io_outData_1(reOrder_io_outData_1),
    .io_outData_2(reOrder_io_outData_2),
    .io_outData_3(reOrder_io_outData_3),
    .io_outData_4(reOrder_io_outData_4),
    .io_outData_5(reOrder_io_outData_5),
    .io_outData_6(reOrder_io_outData_6),
    .io_outData_7(reOrder_io_outData_7)
  );
  FNTT_4point BF_0 ( // @[FNTT_8point.scala 26:33]
    .clock(BF_0_clock),
    .reset(BF_0_reset),
    .io_inData_0(BF_0_io_inData_0),
    .io_inData_1(BF_0_io_inData_1),
    .io_inData_2(BF_0_io_inData_2),
    .io_inData_3(BF_0_io_inData_3),
    .io_omega_0(BF_0_io_omega_0),
    .io_omega_1(BF_0_io_omega_1),
    .io_mod(BF_0_io_mod),
    .io_outData_0(BF_0_io_outData_0),
    .io_outData_1(BF_0_io_outData_1),
    .io_outData_2(BF_0_io_outData_2),
    .io_outData_3(BF_0_io_outData_3)
  );
  FNTT_4point BF_1 ( // @[FNTT_8point.scala 26:33]
    .clock(BF_1_clock),
    .reset(BF_1_reset),
    .io_inData_0(BF_1_io_inData_0),
    .io_inData_1(BF_1_io_inData_1),
    .io_inData_2(BF_1_io_inData_2),
    .io_inData_3(BF_1_io_inData_3),
    .io_omega_0(BF_1_io_omega_0),
    .io_omega_1(BF_1_io_omega_1),
    .io_mod(BF_1_io_mod),
    .io_outData_0(BF_1_io_outData_0),
    .io_outData_1(BF_1_io_outData_1),
    .io_outData_2(BF_1_io_outData_2),
    .io_outData_3(BF_1_io_outData_3)
  );
  modular modBuffer_0_0 ( // @[FNTT_8point.scala 27:42]
    .clock(modBuffer_0_0_clock),
    .reset(modBuffer_0_0_reset),
    .io_inData(modBuffer_0_0_io_inData),
    .io_mod(modBuffer_0_0_io_mod),
    .io_outData(modBuffer_0_0_io_outData)
  );
  modular modBuffer_0_1 ( // @[FNTT_8point.scala 27:42]
    .clock(modBuffer_0_1_clock),
    .reset(modBuffer_0_1_reset),
    .io_inData(modBuffer_0_1_io_inData),
    .io_mod(modBuffer_0_1_io_mod),
    .io_outData(modBuffer_0_1_io_outData)
  );
  modular modBuffer_0_2 ( // @[FNTT_8point.scala 27:42]
    .clock(modBuffer_0_2_clock),
    .reset(modBuffer_0_2_reset),
    .io_inData(modBuffer_0_2_io_inData),
    .io_mod(modBuffer_0_2_io_mod),
    .io_outData(modBuffer_0_2_io_outData)
  );
  modular modBuffer_0_3 ( // @[FNTT_8point.scala 27:42]
    .clock(modBuffer_0_3_clock),
    .reset(modBuffer_0_3_reset),
    .io_inData(modBuffer_0_3_io_inData),
    .io_mod(modBuffer_0_3_io_mod),
    .io_outData(modBuffer_0_3_io_outData)
  );
  modular modBuffer_0_4 ( // @[FNTT_8point.scala 27:42]
    .clock(modBuffer_0_4_clock),
    .reset(modBuffer_0_4_reset),
    .io_inData(modBuffer_0_4_io_inData),
    .io_mod(modBuffer_0_4_io_mod),
    .io_outData(modBuffer_0_4_io_outData)
  );
  modular modBuffer_0_5 ( // @[FNTT_8point.scala 27:42]
    .clock(modBuffer_0_5_clock),
    .reset(modBuffer_0_5_reset),
    .io_inData(modBuffer_0_5_io_inData),
    .io_mod(modBuffer_0_5_io_mod),
    .io_outData(modBuffer_0_5_io_outData)
  );
  modular modBuffer_0_6 ( // @[FNTT_8point.scala 27:42]
    .clock(modBuffer_0_6_clock),
    .reset(modBuffer_0_6_reset),
    .io_inData(modBuffer_0_6_io_inData),
    .io_mod(modBuffer_0_6_io_mod),
    .io_outData(modBuffer_0_6_io_outData)
  );
  modular modBuffer_0_7 ( // @[FNTT_8point.scala 27:42]
    .clock(modBuffer_0_7_clock),
    .reset(modBuffer_0_7_reset),
    .io_inData(modBuffer_0_7_io_inData),
    .io_mod(modBuffer_0_7_io_mod),
    .io_outData(modBuffer_0_7_io_outData)
  );
  modular modBuffer_1_0 ( // @[FNTT_8point.scala 55:44]
    .clock(modBuffer_1_0_clock),
    .reset(modBuffer_1_0_reset),
    .io_inData(modBuffer_1_0_io_inData),
    .io_mod(modBuffer_1_0_io_mod),
    .io_outData(modBuffer_1_0_io_outData)
  );
  modular modBuffer_1_1 ( // @[FNTT_8point.scala 55:44]
    .clock(modBuffer_1_1_clock),
    .reset(modBuffer_1_1_reset),
    .io_inData(modBuffer_1_1_io_inData),
    .io_mod(modBuffer_1_1_io_mod),
    .io_outData(modBuffer_1_1_io_outData)
  );
  modular modBuffer_1_2 ( // @[FNTT_8point.scala 55:44]
    .clock(modBuffer_1_2_clock),
    .reset(modBuffer_1_2_reset),
    .io_inData(modBuffer_1_2_io_inData),
    .io_mod(modBuffer_1_2_io_mod),
    .io_outData(modBuffer_1_2_io_outData)
  );
  modular modBuffer_1_3 ( // @[FNTT_8point.scala 55:44]
    .clock(modBuffer_1_3_clock),
    .reset(modBuffer_1_3_reset),
    .io_inData(modBuffer_1_3_io_inData),
    .io_mod(modBuffer_1_3_io_mod),
    .io_outData(modBuffer_1_3_io_outData)
  );
  modular modBuffer_1_4 ( // @[FNTT_8point.scala 55:44]
    .clock(modBuffer_1_4_clock),
    .reset(modBuffer_1_4_reset),
    .io_inData(modBuffer_1_4_io_inData),
    .io_mod(modBuffer_1_4_io_mod),
    .io_outData(modBuffer_1_4_io_outData)
  );
  modular modBuffer_1_5 ( // @[FNTT_8point.scala 55:44]
    .clock(modBuffer_1_5_clock),
    .reset(modBuffer_1_5_reset),
    .io_inData(modBuffer_1_5_io_inData),
    .io_mod(modBuffer_1_5_io_mod),
    .io_outData(modBuffer_1_5_io_outData)
  );
  modular modBuffer_1_6 ( // @[FNTT_8point.scala 55:44]
    .clock(modBuffer_1_6_clock),
    .reset(modBuffer_1_6_reset),
    .io_inData(modBuffer_1_6_io_inData),
    .io_mod(modBuffer_1_6_io_mod),
    .io_outData(modBuffer_1_6_io_outData)
  );
  modular modBuffer_1_7 ( // @[FNTT_8point.scala 55:44]
    .clock(modBuffer_1_7_clock),
    .reset(modBuffer_1_7_reset),
    .io_inData(modBuffer_1_7_io_inData),
    .io_mod(modBuffer_1_7_io_mod),
    .io_outData(modBuffer_1_7_io_outData)
  );
  modular modBuffer_1_8 ( // @[FNTT_8point.scala 55:44]
    .clock(modBuffer_1_8_clock),
    .reset(modBuffer_1_8_reset),
    .io_inData(modBuffer_1_8_io_inData),
    .io_mod(modBuffer_1_8_io_mod),
    .io_outData(modBuffer_1_8_io_outData)
  );
  modular modBuffer_1_9 ( // @[FNTT_8point.scala 55:44]
    .clock(modBuffer_1_9_clock),
    .reset(modBuffer_1_9_reset),
    .io_inData(modBuffer_1_9_io_inData),
    .io_mod(modBuffer_1_9_io_mod),
    .io_outData(modBuffer_1_9_io_outData)
  );
  modular modBuffer_1_10 ( // @[FNTT_8point.scala 55:44]
    .clock(modBuffer_1_10_clock),
    .reset(modBuffer_1_10_reset),
    .io_inData(modBuffer_1_10_io_inData),
    .io_mod(modBuffer_1_10_io_mod),
    .io_outData(modBuffer_1_10_io_outData)
  );
  modular modBuffer_1_11 ( // @[FNTT_8point.scala 55:44]
    .clock(modBuffer_1_11_clock),
    .reset(modBuffer_1_11_reset),
    .io_inData(modBuffer_1_11_io_inData),
    .io_mod(modBuffer_1_11_io_mod),
    .io_outData(modBuffer_1_11_io_outData)
  );
  modular modBuffer_2_0 ( // @[FNTT_8point.scala 64:42]
    .clock(modBuffer_2_0_clock),
    .reset(modBuffer_2_0_reset),
    .io_inData(modBuffer_2_0_io_inData),
    .io_mod(modBuffer_2_0_io_mod),
    .io_outData(modBuffer_2_0_io_outData)
  );
  modular modBuffer_2_1 ( // @[FNTT_8point.scala 64:42]
    .clock(modBuffer_2_1_clock),
    .reset(modBuffer_2_1_reset),
    .io_inData(modBuffer_2_1_io_inData),
    .io_mod(modBuffer_2_1_io_mod),
    .io_outData(modBuffer_2_1_io_outData)
  );
  modular modBuffer_2_2 ( // @[FNTT_8point.scala 64:42]
    .clock(modBuffer_2_2_clock),
    .reset(modBuffer_2_2_reset),
    .io_inData(modBuffer_2_2_io_inData),
    .io_mod(modBuffer_2_2_io_mod),
    .io_outData(modBuffer_2_2_io_outData)
  );
  modular modBuffer_2_3 ( // @[FNTT_8point.scala 64:42]
    .clock(modBuffer_2_3_clock),
    .reset(modBuffer_2_3_reset),
    .io_inData(modBuffer_2_3_io_inData),
    .io_mod(modBuffer_2_3_io_mod),
    .io_outData(modBuffer_2_3_io_outData)
  );
  modular modBuffer_2_4 ( // @[FNTT_8point.scala 64:42]
    .clock(modBuffer_2_4_clock),
    .reset(modBuffer_2_4_reset),
    .io_inData(modBuffer_2_4_io_inData),
    .io_mod(modBuffer_2_4_io_mod),
    .io_outData(modBuffer_2_4_io_outData)
  );
  modular modBuffer_2_5 ( // @[FNTT_8point.scala 64:42]
    .clock(modBuffer_2_5_clock),
    .reset(modBuffer_2_5_reset),
    .io_inData(modBuffer_2_5_io_inData),
    .io_mod(modBuffer_2_5_io_mod),
    .io_outData(modBuffer_2_5_io_outData)
  );
  modular modBuffer_2_6 ( // @[FNTT_8point.scala 64:42]
    .clock(modBuffer_2_6_clock),
    .reset(modBuffer_2_6_reset),
    .io_inData(modBuffer_2_6_io_inData),
    .io_mod(modBuffer_2_6_io_mod),
    .io_outData(modBuffer_2_6_io_outData)
  );
  modular modBuffer_2_7 ( // @[FNTT_8point.scala 64:42]
    .clock(modBuffer_2_7_clock),
    .reset(modBuffer_2_7_reset),
    .io_inData(modBuffer_2_7_io_inData),
    .io_mod(modBuffer_2_7_io_mod),
    .io_outData(modBuffer_2_7_io_outData)
  );
  assign io_outData_0 = modBuffer_2_0_io_outData; // @[FNTT_8point.scala 79:38]
  assign io_outData_1 = modBuffer_2_1_io_outData; // @[FNTT_8point.scala 79:38]
  assign io_outData_2 = modBuffer_2_2_io_outData; // @[FNTT_8point.scala 79:38]
  assign io_outData_3 = modBuffer_2_3_io_outData; // @[FNTT_8point.scala 79:38]
  assign io_outData_4 = modBuffer_2_4_io_outData; // @[FNTT_8point.scala 79:38]
  assign io_outData_5 = modBuffer_2_5_io_outData; // @[FNTT_8point.scala 79:38]
  assign io_outData_6 = modBuffer_2_6_io_outData; // @[FNTT_8point.scala 79:38]
  assign io_outData_7 = modBuffer_2_7_io_outData; // @[FNTT_8point.scala 79:38]
  assign reOrder_io_inData_0 = io_inData_0; // @[FNTT_8point.scala 15:24]
  assign reOrder_io_inData_1 = io_inData_1; // @[FNTT_8point.scala 16:24]
  assign reOrder_io_inData_2 = io_inData_2; // @[FNTT_8point.scala 17:24]
  assign reOrder_io_inData_3 = io_inData_3; // @[FNTT_8point.scala 18:24]
  assign reOrder_io_inData_4 = io_inData_4; // @[FNTT_8point.scala 19:24]
  assign reOrder_io_inData_5 = io_inData_5; // @[FNTT_8point.scala 20:24]
  assign reOrder_io_inData_6 = io_inData_6; // @[FNTT_8point.scala 21:24]
  assign reOrder_io_inData_7 = io_inData_7; // @[FNTT_8point.scala 22:24]
  assign BF_0_clock = clock;
  assign BF_0_reset = reset;
  assign BF_0_io_inData_0 = reOrder_io_outData_0; // @[FNTT_8point.scala 35:26]
  assign BF_0_io_inData_1 = reOrder_io_outData_1; // @[FNTT_8point.scala 35:26]
  assign BF_0_io_inData_2 = reOrder_io_outData_2; // @[FNTT_8point.scala 35:26]
  assign BF_0_io_inData_3 = reOrder_io_outData_3; // @[FNTT_8point.scala 35:26]
  assign BF_0_io_omega_0 = io_omega_0; // @[FNTT_8point.scala 40:23]
  assign BF_0_io_omega_1 = io_omega_2; // @[FNTT_8point.scala 41:23]
  assign BF_0_io_mod = io_mod; // @[FNTT_8point.scala 30:16]
  assign BF_1_clock = clock;
  assign BF_1_reset = reset;
  assign BF_1_io_inData_0 = reOrder_io_outData_4; // @[FNTT_8point.scala 35:26]
  assign BF_1_io_inData_1 = reOrder_io_outData_5; // @[FNTT_8point.scala 35:26]
  assign BF_1_io_inData_2 = reOrder_io_outData_6; // @[FNTT_8point.scala 35:26]
  assign BF_1_io_inData_3 = reOrder_io_outData_7; // @[FNTT_8point.scala 35:26]
  assign BF_1_io_omega_0 = io_omega_0; // @[FNTT_8point.scala 40:23]
  assign BF_1_io_omega_1 = io_omega_2; // @[FNTT_8point.scala 41:23]
  assign BF_1_io_mod = io_mod; // @[FNTT_8point.scala 31:16]
  assign modBuffer_0_0_clock = clock;
  assign modBuffer_0_0_reset = reset;
  assign modBuffer_0_0_io_inData = BF_0_io_outData_0; // @[FNTT_8point.scala 45:28]
  assign modBuffer_0_0_io_mod = io_mod; // @[FNTT_8point.scala 37:46]
  assign modBuffer_0_1_clock = clock;
  assign modBuffer_0_1_reset = reset;
  assign modBuffer_0_1_io_inData = BF_0_io_outData_1; // @[FNTT_8point.scala 46:28]
  assign modBuffer_0_1_io_mod = io_mod; // @[FNTT_8point.scala 37:46]
  assign modBuffer_0_2_clock = clock;
  assign modBuffer_0_2_reset = reset;
  assign modBuffer_0_2_io_inData = BF_0_io_outData_2; // @[FNTT_8point.scala 47:28]
  assign modBuffer_0_2_io_mod = io_mod; // @[FNTT_8point.scala 37:46]
  assign modBuffer_0_3_clock = clock;
  assign modBuffer_0_3_reset = reset;
  assign modBuffer_0_3_io_inData = BF_0_io_outData_3; // @[FNTT_8point.scala 48:28]
  assign modBuffer_0_3_io_mod = io_mod; // @[FNTT_8point.scala 37:46]
  assign modBuffer_0_4_clock = clock;
  assign modBuffer_0_4_reset = reset;
  assign modBuffer_0_4_io_inData = _modBuffer_0_4_io_inData_T[7:0]; // @[FNTT_8point.scala 49:28]
  assign modBuffer_0_4_io_mod = io_mod; // @[FNTT_8point.scala 37:46]
  assign modBuffer_0_5_clock = clock;
  assign modBuffer_0_5_reset = reset;
  assign modBuffer_0_5_io_inData = _modBuffer_0_5_io_inData_T[7:0]; // @[FNTT_8point.scala 50:28]
  assign modBuffer_0_5_io_mod = io_mod; // @[FNTT_8point.scala 37:46]
  assign modBuffer_0_6_clock = clock;
  assign modBuffer_0_6_reset = reset;
  assign modBuffer_0_6_io_inData = _modBuffer_0_6_io_inData_T[7:0]; // @[FNTT_8point.scala 51:28]
  assign modBuffer_0_6_io_mod = io_mod; // @[FNTT_8point.scala 37:46]
  assign modBuffer_0_7_clock = clock;
  assign modBuffer_0_7_reset = reset;
  assign modBuffer_0_7_io_inData = _modBuffer_0_7_io_inData_T[7:0]; // @[FNTT_8point.scala 52:28]
  assign modBuffer_0_7_io_mod = io_mod; // @[FNTT_8point.scala 37:46]
  assign modBuffer_1_0_clock = clock;
  assign modBuffer_1_0_reset = reset;
  assign modBuffer_1_0_io_inData = modBuffer_0_0_io_outData; // @[FNTT_8point.scala 60:49]
  assign modBuffer_1_0_io_mod = io_mod; // @[FNTT_8point.scala 57:47]
  assign modBuffer_1_1_clock = clock;
  assign modBuffer_1_1_reset = reset;
  assign modBuffer_1_1_io_inData = modBuffer_0_1_io_outData; // @[FNTT_8point.scala 60:49]
  assign modBuffer_1_1_io_mod = io_mod; // @[FNTT_8point.scala 57:47]
  assign modBuffer_1_2_clock = clock;
  assign modBuffer_1_2_reset = reset;
  assign modBuffer_1_2_io_inData = modBuffer_0_2_io_outData; // @[FNTT_8point.scala 60:49]
  assign modBuffer_1_2_io_mod = io_mod; // @[FNTT_8point.scala 57:47]
  assign modBuffer_1_3_clock = clock;
  assign modBuffer_1_3_reset = reset;
  assign modBuffer_1_3_io_inData = modBuffer_0_3_io_outData; // @[FNTT_8point.scala 60:49]
  assign modBuffer_1_3_io_mod = io_mod; // @[FNTT_8point.scala 57:47]
  assign modBuffer_1_4_clock = clock;
  assign modBuffer_1_4_reset = reset;
  assign modBuffer_1_4_io_inData = modBuffer_0_4_io_outData; // @[FNTT_8point.scala 60:49]
  assign modBuffer_1_4_io_mod = io_mod; // @[FNTT_8point.scala 57:47]
  assign modBuffer_1_5_clock = clock;
  assign modBuffer_1_5_reset = reset;
  assign modBuffer_1_5_io_inData = modBuffer_0_5_io_outData; // @[FNTT_8point.scala 60:49]
  assign modBuffer_1_5_io_mod = io_mod; // @[FNTT_8point.scala 57:47]
  assign modBuffer_1_6_clock = clock;
  assign modBuffer_1_6_reset = reset;
  assign modBuffer_1_6_io_inData = modBuffer_0_6_io_outData; // @[FNTT_8point.scala 60:49]
  assign modBuffer_1_6_io_mod = io_mod; // @[FNTT_8point.scala 57:47]
  assign modBuffer_1_7_clock = clock;
  assign modBuffer_1_7_reset = reset;
  assign modBuffer_1_7_io_inData = modBuffer_0_7_io_outData; // @[FNTT_8point.scala 60:49]
  assign modBuffer_1_7_io_mod = io_mod; // @[FNTT_8point.scala 57:47]
  assign modBuffer_1_8_clock = clock;
  assign modBuffer_1_8_reset = reset;
  assign modBuffer_1_8_io_inData = modReg - modBuffer_0_4_io_outData; // @[FNTT_8point.scala 61:60]
  assign modBuffer_1_8_io_mod = io_mod; // @[FNTT_8point.scala 57:47]
  assign modBuffer_1_9_clock = clock;
  assign modBuffer_1_9_reset = reset;
  assign modBuffer_1_9_io_inData = modReg - modBuffer_0_5_io_outData; // @[FNTT_8point.scala 61:60]
  assign modBuffer_1_9_io_mod = io_mod; // @[FNTT_8point.scala 57:47]
  assign modBuffer_1_10_clock = clock;
  assign modBuffer_1_10_reset = reset;
  assign modBuffer_1_10_io_inData = modReg - modBuffer_0_6_io_outData; // @[FNTT_8point.scala 61:60]
  assign modBuffer_1_10_io_mod = io_mod; // @[FNTT_8point.scala 57:47]
  assign modBuffer_1_11_clock = clock;
  assign modBuffer_1_11_reset = reset;
  assign modBuffer_1_11_io_inData = modReg - modBuffer_0_7_io_outData; // @[FNTT_8point.scala 61:60]
  assign modBuffer_1_11_io_mod = io_mod; // @[FNTT_8point.scala 57:47]
  assign modBuffer_2_0_clock = clock;
  assign modBuffer_2_0_reset = reset;
  assign modBuffer_2_0_io_inData = modBuffer_1_0_io_outData + modBuffer_1_4_io_outData; // @[FNTT_8point.scala 66:59]
  assign modBuffer_2_0_io_mod = io_mod; // @[FNTT_8point.scala 65:46]
  assign modBuffer_2_1_clock = clock;
  assign modBuffer_2_1_reset = reset;
  assign modBuffer_2_1_io_inData = modBuffer_1_1_io_outData + modBuffer_1_5_io_outData; // @[FNTT_8point.scala 67:59]
  assign modBuffer_2_1_io_mod = io_mod; // @[FNTT_8point.scala 65:46]
  assign modBuffer_2_2_clock = clock;
  assign modBuffer_2_2_reset = reset;
  assign modBuffer_2_2_io_inData = modBuffer_1_2_io_outData + modBuffer_1_6_io_outData; // @[FNTT_8point.scala 68:59]
  assign modBuffer_2_2_io_mod = io_mod; // @[FNTT_8point.scala 65:46]
  assign modBuffer_2_3_clock = clock;
  assign modBuffer_2_3_reset = reset;
  assign modBuffer_2_3_io_inData = modBuffer_1_3_io_outData + modBuffer_1_7_io_outData; // @[FNTT_8point.scala 69:59]
  assign modBuffer_2_3_io_mod = io_mod; // @[FNTT_8point.scala 65:46]
  assign modBuffer_2_4_clock = clock;
  assign modBuffer_2_4_reset = reset;
  assign modBuffer_2_4_io_inData = modBuffer_1_8_io_outData + modBuffer_1_0_io_outData; // @[FNTT_8point.scala 71:60]
  assign modBuffer_2_4_io_mod = io_mod; // @[FNTT_8point.scala 65:46]
  assign modBuffer_2_5_clock = clock;
  assign modBuffer_2_5_reset = reset;
  assign modBuffer_2_5_io_inData = modBuffer_1_9_io_outData + modBuffer_1_1_io_outData; // @[FNTT_8point.scala 72:60]
  assign modBuffer_2_5_io_mod = io_mod; // @[FNTT_8point.scala 65:46]
  assign modBuffer_2_6_clock = clock;
  assign modBuffer_2_6_reset = reset;
  assign modBuffer_2_6_io_inData = modBuffer_1_10_io_outData + modBuffer_1_2_io_outData; // @[FNTT_8point.scala 73:60]
  assign modBuffer_2_6_io_mod = io_mod; // @[FNTT_8point.scala 65:46]
  assign modBuffer_2_7_clock = clock;
  assign modBuffer_2_7_reset = reset;
  assign modBuffer_2_7_io_inData = modBuffer_1_11_io_outData + modBuffer_1_3_io_outData; // @[FNTT_8point.scala 74:60]
  assign modBuffer_2_7_io_mod = io_mod; // @[FNTT_8point.scala 65:46]
  always @(posedge clock) begin
    if (reset) begin // @[FNTT_8point.scala 28:25]
      omegaReg_0 <= 8'h0; // @[FNTT_8point.scala 28:25]
    end else begin
      omegaReg_0 <= io_omega_0; // @[FNTT_8point.scala 38:36]
    end
    if (reset) begin // @[FNTT_8point.scala 28:25]
      omegaReg_1 <= 8'h0; // @[FNTT_8point.scala 28:25]
    end else begin
      omegaReg_1 <= io_omega_1; // @[FNTT_8point.scala 38:36]
    end
    if (reset) begin // @[FNTT_8point.scala 28:25]
      omegaReg_2 <= 8'h0; // @[FNTT_8point.scala 28:25]
    end else begin
      omegaReg_2 <= io_omega_2; // @[FNTT_8point.scala 38:36]
    end
    if (reset) begin // @[FNTT_8point.scala 28:25]
      omegaReg_3 <= 8'h0; // @[FNTT_8point.scala 28:25]
    end else begin
      omegaReg_3 <= io_omega_3; // @[FNTT_8point.scala 38:36]
    end
    if (reset) begin // @[FNTT_8point.scala 56:23]
      modReg <= 8'h0; // @[FNTT_8point.scala 56:23]
    end else begin
      modReg <= io_mod; // @[FNTT_8point.scala 58:10]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  omegaReg_0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  omegaReg_1 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  omegaReg_2 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  omegaReg_3 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  modReg = _RAND_4[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module invN(
  input        clock,
  input        reset,
  input  [7:0] io_inData_0,
  input  [7:0] io_inData_1,
  input  [7:0] io_inData_2,
  input  [7:0] io_inData_3,
  input  [7:0] io_inData_4,
  input  [7:0] io_inData_5,
  input  [7:0] io_inData_6,
  input  [7:0] io_inData_7,
  input  [7:0] io_mod,
  input  [7:0] io_invN,
  output [7:0] io_outData_0,
  output [7:0] io_outData_1,
  output [7:0] io_outData_2,
  output [7:0] io_outData_3,
  output [7:0] io_outData_4,
  output [7:0] io_outData_5,
  output [7:0] io_outData_6,
  output [7:0] io_outData_7
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  modBuffer_0_clock; // @[FNTT_FINTT_8point.scala 11:40]
  wire  modBuffer_0_reset; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_0_io_inData; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_0_io_mod; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_0_io_outData; // @[FNTT_FINTT_8point.scala 11:40]
  wire  modBuffer_1_clock; // @[FNTT_FINTT_8point.scala 11:40]
  wire  modBuffer_1_reset; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_1_io_inData; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_1_io_mod; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_1_io_outData; // @[FNTT_FINTT_8point.scala 11:40]
  wire  modBuffer_2_clock; // @[FNTT_FINTT_8point.scala 11:40]
  wire  modBuffer_2_reset; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_2_io_inData; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_2_io_mod; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_2_io_outData; // @[FNTT_FINTT_8point.scala 11:40]
  wire  modBuffer_3_clock; // @[FNTT_FINTT_8point.scala 11:40]
  wire  modBuffer_3_reset; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_3_io_inData; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_3_io_mod; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_3_io_outData; // @[FNTT_FINTT_8point.scala 11:40]
  wire  modBuffer_4_clock; // @[FNTT_FINTT_8point.scala 11:40]
  wire  modBuffer_4_reset; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_4_io_inData; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_4_io_mod; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_4_io_outData; // @[FNTT_FINTT_8point.scala 11:40]
  wire  modBuffer_5_clock; // @[FNTT_FINTT_8point.scala 11:40]
  wire  modBuffer_5_reset; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_5_io_inData; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_5_io_mod; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_5_io_outData; // @[FNTT_FINTT_8point.scala 11:40]
  wire  modBuffer_6_clock; // @[FNTT_FINTT_8point.scala 11:40]
  wire  modBuffer_6_reset; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_6_io_inData; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_6_io_mod; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_6_io_outData; // @[FNTT_FINTT_8point.scala 11:40]
  wire  modBuffer_7_clock; // @[FNTT_FINTT_8point.scala 11:40]
  wire  modBuffer_7_reset; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_7_io_inData; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_7_io_mod; // @[FNTT_FINTT_8point.scala 11:40]
  wire [7:0] modBuffer_7_io_outData; // @[FNTT_FINTT_8point.scala 11:40]
  reg [7:0] invNreg; // @[FNTT_FINTT_8point.scala 12:24]
  wire [15:0] _modBuffer_0_io_inData_T = io_inData_0 * invNreg; // @[FNTT_FINTT_8point.scala 17:44]
  wire [15:0] _modBuffer_1_io_inData_T = io_inData_1 * invNreg; // @[FNTT_FINTT_8point.scala 17:44]
  wire [15:0] _modBuffer_2_io_inData_T = io_inData_2 * invNreg; // @[FNTT_FINTT_8point.scala 17:44]
  wire [15:0] _modBuffer_3_io_inData_T = io_inData_3 * invNreg; // @[FNTT_FINTT_8point.scala 17:44]
  wire [15:0] _modBuffer_4_io_inData_T = io_inData_4 * invNreg; // @[FNTT_FINTT_8point.scala 17:44]
  wire [15:0] _modBuffer_5_io_inData_T = io_inData_5 * invNreg; // @[FNTT_FINTT_8point.scala 17:44]
  wire [15:0] _modBuffer_6_io_inData_T = io_inData_6 * invNreg; // @[FNTT_FINTT_8point.scala 17:44]
  wire [15:0] _modBuffer_7_io_inData_T = io_inData_7 * invNreg; // @[FNTT_FINTT_8point.scala 17:44]
  modular modBuffer_0 ( // @[FNTT_FINTT_8point.scala 11:40]
    .clock(modBuffer_0_clock),
    .reset(modBuffer_0_reset),
    .io_inData(modBuffer_0_io_inData),
    .io_mod(modBuffer_0_io_mod),
    .io_outData(modBuffer_0_io_outData)
  );
  modular modBuffer_1 ( // @[FNTT_FINTT_8point.scala 11:40]
    .clock(modBuffer_1_clock),
    .reset(modBuffer_1_reset),
    .io_inData(modBuffer_1_io_inData),
    .io_mod(modBuffer_1_io_mod),
    .io_outData(modBuffer_1_io_outData)
  );
  modular modBuffer_2 ( // @[FNTT_FINTT_8point.scala 11:40]
    .clock(modBuffer_2_clock),
    .reset(modBuffer_2_reset),
    .io_inData(modBuffer_2_io_inData),
    .io_mod(modBuffer_2_io_mod),
    .io_outData(modBuffer_2_io_outData)
  );
  modular modBuffer_3 ( // @[FNTT_FINTT_8point.scala 11:40]
    .clock(modBuffer_3_clock),
    .reset(modBuffer_3_reset),
    .io_inData(modBuffer_3_io_inData),
    .io_mod(modBuffer_3_io_mod),
    .io_outData(modBuffer_3_io_outData)
  );
  modular modBuffer_4 ( // @[FNTT_FINTT_8point.scala 11:40]
    .clock(modBuffer_4_clock),
    .reset(modBuffer_4_reset),
    .io_inData(modBuffer_4_io_inData),
    .io_mod(modBuffer_4_io_mod),
    .io_outData(modBuffer_4_io_outData)
  );
  modular modBuffer_5 ( // @[FNTT_FINTT_8point.scala 11:40]
    .clock(modBuffer_5_clock),
    .reset(modBuffer_5_reset),
    .io_inData(modBuffer_5_io_inData),
    .io_mod(modBuffer_5_io_mod),
    .io_outData(modBuffer_5_io_outData)
  );
  modular modBuffer_6 ( // @[FNTT_FINTT_8point.scala 11:40]
    .clock(modBuffer_6_clock),
    .reset(modBuffer_6_reset),
    .io_inData(modBuffer_6_io_inData),
    .io_mod(modBuffer_6_io_mod),
    .io_outData(modBuffer_6_io_outData)
  );
  modular modBuffer_7 ( // @[FNTT_FINTT_8point.scala 11:40]
    .clock(modBuffer_7_clock),
    .reset(modBuffer_7_reset),
    .io_inData(modBuffer_7_io_inData),
    .io_mod(modBuffer_7_io_mod),
    .io_outData(modBuffer_7_io_outData)
  );
  assign io_outData_0 = modBuffer_0_io_outData; // @[FNTT_FINTT_8point.scala 18:19]
  assign io_outData_1 = modBuffer_1_io_outData; // @[FNTT_FINTT_8point.scala 18:19]
  assign io_outData_2 = modBuffer_2_io_outData; // @[FNTT_FINTT_8point.scala 18:19]
  assign io_outData_3 = modBuffer_3_io_outData; // @[FNTT_FINTT_8point.scala 18:19]
  assign io_outData_4 = modBuffer_4_io_outData; // @[FNTT_FINTT_8point.scala 18:19]
  assign io_outData_5 = modBuffer_5_io_outData; // @[FNTT_FINTT_8point.scala 18:19]
  assign io_outData_6 = modBuffer_6_io_outData; // @[FNTT_FINTT_8point.scala 18:19]
  assign io_outData_7 = modBuffer_7_io_outData; // @[FNTT_FINTT_8point.scala 18:19]
  assign modBuffer_0_clock = clock;
  assign modBuffer_0_reset = reset;
  assign modBuffer_0_io_inData = _modBuffer_0_io_inData_T[7:0]; // @[FNTT_FINTT_8point.scala 17:28]
  assign modBuffer_0_io_mod = io_mod; // @[FNTT_FINTT_8point.scala 16:25]
  assign modBuffer_1_clock = clock;
  assign modBuffer_1_reset = reset;
  assign modBuffer_1_io_inData = _modBuffer_1_io_inData_T[7:0]; // @[FNTT_FINTT_8point.scala 17:28]
  assign modBuffer_1_io_mod = io_mod; // @[FNTT_FINTT_8point.scala 16:25]
  assign modBuffer_2_clock = clock;
  assign modBuffer_2_reset = reset;
  assign modBuffer_2_io_inData = _modBuffer_2_io_inData_T[7:0]; // @[FNTT_FINTT_8point.scala 17:28]
  assign modBuffer_2_io_mod = io_mod; // @[FNTT_FINTT_8point.scala 16:25]
  assign modBuffer_3_clock = clock;
  assign modBuffer_3_reset = reset;
  assign modBuffer_3_io_inData = _modBuffer_3_io_inData_T[7:0]; // @[FNTT_FINTT_8point.scala 17:28]
  assign modBuffer_3_io_mod = io_mod; // @[FNTT_FINTT_8point.scala 16:25]
  assign modBuffer_4_clock = clock;
  assign modBuffer_4_reset = reset;
  assign modBuffer_4_io_inData = _modBuffer_4_io_inData_T[7:0]; // @[FNTT_FINTT_8point.scala 17:28]
  assign modBuffer_4_io_mod = io_mod; // @[FNTT_FINTT_8point.scala 16:25]
  assign modBuffer_5_clock = clock;
  assign modBuffer_5_reset = reset;
  assign modBuffer_5_io_inData = _modBuffer_5_io_inData_T[7:0]; // @[FNTT_FINTT_8point.scala 17:28]
  assign modBuffer_5_io_mod = io_mod; // @[FNTT_FINTT_8point.scala 16:25]
  assign modBuffer_6_clock = clock;
  assign modBuffer_6_reset = reset;
  assign modBuffer_6_io_inData = _modBuffer_6_io_inData_T[7:0]; // @[FNTT_FINTT_8point.scala 17:28]
  assign modBuffer_6_io_mod = io_mod; // @[FNTT_FINTT_8point.scala 16:25]
  assign modBuffer_7_clock = clock;
  assign modBuffer_7_reset = reset;
  assign modBuffer_7_io_inData = _modBuffer_7_io_inData_T[7:0]; // @[FNTT_FINTT_8point.scala 17:28]
  assign modBuffer_7_io_mod = io_mod; // @[FNTT_FINTT_8point.scala 16:25]
  always @(posedge clock) begin
    if (reset) begin // @[FNTT_FINTT_8point.scala 12:24]
      invNreg <= 8'h0; // @[FNTT_FINTT_8point.scala 12:24]
    end else begin
      invNreg <= io_invN; // @[FNTT_FINTT_8point.scala 13:11]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  invNreg = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FNTT_FINTT_8point(
  input        clock,
  input        reset,
  input  [7:0] io_inData_0,
  input  [7:0] io_inData_1,
  input  [7:0] io_inData_2,
  input  [7:0] io_inData_3,
  input  [7:0] io_inData_4,
  input  [7:0] io_inData_5,
  input  [7:0] io_inData_6,
  input  [7:0] io_inData_7,
  input  [7:0] io_omega_0,
  input  [7:0] io_omega_1,
  input  [7:0] io_omega_2,
  input  [7:0] io_omega_3,
  input  [7:0] io_mod,
  input  [7:0] io_invN,
  input        io_mode,
  output [7:0] io_outData_0,
  output [7:0] io_outData_1,
  output [7:0] io_outData_2,
  output [7:0] io_outData_3,
  output [7:0] io_outData_4,
  output [7:0] io_outData_5,
  output [7:0] io_outData_6,
  output [7:0] io_outData_7
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
`endif // RANDOMIZE_REG_INIT
  wire  NTT_clock; // @[FNTT_FINTT_8point.scala 32:19]
  wire  NTT_reset; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_inData_0; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_inData_1; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_inData_2; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_inData_3; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_inData_4; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_inData_5; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_inData_6; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_inData_7; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_omega_0; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_omega_1; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_omega_2; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_omega_3; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_mod; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_outData_0; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_outData_1; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_outData_2; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_outData_3; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_outData_4; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_outData_5; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_outData_6; // @[FNTT_FINTT_8point.scala 32:19]
  wire [7:0] NTT_io_outData_7; // @[FNTT_FINTT_8point.scala 32:19]
  wire  invNmodule_clock; // @[FNTT_FINTT_8point.scala 43:26]
  wire  invNmodule_reset; // @[FNTT_FINTT_8point.scala 43:26]
  wire [7:0] invNmodule_io_inData_0; // @[FNTT_FINTT_8point.scala 43:26]
  wire [7:0] invNmodule_io_inData_1; // @[FNTT_FINTT_8point.scala 43:26]
  wire [7:0] invNmodule_io_inData_2; // @[FNTT_FINTT_8point.scala 43:26]
  wire [7:0] invNmodule_io_inData_3; // @[FNTT_FINTT_8point.scala 43:26]
  wire [7:0] invNmodule_io_inData_4; // @[FNTT_FINTT_8point.scala 43:26]
  wire [7:0] invNmodule_io_inData_5; // @[FNTT_FINTT_8point.scala 43:26]
  wire [7:0] invNmodule_io_inData_6; // @[FNTT_FINTT_8point.scala 43:26]
  wire [7:0] invNmodule_io_inData_7; // @[FNTT_FINTT_8point.scala 43:26]
  wire [7:0] invNmodule_io_mod; // @[FNTT_FINTT_8point.scala 43:26]
  wire [7:0] invNmodule_io_invN; // @[FNTT_FINTT_8point.scala 43:26]
  wire [7:0] invNmodule_io_outData_0; // @[FNTT_FINTT_8point.scala 43:26]
  wire [7:0] invNmodule_io_outData_1; // @[FNTT_FINTT_8point.scala 43:26]
  wire [7:0] invNmodule_io_outData_2; // @[FNTT_FINTT_8point.scala 43:26]
  wire [7:0] invNmodule_io_outData_3; // @[FNTT_FINTT_8point.scala 43:26]
  wire [7:0] invNmodule_io_outData_4; // @[FNTT_FINTT_8point.scala 43:26]
  wire [7:0] invNmodule_io_outData_5; // @[FNTT_FINTT_8point.scala 43:26]
  wire [7:0] invNmodule_io_outData_6; // @[FNTT_FINTT_8point.scala 43:26]
  wire [7:0] invNmodule_io_outData_7; // @[FNTT_FINTT_8point.scala 43:26]
  reg [7:0] nttReg_0; // @[FNTT_FINTT_8point.scala 33:23]
  reg [7:0] nttReg_1; // @[FNTT_FINTT_8point.scala 33:23]
  reg [7:0] nttReg_2; // @[FNTT_FINTT_8point.scala 33:23]
  reg [7:0] nttReg_3; // @[FNTT_FINTT_8point.scala 33:23]
  reg [7:0] nttReg_4; // @[FNTT_FINTT_8point.scala 33:23]
  reg [7:0] nttReg_5; // @[FNTT_FINTT_8point.scala 33:23]
  reg [7:0] nttReg_6; // @[FNTT_FINTT_8point.scala 33:23]
  reg [7:0] nttReg_7; // @[FNTT_FINTT_8point.scala 33:23]
  reg [7:0] inttReg_0; // @[FNTT_FINTT_8point.scala 44:24]
  reg [7:0] inttReg_1; // @[FNTT_FINTT_8point.scala 44:24]
  reg [7:0] inttReg_2; // @[FNTT_FINTT_8point.scala 44:24]
  reg [7:0] inttReg_3; // @[FNTT_FINTT_8point.scala 44:24]
  reg [7:0] inttReg_4; // @[FNTT_FINTT_8point.scala 44:24]
  reg [7:0] inttReg_5; // @[FNTT_FINTT_8point.scala 44:24]
  reg [7:0] inttReg_6; // @[FNTT_FINTT_8point.scala 44:24]
  reg [7:0] inttReg_7; // @[FNTT_FINTT_8point.scala 44:24]
  FNTT_8point NTT ( // @[FNTT_FINTT_8point.scala 32:19]
    .clock(NTT_clock),
    .reset(NTT_reset),
    .io_inData_0(NTT_io_inData_0),
    .io_inData_1(NTT_io_inData_1),
    .io_inData_2(NTT_io_inData_2),
    .io_inData_3(NTT_io_inData_3),
    .io_inData_4(NTT_io_inData_4),
    .io_inData_5(NTT_io_inData_5),
    .io_inData_6(NTT_io_inData_6),
    .io_inData_7(NTT_io_inData_7),
    .io_omega_0(NTT_io_omega_0),
    .io_omega_1(NTT_io_omega_1),
    .io_omega_2(NTT_io_omega_2),
    .io_omega_3(NTT_io_omega_3),
    .io_mod(NTT_io_mod),
    .io_outData_0(NTT_io_outData_0),
    .io_outData_1(NTT_io_outData_1),
    .io_outData_2(NTT_io_outData_2),
    .io_outData_3(NTT_io_outData_3),
    .io_outData_4(NTT_io_outData_4),
    .io_outData_5(NTT_io_outData_5),
    .io_outData_6(NTT_io_outData_6),
    .io_outData_7(NTT_io_outData_7)
  );
  invN invNmodule ( // @[FNTT_FINTT_8point.scala 43:26]
    .clock(invNmodule_clock),
    .reset(invNmodule_reset),
    .io_inData_0(invNmodule_io_inData_0),
    .io_inData_1(invNmodule_io_inData_1),
    .io_inData_2(invNmodule_io_inData_2),
    .io_inData_3(invNmodule_io_inData_3),
    .io_inData_4(invNmodule_io_inData_4),
    .io_inData_5(invNmodule_io_inData_5),
    .io_inData_6(invNmodule_io_inData_6),
    .io_inData_7(invNmodule_io_inData_7),
    .io_mod(invNmodule_io_mod),
    .io_invN(invNmodule_io_invN),
    .io_outData_0(invNmodule_io_outData_0),
    .io_outData_1(invNmodule_io_outData_1),
    .io_outData_2(invNmodule_io_outData_2),
    .io_outData_3(invNmodule_io_outData_3),
    .io_outData_4(invNmodule_io_outData_4),
    .io_outData_5(invNmodule_io_outData_5),
    .io_outData_6(invNmodule_io_outData_6),
    .io_outData_7(invNmodule_io_outData_7)
  );
  assign io_outData_0 = io_mode ? nttReg_0 : inttReg_0; // @[FNTT_FINTT_8point.scala 54:44]
  assign io_outData_1 = io_mode ? nttReg_1 : inttReg_1; // @[FNTT_FINTT_8point.scala 54:44]
  assign io_outData_2 = io_mode ? nttReg_2 : inttReg_2; // @[FNTT_FINTT_8point.scala 54:44]
  assign io_outData_3 = io_mode ? nttReg_3 : inttReg_3; // @[FNTT_FINTT_8point.scala 54:44]
  assign io_outData_4 = io_mode ? nttReg_4 : inttReg_4; // @[FNTT_FINTT_8point.scala 54:44]
  assign io_outData_5 = io_mode ? nttReg_5 : inttReg_5; // @[FNTT_FINTT_8point.scala 54:44]
  assign io_outData_6 = io_mode ? nttReg_6 : inttReg_6; // @[FNTT_FINTT_8point.scala 54:44]
  assign io_outData_7 = io_mode ? nttReg_7 : inttReg_7; // @[FNTT_FINTT_8point.scala 54:44]
  assign NTT_clock = clock;
  assign NTT_reset = reset;
  assign NTT_io_inData_0 = io_inData_0; // @[FNTT_FINTT_8point.scala 38:22]
  assign NTT_io_inData_1 = io_inData_1; // @[FNTT_FINTT_8point.scala 38:22]
  assign NTT_io_inData_2 = io_inData_2; // @[FNTT_FINTT_8point.scala 38:22]
  assign NTT_io_inData_3 = io_inData_3; // @[FNTT_FINTT_8point.scala 38:22]
  assign NTT_io_inData_4 = io_inData_4; // @[FNTT_FINTT_8point.scala 38:22]
  assign NTT_io_inData_5 = io_inData_5; // @[FNTT_FINTT_8point.scala 38:22]
  assign NTT_io_inData_6 = io_inData_6; // @[FNTT_FINTT_8point.scala 38:22]
  assign NTT_io_inData_7 = io_inData_7; // @[FNTT_FINTT_8point.scala 38:22]
  assign NTT_io_omega_0 = io_omega_0; // @[FNTT_FINTT_8point.scala 35:16]
  assign NTT_io_omega_1 = io_omega_1; // @[FNTT_FINTT_8point.scala 35:16]
  assign NTT_io_omega_2 = io_omega_2; // @[FNTT_FINTT_8point.scala 35:16]
  assign NTT_io_omega_3 = io_omega_3; // @[FNTT_FINTT_8point.scala 35:16]
  assign NTT_io_mod = io_mod; // @[FNTT_FINTT_8point.scala 36:14]
  assign invNmodule_clock = clock;
  assign invNmodule_reset = reset;
  assign invNmodule_io_inData_0 = nttReg_0; // @[FNTT_FINTT_8point.scala 48:29]
  assign invNmodule_io_inData_1 = nttReg_1; // @[FNTT_FINTT_8point.scala 48:29]
  assign invNmodule_io_inData_2 = nttReg_2; // @[FNTT_FINTT_8point.scala 48:29]
  assign invNmodule_io_inData_3 = nttReg_3; // @[FNTT_FINTT_8point.scala 48:29]
  assign invNmodule_io_inData_4 = nttReg_4; // @[FNTT_FINTT_8point.scala 48:29]
  assign invNmodule_io_inData_5 = nttReg_5; // @[FNTT_FINTT_8point.scala 48:29]
  assign invNmodule_io_inData_6 = nttReg_6; // @[FNTT_FINTT_8point.scala 48:29]
  assign invNmodule_io_inData_7 = nttReg_7; // @[FNTT_FINTT_8point.scala 48:29]
  assign invNmodule_io_mod = io_mod; // @[FNTT_FINTT_8point.scala 46:21]
  assign invNmodule_io_invN = io_invN; // @[FNTT_FINTT_8point.scala 45:22]
  always @(posedge clock) begin
    if (reset) begin // @[FNTT_FINTT_8point.scala 33:23]
      nttReg_0 <= 8'h0; // @[FNTT_FINTT_8point.scala 33:23]
    end else begin
      nttReg_0 <= NTT_io_outData_0; // @[FNTT_FINTT_8point.scala 39:15]
    end
    if (reset) begin // @[FNTT_FINTT_8point.scala 33:23]
      nttReg_1 <= 8'h0; // @[FNTT_FINTT_8point.scala 33:23]
    end else begin
      nttReg_1 <= NTT_io_outData_1; // @[FNTT_FINTT_8point.scala 39:15]
    end
    if (reset) begin // @[FNTT_FINTT_8point.scala 33:23]
      nttReg_2 <= 8'h0; // @[FNTT_FINTT_8point.scala 33:23]
    end else begin
      nttReg_2 <= NTT_io_outData_2; // @[FNTT_FINTT_8point.scala 39:15]
    end
    if (reset) begin // @[FNTT_FINTT_8point.scala 33:23]
      nttReg_3 <= 8'h0; // @[FNTT_FINTT_8point.scala 33:23]
    end else begin
      nttReg_3 <= NTT_io_outData_3; // @[FNTT_FINTT_8point.scala 39:15]
    end
    if (reset) begin // @[FNTT_FINTT_8point.scala 33:23]
      nttReg_4 <= 8'h0; // @[FNTT_FINTT_8point.scala 33:23]
    end else begin
      nttReg_4 <= NTT_io_outData_4; // @[FNTT_FINTT_8point.scala 39:15]
    end
    if (reset) begin // @[FNTT_FINTT_8point.scala 33:23]
      nttReg_5 <= 8'h0; // @[FNTT_FINTT_8point.scala 33:23]
    end else begin
      nttReg_5 <= NTT_io_outData_5; // @[FNTT_FINTT_8point.scala 39:15]
    end
    if (reset) begin // @[FNTT_FINTT_8point.scala 33:23]
      nttReg_6 <= 8'h0; // @[FNTT_FINTT_8point.scala 33:23]
    end else begin
      nttReg_6 <= NTT_io_outData_6; // @[FNTT_FINTT_8point.scala 39:15]
    end
    if (reset) begin // @[FNTT_FINTT_8point.scala 33:23]
      nttReg_7 <= 8'h0; // @[FNTT_FINTT_8point.scala 33:23]
    end else begin
      nttReg_7 <= NTT_io_outData_7; // @[FNTT_FINTT_8point.scala 39:15]
    end
    if (reset) begin // @[FNTT_FINTT_8point.scala 44:24]
      inttReg_0 <= 8'h0; // @[FNTT_FINTT_8point.scala 44:24]
    end else begin
      inttReg_0 <= invNmodule_io_outData_0; // @[FNTT_FINTT_8point.scala 49:16]
    end
    if (reset) begin // @[FNTT_FINTT_8point.scala 44:24]
      inttReg_1 <= 8'h0; // @[FNTT_FINTT_8point.scala 44:24]
    end else begin
      inttReg_1 <= invNmodule_io_outData_1; // @[FNTT_FINTT_8point.scala 49:16]
    end
    if (reset) begin // @[FNTT_FINTT_8point.scala 44:24]
      inttReg_2 <= 8'h0; // @[FNTT_FINTT_8point.scala 44:24]
    end else begin
      inttReg_2 <= invNmodule_io_outData_2; // @[FNTT_FINTT_8point.scala 49:16]
    end
    if (reset) begin // @[FNTT_FINTT_8point.scala 44:24]
      inttReg_3 <= 8'h0; // @[FNTT_FINTT_8point.scala 44:24]
    end else begin
      inttReg_3 <= invNmodule_io_outData_3; // @[FNTT_FINTT_8point.scala 49:16]
    end
    if (reset) begin // @[FNTT_FINTT_8point.scala 44:24]
      inttReg_4 <= 8'h0; // @[FNTT_FINTT_8point.scala 44:24]
    end else begin
      inttReg_4 <= invNmodule_io_outData_4; // @[FNTT_FINTT_8point.scala 49:16]
    end
    if (reset) begin // @[FNTT_FINTT_8point.scala 44:24]
      inttReg_5 <= 8'h0; // @[FNTT_FINTT_8point.scala 44:24]
    end else begin
      inttReg_5 <= invNmodule_io_outData_5; // @[FNTT_FINTT_8point.scala 49:16]
    end
    if (reset) begin // @[FNTT_FINTT_8point.scala 44:24]
      inttReg_6 <= 8'h0; // @[FNTT_FINTT_8point.scala 44:24]
    end else begin
      inttReg_6 <= invNmodule_io_outData_6; // @[FNTT_FINTT_8point.scala 49:16]
    end
    if (reset) begin // @[FNTT_FINTT_8point.scala 44:24]
      inttReg_7 <= 8'h0; // @[FNTT_FINTT_8point.scala 44:24]
    end else begin
      inttReg_7 <= invNmodule_io_outData_7; // @[FNTT_FINTT_8point.scala 49:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  nttReg_0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  nttReg_1 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  nttReg_2 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  nttReg_3 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  nttReg_4 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  nttReg_5 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  nttReg_6 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  nttReg_7 = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  inttReg_0 = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  inttReg_1 = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  inttReg_2 = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  inttReg_3 = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  inttReg_4 = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  inttReg_5 = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  inttReg_6 = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  inttReg_7 = _RAND_15[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
