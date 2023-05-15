package FNTT_GS
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class modularTB extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "Modular"
  it should "Mod ex" in {
    test(new modular(width = 8)).withAnnotations(Seq(WriteVcdAnnotation)) { p =>
      p.io.inData.poke(5.U(8.W))
      p.io.mod.poke(3.U(8.W))
      p.clock.step(10)
      p.io.outData.expect(2.U(8.W))
    }
  }
}