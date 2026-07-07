\m5_TLV_version 1d: tl-x.org
\SV
module leading_zero_counter #(
    parameter INPUT_WIDTH = 8,
    parameter COUNT_WIDTH = 4
)(
    input  wire [INPUT_WIDTH-1:0]    data_in,
    output wire [COUNT_WIDTH-1:0]    zero_count,
    output wire                      all_zero
);
\TLV
   \SV_plus

          integer i;
          reg [COUNT_WIDTH-1:0] count;
          reg found_one;

          always @(*) begin
              count = {COUNT_WIDTH{1'b0}};
              found_one = 1'b0;

              for (i = INPUT_WIDTH-1; i >= 0; i = i - 1) begin
                  if (!found_one) begin
                      if (data_in[i] == 1'b1) begin
                          found_one = 1'b1;
                      end else begin
                          count = count + 1'b1;
                      end
                  end
              end
          end

          assign zero_count = count;
          assign all_zero = (count == INPUT_WIDTH);
\SV
endmodule
