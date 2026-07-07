\m5_TLV_version 1d: tl-x.org
\SV
module pwm_generator #(
    parameter COUNTER_WIDTH = 8,
    parameter PWM_PERIOD = 256
)(
    input  wire                         clk,
    input  wire                         reset,
    input  wire                         enable,
    input  wire [COUNTER_WIDTH-1:0]     duty_cycle,
    output wire                         pwm_out
);
\TLV
   $counter[COUNTER_WIDTH-1:0] = *reset ? {COUNTER_WIDTH{1'b0}} : (*enable ? (>>1$counter == (PWM_PERIOD - 1) ? {COUNTER_WIDTH{1'b0}} : >>1$counter + 1'b1) : >>1$counter);
   $pwm_reg = *reset ? 1'b0 : (*enable ? ((*duty_cycle == 0) ? 1'b0 : ((*duty_cycle >= PWM_PERIOD) ? 1'b1 : (>>1$counter < *duty_cycle))) : 1'b0);
   *pwm_out = $pwm_reg;
\SV
endmodule
