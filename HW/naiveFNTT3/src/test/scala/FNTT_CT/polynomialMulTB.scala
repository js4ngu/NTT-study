package FNTT_CT
import chisel3._
import chiseltest._
import firrtl.Utils.False
import org.scalatest.flatspec.AnyFlatSpec

class polynomialMulTB extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "polynomialMulTB"
  it should "polynomialMul ex" in {
    test(new polynomialMul(width = 8)).withAnnotations(Seq(WriteVcdAnnotation)) { p =>
      //HW Init
      p.io.mod.poke(17.U(8.W))

      //NTT
      p.io.omega(0).poke(1.U(8.W))
      p.io.omega(1).poke(9.U(8.W))
      p.io.omega(2).poke(13.U(8.W)) //81%17
      p.io.omega(3).poke(15.U(8.W)) //729%19=15

      //INTT
      p.io.invOmega(0).poke(1.U(8.W))
      p.io.invOmega(1).poke(2.U(8.W))
      p.io.invOmega(2).poke(4.U(8.W)) //81%17
      p.io.invOmega(3).poke(8.U(8.W)) //729%19=15
      p.io.invN.poke(15 .U(8.W))

      //Data Injecton
      p.io.inData(0)(0).poke(2.U(8.W))
      p.io.inData(0)(1).poke(1.U(8.W))
      p.io.inData(0)(2).poke(3.U(8.W))
      p.io.inData(0)(3).poke(0.U(8.W))
      p.io.inData(0)(4).poke(0.U(8.W))
      p.io.inData(0)(5).poke(0.U(8.W))
      p.io.inData(0)(6).poke(0.U(8.W))
      p.io.inData(0)(7).poke(0.U(8.W))

      //Data Injecton
      p.io.inData(1)(0).poke(3.U(8.W))
      p.io.inData(1)(1).poke(2.U(8.W))
      p.io.inData(1)(2).poke(2.U(8.W))
      p.io.inData(1)(3).poke(0.U(8.W))
      p.io.inData(1)(4).poke(0.U(8.W))
      p.io.inData(1)(5).poke(0.U(8.W))
      p.io.inData(1)(6).poke(0.U(8.W))
      p.io.inData(1)(7).poke(0.U(8.W))

      p.clock.step(20)

      p.io.outData(0).expect(0.U(8.W))
      p.io.outData(1).expect(0.U(8.W))
      p.io.outData(2).expect(0.U(8.W))
      p.io.outData(3).expect(0.U(8.W))
      p.io.outData(4).expect(0.U(8.W))
      p.io.outData(5).expect(0.U(8.W))
      p.io.outData(6).expect(0.U(8.W))
      p.io.outData(7).expect(0.U(8.W))
    }
  }
}
