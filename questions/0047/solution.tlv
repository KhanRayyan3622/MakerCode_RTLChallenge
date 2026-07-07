\m5_TLV_version 1d: tl-x.org
\SV
module moving_average #(
    parameter DATA_WIDTH = 8,
    parameter WINDOW_SIZE = 4
)(
    input  wire                       clk,
    input  wire                       reset,
    input  wire [DATA_WIDTH-1:0]      data_in,
    output wire [DATA_WIDTH-1:0]      data_out
);
\TLV
   $w0[DATA_WIDTH-1:0] = *reset ? {DATA_WIDTH{1'b0}} : *data_in;
   $w1[DATA_WIDTH-1:0] = *reset ? {DATA_WIDTH{1'b0}} : >>1$w0;
   $w2[DATA_WIDTH-1:0] = *reset ? {DATA_WIDTH{1'b0}} : >>1$w1;
   $w3[DATA_WIDTH-1:0] = *reset ? {DATA_WIDTH{1'b0}} : >>1$w2;
   $sum[DATA_WIDTH+3:0] = *reset ? 0 : ($w0 + (>>1$w0 << 1) + (>>1$w1 << 1) + $w3);
   *data_out = $sum >>> 2;
\SV
endmodule
