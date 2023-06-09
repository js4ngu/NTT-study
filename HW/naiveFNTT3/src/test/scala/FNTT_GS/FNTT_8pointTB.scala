package FNTT_GS
import chisel3._
import chiseltest._

import org.scalatest.flatspec.AnyFlatSpec

class FNTT_4pointFor8pointTB extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "4pointTB"
  it should "4pointTB ex" in{
    test(new FNTT_4point(width = 8)).withAnnotations(Seq(WriteVcdAnnotation)) { p =>
      //HW Init
      p.io.omega(0).poke(1.U(8.W))
      p.io.omega(1).poke(13.U(8.W))

      p.io.mod.poke(17.U(8.W))

      //Data Injecton
      p.io.inData(0).poke(0.U(8.W))
      p.io.inData(1).poke(4.U(8.W))
      p.io.inData(2).poke(2.U(8.W))
      p.io.inData(3).poke(6.U(8.W))

      p.clock.step(20)

      p.io.outData(0).expect(12.U(8.W))
      p.io.outData(1).expect(12.U(8.W))
      p.io.outData(2).expect(13.U(8.W))
      p.io.outData(3).expect(14.U(8.W))
    }
  }
}
class FNTT_8pointTB extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "8pointTB"
  it should "8pointTB ex" in{
    test(new FNTT_8point(width = 8)).withAnnotations(Seq(WriteVcdAnnotation)) { p =>
      //HW Init
      p.io.omega(0).poke(1 .U(8.W))
      p.io.omega(1).poke(9.U(8.W))
      p.io.omega(2).poke(13.U(8.W))
      p.io.omega(3).poke(15.U(8.W))

      p.io.mod.poke(17.U(8.W))

      //Data Injecton
      p.io.inData(0).poke(0.U(8.W))
      p.io.inData(1).poke(4.U(8.W))
      p.io.inData(2).poke(2.U(8.W))
      p.io.inData(3).poke(6.U(8.W))
      p.io.inData(4).poke(1.U(8.W))
      p.io.inData(5).poke(5.U(8.W))
      p.io.inData(6).poke(3.U(8.W))
      p.io.inData(7).poke(7.U(8.W))

      p.clock.step(20)

      p.io.outData(0).expect(11.U(8.W))
      p.io.outData(1).expect(1.U(8.W))
      p.io.outData(2).expect(12.U(8.W))
      p.io.outData(3).expect(3.U(8.W))

      p.io.outData(4).expect(13.U(8.W))
      p.io.outData(5).expect(6.U(8.W))
      p.io.outData(6).expect(14.U(8.W))
      p.io.outData(7).expect(8.U(8.W))

    }
  }
}