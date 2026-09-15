// Replays the stored measurements through the frontend and all three decoders, checking each output against its golden model and timing it.
`timescale 1ns/1ps
module tb_qec_decoder;

localparam int SHOTS = 10000;
localparam int TIMEOUT = 2000;

logic clk = 1'b0;
logic rst = 1'b1;
logic round_valid = 1'b0;
logic [7:0] round = '0;
logic final_valid = 1'b0;
logic [8:0] data = '0;
logic det_valid;
logic [23:0] det;
logic union_find_valid, union_find_flip;
logic weightless_valid, weightless_flip;
logic recurrent_valid, recurrent_flip;

logic [32:0] meas [SHOTS];
logic [23:0] dets [SHOTS];
logic truth [SHOTS];
logic union_find_want [SHOTS];
logic weightless_want [SHOTS];
logic recurrent_want [SHOTS];

int trace;
int frontend_errors = 0;
int mismatches [3] = '{0, 0, 0};
int logical [3] = '{0, 0, 0};
int worst [3] = '{0, 0, 0};
longint total [3] = '{0, 0, 0};
int latency [3];
logic got [3];
logic done [3];
logic [23:0] seen_det;

qec_decoder dut (.*);

always #5 clk = ~clk;

task automatic record(input int core, input int cycles, input logic flip, input logic want, input logic real_flip);
    done[core] = 1'b1;
    got[core] = flip;
    latency[core] = cycles;
    total[core] += cycles;
    if (cycles > worst[core]) worst[core] = cycles;
    if (flip !== want) mismatches[core]++;
    if (flip !== real_flip) logical[core]++;
endtask

task automatic report(input string name, input int core);
    $display("%s %0d mismatches, %0d logical errors, last round to answer worst %0d mean %0.2f cycles", name, mismatches[core], logical[core], worst[core], real'(total[core]) / SHOTS);
endtask

initial begin
    $readmemb("data/measurements.txt", meas);
    $readmemb("data/detectors.txt", dets);
    $readmemb("data/observables.txt", truth);
    $readmemb("data/union_find_expected.txt", union_find_want);
    $readmemb("data/weightless_expected.txt", weightless_want);
    $readmemb("data/recurrent_expected.txt", recurrent_want);
    trace = $fopen("data/trace.txt", "w");

    repeat (4) @(negedge clk);
    rst = 1'b0;

    for (int s = 0; s < SHOTS; s++) begin
        for (int r = 0; r < 3; r++) begin
            @(negedge clk);
            for (int j = 0; j < 8; j++)
                round[j] = meas[s][32 - (r*8 + j)];
            round_valid = 1'b1;
            @(negedge clk);
            round_valid = 1'b0;
        end
        @(negedge clk);
        for (int j = 0; j < 9; j++)
            data[j] = meas[s][32 - (24 + j)];
        final_valid = 1'b1;
        done = '{1'b0, 1'b0, 1'b0};

        for (int cycles = 1; !(done[0] && done[1] && done[2]); cycles++) begin
            @(negedge clk);
            final_valid = 1'b0;
            if (cycles > TIMEOUT) $fatal(1, "shot %0d: a decoder never answered", s);
            if (det_valid) begin
                seen_det = det;
                for (int k = 0; k < 24; k++)
                    if (det[k] !== dets[s][23 - k]) begin
                        frontend_errors++;
                        break;
                    end
            end
            if (union_find_valid) record(0, cycles, union_find_flip, union_find_want[s], truth[s]);
            if (weightless_valid) record(1, cycles, weightless_flip, weightless_want[s], truth[s]);
            if (recurrent_valid) record(2, cycles, recurrent_flip, recurrent_want[s], truth[s]);
        end
        $fdisplay(trace, "%0d %b %b %b %b %b", s, seen_det, got[0], got[1], got[2], truth[s]);
    end

    $fclose(trace);
    $display("%0d shots", SHOTS);
    $display("frontend %0d mismatches", frontend_errors);
    report("union-find", 0);
    report("weightless", 1);
    report("recurrent", 2);
    $display("%s", frontend_errors + mismatches[0] + mismatches[1] + mismatches[2] == 0 ? "PASS" : "FAIL");
    $finish;
end

endmodule
