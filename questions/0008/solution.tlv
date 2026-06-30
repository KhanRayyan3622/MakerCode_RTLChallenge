\m5_TLV_version 1d: tl-x.org
\SV
module d_flip_flop (
    input wire clk,
    input wire reset,
    input wire d_i,
    output reg q_norst_o,
    output reg q_syncrst_o,
    output reg q_asyncrst_o
);
\TLV
   \SV_plus
      always @(posedge clk) begin
         q_norst_o <= d_i;
      end

      always @(posedge clk) begin
         if (reset)
            q_syncrst_o <= 1'b0;
         else
            q_syncrst_o <= d_i;
      end

      always @(posedge clk or posedge reset) begin
         if (reset)
            q_asyncrst_o <= 1'b0;
         else
            q_asyncrst_o <= d_i;
      end
\SV
endmodule
