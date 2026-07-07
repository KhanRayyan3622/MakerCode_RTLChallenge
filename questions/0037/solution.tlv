\m5_TLV_version 1d: tl-x.org
\SV
module uart_transmitter #(
    parameter CLK_FREQ = 50000000,
    parameter BAUD_RATE = 9600
)(
    input  wire        clk,
    input  wire        reset,
    input  wire        tx_start,
    input  wire [7:0]  tx_data,
    output wire        tx_out,
    output wire        tx_busy
);
\TLV
   \SV_plus
      localparam CLKS_PER_BIT = CLK_FREQ / BAUD_RATE;
      localparam s_IDLE         = 3'b000;
      localparam s_TX_START_BIT = 3'b001;
      localparam s_TX_DATA_BITS = 3'b010;
      localparam s_TX_STOP_BIT  = 3'b011;

      reg [2:0]  r_SM_Main     = s_IDLE;
      reg [15:0] r_Clock_Count = 0;
      reg [2:0]  r_Bit_Index   = 0;
      reg [7:0]  r_Tx_Data     = 0;
      reg        r_Tx_Active   = 0;

      always @(posedge clk) begin
          if (reset) begin
              r_SM_Main     <= s_IDLE;
              r_Clock_Count <= 0;
              r_Bit_Index   <= 0;
              r_Tx_Data     <= 0;
              r_Tx_Active   <= 1'b1;
          end else begin
              case (r_SM_Main)
                  s_IDLE: begin
                      r_Tx_Active   <= 1'b1;
                      r_Clock_Count <= 0;
                      r_Bit_Index   <= 0;
                      if (tx_start) begin
                          r_Tx_Data <= tx_data;
                          r_SM_Main <= s_TX_START_BIT;
                      end else begin
                          r_SM_Main <= s_IDLE;
                      end
                  end
                  s_TX_START_BIT: begin
                      r_Tx_Active <= 1'b0;
                      if (r_Clock_Count < CLKS_PER_BIT - 1) begin
                          r_Clock_Count <= r_Clock_Count + 1;
                          r_SM_Main     <= s_TX_START_BIT;
                      end else begin
                          r_Clock_Count <= 0;
                          r_SM_Main     <= s_TX_DATA_BITS;
                      end
                  end
                  s_TX_DATA_BITS: begin
                      r_Tx_Active <= r_Tx_Data[r_Bit_Index];
                      if (r_Clock_Count < CLKS_PER_BIT - 1) begin
                          r_Clock_Count <= r_Clock_Count + 1;
                          r_SM_Main     <= s_TX_DATA_BITS;
                      end else begin
                          r_Clock_Count <= 0;
                          if (r_Bit_Index < 7) begin
                              r_Bit_Index <= r_Bit_Index + 1;
                              r_SM_Main   <= s_TX_DATA_BITS;
                          end else begin
                              r_Bit_Index <= 0;
                              r_SM_Main   <= s_TX_STOP_BIT;
                          end
                      end
                  end
                  s_TX_STOP_BIT: begin
                      r_Tx_Active <= 1'b1;
                      if (r_Clock_Count < CLKS_PER_BIT - 1) begin
                          r_Clock_Count <= r_Clock_Count + 1;
                          r_SM_Main     <= s_TX_STOP_BIT;
                      end else begin
                          r_Clock_Count <= 0;
                          r_SM_Main     <= s_IDLE;
                      end
                  end
                  default: begin
                      r_SM_Main <= s_IDLE;
                  end
              endcase
          end
      end

      assign tx_out  = r_Tx_Active;
      assign tx_busy = (r_SM_Main != s_IDLE);
\SV
endmodule
