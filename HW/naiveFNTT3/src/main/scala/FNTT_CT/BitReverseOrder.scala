package FNTT_CT
import chisel3._
class BitReverseOrder(width : Int) extends Module {
  val io = IO(new Bundle(){
    val inData = Input(Vec(8, UInt(width.W)))
    val outData = Output(Vec(8, UInt(width.W)))
  })
  io.outData(0) := io.inData(0)
  io.outData(1) := io.inData(4)
  io.outData(2) := io.inData(2)
  io.outData(3) := io.inData(6)
  io.outData(4) := io.inData(1)
  io.outData(5) := io.inData(5)
  io.outData(6) := io.inData(3)
  io.outData(7) := io.inData(7)
}
