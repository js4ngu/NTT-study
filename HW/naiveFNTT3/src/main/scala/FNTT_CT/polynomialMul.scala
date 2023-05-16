package FNTT_CT
import chisel3._

class polynomialMul(width : Int) extends Module {
  val io = IO(new Bundle() {
    val inData = Input(Vec(2, Vec(8, UInt(width.W))))
    val mod = Input(UInt(width.W))//
    val omega = Input(Vec(4, UInt(width.W)))//

    val invOmega = Input(Vec(4, UInt(width.W)))
    val invN = Input(UInt(width.W))

    val outData = Output(Vec(8, UInt(width.W)))
  })

  //common setting
  val ntt = Vector.fill(3)(Module(new FNTT_FINTT_8point(width)))
  val modBuffer0 = Vector.fill(8)(Module(new modular(width)))
  val modBuffer1 = Vector.fill(8)(Module(new modular(width)))

  for (i <- 0 until 8) modBuffer0(i).io.mod := io.mod
  for (i <- 0 until 8) modBuffer1(i).io.mod := io.mod

  for(i <- 0 until 3) ntt(i).io.mod := io.mod

  //ntt setting
  for(i <- 0 until 2) {
    for(j <- 0 until 4) {
      ntt(i).io.omega(j) := io.omega(j)
      ntt(i).io.invN := io.invN
      ntt(i).io.mode := true.B
    }
  }
  //intt setting
  for(i <- 0 until 4) ntt(2).io.omega(i) := io.invOmega(i)
  ntt(2).io.invN := io.invN
  ntt(2).io.mode := false.B

  //data_injection
  for (i <- 0 until 2)
    for (j <- 0 until 8)
      ntt(i).io.inData(j) := io.inData(i)(j)

  for (i <- 0 until 8) modBuffer0(i).io.inData := ntt(0).io.outData(i) * ntt(1).io.outData(i)

  //invTransform
  for (i <- 0 until 8) {
    ntt(2).io.inData(i) := modBuffer0(i).io.outData
    modBuffer1(i).io.inData := ntt(2).io.outData(i)
  }

  //out
  for (i <- 0 until 8) io.outData(i) := modBuffer1(i).io.outData
}
