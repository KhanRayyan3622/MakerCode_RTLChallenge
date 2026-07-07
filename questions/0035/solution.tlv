\m5_TLV_version 1d: tl-x.org
\SV
module barrel_shifter #(
    parameter DATA_WIDTH = 8,
    parameter SHIFT_WIDTH = 3
)(
    input  wire [DATA_WIDTH-1:0]     data_in,
    input  wire [SHIFT_WIDTH-1:0]    shift_amt,
    input  wire                      shift_dir,
    input  wire                      shift_type,
    output wire [DATA_WIDTH-1:0]     data_out
);
\TLV
   $eff_shift[SHIFT_WIDTH-1:0] = *shift_amt % DATA_WIDTH;
   $shifted_data[DATA_WIDTH-1:0] = (*shift_dir == 1'b0) ? ((*shift_type == 1'b0) ? (*data_in << *shift_amt) : ($eff_shift == 0 ? *data_in : ((*data_in << $eff_shift) | (*data_in >> (DATA_WIDTH - $eff_shift))))) : ((*shift_type == 1'b0) ? (*data_in >> *shift_amt) : ($eff_shift == 0 ? *data_in : ((*data_in >> $eff_shift) | (*data_in << (DATA_WIDTH - $eff_shift))))));
   *data_out = $shifted_data;
\SV
endmodule
