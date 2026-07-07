\m5_TLV_version 1d: tl-x.org
\SV
module gray_to_binary #(
    parameter WIDTH = 4
)(
    input  wire [WIDTH-1:0] gray_in,
    output wire [WIDTH-1:0] binary_out
);
\TLV
   \SV_plus

      genvar i;
      generate
          for (i = 0; i < WIDTH; i = i + 1) begin : gen_xor
              assign binary_out[i] = ^gray_in[WIDTH-1:i];
          end
      endgenerate
\SV
endmodule
