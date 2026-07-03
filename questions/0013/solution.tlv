\m5_TLV_version 1d: tl-x.org
\SV
module lfsr (
    input wire clk,
    input wire reset,
    output wire [3:0] lfsr_o
);
\TLV
   \SV_plus
      reg [3:0] lfsr_reg;
      wire feedback;
      assign feedback = lfsr_reg[3] ^ lfsr_reg[1];
      always @(posedge clk or posedge reset) begin
         if (reset)
            lfsr_reg <= 4'hE;
         else
            lfsr_reg <= {lfsr_reg[2:0], feedback};
      end
      assign lfsr_o = lfsr_reg;
\SV
endmodule
