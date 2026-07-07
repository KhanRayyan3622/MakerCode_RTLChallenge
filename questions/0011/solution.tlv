\m5_TLV_version 1d: tl-x.org
\SV

module odd_counter (
    input wire clk,
    input wire reset,
    output reg [7:0] cnt_o
);

\TLV
   always @(posedge clk) begin
      cnt_o = *reset ? 8'd1 : >>1$cnt_o + 8'd2;
   end

\SV
endmodule
