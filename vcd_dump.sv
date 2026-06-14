// Waveform helper used by the Makefile (make sim) for testbenches that do not
// call $dumpfile themselves. When +VCDFILE=<file> is passed, it dumps the whole
// `tb` hierarchy so every question can produce a waveform. It is only compiled
// in when the question's tb.sv has no $dumpfile, and is irrelevant to grading.
module __vcd_dump;
  string __vcdf;
  initial begin
    if ($value$plusargs("VCDFILE=%s", __vcdf)) begin
      $dumpfile(__vcdf);
      $dumpvars(0, tb);
    end
  end
endmodule
