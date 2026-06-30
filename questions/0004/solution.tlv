\m5_TLV_version 1d: tl-x.org
\SV
module ripple_counter #(
    parameter COUNTER_WIDTH = 4
)(
    input wire clk,
    input wire rst_n,
    output wire [COUNTER_WIDTH-1:0] count_out
);
\TLV
   \SV_plus
      reg [COUNTER_WIDTH-1:0] count_reg;
      always @(posedge clk or negedge rst_n) begin
         if (!rst_n)
            count_reg <= {COUNTER_WIDTH{1'b0}};
         else
            count_reg <= count_reg + 1'b1;
      end
      assign count_out = count_reg;
\SV
endmodule
