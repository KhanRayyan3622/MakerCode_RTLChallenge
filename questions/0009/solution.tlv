\m5_TLV_version 1d: tl-x.org
\SV
module edge_detector (
    input wire clk,
    input wire reset,
    input wire a_i,
    output wire rising_edge_o,
    output wire falling_edge_o
);
   reg a_i_prev;
   always @(posedge clk) begin
      if (reset)
         a_i_prev <= 1'b0;
      else
         a_i_prev <= a_i;
   end
   assign rising_edge_o = a_i & ~a_i_prev;
   assign falling_edge_o = ~a_i & a_i_prev;
endmodule
