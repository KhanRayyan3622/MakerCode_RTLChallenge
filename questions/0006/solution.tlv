\m5_TLV_version 1d: tl-x.org
\SV
module dual_edge_dff #(
    parameter DATA_WIDTH = 8
)(
    input wire clk,
    input wire rst_n,
    input wire [DATA_WIDTH-1:0] data_in,
    output wire [DATA_WIDTH-1:0] data_out
);
\TLV
   \SV_plus
      reg [DATA_WIDTH-1:0] data_reg;
      always @(posedge clk or negedge clk or negedge rst_n) begin
         if (!rst_n)
            data_reg <= {DATA_WIDTH{1'b0}};
         else
            data_reg <= data_in;
      end
      assign data_out = data_reg;
\SV
endmodule
