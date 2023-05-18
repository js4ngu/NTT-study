package FNTT_CT
import chisel3._

class polynomialMul(width : Int) extends Module {
  val io = IO(new Bundle() {
    val inData = Input(Vec(2, Vec(8, UInt(width.W))))
    val mod = Input(UInt(width.W)) //
    val omega = Input(Vec(4, UInt(width.W))) //

    val invOmega = Input(Vec(4, UInt(width.W)))
    val invN = Input(UInt(width.W))

    val outData = Output(Vec(8, UInt(width.W)))
  })

  //ntt setting
  val ntt = Vector.fill(2)(Module(new FNTT_8point(width)))
  for (i <- 0 until 2) {
    for (j <- 0 until 4) {
      ntt(i).io.omega(j) := io.omega(j)
      ntt(i).io.mod := io.mod
    }
  }

  //intt setting
  val intt = Module(new FINTT_8point(width))
  intt.io.mod := io.mod
  intt.io.invN := io.invN
  for (i <- 0 until 4) intt.io.omega(i) := io.invOmega(i)

  //modular setting
  val nttBuff = Vector.fill(8)(Module(new modular(width)))
  val inttBuff = Vector.fill(8)(Module(new modular(width)))

  for (i <- 0 until 8) {
    nttBuff(i).io.mod := io.mod
    inttBuff(i).io.mod := io.mod
  }

  //data_injection
  for (i <- 0 until 2)
    for (j <- 0 until 8)
      ntt(i).io.inData(j) := io.inData(i)(j)

  for (i <- 0 until 8) nttBuff(i).io.inData := ntt(0).io.outData(i) * ntt(1).io.outData(i)

  //
  //inv Transform
  for (i <- 0 until 8) intt.io.inData(i) := nttBuff(i).io.outData
  for (i <- 0 until 8) inttBuff(i).io.inData := intt.io.outData(i)

  for (i <- 0 until 8) io.outData(i) := inttBuff(i).io.outData

}