\m5_TLV_version 1d: tl-x.org
\SV
module fir_filter #(
    parameter DATA_WIDTH = 8
)(
    input  wire                       clk,
    input  wire                       reset,
    input  wire signed [DATA_WIDTH-1:0]    data_in,
    output wire signed [DATA_WIDTH+1:0]    data_out
);
\TLV
   $delay1[DATA_WIDTH-1:0] = *reset ? {DATA_WIDTH{1'b0}} : *data_in;
   $delay2[DATA_WIDTH-1:0] = *reset ? {DATA_WIDTH{1'b0}} : >>1$delay1;
   $delay3[DATA_WIDTH-1:0] = *reset ? {DATA_WIDTH{1'b0}} : >>1$delay2;
   $accumulator[DATA_WIDTH+3:0] = *reset ? 0 : (((*data_in) + (>>1$delay1 << 1) + (>>1$delay2 << 1) + (>>1$delay3)) >>> 3);
   *data_out = $accumulator;
\SV
endmodule
