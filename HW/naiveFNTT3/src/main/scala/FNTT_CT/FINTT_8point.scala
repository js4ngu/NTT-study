package FNTT_CT
import chisel3._

class invN(width : Int) extends Module{
  val io = IO(new Bundle() {
    val inData = Input(Vec(8, UInt(width.W)))
    val mod = Input(UInt(width.W))
    val invN  = Input(UInt(width.W))
    val outData = Output(Vec(8, UInt(width.W)))
  })
  val modBuffer = Vector.fill(8)(Module(new modular(width)))
  val invNreg = RegInit(0.U(width.W))
  invNreg := io.invN

  for (i <- 0 until 8) {
    modBuffer(i).io.mod := io.mod
    modBuffer(i).io.inData := io.inData(i) * invNreg
    io.outData(i) := modBuffer(i).io.outData
  }
}

class FINTT_8point(width : Int) extends Module {
  val io = IO(new Bundle(){
    val inData = Input(Vec(8, UInt(width.W)))
    val omega = Input(Vec(4, UInt(width.W)))
    val mod = Input(UInt(width.W))
    val invN  = Input(UInt(width.W))
    val outData = Output(Vec(8, UInt(width.W)))
  })
  //NTT setting
  val NTT = Module(new FNTT_8point(width))
  val nttReg = RegInit(VecInit(Seq.fill(8)(0.U(width.W))))

  NTT.io.omega := io.omega
  NTT.io.mod := io.mod

  for (i <- 0 until 8){
    NTT.io.inData(i) := io.inData(i)
    nttReg(i) := NTT.io.outData(i)
  }

  //INTT setting
  val invNmodule = Module(new invN(width))
  val inttReg = RegInit(VecInit(Seq.fill(8)(0.U(width.W))))

  invNmodule.io.invN := io.invN
  invNmodule.io.mod := io.mod

  for (i <- 0 until 8) invNmodule.io.inData(i) := nttReg(i)
  for (i <- 0 until 8) io.outData(i) :=  invNmodule.io.outData(i)
}
