\m5_TLV_version 1d: tl-x.org
\SV
module odd_counter (
    input wire clk,
    input wire reset,
    output reg [7:0] cnt_o
);
\TLV
   \SV_plus
      always @(posedge clk or posedge reset) begin
         if (reset)
            cnt_o <= 8'h01;
         else
            cnt_o <= cnt_o + 8'd2;
      end
\SV
endmodule
