\m5_TLV_version 1d: tl-x.org
\SV
module sequence_detector #(
    parameter PATTERN = 4'b1011
)(
    input wire clk,
    input wire rst_n,
    input wire data_in,
    output wire pattern_detected
);
\TLV
   \SV_plus
      localparam [1:0] s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
      reg [1:0] ps, ns;
      always @(posedge clk or negedge rst_n)
          if (!rst_n) ps <= s0;
          else ps <= ns;
      always @(*)
          case (ps)
              s0: ns = data_in ? s1 : s0;
              s1: ns = data_in ? s1 : s2;
              s2: ns = data_in ? s3 : s0;
              s3: ns = data_in ? s1 : s2;
          endcase
      assign pattern_detected = (ps == s3) ? data_in : 1'b0;
\SV
endmodule
