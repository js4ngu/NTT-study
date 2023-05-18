package FNTT_CT
package FNTTSupport
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
class FNTT_8paointTB extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "8pointTB"
  it should "8pointTB ex" in{
    test(new FNTT_8point(width = 8)).withAnnotations(Seq(WriteVcdAnnotation)) { p =>
      //HW Init
      p.io.omega(0).poke(1 .U(8.W))
      p.io.omega(1).poke(9.U(8.W))
      p.io.omega(2).poke(13.U(8.W)) //81%17
      p.io.omega(3).poke(15.U(8.W)) //729%19=15

      p.io.mod.poke(17.U(8.W))

      //Data Injecton
      p.io.inData(0).poke(1.U(8.W))
      p.io.inData(1).poke(1.U(8.W))
      p.io.inData(2).poke(1.U(8.W))
      p.io.inData(3).poke(1.U(8.W))
      p.io.inData(4).poke(0.U(8.W))
      p.io.inData(5).poke(0.U(8.W))
      p.io.inData(6).poke(0.U(8.W))
      p.io.inData(7).poke(0.U(8.W))

      p.clock.step(20)

      p.io.outData(0).expect(4.U(8.W))
      p.io.outData(1).expect(4.U(8.W))
      p.io.outData(2).expect(0.U(8.W))
      p.io.outData(3).expect(12.U(8.W))
      p.io.outData(4).expect(0.U(8.W))
      p.io.outData(5).expect(7.U(8.W))
      p.io.outData(6).expect(0.U(8.W))
      p.io.outData(7).expect(15.U(8.W))

      //Data Injecton
      p.io.inData(0).poke(0.U(8.W))
      p.io.inData(1).poke(0.U(8.W))
      p.io.inData(2).poke(0.U(8.W))
      p.io.inData(3).poke(0.U(8.W))
      p.io.inData(4).poke(1.U(8.W))
      p.io.inData(5).poke(1.U(8.W))
      p.io.inData(6).poke(1.U(8.W))
      p.io.inData(7).poke(1.U(8.W))

      p.clock.step(20)
      p.io.outData(0).expect(16.U(8.W))
      p.io.outData(1).expect(13.U(8.W))
      p.io.outData(2).expect(0.U(8.W))
      p.io.outData(3).expect(5.U(8.W))
      p.io.outData(4).expect(0.U(8.W))
      p.io.outData(5).expect(10.U(8.W))
      p.io.outData(6).expect(0.U(8.W))
      p.io.outData(7).expect(2.U(8.W))


    }
  }
}