\m5_TLV_version 1d: tl-x.org
\SV
module binary_to_gray_code #(
    parameter VEC_W = 4
)(
    input wire [VEC_W-1:0] bin_i,
    output wire [VEC_W-1:0] gray_o
);
\TLV
   \SV_plus
      assign gray_o = bin_i ^ (bin_i >> 1);
\SV
endmodule
