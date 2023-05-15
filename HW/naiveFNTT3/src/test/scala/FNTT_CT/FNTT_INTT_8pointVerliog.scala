package FNTT_CT
import chisel3.stage.ChiselStage
object FNTT_INTT_8pointVerliog extends App{
  (new ChiselStage).emitVerilog(new FNTT_FINTT_8point(width = 8))
}