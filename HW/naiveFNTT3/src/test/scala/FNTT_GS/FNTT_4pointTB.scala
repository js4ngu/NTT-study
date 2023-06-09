package FNTT_GS
import chisel3._
import chiseltest._

import org.scalatest.flatspec.AnyFlatSpec

class FNTT_4pointTB extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "4pointTB"
  it should "4pointTB ex" in{
    test(new FNTT_4point(width = 8)).withAnnotations(Seq(WriteVcdAnnotation)) { p =>
      //HW Init
      p.io.omega(0).poke(1.U(8.W))
      p.io.omega(1).poke(2.U(8.W))

      p.io.mod.poke(5.U(8.W))

      //Data Injecton
      p.io.inData(0).poke(0.U(8.W))
      p.io.inData(1).poke(2.U(8.W))
      p.io.inData(2).poke(1.U(8.W))
      p.io.inData(3).poke(3.U(8.W))

      p.clock.step(20)

      p.io.outData(0).expect(1.U(8.W))
      p.io.outData(1).expect(4.U(8.W))
      p.io.outData(2).expect(3.U(8.W))
      p.io.outData(3).expect(2.U(8.W))
    }
  }
}