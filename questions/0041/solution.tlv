\m5_TLV_version 1d: tl-x.org
\SV
module hamming_encoder (
    input  wire [7:0]      data_in,
    output wire [12:0]     encoded_out,
    output wire [4:0]      parity_bits
);
\TLV
   $p0 = *data_in[0] ^ *data_in[1] ^ *data_in[3] ^ *data_in[4] ^ *data_in[6];
   $p1 = *data_in[0] ^ *data_in[2] ^ *data_in[3] ^ *data_in[5] ^ *data_in[6];
   $p2 = *data_in[1] ^ *data_in[2] ^ *data_in[3] ^ *data_in[7];
   $p3 = *data_in[4] ^ *data_in[5] ^ *data_in[6] ^ *data_in[7];
   $p4 = $p0 ^ $p1 ^ *data_in[0] ^ $p2 ^ *data_in[1] ^ *data_in[2] ^ *data_in[3] ^ $p3 ^ *data_in[4] ^ *data_in[5] ^ *data_in[6] ^ *data_in[7];
   *encoded_out = {$p4, *data_in[7], *data_in[6], *data_in[5], *data_in[4], $p3, *data_in[3], *data_in[2], *data_in[1], $p2, *data_in[0], $p1, $p0};
   *parity_bits = {$p4, $p3, $p2, $p1, $p0};
\SV
endmodule
