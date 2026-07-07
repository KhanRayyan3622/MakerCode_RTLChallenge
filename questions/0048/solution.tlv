\m5_TLV_version 1d: tl-x.org
\SV
module digital_differentiator #(
    parameter DATA_WIDTH = 8
)(
    input  wire                       clk,
    input  wire                       reset,
    input  wire signed [DATA_WIDTH-1:0]    data_in,
    output wire signed [DATA_WIDTH:0]      data_out
);
\TLV
   $prev_data[DATA_WIDTH-1:0] = *reset ? {DATA_WIDTH{1'b0}} : *data_in;
   $data_out_reg[DATA_WIDTH:0] = *reset ? {DATA_WIDTH+1{1'b0}} : (*data_in - >>1$prev_data);
   *data_out = $data_out_reg;
\SV
endmodule
