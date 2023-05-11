package FNTT
import chisel3._

class FNTT_4point(width : Int) extends Module {
  val io = IO(new Bundle() {
    val inData = Input(Vec(4, UInt(width.W)))
    val omega = Input(Vec(4, UInt(width.W)))
    val mod = Input(UInt(width.W))
    val outData = Output(Vec(4, UInt(width.W)))
  })
  //stage1 Setting
  val BF = Vector.fill(2)(Module (new FNTT_2point(width)) )
  val modBuffer_0 = Vector.fill(4)(Module (new modular(width)) )
  val omeaaReg = RegInit(VecInit(Seq.fill(2)(0.U(width.W))))

  BF(0).io.mod := io.mod
  BF(1).io.mod := io.mod
  for (i <- 0 until 4) modBuffer_0(i).io.mod := io.mod

  omeaaReg(0) := io.omega(0)
  omeaaReg(1) := io.omega(2)

  //stage10
  BF(0).io.inData(0) := io.inData(0)
  BF(0).io.inData(1) := io.inData(1)
  BF(1).io.inData(0) := io.inData(2)
  BF(1).io.inData(1) := io.inData(3)

  modBuffer_0(0).io.inData := BF(0).io.outData(0)
  modBuffer_0(1).io.inData := BF(0).io.outData(1) * omeaaReg(0)
  modBuffer_0(2).io.inData := BF(1).io.outData(0)
  modBuffer_0(3).io.inData := BF(1).io.outData(1) * omeaaReg(1)

  //stage1
  val modBuffer_1 = Vector.fill(6)(Module (new modular(width)) )
  val modReg = RegInit(0.U(width.W))
  for (i <- 0 until 6) modBuffer_1(i).io.mod := io.mod
  modReg := io.mod

  modBuffer_1(0).io.inData := modBuffer_0(0).io.outData
  modBuffer_1(1).io.inData := modBuffer_0(1).io.outData
  modBuffer_1(2).io.inData := modBuffer_0(2).io.outData
  modBuffer_1(3).io.inData := modBuffer_0(3).io.outData

  modBuffer_1(4).io.inData := modReg - modBuffer_0(2).io.outData
  modBuffer_1(5).io.inData := modReg - modBuffer_0(3).io.outData

  //stage2
  val modBuffer_2 = Vector.fill(4)(Module(new modular(width)))
  for (i <- 0 until 4) modBuffer_2(i).io.mod := io.mod
  modBuffer_2(0).io.inData := modBuffer_1(0).io.outData + modBuffer_1(2).io.outData
  modBuffer_2(1).io.inData := modBuffer_1(1).io.outData + modBuffer_1(3).io.outData

  modBuffer_2(2).io.inData := modBuffer_1(4).io.outData + modBuffer_1(0).io.outData
  modBuffer_2(3).io.inData := modBuffer_1(5).io.outData + modBuffer_1(1).io.outData


  //for Debug
  for (i <- 0 until 4) io.outData(i) := modBuffer_1(i).io.outData
}
