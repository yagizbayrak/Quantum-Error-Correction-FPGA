// Wraps the hls4ml recurrent core: lays the 24 detection events out as four rounds of eight inputs, absent ones at -1, and reads the logit's sign as the flip.
module recurrent_decoder (
    input logic clk,
    input logic rst,
    input logic [23:0] in,
    input logic in_valid,
    output logic out_valid,
    output logic flip
);
`include "recurrent_params.svh"

logic [23:0] held;
logic start;
logic [SLOTS*VALUE_W-1:0] sequence_in;
logic ap_done, ap_idle, ap_ready;
logic [VALUE_W-1:0] logit;
logic logit_valid;

always_comb
    for (int s = 0; s < SLOTS; s++)
        sequence_in[s*VALUE_W +: VALUE_W] = !PRESENT[s] ? -(1 << FRACTION) : held[SOURCE[s*DET_W +: DET_W]] ? 1 << FRACTION : 0;

recurrent core (
    .ap_clk(clk), .ap_rst(rst), .ap_start(start), .ap_done(ap_done), .ap_idle(ap_idle), .ap_ready(ap_ready),
    .input_layer(sequence_in), .input_layer_ap_vld(start), .layer3_out(logit), .layer3_out_ap_vld(logit_valid)
);

always_ff @(posedge clk) begin
    if (rst) begin
        start <= 1'b0;
        out_valid <= 1'b0;
        flip <= 1'b0;
    end else begin
        if (in_valid) begin
            held <= in;
            start <= 1'b1;
        end else if (ap_ready) begin
            start <= 1'b0;
        end
        out_valid <= logit_valid;
        if (logit_valid) flip <= $signed(logit) > 0;
    end
end

endmodule
