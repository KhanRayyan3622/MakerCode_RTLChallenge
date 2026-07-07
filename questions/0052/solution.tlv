\m5_TLV_version 1d: tl-x.org
\SV
module parity_gen_check #(
    parameter DATA_WIDTH  = 8,
    parameter PARITY_TYPE = 0  // 0 = even, 1 = odd
)(
    input  wire [DATA_WIDTH-1:0] data_in,
    input  wire                  mode,       // 0 = generate, 1 = check
    input  wire                  parity_in,  // input parity (for check mode)
    output wire                  parity_out, // generated parity (for generate mode)
    output wire                  error       // error flag (for check mode)
);
\TLV
   $data_parity = ^*data_in;
   *parity_out = (PARITY_TYPE == 0) ? $data_parity : ~$data_parity;
   $check_result = $data_parity ^ *parity_in;
   *error = (PARITY_TYPE == 0) ? $check_result : ~$check_result;
\SV
endmodule
