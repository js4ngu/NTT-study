package FNTT_GS
import chisel3._
import chiseltest._

import org.scalatest.flatspec.AnyFlatSpec

class Butterfly_2pointTB extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "Butterfly_2pointTB"
  it should "Butterfly_2point ex" in {
    test(new Butterfly_2point(width = 8)).withAnnotations(Seq(WriteVcdAnnotation)) { p =>
      p.io.inData(0).poke(2.U(8.W))
      p.io.inData(1).poke(3.U(8.W))

      p.io.mod.poke(17.U(8.W))
      p.clock.step(10)

      p.io.outData(0).expect(5.U(8.W))
      p.io.outData(1).expect(16.U(8.W))

    }
  }
}

class FNTT_2pointTB extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "Butterfly_2pointTB"
  it should "Butterfly_2point ex" in {
    test(new FNTT_2point(width = 8)).withAnnotations(Seq(WriteVcdAnnotation)) { p =>
      p.io.inData(0).poke(2.U(8.W))
      p.io.inData(1).poke(3.U(8.W))

      p.io.mod.poke(17.U(8.W))
      p.clock.step(10)

      p.io.outData(0).expect(5.U(8.W))
      p.io.outData(1).expect(16.U(8.W))
    }
  }
}