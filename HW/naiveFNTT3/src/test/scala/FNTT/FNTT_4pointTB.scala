package FNTT
import chisel3._
import chiseltest._

import org.scalatest.flatspec.AnyFlatSpec

class FNTT_4pointTB extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "4pointTB"
  it should "4pointTB ex" in{
    test(new FNTT_4point(width = 8)).withAnnotations(Seq(WriteVcdAnnotation)) { p =>
      //HW Init
      p.io.omega(0).poke(1.U(8.W))
      p.io.omega(1).poke(9.U(8.W))
      p.io.omega(2).poke(17.U(8.W))
      p.io.omega(3).poke(9.U(8.W))

      p.io.mod.poke(17.U(8.W))

      //Data Injecton
      p.io.inData(0).poke(1.U(8.W))
      p.io.inData(1).poke(0.U(8.W))
      p.io.inData(2).poke(1.U(8.W))
      p.io.inData(3).poke(0.U(8.W))

      p.clock.step(10)

      p.io.outData(0).expect(1.U(8.W))
      p.io.outData(1).expect(1.U(8.W))
      p.io.outData(2).expect(1.U(8.W))
      p.io.outData(3).expect(0.U(8.W))
    }
  }
}