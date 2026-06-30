\m5_TLV_version 1d: tl-x.org
\SV
module adder #(
    parameter INPUT_WIDTH = 8
)(
    input wire [INPUT_WIDTH-1:0] data_in_1,
    input wire [INPUT_WIDTH-1:0] data_in_2,
    output wire [INPUT_WIDTH:0] data_out
);
\TLV
   $data_out[INPUT_WIDTH:0] = {1'b0, *data_in_1} + {1'b0, *data_in_2};
   *data_out = $data_out;
\SV
endmodule
