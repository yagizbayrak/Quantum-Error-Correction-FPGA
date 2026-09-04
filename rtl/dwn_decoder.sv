// Top of the weightless core: detection events in, one flip bit out, valid tracking the core's pipeline depth.
`include "dwn_params.svh"

module dwn_decoder (
    input  logic                   clk,
    input  logic                   rst,
    input  logic                   in_valid,
    input  logic [`WL_IN_BITS-1:0] in,
    output logic                   out_valid,
    output logic                   flip
);
    logic [`WL_OUT_BITS-1:0]  bits;
    logic                     decision;
    logic [`WL_NUM_LAYERS-1:0] valid_pipe;

    dwn_core u_core (.clk(clk), .rst(rst), .in(in), .out(bits));

    scorer #(
        .GROUP_SIZE(`WL_GROUP_SIZE),
        .SCORE_W   (`WL_SCORE_W)
    ) u_scorer (.bits(bits), .flip(decision));

    always_ff @(posedge clk) begin
        if (rst) begin
            valid_pipe <= '0;
            out_valid  <= 1'b0;
            flip       <= 1'b0;
        end else begin
            valid_pipe <= {valid_pipe[`WL_NUM_LAYERS-2:0], in_valid};
            out_valid  <= valid_pipe[`WL_NUM_LAYERS-1];
            flip       <= decision;
        end
    end
endmodule
