\m5_TLV_version 1d: tl-x.org
\SV
module johnson_counter #(
    parameter WIDTH = 4
)(
    input  wire                    clk,
    input  wire                    reset,
    input  wire                    enable,
    output wire [WIDTH-1:0]        count_out
);
\TLV
   $counter[WIDTH-1:0] = *reset ? {WIDTH{1'b0}} : (*enable ? {>>1$counter[WIDTH-2:0], ~>>1$counter[WIDTH-1]} : >>1$counter);
   *count_out = $counter;
\SV
endmodule
