circuit FNTT_FINTT_8point :
  module BitReverseOrder :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>[8], outData : UInt<8>[8]}

    io.outData[0] <= io.inData[0] @[BitReverseOrder.scala 8:17]
    io.outData[1] <= io.inData[4] @[BitReverseOrder.scala 9:17]
    io.outData[2] <= io.inData[2] @[BitReverseOrder.scala 10:17]
    io.outData[3] <= io.inData[6] @[BitReverseOrder.scala 11:17]
    io.outData[4] <= io.inData[1] @[BitReverseOrder.scala 12:17]
    io.outData[5] <= io.inData[5] @[BitReverseOrder.scala 13:17]
    io.outData[6] <= io.inData[3] @[BitReverseOrder.scala 14:17]
    io.outData[7] <= io.inData[7] @[BitReverseOrder.scala 15:17]

  module Butterfly_2point :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>[2], flip mod : UInt<8>, outData : UInt<8>[2]}

    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[FNTT_2point.scala 11:23]
    wire _InBuffer_WIRE : UInt<8>[2] @[FNTT_2point.scala 13:33]
    _InBuffer_WIRE[0] <= UInt<8>("h0") @[FNTT_2point.scala 13:33]
    _InBuffer_WIRE[1] <= UInt<8>("h0") @[FNTT_2point.scala 13:33]
    reg InBuffer : UInt<8>[2], clock with :
      reset => (reset, _InBuffer_WIRE) @[FNTT_2point.scala 13:25]
    wire _OutBuffer_WIRE : UInt<8>[2] @[FNTT_2point.scala 14:34]
    _OutBuffer_WIRE[0] <= UInt<8>("h0") @[FNTT_2point.scala 14:34]
    _OutBuffer_WIRE[1] <= UInt<8>("h0") @[FNTT_2point.scala 14:34]
    reg OutBuffer : UInt<8>[2], clock with :
      reset => (reset, _OutBuffer_WIRE) @[FNTT_2point.scala 14:26]
    modReg <= io.mod @[FNTT_2point.scala 16:10]
    InBuffer[0] <= io.inData[0] @[FNTT_2point.scala 18:15]
    InBuffer[1] <= io.inData[1] @[FNTT_2point.scala 19:15]
    node _OutBuffer_0_T = add(InBuffer[0], InBuffer[1]) @[FNTT_2point.scala 21:31]
    node _OutBuffer_0_T_1 = tail(_OutBuffer_0_T, 1) @[FNTT_2point.scala 21:31]
    OutBuffer[0] <= _OutBuffer_0_T_1 @[FNTT_2point.scala 21:16]
    node _OutBuffer_1_T = sub(modReg, InBuffer[1]) @[FNTT_2point.scala 22:27]
    node _OutBuffer_1_T_1 = tail(_OutBuffer_1_T, 1) @[FNTT_2point.scala 22:27]
    node _OutBuffer_1_T_2 = add(_OutBuffer_1_T_1, InBuffer[0]) @[FNTT_2point.scala 22:42]
    node _OutBuffer_1_T_3 = tail(_OutBuffer_1_T_2, 1) @[FNTT_2point.scala 22:42]
    OutBuffer[1] <= _OutBuffer_1_T_3 @[FNTT_2point.scala 22:16]
    io.outData[0] <= OutBuffer[0] @[FNTT_2point.scala 24:17]
    io.outData[1] <= OutBuffer[1] @[FNTT_2point.scala 25:17]

  module modular :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module FNTT_2point :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>[2], flip mod : UInt<8>, outData : UInt<8>[2]}

    inst BF of Butterfly_2point @[FNTT_2point.scala 34:18]
    BF.clock <= clock
    BF.reset <= reset
    inst modular_0 of modular @[FNTT_2point.scala 35:39]
    modular_0.clock <= clock
    modular_0.reset <= reset
    inst modular_1 of modular_1 @[FNTT_2point.scala 35:39]
    modular_1.clock <= clock
    modular_1.reset <= reset
    BF.io.inData[0] <= io.inData[0] @[FNTT_2point.scala 37:19]
    BF.io.inData[1] <= io.inData[1] @[FNTT_2point.scala 38:19]
    BF.io.mod <= io.mod @[FNTT_2point.scala 40:13]
    modular_0.io.mod <= io.mod @[FNTT_2point.scala 41:21]
    modular_1.io.mod <= io.mod @[FNTT_2point.scala 42:21]
    modular_0.io.inData <= BF.io.outData[0] @[FNTT_2point.scala 44:24]
    modular_1.io.inData <= BF.io.outData[1] @[FNTT_2point.scala 45:24]
    io.outData[0] <= modular_0.io.outData @[FNTT_2point.scala 47:17]
    io.outData[1] <= modular_1.io.outData @[FNTT_2point.scala 48:17]

  module Butterfly_2point_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>[2], flip mod : UInt<8>, outData : UInt<8>[2]}

    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[FNTT_2point.scala 11:23]
    wire _InBuffer_WIRE : UInt<8>[2] @[FNTT_2point.scala 13:33]
    _InBuffer_WIRE[0] <= UInt<8>("h0") @[FNTT_2point.scala 13:33]
    _InBuffer_WIRE[1] <= UInt<8>("h0") @[FNTT_2point.scala 13:33]
    reg InBuffer : UInt<8>[2], clock with :
      reset => (reset, _InBuffer_WIRE) @[FNTT_2point.scala 13:25]
    wire _OutBuffer_WIRE : UInt<8>[2] @[FNTT_2point.scala 14:34]
    _OutBuffer_WIRE[0] <= UInt<8>("h0") @[FNTT_2point.scala 14:34]
    _OutBuffer_WIRE[1] <= UInt<8>("h0") @[FNTT_2point.scala 14:34]
    reg OutBuffer : UInt<8>[2], clock with :
      reset => (reset, _OutBuffer_WIRE) @[FNTT_2point.scala 14:26]
    modReg <= io.mod @[FNTT_2point.scala 16:10]
    InBuffer[0] <= io.inData[0] @[FNTT_2point.scala 18:15]
    InBuffer[1] <= io.inData[1] @[FNTT_2point.scala 19:15]
    node _OutBuffer_0_T = add(InBuffer[0], InBuffer[1]) @[FNTT_2point.scala 21:31]
    node _OutBuffer_0_T_1 = tail(_OutBuffer_0_T, 1) @[FNTT_2point.scala 21:31]
    OutBuffer[0] <= _OutBuffer_0_T_1 @[FNTT_2point.scala 21:16]
    node _OutBuffer_1_T = sub(modReg, InBuffer[1]) @[FNTT_2point.scala 22:27]
    node _OutBuffer_1_T_1 = tail(_OutBuffer_1_T, 1) @[FNTT_2point.scala 22:27]
    node _OutBuffer_1_T_2 = add(_OutBuffer_1_T_1, InBuffer[0]) @[FNTT_2point.scala 22:42]
    node _OutBuffer_1_T_3 = tail(_OutBuffer_1_T_2, 1) @[FNTT_2point.scala 22:42]
    OutBuffer[1] <= _OutBuffer_1_T_3 @[FNTT_2point.scala 22:16]
    io.outData[0] <= OutBuffer[0] @[FNTT_2point.scala 24:17]
    io.outData[1] <= OutBuffer[1] @[FNTT_2point.scala 25:17]

  module modular_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module FNTT_2point_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>[2], flip mod : UInt<8>, outData : UInt<8>[2]}

    inst BF of Butterfly_2point_1 @[FNTT_2point.scala 34:18]
    BF.clock <= clock
    BF.reset <= reset
    inst modular_0 of modular_2 @[FNTT_2point.scala 35:39]
    modular_0.clock <= clock
    modular_0.reset <= reset
    inst modular_1 of modular_3 @[FNTT_2point.scala 35:39]
    modular_1.clock <= clock
    modular_1.reset <= reset
    BF.io.inData[0] <= io.inData[0] @[FNTT_2point.scala 37:19]
    BF.io.inData[1] <= io.inData[1] @[FNTT_2point.scala 38:19]
    BF.io.mod <= io.mod @[FNTT_2point.scala 40:13]
    modular_0.io.mod <= io.mod @[FNTT_2point.scala 41:21]
    modular_1.io.mod <= io.mod @[FNTT_2point.scala 42:21]
    modular_0.io.inData <= BF.io.outData[0] @[FNTT_2point.scala 44:24]
    modular_1.io.inData <= BF.io.outData[1] @[FNTT_2point.scala 45:24]
    io.outData[0] <= modular_0.io.outData @[FNTT_2point.scala 47:17]
    io.outData[1] <= modular_1.io.outData @[FNTT_2point.scala 48:17]

  module modular_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_5 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_6 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_7 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_8 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_9 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_10 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_11 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_12 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_13 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_14 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_15 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_16 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_17 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module FNTT_4point :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>[4], flip omega : UInt<8>[2], flip mod : UInt<8>, outData : UInt<8>[4]}

    inst BF_0 of FNTT_2point @[FNTT_4point.scala 13:34]
    BF_0.clock <= clock
    BF_0.reset <= reset
    inst BF_1 of FNTT_2point_1 @[FNTT_4point.scala 13:34]
    BF_1.clock <= clock
    BF_1.reset <= reset
    inst modBuffer_0_0 of modular_4 @[FNTT_4point.scala 14:43]
    modBuffer_0_0.clock <= clock
    modBuffer_0_0.reset <= reset
    inst modBuffer_0_1 of modular_5 @[FNTT_4point.scala 14:43]
    modBuffer_0_1.clock <= clock
    modBuffer_0_1.reset <= reset
    inst modBuffer_0_2 of modular_6 @[FNTT_4point.scala 14:43]
    modBuffer_0_2.clock <= clock
    modBuffer_0_2.reset <= reset
    inst modBuffer_0_3 of modular_7 @[FNTT_4point.scala 14:43]
    modBuffer_0_3.clock <= clock
    modBuffer_0_3.reset <= reset
    wire _omeaaReg_WIRE : UInt<8>[2] @[FNTT_4point.scala 15:33]
    _omeaaReg_WIRE[0] <= UInt<8>("h0") @[FNTT_4point.scala 15:33]
    _omeaaReg_WIRE[1] <= UInt<8>("h0") @[FNTT_4point.scala 15:33]
    reg omeaaReg : UInt<8>[2], clock with :
      reset => (reset, _omeaaReg_WIRE) @[FNTT_4point.scala 15:25]
    BF_0.io.mod <= io.mod @[FNTT_4point.scala 17:16]
    BF_1.io.mod <= io.mod @[FNTT_4point.scala 18:16]
    modBuffer_0_0.io.mod <= io.mod @[FNTT_4point.scala 19:46]
    modBuffer_0_1.io.mod <= io.mod @[FNTT_4point.scala 19:46]
    modBuffer_0_2.io.mod <= io.mod @[FNTT_4point.scala 19:46]
    modBuffer_0_3.io.mod <= io.mod @[FNTT_4point.scala 19:46]
    omeaaReg[0] <= io.omega[0] @[FNTT_4point.scala 21:15]
    omeaaReg[1] <= io.omega[1] @[FNTT_4point.scala 22:15]
    BF_0.io.inData[0] <= io.inData[0] @[FNTT_4point.scala 25:22]
    BF_0.io.inData[1] <= io.inData[1] @[FNTT_4point.scala 26:22]
    BF_1.io.inData[0] <= io.inData[2] @[FNTT_4point.scala 27:22]
    BF_1.io.inData[1] <= io.inData[3] @[FNTT_4point.scala 28:22]
    modBuffer_0_0.io.inData <= BF_0.io.outData[0] @[FNTT_4point.scala 30:28]
    modBuffer_0_1.io.inData <= BF_0.io.outData[1] @[FNTT_4point.scala 31:28]
    node _modBuffer_0_2_io_inData_T = mul(BF_1.io.outData[0], omeaaReg[0]) @[FNTT_4point.scala 32:51]
    modBuffer_0_2.io.inData <= _modBuffer_0_2_io_inData_T @[FNTT_4point.scala 32:28]
    node _modBuffer_0_3_io_inData_T = mul(BF_1.io.outData[1], omeaaReg[1]) @[FNTT_4point.scala 33:51]
    modBuffer_0_3.io.inData <= _modBuffer_0_3_io_inData_T @[FNTT_4point.scala 33:28]
    inst modBuffer_1_0 of modular_8 @[FNTT_4point.scala 36:43]
    modBuffer_1_0.clock <= clock
    modBuffer_1_0.reset <= reset
    inst modBuffer_1_1 of modular_9 @[FNTT_4point.scala 36:43]
    modBuffer_1_1.clock <= clock
    modBuffer_1_1.reset <= reset
    inst modBuffer_1_2 of modular_10 @[FNTT_4point.scala 36:43]
    modBuffer_1_2.clock <= clock
    modBuffer_1_2.reset <= reset
    inst modBuffer_1_3 of modular_11 @[FNTT_4point.scala 36:43]
    modBuffer_1_3.clock <= clock
    modBuffer_1_3.reset <= reset
    inst modBuffer_1_4 of modular_12 @[FNTT_4point.scala 36:43]
    modBuffer_1_4.clock <= clock
    modBuffer_1_4.reset <= reset
    inst modBuffer_1_5 of modular_13 @[FNTT_4point.scala 36:43]
    modBuffer_1_5.clock <= clock
    modBuffer_1_5.reset <= reset
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[FNTT_4point.scala 37:23]
    modBuffer_1_0.io.mod <= io.mod @[FNTT_4point.scala 38:46]
    modBuffer_1_1.io.mod <= io.mod @[FNTT_4point.scala 38:46]
    modBuffer_1_2.io.mod <= io.mod @[FNTT_4point.scala 38:46]
    modBuffer_1_3.io.mod <= io.mod @[FNTT_4point.scala 38:46]
    modBuffer_1_4.io.mod <= io.mod @[FNTT_4point.scala 38:46]
    modBuffer_1_5.io.mod <= io.mod @[FNTT_4point.scala 38:46]
    modReg <= io.mod @[FNTT_4point.scala 39:10]
    modBuffer_1_0.io.inData <= modBuffer_0_0.io.outData @[FNTT_4point.scala 41:28]
    modBuffer_1_1.io.inData <= modBuffer_0_1.io.outData @[FNTT_4point.scala 42:28]
    modBuffer_1_2.io.inData <= modBuffer_0_2.io.outData @[FNTT_4point.scala 43:28]
    modBuffer_1_3.io.inData <= modBuffer_0_3.io.outData @[FNTT_4point.scala 44:28]
    node _modBuffer_1_4_io_inData_T = sub(modReg, modBuffer_0_2.io.outData) @[FNTT_4point.scala 46:38]
    node _modBuffer_1_4_io_inData_T_1 = tail(_modBuffer_1_4_io_inData_T, 1) @[FNTT_4point.scala 46:38]
    modBuffer_1_4.io.inData <= _modBuffer_1_4_io_inData_T_1 @[FNTT_4point.scala 46:28]
    node _modBuffer_1_5_io_inData_T = sub(modReg, modBuffer_0_3.io.outData) @[FNTT_4point.scala 47:38]
    node _modBuffer_1_5_io_inData_T_1 = tail(_modBuffer_1_5_io_inData_T, 1) @[FNTT_4point.scala 47:38]
    modBuffer_1_5.io.inData <= _modBuffer_1_5_io_inData_T_1 @[FNTT_4point.scala 47:28]
    inst modBuffer_2_0 of modular_14 @[FNTT_4point.scala 50:42]
    modBuffer_2_0.clock <= clock
    modBuffer_2_0.reset <= reset
    inst modBuffer_2_1 of modular_15 @[FNTT_4point.scala 50:42]
    modBuffer_2_1.clock <= clock
    modBuffer_2_1.reset <= reset
    inst modBuffer_2_2 of modular_16 @[FNTT_4point.scala 50:42]
    modBuffer_2_2.clock <= clock
    modBuffer_2_2.reset <= reset
    inst modBuffer_2_3 of modular_17 @[FNTT_4point.scala 50:42]
    modBuffer_2_3.clock <= clock
    modBuffer_2_3.reset <= reset
    modBuffer_2_0.io.mod <= io.mod @[FNTT_4point.scala 51:46]
    modBuffer_2_1.io.mod <= io.mod @[FNTT_4point.scala 51:46]
    modBuffer_2_2.io.mod <= io.mod @[FNTT_4point.scala 51:46]
    modBuffer_2_3.io.mod <= io.mod @[FNTT_4point.scala 51:46]
    node _modBuffer_2_0_io_inData_T = add(modBuffer_1_0.io.outData, modBuffer_1_2.io.outData) @[FNTT_4point.scala 52:57]
    node _modBuffer_2_0_io_inData_T_1 = tail(_modBuffer_2_0_io_inData_T, 1) @[FNTT_4point.scala 52:57]
    modBuffer_2_0.io.inData <= _modBuffer_2_0_io_inData_T_1 @[FNTT_4point.scala 52:28]
    node _modBuffer_2_1_io_inData_T = add(modBuffer_1_1.io.outData, modBuffer_1_3.io.outData) @[FNTT_4point.scala 53:57]
    node _modBuffer_2_1_io_inData_T_1 = tail(_modBuffer_2_1_io_inData_T, 1) @[FNTT_4point.scala 53:57]
    modBuffer_2_1.io.inData <= _modBuffer_2_1_io_inData_T_1 @[FNTT_4point.scala 53:28]
    node _modBuffer_2_2_io_inData_T = add(modBuffer_1_4.io.outData, modBuffer_1_0.io.outData) @[FNTT_4point.scala 55:57]
    node _modBuffer_2_2_io_inData_T_1 = tail(_modBuffer_2_2_io_inData_T, 1) @[FNTT_4point.scala 55:57]
    modBuffer_2_2.io.inData <= _modBuffer_2_2_io_inData_T_1 @[FNTT_4point.scala 55:28]
    node _modBuffer_2_3_io_inData_T = add(modBuffer_1_5.io.outData, modBuffer_1_1.io.outData) @[FNTT_4point.scala 56:57]
    node _modBuffer_2_3_io_inData_T_1 = tail(_modBuffer_2_3_io_inData_T, 1) @[FNTT_4point.scala 56:57]
    modBuffer_2_3.io.inData <= _modBuffer_2_3_io_inData_T_1 @[FNTT_4point.scala 56:28]
    io.outData[0] <= modBuffer_2_0.io.outData @[FNTT_4point.scala 60:38]
    io.outData[1] <= modBuffer_2_1.io.outData @[FNTT_4point.scala 60:38]
    io.outData[2] <= modBuffer_2_2.io.outData @[FNTT_4point.scala 60:38]
    io.outData[3] <= modBuffer_2_3.io.outData @[FNTT_4point.scala 60:38]

  module Butterfly_2point_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>[2], flip mod : UInt<8>, outData : UInt<8>[2]}

    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[FNTT_2point.scala 11:23]
    wire _InBuffer_WIRE : UInt<8>[2] @[FNTT_2point.scala 13:33]
    _InBuffer_WIRE[0] <= UInt<8>("h0") @[FNTT_2point.scala 13:33]
    _InBuffer_WIRE[1] <= UInt<8>("h0") @[FNTT_2point.scala 13:33]
    reg InBuffer : UInt<8>[2], clock with :
      reset => (reset, _InBuffer_WIRE) @[FNTT_2point.scala 13:25]
    wire _OutBuffer_WIRE : UInt<8>[2] @[FNTT_2point.scala 14:34]
    _OutBuffer_WIRE[0] <= UInt<8>("h0") @[FNTT_2point.scala 14:34]
    _OutBuffer_WIRE[1] <= UInt<8>("h0") @[FNTT_2point.scala 14:34]
    reg OutBuffer : UInt<8>[2], clock with :
      reset => (reset, _OutBuffer_WIRE) @[FNTT_2point.scala 14:26]
    modReg <= io.mod @[FNTT_2point.scala 16:10]
    InBuffer[0] <= io.inData[0] @[FNTT_2point.scala 18:15]
    InBuffer[1] <= io.inData[1] @[FNTT_2point.scala 19:15]
    node _OutBuffer_0_T = add(InBuffer[0], InBuffer[1]) @[FNTT_2point.scala 21:31]
    node _OutBuffer_0_T_1 = tail(_OutBuffer_0_T, 1) @[FNTT_2point.scala 21:31]
    OutBuffer[0] <= _OutBuffer_0_T_1 @[FNTT_2point.scala 21:16]
    node _OutBuffer_1_T = sub(modReg, InBuffer[1]) @[FNTT_2point.scala 22:27]
    node _OutBuffer_1_T_1 = tail(_OutBuffer_1_T, 1) @[FNTT_2point.scala 22:27]
    node _OutBuffer_1_T_2 = add(_OutBuffer_1_T_1, InBuffer[0]) @[FNTT_2point.scala 22:42]
    node _OutBuffer_1_T_3 = tail(_OutBuffer_1_T_2, 1) @[FNTT_2point.scala 22:42]
    OutBuffer[1] <= _OutBuffer_1_T_3 @[FNTT_2point.scala 22:16]
    io.outData[0] <= OutBuffer[0] @[FNTT_2point.scala 24:17]
    io.outData[1] <= OutBuffer[1] @[FNTT_2point.scala 25:17]

  module modular_18 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_19 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module FNTT_2point_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>[2], flip mod : UInt<8>, outData : UInt<8>[2]}

    inst BF of Butterfly_2point_2 @[FNTT_2point.scala 34:18]
    BF.clock <= clock
    BF.reset <= reset
    inst modular_0 of modular_18 @[FNTT_2point.scala 35:39]
    modular_0.clock <= clock
    modular_0.reset <= reset
    inst modular_1 of modular_19 @[FNTT_2point.scala 35:39]
    modular_1.clock <= clock
    modular_1.reset <= reset
    BF.io.inData[0] <= io.inData[0] @[FNTT_2point.scala 37:19]
    BF.io.inData[1] <= io.inData[1] @[FNTT_2point.scala 38:19]
    BF.io.mod <= io.mod @[FNTT_2point.scala 40:13]
    modular_0.io.mod <= io.mod @[FNTT_2point.scala 41:21]
    modular_1.io.mod <= io.mod @[FNTT_2point.scala 42:21]
    modular_0.io.inData <= BF.io.outData[0] @[FNTT_2point.scala 44:24]
    modular_1.io.inData <= BF.io.outData[1] @[FNTT_2point.scala 45:24]
    io.outData[0] <= modular_0.io.outData @[FNTT_2point.scala 47:17]
    io.outData[1] <= modular_1.io.outData @[FNTT_2point.scala 48:17]

  module Butterfly_2point_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>[2], flip mod : UInt<8>, outData : UInt<8>[2]}

    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[FNTT_2point.scala 11:23]
    wire _InBuffer_WIRE : UInt<8>[2] @[FNTT_2point.scala 13:33]
    _InBuffer_WIRE[0] <= UInt<8>("h0") @[FNTT_2point.scala 13:33]
    _InBuffer_WIRE[1] <= UInt<8>("h0") @[FNTT_2point.scala 13:33]
    reg InBuffer : UInt<8>[2], clock with :
      reset => (reset, _InBuffer_WIRE) @[FNTT_2point.scala 13:25]
    wire _OutBuffer_WIRE : UInt<8>[2] @[FNTT_2point.scala 14:34]
    _OutBuffer_WIRE[0] <= UInt<8>("h0") @[FNTT_2point.scala 14:34]
    _OutBuffer_WIRE[1] <= UInt<8>("h0") @[FNTT_2point.scala 14:34]
    reg OutBuffer : UInt<8>[2], clock with :
      reset => (reset, _OutBuffer_WIRE) @[FNTT_2point.scala 14:26]
    modReg <= io.mod @[FNTT_2point.scala 16:10]
    InBuffer[0] <= io.inData[0] @[FNTT_2point.scala 18:15]
    InBuffer[1] <= io.inData[1] @[FNTT_2point.scala 19:15]
    node _OutBuffer_0_T = add(InBuffer[0], InBuffer[1]) @[FNTT_2point.scala 21:31]
    node _OutBuffer_0_T_1 = tail(_OutBuffer_0_T, 1) @[FNTT_2point.scala 21:31]
    OutBuffer[0] <= _OutBuffer_0_T_1 @[FNTT_2point.scala 21:16]
    node _OutBuffer_1_T = sub(modReg, InBuffer[1]) @[FNTT_2point.scala 22:27]
    node _OutBuffer_1_T_1 = tail(_OutBuffer_1_T, 1) @[FNTT_2point.scala 22:27]
    node _OutBuffer_1_T_2 = add(_OutBuffer_1_T_1, InBuffer[0]) @[FNTT_2point.scala 22:42]
    node _OutBuffer_1_T_3 = tail(_OutBuffer_1_T_2, 1) @[FNTT_2point.scala 22:42]
    OutBuffer[1] <= _OutBuffer_1_T_3 @[FNTT_2point.scala 22:16]
    io.outData[0] <= OutBuffer[0] @[FNTT_2point.scala 24:17]
    io.outData[1] <= OutBuffer[1] @[FNTT_2point.scala 25:17]

  module modular_20 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_21 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module FNTT_2point_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>[2], flip mod : UInt<8>, outData : UInt<8>[2]}

    inst BF of Butterfly_2point_3 @[FNTT_2point.scala 34:18]
    BF.clock <= clock
    BF.reset <= reset
    inst modular_0 of modular_20 @[FNTT_2point.scala 35:39]
    modular_0.clock <= clock
    modular_0.reset <= reset
    inst modular_1 of modular_21 @[FNTT_2point.scala 35:39]
    modular_1.clock <= clock
    modular_1.reset <= reset
    BF.io.inData[0] <= io.inData[0] @[FNTT_2point.scala 37:19]
    BF.io.inData[1] <= io.inData[1] @[FNTT_2point.scala 38:19]
    BF.io.mod <= io.mod @[FNTT_2point.scala 40:13]
    modular_0.io.mod <= io.mod @[FNTT_2point.scala 41:21]
    modular_1.io.mod <= io.mod @[FNTT_2point.scala 42:21]
    modular_0.io.inData <= BF.io.outData[0] @[FNTT_2point.scala 44:24]
    modular_1.io.inData <= BF.io.outData[1] @[FNTT_2point.scala 45:24]
    io.outData[0] <= modular_0.io.outData @[FNTT_2point.scala 47:17]
    io.outData[1] <= modular_1.io.outData @[FNTT_2point.scala 48:17]

  module modular_22 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_23 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_24 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_25 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_26 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_27 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_28 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_29 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_30 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_31 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_32 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_33 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_34 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_35 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module FNTT_4point_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>[4], flip omega : UInt<8>[2], flip mod : UInt<8>, outData : UInt<8>[4]}

    inst BF_0 of FNTT_2point_2 @[FNTT_4point.scala 13:34]
    BF_0.clock <= clock
    BF_0.reset <= reset
    inst BF_1 of FNTT_2point_3 @[FNTT_4point.scala 13:34]
    BF_1.clock <= clock
    BF_1.reset <= reset
    inst modBuffer_0_0 of modular_22 @[FNTT_4point.scala 14:43]
    modBuffer_0_0.clock <= clock
    modBuffer_0_0.reset <= reset
    inst modBuffer_0_1 of modular_23 @[FNTT_4point.scala 14:43]
    modBuffer_0_1.clock <= clock
    modBuffer_0_1.reset <= reset
    inst modBuffer_0_2 of modular_24 @[FNTT_4point.scala 14:43]
    modBuffer_0_2.clock <= clock
    modBuffer_0_2.reset <= reset
    inst modBuffer_0_3 of modular_25 @[FNTT_4point.scala 14:43]
    modBuffer_0_3.clock <= clock
    modBuffer_0_3.reset <= reset
    wire _omeaaReg_WIRE : UInt<8>[2] @[FNTT_4point.scala 15:33]
    _omeaaReg_WIRE[0] <= UInt<8>("h0") @[FNTT_4point.scala 15:33]
    _omeaaReg_WIRE[1] <= UInt<8>("h0") @[FNTT_4point.scala 15:33]
    reg omeaaReg : UInt<8>[2], clock with :
      reset => (reset, _omeaaReg_WIRE) @[FNTT_4point.scala 15:25]
    BF_0.io.mod <= io.mod @[FNTT_4point.scala 17:16]
    BF_1.io.mod <= io.mod @[FNTT_4point.scala 18:16]
    modBuffer_0_0.io.mod <= io.mod @[FNTT_4point.scala 19:46]
    modBuffer_0_1.io.mod <= io.mod @[FNTT_4point.scala 19:46]
    modBuffer_0_2.io.mod <= io.mod @[FNTT_4point.scala 19:46]
    modBuffer_0_3.io.mod <= io.mod @[FNTT_4point.scala 19:46]
    omeaaReg[0] <= io.omega[0] @[FNTT_4point.scala 21:15]
    omeaaReg[1] <= io.omega[1] @[FNTT_4point.scala 22:15]
    BF_0.io.inData[0] <= io.inData[0] @[FNTT_4point.scala 25:22]
    BF_0.io.inData[1] <= io.inData[1] @[FNTT_4point.scala 26:22]
    BF_1.io.inData[0] <= io.inData[2] @[FNTT_4point.scala 27:22]
    BF_1.io.inData[1] <= io.inData[3] @[FNTT_4point.scala 28:22]
    modBuffer_0_0.io.inData <= BF_0.io.outData[0] @[FNTT_4point.scala 30:28]
    modBuffer_0_1.io.inData <= BF_0.io.outData[1] @[FNTT_4point.scala 31:28]
    node _modBuffer_0_2_io_inData_T = mul(BF_1.io.outData[0], omeaaReg[0]) @[FNTT_4point.scala 32:51]
    modBuffer_0_2.io.inData <= _modBuffer_0_2_io_inData_T @[FNTT_4point.scala 32:28]
    node _modBuffer_0_3_io_inData_T = mul(BF_1.io.outData[1], omeaaReg[1]) @[FNTT_4point.scala 33:51]
    modBuffer_0_3.io.inData <= _modBuffer_0_3_io_inData_T @[FNTT_4point.scala 33:28]
    inst modBuffer_1_0 of modular_26 @[FNTT_4point.scala 36:43]
    modBuffer_1_0.clock <= clock
    modBuffer_1_0.reset <= reset
    inst modBuffer_1_1 of modular_27 @[FNTT_4point.scala 36:43]
    modBuffer_1_1.clock <= clock
    modBuffer_1_1.reset <= reset
    inst modBuffer_1_2 of modular_28 @[FNTT_4point.scala 36:43]
    modBuffer_1_2.clock <= clock
    modBuffer_1_2.reset <= reset
    inst modBuffer_1_3 of modular_29 @[FNTT_4point.scala 36:43]
    modBuffer_1_3.clock <= clock
    modBuffer_1_3.reset <= reset
    inst modBuffer_1_4 of modular_30 @[FNTT_4point.scala 36:43]
    modBuffer_1_4.clock <= clock
    modBuffer_1_4.reset <= reset
    inst modBuffer_1_5 of modular_31 @[FNTT_4point.scala 36:43]
    modBuffer_1_5.clock <= clock
    modBuffer_1_5.reset <= reset
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[FNTT_4point.scala 37:23]
    modBuffer_1_0.io.mod <= io.mod @[FNTT_4point.scala 38:46]
    modBuffer_1_1.io.mod <= io.mod @[FNTT_4point.scala 38:46]
    modBuffer_1_2.io.mod <= io.mod @[FNTT_4point.scala 38:46]
    modBuffer_1_3.io.mod <= io.mod @[FNTT_4point.scala 38:46]
    modBuffer_1_4.io.mod <= io.mod @[FNTT_4point.scala 38:46]
    modBuffer_1_5.io.mod <= io.mod @[FNTT_4point.scala 38:46]
    modReg <= io.mod @[FNTT_4point.scala 39:10]
    modBuffer_1_0.io.inData <= modBuffer_0_0.io.outData @[FNTT_4point.scala 41:28]
    modBuffer_1_1.io.inData <= modBuffer_0_1.io.outData @[FNTT_4point.scala 42:28]
    modBuffer_1_2.io.inData <= modBuffer_0_2.io.outData @[FNTT_4point.scala 43:28]
    modBuffer_1_3.io.inData <= modBuffer_0_3.io.outData @[FNTT_4point.scala 44:28]
    node _modBuffer_1_4_io_inData_T = sub(modReg, modBuffer_0_2.io.outData) @[FNTT_4point.scala 46:38]
    node _modBuffer_1_4_io_inData_T_1 = tail(_modBuffer_1_4_io_inData_T, 1) @[FNTT_4point.scala 46:38]
    modBuffer_1_4.io.inData <= _modBuffer_1_4_io_inData_T_1 @[FNTT_4point.scala 46:28]
    node _modBuffer_1_5_io_inData_T = sub(modReg, modBuffer_0_3.io.outData) @[FNTT_4point.scala 47:38]
    node _modBuffer_1_5_io_inData_T_1 = tail(_modBuffer_1_5_io_inData_T, 1) @[FNTT_4point.scala 47:38]
    modBuffer_1_5.io.inData <= _modBuffer_1_5_io_inData_T_1 @[FNTT_4point.scala 47:28]
    inst modBuffer_2_0 of modular_32 @[FNTT_4point.scala 50:42]
    modBuffer_2_0.clock <= clock
    modBuffer_2_0.reset <= reset
    inst modBuffer_2_1 of modular_33 @[FNTT_4point.scala 50:42]
    modBuffer_2_1.clock <= clock
    modBuffer_2_1.reset <= reset
    inst modBuffer_2_2 of modular_34 @[FNTT_4point.scala 50:42]
    modBuffer_2_2.clock <= clock
    modBuffer_2_2.reset <= reset
    inst modBuffer_2_3 of modular_35 @[FNTT_4point.scala 50:42]
    modBuffer_2_3.clock <= clock
    modBuffer_2_3.reset <= reset
    modBuffer_2_0.io.mod <= io.mod @[FNTT_4point.scala 51:46]
    modBuffer_2_1.io.mod <= io.mod @[FNTT_4point.scala 51:46]
    modBuffer_2_2.io.mod <= io.mod @[FNTT_4point.scala 51:46]
    modBuffer_2_3.io.mod <= io.mod @[FNTT_4point.scala 51:46]
    node _modBuffer_2_0_io_inData_T = add(modBuffer_1_0.io.outData, modBuffer_1_2.io.outData) @[FNTT_4point.scala 52:57]
    node _modBuffer_2_0_io_inData_T_1 = tail(_modBuffer_2_0_io_inData_T, 1) @[FNTT_4point.scala 52:57]
    modBuffer_2_0.io.inData <= _modBuffer_2_0_io_inData_T_1 @[FNTT_4point.scala 52:28]
    node _modBuffer_2_1_io_inData_T = add(modBuffer_1_1.io.outData, modBuffer_1_3.io.outData) @[FNTT_4point.scala 53:57]
    node _modBuffer_2_1_io_inData_T_1 = tail(_modBuffer_2_1_io_inData_T, 1) @[FNTT_4point.scala 53:57]
    modBuffer_2_1.io.inData <= _modBuffer_2_1_io_inData_T_1 @[FNTT_4point.scala 53:28]
    node _modBuffer_2_2_io_inData_T = add(modBuffer_1_4.io.outData, modBuffer_1_0.io.outData) @[FNTT_4point.scala 55:57]
    node _modBuffer_2_2_io_inData_T_1 = tail(_modBuffer_2_2_io_inData_T, 1) @[FNTT_4point.scala 55:57]
    modBuffer_2_2.io.inData <= _modBuffer_2_2_io_inData_T_1 @[FNTT_4point.scala 55:28]
    node _modBuffer_2_3_io_inData_T = add(modBuffer_1_5.io.outData, modBuffer_1_1.io.outData) @[FNTT_4point.scala 56:57]
    node _modBuffer_2_3_io_inData_T_1 = tail(_modBuffer_2_3_io_inData_T, 1) @[FNTT_4point.scala 56:57]
    modBuffer_2_3.io.inData <= _modBuffer_2_3_io_inData_T_1 @[FNTT_4point.scala 56:28]
    io.outData[0] <= modBuffer_2_0.io.outData @[FNTT_4point.scala 60:38]
    io.outData[1] <= modBuffer_2_1.io.outData @[FNTT_4point.scala 60:38]
    io.outData[2] <= modBuffer_2_2.io.outData @[FNTT_4point.scala 60:38]
    io.outData[3] <= modBuffer_2_3.io.outData @[FNTT_4point.scala 60:38]

  module modular_36 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_37 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_38 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_39 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_40 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_41 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_42 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_43 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_44 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_45 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_46 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_47 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_48 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_49 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_50 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_51 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_52 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_53 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_54 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_55 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_56 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_57 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_58 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_59 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_60 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_61 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_62 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_63 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module FNTT_8point :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>[8], flip omega : UInt<8>[4], flip mod : UInt<8>, outData : UInt<8>[8]}

    inst reOrder of BitReverseOrder @[FNTT_8point.scala 14:23]
    reOrder.clock <= clock
    reOrder.reset <= reset
    reOrder.io.inData[0] <= io.inData[0] @[FNTT_8point.scala 15:24]
    reOrder.io.inData[1] <= io.inData[1] @[FNTT_8point.scala 16:24]
    reOrder.io.inData[2] <= io.inData[2] @[FNTT_8point.scala 17:24]
    reOrder.io.inData[3] <= io.inData[3] @[FNTT_8point.scala 18:24]
    reOrder.io.inData[4] <= io.inData[4] @[FNTT_8point.scala 19:24]
    reOrder.io.inData[5] <= io.inData[5] @[FNTT_8point.scala 20:24]
    reOrder.io.inData[6] <= io.inData[6] @[FNTT_8point.scala 21:24]
    reOrder.io.inData[7] <= io.inData[7] @[FNTT_8point.scala 22:24]
    inst BF_0 of FNTT_4point @[FNTT_8point.scala 26:33]
    BF_0.clock <= clock
    BF_0.reset <= reset
    inst BF_1 of FNTT_4point_1 @[FNTT_8point.scala 26:33]
    BF_1.clock <= clock
    BF_1.reset <= reset
    inst modBuffer_0_0 of modular_36 @[FNTT_8point.scala 27:42]
    modBuffer_0_0.clock <= clock
    modBuffer_0_0.reset <= reset
    inst modBuffer_0_1 of modular_37 @[FNTT_8point.scala 27:42]
    modBuffer_0_1.clock <= clock
    modBuffer_0_1.reset <= reset
    inst modBuffer_0_2 of modular_38 @[FNTT_8point.scala 27:42]
    modBuffer_0_2.clock <= clock
    modBuffer_0_2.reset <= reset
    inst modBuffer_0_3 of modular_39 @[FNTT_8point.scala 27:42]
    modBuffer_0_3.clock <= clock
    modBuffer_0_3.reset <= reset
    inst modBuffer_0_4 of modular_40 @[FNTT_8point.scala 27:42]
    modBuffer_0_4.clock <= clock
    modBuffer_0_4.reset <= reset
    inst modBuffer_0_5 of modular_41 @[FNTT_8point.scala 27:42]
    modBuffer_0_5.clock <= clock
    modBuffer_0_5.reset <= reset
    inst modBuffer_0_6 of modular_42 @[FNTT_8point.scala 27:42]
    modBuffer_0_6.clock <= clock
    modBuffer_0_6.reset <= reset
    inst modBuffer_0_7 of modular_43 @[FNTT_8point.scala 27:42]
    modBuffer_0_7.clock <= clock
    modBuffer_0_7.reset <= reset
    wire _omegaReg_WIRE : UInt<8>[4] @[FNTT_8point.scala 28:33]
    _omegaReg_WIRE[0] <= UInt<8>("h0") @[FNTT_8point.scala 28:33]
    _omegaReg_WIRE[1] <= UInt<8>("h0") @[FNTT_8point.scala 28:33]
    _omegaReg_WIRE[2] <= UInt<8>("h0") @[FNTT_8point.scala 28:33]
    _omegaReg_WIRE[3] <= UInt<8>("h0") @[FNTT_8point.scala 28:33]
    reg omegaReg : UInt<8>[4], clock with :
      reset => (reset, _omegaReg_WIRE) @[FNTT_8point.scala 28:25]
    BF_0.io.mod <= io.mod @[FNTT_8point.scala 30:16]
    BF_1.io.mod <= io.mod @[FNTT_8point.scala 31:16]
    BF_0.io.inData[0] <= reOrder.io.outData[0] @[FNTT_8point.scala 35:26]
    BF_0.io.inData[1] <= reOrder.io.outData[1] @[FNTT_8point.scala 35:26]
    BF_0.io.inData[2] <= reOrder.io.outData[2] @[FNTT_8point.scala 35:26]
    BF_0.io.inData[3] <= reOrder.io.outData[3] @[FNTT_8point.scala 35:26]
    BF_1.io.inData[0] <= reOrder.io.outData[4] @[FNTT_8point.scala 35:26]
    BF_1.io.inData[1] <= reOrder.io.outData[5] @[FNTT_8point.scala 35:26]
    BF_1.io.inData[2] <= reOrder.io.outData[6] @[FNTT_8point.scala 35:26]
    BF_1.io.inData[3] <= reOrder.io.outData[7] @[FNTT_8point.scala 35:26]
    modBuffer_0_0.io.mod <= io.mod @[FNTT_8point.scala 37:46]
    modBuffer_0_1.io.mod <= io.mod @[FNTT_8point.scala 37:46]
    modBuffer_0_2.io.mod <= io.mod @[FNTT_8point.scala 37:46]
    modBuffer_0_3.io.mod <= io.mod @[FNTT_8point.scala 37:46]
    modBuffer_0_4.io.mod <= io.mod @[FNTT_8point.scala 37:46]
    modBuffer_0_5.io.mod <= io.mod @[FNTT_8point.scala 37:46]
    modBuffer_0_6.io.mod <= io.mod @[FNTT_8point.scala 37:46]
    modBuffer_0_7.io.mod <= io.mod @[FNTT_8point.scala 37:46]
    omegaReg[0] <= io.omega[0] @[FNTT_8point.scala 38:36]
    omegaReg[1] <= io.omega[1] @[FNTT_8point.scala 38:36]
    omegaReg[2] <= io.omega[2] @[FNTT_8point.scala 38:36]
    omegaReg[3] <= io.omega[3] @[FNTT_8point.scala 38:36]
    BF_0.io.omega[0] <= io.omega[0] @[FNTT_8point.scala 40:23]
    BF_0.io.omega[1] <= io.omega[2] @[FNTT_8point.scala 41:23]
    BF_1.io.omega[0] <= io.omega[0] @[FNTT_8point.scala 40:23]
    BF_1.io.omega[1] <= io.omega[2] @[FNTT_8point.scala 41:23]
    modBuffer_0_0.io.inData <= BF_0.io.outData[0] @[FNTT_8point.scala 45:28]
    modBuffer_0_1.io.inData <= BF_0.io.outData[1] @[FNTT_8point.scala 46:28]
    modBuffer_0_2.io.inData <= BF_0.io.outData[2] @[FNTT_8point.scala 47:28]
    modBuffer_0_3.io.inData <= BF_0.io.outData[3] @[FNTT_8point.scala 48:28]
    node _modBuffer_0_4_io_inData_T = mul(BF_1.io.outData[0], omegaReg[0]) @[FNTT_8point.scala 49:51]
    modBuffer_0_4.io.inData <= _modBuffer_0_4_io_inData_T @[FNTT_8point.scala 49:28]
    node _modBuffer_0_5_io_inData_T = mul(BF_1.io.outData[1], omegaReg[1]) @[FNTT_8point.scala 50:51]
    modBuffer_0_5.io.inData <= _modBuffer_0_5_io_inData_T @[FNTT_8point.scala 50:28]
    node _modBuffer_0_6_io_inData_T = mul(BF_1.io.outData[2], omegaReg[2]) @[FNTT_8point.scala 51:51]
    modBuffer_0_6.io.inData <= _modBuffer_0_6_io_inData_T @[FNTT_8point.scala 51:28]
    node _modBuffer_0_7_io_inData_T = mul(BF_1.io.outData[3], omegaReg[3]) @[FNTT_8point.scala 52:51]
    modBuffer_0_7.io.inData <= _modBuffer_0_7_io_inData_T @[FNTT_8point.scala 52:28]
    inst modBuffer_1_0 of modular_44 @[FNTT_8point.scala 55:44]
    modBuffer_1_0.clock <= clock
    modBuffer_1_0.reset <= reset
    inst modBuffer_1_1 of modular_45 @[FNTT_8point.scala 55:44]
    modBuffer_1_1.clock <= clock
    modBuffer_1_1.reset <= reset
    inst modBuffer_1_2 of modular_46 @[FNTT_8point.scala 55:44]
    modBuffer_1_2.clock <= clock
    modBuffer_1_2.reset <= reset
    inst modBuffer_1_3 of modular_47 @[FNTT_8point.scala 55:44]
    modBuffer_1_3.clock <= clock
    modBuffer_1_3.reset <= reset
    inst modBuffer_1_4 of modular_48 @[FNTT_8point.scala 55:44]
    modBuffer_1_4.clock <= clock
    modBuffer_1_4.reset <= reset
    inst modBuffer_1_5 of modular_49 @[FNTT_8point.scala 55:44]
    modBuffer_1_5.clock <= clock
    modBuffer_1_5.reset <= reset
    inst modBuffer_1_6 of modular_50 @[FNTT_8point.scala 55:44]
    modBuffer_1_6.clock <= clock
    modBuffer_1_6.reset <= reset
    inst modBuffer_1_7 of modular_51 @[FNTT_8point.scala 55:44]
    modBuffer_1_7.clock <= clock
    modBuffer_1_7.reset <= reset
    inst modBuffer_1_8 of modular_52 @[FNTT_8point.scala 55:44]
    modBuffer_1_8.clock <= clock
    modBuffer_1_8.reset <= reset
    inst modBuffer_1_9 of modular_53 @[FNTT_8point.scala 55:44]
    modBuffer_1_9.clock <= clock
    modBuffer_1_9.reset <= reset
    inst modBuffer_1_10 of modular_54 @[FNTT_8point.scala 55:44]
    modBuffer_1_10.clock <= clock
    modBuffer_1_10.reset <= reset
    inst modBuffer_1_11 of modular_55 @[FNTT_8point.scala 55:44]
    modBuffer_1_11.clock <= clock
    modBuffer_1_11.reset <= reset
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[FNTT_8point.scala 56:23]
    modBuffer_1_0.io.mod <= io.mod @[FNTT_8point.scala 57:47]
    modBuffer_1_1.io.mod <= io.mod @[FNTT_8point.scala 57:47]
    modBuffer_1_2.io.mod <= io.mod @[FNTT_8point.scala 57:47]
    modBuffer_1_3.io.mod <= io.mod @[FNTT_8point.scala 57:47]
    modBuffer_1_4.io.mod <= io.mod @[FNTT_8point.scala 57:47]
    modBuffer_1_5.io.mod <= io.mod @[FNTT_8point.scala 57:47]
    modBuffer_1_6.io.mod <= io.mod @[FNTT_8point.scala 57:47]
    modBuffer_1_7.io.mod <= io.mod @[FNTT_8point.scala 57:47]
    modBuffer_1_8.io.mod <= io.mod @[FNTT_8point.scala 57:47]
    modBuffer_1_9.io.mod <= io.mod @[FNTT_8point.scala 57:47]
    modBuffer_1_10.io.mod <= io.mod @[FNTT_8point.scala 57:47]
    modBuffer_1_11.io.mod <= io.mod @[FNTT_8point.scala 57:47]
    modReg <= io.mod @[FNTT_8point.scala 58:10]
    modBuffer_1_0.io.inData <= modBuffer_0_0.io.outData @[FNTT_8point.scala 60:49]
    modBuffer_1_1.io.inData <= modBuffer_0_1.io.outData @[FNTT_8point.scala 60:49]
    modBuffer_1_2.io.inData <= modBuffer_0_2.io.outData @[FNTT_8point.scala 60:49]
    modBuffer_1_3.io.inData <= modBuffer_0_3.io.outData @[FNTT_8point.scala 60:49]
    modBuffer_1_4.io.inData <= modBuffer_0_4.io.outData @[FNTT_8point.scala 60:49]
    modBuffer_1_5.io.inData <= modBuffer_0_5.io.outData @[FNTT_8point.scala 60:49]
    modBuffer_1_6.io.inData <= modBuffer_0_6.io.outData @[FNTT_8point.scala 60:49]
    modBuffer_1_7.io.inData <= modBuffer_0_7.io.outData @[FNTT_8point.scala 60:49]
    node _modBuffer_1_8_io_inData_T = sub(modReg, modBuffer_0_4.io.outData) @[FNTT_8point.scala 61:60]
    node _modBuffer_1_8_io_inData_T_1 = tail(_modBuffer_1_8_io_inData_T, 1) @[FNTT_8point.scala 61:60]
    modBuffer_1_8.io.inData <= _modBuffer_1_8_io_inData_T_1 @[FNTT_8point.scala 61:50]
    node _modBuffer_1_9_io_inData_T = sub(modReg, modBuffer_0_5.io.outData) @[FNTT_8point.scala 61:60]
    node _modBuffer_1_9_io_inData_T_1 = tail(_modBuffer_1_9_io_inData_T, 1) @[FNTT_8point.scala 61:60]
    modBuffer_1_9.io.inData <= _modBuffer_1_9_io_inData_T_1 @[FNTT_8point.scala 61:50]
    node _modBuffer_1_10_io_inData_T = sub(modReg, modBuffer_0_6.io.outData) @[FNTT_8point.scala 61:60]
    node _modBuffer_1_10_io_inData_T_1 = tail(_modBuffer_1_10_io_inData_T, 1) @[FNTT_8point.scala 61:60]
    modBuffer_1_10.io.inData <= _modBuffer_1_10_io_inData_T_1 @[FNTT_8point.scala 61:50]
    node _modBuffer_1_11_io_inData_T = sub(modReg, modBuffer_0_7.io.outData) @[FNTT_8point.scala 61:60]
    node _modBuffer_1_11_io_inData_T_1 = tail(_modBuffer_1_11_io_inData_T, 1) @[FNTT_8point.scala 61:60]
    modBuffer_1_11.io.inData <= _modBuffer_1_11_io_inData_T_1 @[FNTT_8point.scala 61:50]
    inst modBuffer_2_0 of modular_56 @[FNTT_8point.scala 64:42]
    modBuffer_2_0.clock <= clock
    modBuffer_2_0.reset <= reset
    inst modBuffer_2_1 of modular_57 @[FNTT_8point.scala 64:42]
    modBuffer_2_1.clock <= clock
    modBuffer_2_1.reset <= reset
    inst modBuffer_2_2 of modular_58 @[FNTT_8point.scala 64:42]
    modBuffer_2_2.clock <= clock
    modBuffer_2_2.reset <= reset
    inst modBuffer_2_3 of modular_59 @[FNTT_8point.scala 64:42]
    modBuffer_2_3.clock <= clock
    modBuffer_2_3.reset <= reset
    inst modBuffer_2_4 of modular_60 @[FNTT_8point.scala 64:42]
    modBuffer_2_4.clock <= clock
    modBuffer_2_4.reset <= reset
    inst modBuffer_2_5 of modular_61 @[FNTT_8point.scala 64:42]
    modBuffer_2_5.clock <= clock
    modBuffer_2_5.reset <= reset
    inst modBuffer_2_6 of modular_62 @[FNTT_8point.scala 64:42]
    modBuffer_2_6.clock <= clock
    modBuffer_2_6.reset <= reset
    inst modBuffer_2_7 of modular_63 @[FNTT_8point.scala 64:42]
    modBuffer_2_7.clock <= clock
    modBuffer_2_7.reset <= reset
    modBuffer_2_0.io.mod <= io.mod @[FNTT_8point.scala 65:46]
    modBuffer_2_1.io.mod <= io.mod @[FNTT_8point.scala 65:46]
    modBuffer_2_2.io.mod <= io.mod @[FNTT_8point.scala 65:46]
    modBuffer_2_3.io.mod <= io.mod @[FNTT_8point.scala 65:46]
    modBuffer_2_4.io.mod <= io.mod @[FNTT_8point.scala 65:46]
    modBuffer_2_5.io.mod <= io.mod @[FNTT_8point.scala 65:46]
    modBuffer_2_6.io.mod <= io.mod @[FNTT_8point.scala 65:46]
    modBuffer_2_7.io.mod <= io.mod @[FNTT_8point.scala 65:46]
    node _modBuffer_2_0_io_inData_T = add(modBuffer_1_0.io.outData, modBuffer_1_4.io.outData) @[FNTT_8point.scala 66:59]
    node _modBuffer_2_0_io_inData_T_1 = tail(_modBuffer_2_0_io_inData_T, 1) @[FNTT_8point.scala 66:59]
    modBuffer_2_0.io.inData <= _modBuffer_2_0_io_inData_T_1 @[FNTT_8point.scala 66:28]
    node _modBuffer_2_1_io_inData_T = add(modBuffer_1_1.io.outData, modBuffer_1_5.io.outData) @[FNTT_8point.scala 67:59]
    node _modBuffer_2_1_io_inData_T_1 = tail(_modBuffer_2_1_io_inData_T, 1) @[FNTT_8point.scala 67:59]
    modBuffer_2_1.io.inData <= _modBuffer_2_1_io_inData_T_1 @[FNTT_8point.scala 67:28]
    node _modBuffer_2_2_io_inData_T = add(modBuffer_1_2.io.outData, modBuffer_1_6.io.outData) @[FNTT_8point.scala 68:59]
    node _modBuffer_2_2_io_inData_T_1 = tail(_modBuffer_2_2_io_inData_T, 1) @[FNTT_8point.scala 68:59]
    modBuffer_2_2.io.inData <= _modBuffer_2_2_io_inData_T_1 @[FNTT_8point.scala 68:28]
    node _modBuffer_2_3_io_inData_T = add(modBuffer_1_3.io.outData, modBuffer_1_7.io.outData) @[FNTT_8point.scala 69:59]
    node _modBuffer_2_3_io_inData_T_1 = tail(_modBuffer_2_3_io_inData_T, 1) @[FNTT_8point.scala 69:59]
    modBuffer_2_3.io.inData <= _modBuffer_2_3_io_inData_T_1 @[FNTT_8point.scala 69:28]
    node _modBuffer_2_4_io_inData_T = add(modBuffer_1_8.io.outData, modBuffer_1_0.io.outData) @[FNTT_8point.scala 71:60]
    node _modBuffer_2_4_io_inData_T_1 = tail(_modBuffer_2_4_io_inData_T, 1) @[FNTT_8point.scala 71:60]
    modBuffer_2_4.io.inData <= _modBuffer_2_4_io_inData_T_1 @[FNTT_8point.scala 71:28]
    node _modBuffer_2_5_io_inData_T = add(modBuffer_1_9.io.outData, modBuffer_1_1.io.outData) @[FNTT_8point.scala 72:60]
    node _modBuffer_2_5_io_inData_T_1 = tail(_modBuffer_2_5_io_inData_T, 1) @[FNTT_8point.scala 72:60]
    modBuffer_2_5.io.inData <= _modBuffer_2_5_io_inData_T_1 @[FNTT_8point.scala 72:28]
    node _modBuffer_2_6_io_inData_T = add(modBuffer_1_10.io.outData, modBuffer_1_2.io.outData) @[FNTT_8point.scala 73:60]
    node _modBuffer_2_6_io_inData_T_1 = tail(_modBuffer_2_6_io_inData_T, 1) @[FNTT_8point.scala 73:60]
    modBuffer_2_6.io.inData <= _modBuffer_2_6_io_inData_T_1 @[FNTT_8point.scala 73:28]
    node _modBuffer_2_7_io_inData_T = add(modBuffer_1_11.io.outData, modBuffer_1_3.io.outData) @[FNTT_8point.scala 74:60]
    node _modBuffer_2_7_io_inData_T_1 = tail(_modBuffer_2_7_io_inData_T, 1) @[FNTT_8point.scala 74:60]
    modBuffer_2_7.io.inData <= _modBuffer_2_7_io_inData_T_1 @[FNTT_8point.scala 74:28]
    io.outData[0] <= modBuffer_2_0.io.outData @[FNTT_8point.scala 79:38]
    io.outData[1] <= modBuffer_2_1.io.outData @[FNTT_8point.scala 79:38]
    io.outData[2] <= modBuffer_2_2.io.outData @[FNTT_8point.scala 79:38]
    io.outData[3] <= modBuffer_2_3.io.outData @[FNTT_8point.scala 79:38]
    io.outData[4] <= modBuffer_2_4.io.outData @[FNTT_8point.scala 79:38]
    io.outData[5] <= modBuffer_2_5.io.outData @[FNTT_8point.scala 79:38]
    io.outData[6] <= modBuffer_2_6.io.outData @[FNTT_8point.scala 79:38]
    io.outData[7] <= modBuffer_2_7.io.outData @[FNTT_8point.scala 79:38]

  module modular_64 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_65 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_66 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_67 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_68 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_69 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_70 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module modular_71 :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>, flip mod : UInt<8>, outData : UInt<8>}

    reg inBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 13:25]
    reg modReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 14:23]
    reg outBuffer : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[modular.scala 15:26]
    modReg <= io.mod @[modular.scala 17:10]
    inBuffer <= io.inData @[modular.scala 18:12]
    node _outBuffer_T = rem(io.inData, modReg) @[modular.scala 21:26]
    outBuffer <= _outBuffer_T @[modular.scala 21:13]
    io.outData <= outBuffer @[modular.scala 23:14]

  module invN :
    input clock : Clock
    input reset : Reset
    output io : { flip inData : UInt<8>[8], flip mod : UInt<8>, flip invN : UInt<8>, outData : UInt<8>[8]}

    inst modBuffer_0 of modular_64 @[FNTT_FINTT_8point.scala 11:40]
    modBuffer_0.clock <= clock
    modBuffer_0.reset <= reset
    inst modBuffer_1 of modular_65 @[FNTT_FINTT_8point.scala 11:40]
    modBuffer_1.clock <= clock
    modBuffer_1.reset <= reset
    inst modBuffer_2 of modular_66 @[FNTT_FINTT_8point.scala 11:40]
    modBuffer_2.clock <= clock
    modBuffer_2.reset <= reset
    inst modBuffer_3 of modular_67 @[FNTT_FINTT_8point.scala 11:40]
    modBuffer_3.clock <= clock
    modBuffer_3.reset <= reset
    inst modBuffer_4 of modular_68 @[FNTT_FINTT_8point.scala 11:40]
    modBuffer_4.clock <= clock
    modBuffer_4.reset <= reset
    inst modBuffer_5 of modular_69 @[FNTT_FINTT_8point.scala 11:40]
    modBuffer_5.clock <= clock
    modBuffer_5.reset <= reset
    inst modBuffer_6 of modular_70 @[FNTT_FINTT_8point.scala 11:40]
    modBuffer_6.clock <= clock
    modBuffer_6.reset <= reset
    inst modBuffer_7 of modular_71 @[FNTT_FINTT_8point.scala 11:40]
    modBuffer_7.clock <= clock
    modBuffer_7.reset <= reset
    reg invNreg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[FNTT_FINTT_8point.scala 12:24]
    invNreg <= io.invN @[FNTT_FINTT_8point.scala 13:11]
    modBuffer_0.io.mod <= io.mod @[FNTT_FINTT_8point.scala 16:25]
    node _modBuffer_0_io_inData_T = mul(io.inData[0], invNreg) @[FNTT_FINTT_8point.scala 17:44]
    modBuffer_0.io.inData <= _modBuffer_0_io_inData_T @[FNTT_FINTT_8point.scala 17:28]
    io.outData[0] <= modBuffer_0.io.outData @[FNTT_FINTT_8point.scala 18:19]
    modBuffer_1.io.mod <= io.mod @[FNTT_FINTT_8point.scala 16:25]
    node _modBuffer_1_io_inData_T = mul(io.inData[1], invNreg) @[FNTT_FINTT_8point.scala 17:44]
    modBuffer_1.io.inData <= _modBuffer_1_io_inData_T @[FNTT_FINTT_8point.scala 17:28]
    io.outData[1] <= modBuffer_1.io.outData @[FNTT_FINTT_8point.scala 18:19]
    modBuffer_2.io.mod <= io.mod @[FNTT_FINTT_8point.scala 16:25]
    node _modBuffer_2_io_inData_T = mul(io.inData[2], invNreg) @[FNTT_FINTT_8point.scala 17:44]
    modBuffer_2.io.inData <= _modBuffer_2_io_inData_T @[FNTT_FINTT_8point.scala 17:28]
    io.outData[2] <= modBuffer_2.io.outData @[FNTT_FINTT_8point.scala 18:19]
    modBuffer_3.io.mod <= io.mod @[FNTT_FINTT_8point.scala 16:25]
    node _modBuffer_3_io_inData_T = mul(io.inData[3], invNreg) @[FNTT_FINTT_8point.scala 17:44]
    modBuffer_3.io.inData <= _modBuffer_3_io_inData_T @[FNTT_FINTT_8point.scala 17:28]
    io.outData[3] <= modBuffer_3.io.outData @[FNTT_FINTT_8point.scala 18:19]
    modBuffer_4.io.mod <= io.mod @[FNTT_FINTT_8point.scala 16:25]
    node _modBuffer_4_io_inData_T = mul(io.inData[4], invNreg) @[FNTT_FINTT_8point.scala 17:44]
    modBuffer_4.io.inData <= _modBuffer_4_io_inData_T @[FNTT_FINTT_8point.scala 17:28]
    io.outData[4] <= modBuffer_4.io.outData @[FNTT_FINTT_8point.scala 18:19]
    modBuffer_5.io.mod <= io.mod @[FNTT_FINTT_8point.scala 16:25]
    node _modBuffer_5_io_inData_T = mul(io.inData[5], invNreg) @[FNTT_FINTT_8point.scala 17:44]
    modBuffer_5.io.inData <= _modBuffer_5_io_inData_T @[FNTT_FINTT_8point.scala 17:28]
    io.outData[5] <= modBuffer_5.io.outData @[FNTT_FINTT_8point.scala 18:19]
    modBuffer_6.io.mod <= io.mod @[FNTT_FINTT_8point.scala 16:25]
    node _modBuffer_6_io_inData_T = mul(io.inData[6], invNreg) @[FNTT_FINTT_8point.scala 17:44]
    modBuffer_6.io.inData <= _modBuffer_6_io_inData_T @[FNTT_FINTT_8point.scala 17:28]
    io.outData[6] <= modBuffer_6.io.outData @[FNTT_FINTT_8point.scala 18:19]
    modBuffer_7.io.mod <= io.mod @[FNTT_FINTT_8point.scala 16:25]
    node _modBuffer_7_io_inData_T = mul(io.inData[7], invNreg) @[FNTT_FINTT_8point.scala 17:44]
    modBuffer_7.io.inData <= _modBuffer_7_io_inData_T @[FNTT_FINTT_8point.scala 17:28]
    io.outData[7] <= modBuffer_7.io.outData @[FNTT_FINTT_8point.scala 18:19]

  module FNTT_FINTT_8point :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip inData : UInt<8>[8], flip omega : UInt<8>[4], flip mod : UInt<8>, flip invN : UInt<8>, flip mode : UInt<1>, outData : UInt<8>[8]}

    inst NTT of FNTT_8point @[FNTT_FINTT_8point.scala 32:19]
    NTT.clock <= clock
    NTT.reset <= reset
    wire _nttReg_WIRE : UInt<8>[8] @[FNTT_FINTT_8point.scala 33:31]
    _nttReg_WIRE[0] <= UInt<8>("h0") @[FNTT_FINTT_8point.scala 33:31]
    _nttReg_WIRE[1] <= UInt<8>("h0") @[FNTT_FINTT_8point.scala 33:31]
    _nttReg_WIRE[2] <= UInt<8>("h0") @[FNTT_FINTT_8point.scala 33:31]
    _nttReg_WIRE[3] <= UInt<8>("h0") @[FNTT_FINTT_8point.scala 33:31]
    _nttReg_WIRE[4] <= UInt<8>("h0") @[FNTT_FINTT_8point.scala 33:31]
    _nttReg_WIRE[5] <= UInt<8>("h0") @[FNTT_FINTT_8point.scala 33:31]
    _nttReg_WIRE[6] <= UInt<8>("h0") @[FNTT_FINTT_8point.scala 33:31]
    _nttReg_WIRE[7] <= UInt<8>("h0") @[FNTT_FINTT_8point.scala 33:31]
    reg nttReg : UInt<8>[8], clock with :
      reset => (reset, _nttReg_WIRE) @[FNTT_FINTT_8point.scala 33:23]
    NTT.io.omega[0] <= io.omega[0] @[FNTT_FINTT_8point.scala 35:16]
    NTT.io.omega[1] <= io.omega[1] @[FNTT_FINTT_8point.scala 35:16]
    NTT.io.omega[2] <= io.omega[2] @[FNTT_FINTT_8point.scala 35:16]
    NTT.io.omega[3] <= io.omega[3] @[FNTT_FINTT_8point.scala 35:16]
    NTT.io.mod <= io.mod @[FNTT_FINTT_8point.scala 36:14]
    NTT.io.inData[0] <= io.inData[0] @[FNTT_FINTT_8point.scala 38:22]
    nttReg[0] <= NTT.io.outData[0] @[FNTT_FINTT_8point.scala 39:15]
    NTT.io.inData[1] <= io.inData[1] @[FNTT_FINTT_8point.scala 38:22]
    nttReg[1] <= NTT.io.outData[1] @[FNTT_FINTT_8point.scala 39:15]
    NTT.io.inData[2] <= io.inData[2] @[FNTT_FINTT_8point.scala 38:22]
    nttReg[2] <= NTT.io.outData[2] @[FNTT_FINTT_8point.scala 39:15]
    NTT.io.inData[3] <= io.inData[3] @[FNTT_FINTT_8point.scala 38:22]
    nttReg[3] <= NTT.io.outData[3] @[FNTT_FINTT_8point.scala 39:15]
    NTT.io.inData[4] <= io.inData[4] @[FNTT_FINTT_8point.scala 38:22]
    nttReg[4] <= NTT.io.outData[4] @[FNTT_FINTT_8point.scala 39:15]
    NTT.io.inData[5] <= io.inData[5] @[FNTT_FINTT_8point.scala 38:22]
    nttReg[5] <= NTT.io.outData[5] @[FNTT_FINTT_8point.scala 39:15]
    NTT.io.inData[6] <= io.inData[6] @[FNTT_FINTT_8point.scala 38:22]
    nttReg[6] <= NTT.io.outData[6] @[FNTT_FINTT_8point.scala 39:15]
    NTT.io.inData[7] <= io.inData[7] @[FNTT_FINTT_8point.scala 38:22]
    nttReg[7] <= NTT.io.outData[7] @[FNTT_FINTT_8point.scala 39:15]
    inst invNmodule of invN @[FNTT_FINTT_8point.scala 43:26]
    invNmodule.clock <= clock
    invNmodule.reset <= reset
    wire _inttReg_WIRE : UInt<8>[8] @[FNTT_FINTT_8point.scala 44:32]
    _inttReg_WIRE[0] <= UInt<8>("h0") @[FNTT_FINTT_8point.scala 44:32]
    _inttReg_WIRE[1] <= UInt<8>("h0") @[FNTT_FINTT_8point.scala 44:32]
    _inttReg_WIRE[2] <= UInt<8>("h0") @[FNTT_FINTT_8point.scala 44:32]
    _inttReg_WIRE[3] <= UInt<8>("h0") @[FNTT_FINTT_8point.scala 44:32]
    _inttReg_WIRE[4] <= UInt<8>("h0") @[FNTT_FINTT_8point.scala 44:32]
    _inttReg_WIRE[5] <= UInt<8>("h0") @[FNTT_FINTT_8point.scala 44:32]
    _inttReg_WIRE[6] <= UInt<8>("h0") @[FNTT_FINTT_8point.scala 44:32]
    _inttReg_WIRE[7] <= UInt<8>("h0") @[FNTT_FINTT_8point.scala 44:32]
    reg inttReg : UInt<8>[8], clock with :
      reset => (reset, _inttReg_WIRE) @[FNTT_FINTT_8point.scala 44:24]
    invNmodule.io.invN <= io.invN @[FNTT_FINTT_8point.scala 45:22]
    invNmodule.io.mod <= io.mod @[FNTT_FINTT_8point.scala 46:21]
    invNmodule.io.inData[0] <= nttReg[0] @[FNTT_FINTT_8point.scala 48:29]
    inttReg[0] <= invNmodule.io.outData[0] @[FNTT_FINTT_8point.scala 49:16]
    invNmodule.io.inData[1] <= nttReg[1] @[FNTT_FINTT_8point.scala 48:29]
    inttReg[1] <= invNmodule.io.outData[1] @[FNTT_FINTT_8point.scala 49:16]
    invNmodule.io.inData[2] <= nttReg[2] @[FNTT_FINTT_8point.scala 48:29]
    inttReg[2] <= invNmodule.io.outData[2] @[FNTT_FINTT_8point.scala 49:16]
    invNmodule.io.inData[3] <= nttReg[3] @[FNTT_FINTT_8point.scala 48:29]
    inttReg[3] <= invNmodule.io.outData[3] @[FNTT_FINTT_8point.scala 49:16]
    invNmodule.io.inData[4] <= nttReg[4] @[FNTT_FINTT_8point.scala 48:29]
    inttReg[4] <= invNmodule.io.outData[4] @[FNTT_FINTT_8point.scala 49:16]
    invNmodule.io.inData[5] <= nttReg[5] @[FNTT_FINTT_8point.scala 48:29]
    inttReg[5] <= invNmodule.io.outData[5] @[FNTT_FINTT_8point.scala 49:16]
    invNmodule.io.inData[6] <= nttReg[6] @[FNTT_FINTT_8point.scala 48:29]
    inttReg[6] <= invNmodule.io.outData[6] @[FNTT_FINTT_8point.scala 49:16]
    invNmodule.io.inData[7] <= nttReg[7] @[FNTT_FINTT_8point.scala 48:29]
    inttReg[7] <= invNmodule.io.outData[7] @[FNTT_FINTT_8point.scala 49:16]
    node _io_outData_0_T = mux(io.mode, nttReg[0], inttReg[0]) @[FNTT_FINTT_8point.scala 54:44]
    io.outData[0] <= _io_outData_0_T @[FNTT_FINTT_8point.scala 54:38]
    node _io_outData_1_T = mux(io.mode, nttReg[1], inttReg[1]) @[FNTT_FINTT_8point.scala 54:44]
    io.outData[1] <= _io_outData_1_T @[FNTT_FINTT_8point.scala 54:38]
    node _io_outData_2_T = mux(io.mode, nttReg[2], inttReg[2]) @[FNTT_FINTT_8point.scala 54:44]
    io.outData[2] <= _io_outData_2_T @[FNTT_FINTT_8point.scala 54:38]
    node _io_outData_3_T = mux(io.mode, nttReg[3], inttReg[3]) @[FNTT_FINTT_8point.scala 54:44]
    io.outData[3] <= _io_outData_3_T @[FNTT_FINTT_8point.scala 54:38]
    node _io_outData_4_T = mux(io.mode, nttReg[4], inttReg[4]) @[FNTT_FINTT_8point.scala 54:44]
    io.outData[4] <= _io_outData_4_T @[FNTT_FINTT_8point.scala 54:38]
    node _io_outData_5_T = mux(io.mode, nttReg[5], inttReg[5]) @[FNTT_FINTT_8point.scala 54:44]
    io.outData[5] <= _io_outData_5_T @[FNTT_FINTT_8point.scala 54:38]
    node _io_outData_6_T = mux(io.mode, nttReg[6], inttReg[6]) @[FNTT_FINTT_8point.scala 54:44]
    io.outData[6] <= _io_outData_6_T @[FNTT_FINTT_8point.scala 54:38]
    node _io_outData_7_T = mux(io.mode, nttReg[7], inttReg[7]) @[FNTT_FINTT_8point.scala 54:44]
    io.outData[7] <= _io_outData_7_T @[FNTT_FINTT_8point.scala 54:38]

