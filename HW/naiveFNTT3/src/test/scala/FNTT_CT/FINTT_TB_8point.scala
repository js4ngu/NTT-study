package FNTT_CT
import chisel3._
import chiseltest._
import firrtl.Utils.False
import org.scalatest.flatspec.AnyFlatSpec

class invNTB extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "invNtb"
  it should "invN ex" in {
    test(new invN(width = 8)).withAnnotations(Seq(WriteVcdAnnotation)) { p =>
      for (i <- 0 until 8) p.io.inData(i).poke(5.U(8.W))
      p.io.mod.poke(17.U(8.W))
      p.io.invN.poke(0.U(8.W))
      p.clock.step(10)
      for (i <- 0 until 8) p.io.outData(i).expect(0.U(8.W))
    }
  }
}

class FINTT_8paointTB extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "8point INTT TB"
  it should "8point INTT TB" in{
    test(new FINTT_8point(width = 8)).withAnnotations(Seq(WriteVcdAnnotation)) { p =>
      //HW Init
      p.io.mod.poke(17 .U(8.W))
      p.io.invN.poke(15 .U(8.W))

      p.io.omega(0).poke(1.U(8.W))
      p.io.omega(1).poke(2.U(8.W))
      p.io.omega(2).poke(4.U(8.W)) //81%17
      p.io.omega(3).poke(8.U(8.W)) //729%19=15

      //Data Injecton
      p.io.inData(0).poke(11.U(8.W))
      p.io.inData(1).poke(1.U(8.W))
      p.io.inData(2).poke(12.U(8.W))
      p.io.inData(3).poke(3.U(8.W))
      p.io.inData(4).poke(13.U(8.W))
      p.io.inData(5).poke(6.U(8.W))
      p.io.inData(6).poke(14.U(8.W))
      p.io.inData(7).poke(8.U(8.W))

      p.clock.step(20)

      p.io.outData(0).expect(0.U(8.W))
      p.io.outData(1).expect(1.U(8.W))
      p.io.outData(2).expect(2.U(8.W))
      p.io.outData(3).expect(3.U(8.W))
      p.io.outData(4).expect(4.U(8.W))
      p.io.outData(5).expect(5.U(8.W))
      p.io.outData(6).expect(6.U(8.W))
      p.io.outData(7).expect(7.U(8.W))
    }
  }
}