\m5_TLV_version 1d: tl-x.org
\SV
module ring_counter #(
    parameter COUNTER_WIDTH = 4
)(
    input wire clk,
    input wire rst_n,
    output wire [COUNTER_WIDTH-1:0] count_out
);
\TLV
   $count_out[COUNTER_WIDTH-1:0] = ! *rst_n ? 1 : {>>1$count_out[COUNTER_WIDTH-2:0], >>1$count_out[COUNTER_WIDTH-1]};
   *count_out = >>1$count_out;
\SV
endmodule
