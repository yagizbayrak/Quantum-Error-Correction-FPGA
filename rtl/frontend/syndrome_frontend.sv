// Forms the 24 detection events from streamed ancilla rounds and the final data-qubit measurement.
module syndrome_frontend (
    clk, rst, round_valid, round, final_valid, data, det_valid, det
);
`include "frontend_params.svh"

localparam int ROUND_W = $clog2(ROUNDS);
localparam int SLICE_W = $clog2(DETECTORS);

input logic clk;
input logic rst;
input logic round_valid;
input logic [ANCILLAS-1:0] round;
input logic final_valid;
input logic [DATA_QUBITS-1:0] data;
output logic det_valid;
output logic [DETECTORS-1:0] det;

logic [ANCILLAS-1:0] prev;
logic [ROUND_W-1:0] index;
logic [SLICE_W-1:0] slice;

assign slice = LAYER0_DETS + (index - 1) * ANCILLAS;

always_ff @(posedge clk) begin
    if (rst) begin
        prev <= '0;
        index <= '0;
        det <= '0;
        det_valid <= 1'b0;
    end else begin
        det_valid <= 1'b0;
        if (round_valid) begin
            prev <= round;
            index <= index + 1'b1;
            if (index == '0) begin
                for (int j = 0; j < LAYER0_DETS; j++)
                    det[j] <= round[LAYER0_TAP[j*TAP_W +: TAP_W]];
            end else begin
                det[slice +: ANCILLAS] <= round ^ prev;
            end
        end
        if (final_valid) begin
            index <= '0;
            for (int j = 0; j < LAYER3_DETS; j++)
                det[DETECTORS - LAYER3_DETS + j] <=
                    prev[LAYER3_TAP[j*TAP_W +: TAP_W]] ^ (^(data & LAYER3_DATA[j*DATA_QUBITS +: DATA_QUBITS]));
            det_valid <= 1'b1;
        end
    end
end
endmodule
