package FNTT_CT
import chisel3._
//Number Theoretic Transform and Its Applications in Lattice-based Cryptosystems: A Survey - Fig6.a
class FNTT_8point(width : Int) extends Module {
  val io = IO(new Bundle() {
    val inData = Input(Vec(8, UInt(width.W)))
    val omega = Input(Vec(4, UInt(width.W)))
    val mod = Input(UInt(width.W))
    val outData = Output(Vec(8, UInt(width.W)))
  })

  //Init support Module
  //bitReverseOrder
  val reOrder = Module(new BitReverseOrder(width))
  reOrder.io.inData(0) := io.inData(0)
  reOrder.io.inData(1) := io.inData(1)
  reOrder.io.inData(2) := io.inData(2)
  reOrder.io.inData(3) := io.inData(3)
  reOrder.io.inData(4) := io.inData(4)
  reOrder.io.inData(5) := io.inData(5)
  reOrder.io.inData(6) := io.inData(6)
  reOrder.io.inData(7) := io.inData(7)

  for (i <- 0 until 2)
    for (j <- 0 until 4)
      BF(i).io.inData(j) := reOrder.io.outData(4 * i + j)

  //Omega gen

  //BF Setting
  val BF = Vector.fill(2)(Module(new FNTT_4point(width)))
  val modBuffer_0 = Vector.fill(8)(Module(new modular(width)))
  val omeaaReg = RegInit(VecInit(Seq.fill(4)(0.U(width.W))))

  BF(0).io.mod := io.mod
  BF(1).io.mod := io.mod
  for (i <- 0 until 8) modBuffer_0(i).io.mod := io.mod
  for (i <- 0 until 4) omeaaReg(i) := io.omega(i)
  for (i <- 0 until 2) {
    BF(i).io.omega(0) := io.omega(0)
    BF(i).io.omega(1) := io.omega(2)
  }

  //stage0
  modBuffer_0(0).io.inData := BF(0).io.outData(0)
  modBuffer_0(1).io.inData := BF(0).io.outData(1)
  modBuffer_0(2).io.inData := BF(0).io.outData(2)
  modBuffer_0(3).io.inData := BF(0).io.outData(3)
  modBuffer_0(4).io.inData := BF(1).io.outData(0) * omeaaReg(0)
  modBuffer_0(5).io.inData := BF(1).io.outData(1) * omeaaReg(1)
  modBuffer_0(6).io.inData := BF(1).io.outData(2) * omeaaReg(2)
  modBuffer_0(7).io.inData := BF(1).io.outData(3) * omeaaReg(3)

  //stage1
  val modBuffer_1 = Vector.fill(12)(Module (new modular(width)) )
  val modReg = RegInit(0.U(width.W))
  for (i <- 0 until 12) modBuffer_1(i).io.mod := io.mod
  modReg := io.mod

  for (i <- 0 until 8) modBuffer_1(i).io.inData := modBuffer_0(i).io.outData
  for (i <- 8 until 12) modBuffer_1(i).io.inData := modReg - modBuffer_0(i - 4).io.outData

  //stage2
  val modBuffer_2 = Vector.fill(8)(Module(new modular(width)))
  for (i <- 0 until 8) modBuffer_2(i).io.mod := io.mod
  modBuffer_2(0).io.inData := ( modBuffer_1(0).io.outData + modBuffer_1(4).io.outData)
  modBuffer_2(1).io.inData := ( modBuffer_1(1).io.outData + modBuffer_1(5).io.outData)
  modBuffer_2(2).io.inData := ( modBuffer_1(2).io.outData + modBuffer_1(6).io.outData)
  modBuffer_2(3).io.inData := ( modBuffer_1(3).io.outData + modBuffer_1(7).io.outData)

  modBuffer_2(4).io.inData := ( modBuffer_1(8).io.outData  + modBuffer_1(0).io.outData)
  modBuffer_2(5).io.inData := ( modBuffer_1(9).io.outData  + modBuffer_1(1).io.outData)
  modBuffer_2(6).io.inData := ( modBuffer_1(10).io.outData + modBuffer_1(2).io.outData)
  modBuffer_2(7).io.inData := ( modBuffer_1(11).io.outData + modBuffer_1(3).io.outData)



  //for Debug
  for (i <- 0 until 8) io.outData(i) := modBuffer_2(i).io.outData

}