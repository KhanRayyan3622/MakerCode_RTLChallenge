\m5_TLV_version 1d: tl-x.org
\SV
module gray_counter #(
    parameter WIDTH = 4
)(
    input  wire                    clk,
    input  wire                    reset,
    input  wire                    enable,
    output wire [WIDTH-1:0]        gray_count,
    output wire [WIDTH-1:0]        binary_count
);
\TLV
   $binary_counter[WIDTH-1:0] = *reset ? {WIDTH{1'b0}} : (*enable ? >>1$binary_counter + 1'b1 : >>1$binary_counter);
   *gray_count = $binary_counter ^ ($binary_counter >> 1);
   *binary_count = $binary_counter;
\SV
endmodule
