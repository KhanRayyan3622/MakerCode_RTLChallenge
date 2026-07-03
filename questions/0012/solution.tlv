\m5_TLV_version 1d: tl-x.org
\SV
module shift_register (
    input wire clk,
    input wire reset,
    input wire x_i,
    output wire [3:0] sr_o
);
\TLV
   \SV_plus
      reg [3:0] shift_reg;
      always @(posedge clk or posedge reset) begin
         if (reset)
            shift_reg <= 4'b0000;
         else
            shift_reg <= {shift_reg[2:0], x_i};
      end
      assign sr_o = shift_reg;
\SV
endmodule
