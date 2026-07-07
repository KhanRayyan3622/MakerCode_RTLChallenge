\m5_TLV_version 1d: tl-x.org
\SV
module clock_divider #(
    parameter DIVIDE_FACTOR = 2
)(
    input  wire                    clk_in,
    input  wire                    reset,
    input  wire                    enable,
    output wire                    clk_out
);
\TLV
   $counter[COUNTER_WIDTH-1:0] = *reset ? {COUNTER_WIDTH{1'b0}} : (*enable ? (>>1$counter == ((DIVIDE_FACTOR/2) - 1) ? {COUNTER_WIDTH{1'b0}} : >>1$counter + 1'b1) : >>1$counter);
   $clk_out_reg = *reset ? 1'b0 : (*enable ? (>>1$counter == ((DIVIDE_FACTOR/2) - 1) ? ~>>1$clk_out_reg : >>1$clk_out_reg) : 1'b0);
   *clk_out = *enable ? $clk_out_reg : 1'b0;
\SV
endmodule
