\m5_TLV_version 1d: tl-x.org
\SV
module multiplier #(
    parameter INPUT_WIDTH = 8
)(
    input wire [INPUT_WIDTH-1:0] data_in_1,
    input wire [INPUT_WIDTH-1:0] data_in_2,
    output wire [2*INPUT_WIDTH-1:0] data_out
);
\TLV
   $data_out[2 * INPUT_WIDTH - 1 : 0] = *data_in_1 * *data_in_2;
   *data_out = $data_out;
\SV
endmodule
