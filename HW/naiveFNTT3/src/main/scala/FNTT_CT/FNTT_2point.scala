package FNTT_CT
import chisel3._
//Number Theoretic Transform and Its Applications in Lattice-based Cryptosystems: A Survey - Fig6.a
class Butterfly_2point(width : Int) extends Module {
  val io = IO(new Bundle(){
    val inData = Input(Vec(2, UInt(width.W)))
    val mod = Input(UInt(width.W))
    val outData = Output(Vec(2, UInt(width.W)))
  })

  val modReg = RegInit(0.U(width.W))

  val InBuffer = RegInit(VecInit(Seq.fill(2)(0.U(width.W))))
  val OutBuffer = RegInit(VecInit(Seq.fill(2)(0.U(width.W))))

  modReg := io.mod

  InBuffer(0) := io.inData(0)
  InBuffer(1) := io.inData(1)

  OutBuffer(0) := InBuffer(0) + InBuffer(1)
  OutBuffer(1) := (modReg - InBuffer(1)) + InBuffer(0)

  io.outData(0) := OutBuffer(0)
  io.outData(1) := OutBuffer(1)
}

class FNTT_2point(width : Int) extends Module {
  val io = IO(new Bundle(){
    val inData = Input(Vec(2, UInt(width.W)))
    val mod = Input(UInt(width.W))
    val outData = Output(Vec(2, UInt(width.W)))
  })
  val BF = Module( new Butterfly_2point(width) )
  val modular = Vector.fill(2)(Module (new modular(width)) )

  BF.io.inData(0) := io.inData(0)
  BF.io.inData(1) := io.inData(1)

  BF.io.mod := io.mod
  modular(0).io.mod := io.mod
  modular(1).io.mod := io.mod

  modular(0).io.inData := BF.io.outData(0)
  modular(1).io.inData := BF.io.outData(1)

  io.outData(0) := modular(0).io.outData
  io.outData(1) := modular(1).io.outData
}

