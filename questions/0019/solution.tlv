\m5_TLV_version 1d: tl-x.org
\SV
module priority_encoder (
    input  logic [3:0] data_i,
    output logic       valid_o,
    output logic [1:0] pos_o
);
   assign valid_o = |data_i;
   always_comb begin
      if      (data_i[0]) pos_o = 2'b00;
      else if (data_i[1]) pos_o = 2'b01;
      else if (data_i[2]) pos_o = 2'b10;
      else if (data_i[3]) pos_o = 2'b11;
      else                pos_o = 2'b00;
   end
\SV
endmodule
