package FNTT_GS
import chisel3._

class modular(width : Int) extends Module {
  val io = IO(new Bundle(){
    val inData = Input(UInt(width.W))
    val mod = Input(UInt(width.W))
    val outData = Output(UInt(width.W))
  })
  val inBuffer = RegInit(0.U(width.W))
  val modReg = RegInit(0.U(width.W))
  val outBuffer = RegInit(0.U(width.W))

  modReg := io.mod
  inBuffer := io.inData

  //추후 Optima 해야할 로직임
  outBuffer := io.inData % modReg

  io.outData := outBuffer
}
