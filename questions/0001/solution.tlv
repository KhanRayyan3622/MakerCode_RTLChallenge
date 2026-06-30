\m5_TLV_version 1d: tl-x.org
\SV
module subtractor #(
    parameter INPUT_WIDTH = 8
)(
    input wire [INPUT_WIDTH-1:0] data_in_1,
    input wire [INPUT_WIDTH-1:0] data_in_2,
    output wire [INPUT_WIDTH-1:0] data_out
);
\TLV
   // Subtract with underflow clamping: if data_in_2 > data_in_1, output 0
   $data_out[INPUT_WIDTH-1:0] = (*data_in_1 > *data_in_2) ? (*data_in_1 - *data_in_2) : {INPUT_WIDTH{1'b0}};
   *data_out = $data_out;
\SV
endmodule
