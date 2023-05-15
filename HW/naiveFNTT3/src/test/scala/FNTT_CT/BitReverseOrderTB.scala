package FNTT_CT
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class BitReverseOrderTB extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "ReOrder"
  it should "ReOrder ex" in {
    test(new BitReverseOrder(width = 8)).withAnnotations(Seq(WriteVcdAnnotation)) { p =>
      for (i <- 0 until 8)  p.io.inData(i).poke(i.U(8.W))
      p.io.outData(0).expect(0.U(8.W))
      p.io.outData(1).expect(4.U(8.W))
      p.io.outData(2).expect(2.U(8.W))
      p.io.outData(3).expect(6.U(8.W))

      p.io.outData(4).expect(1.U(8.W))
      p.io.outData(5).expect(5.U(8.W))
      p.io.outData(6).expect(3.U(8.W))
      p.io.outData(7).expect(7.U(8.W))
    }
  }
}