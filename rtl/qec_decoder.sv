// Top level: the syndrome frontend feeding the Union-Find, weightless and recurrent decoders side by side.
module qec_decoder (
    input logic clk,
    input logic rst,
    input logic round_valid,
    input logic [7:0] round,
    input logic final_valid,
    input logic [8:0] data,
    output logic det_valid,
    output logic [23:0] det,
    output logic union_find_valid,
    output logic union_find_flip,
    output logic weightless_valid,
    output logic weightless_flip,
    output logic recurrent_valid,
    output logic recurrent_flip
);

logic union_find_busy;

syndrome_frontend frontend (
    .clk(clk), .rst(rst), .round_valid(round_valid), .round(round),
    .final_valid(final_valid), .data(data), .det_valid(det_valid), .det(det)
);

union_find_decoder union_find (
    .clk(clk), .rst(rst), .in(det), .in_valid(det_valid),
    .out_valid(union_find_valid), .flip(union_find_flip), .busy(union_find_busy)
);

dwn_decoder weightless (
    .clk(clk), .rst(rst), .in(det), .in_valid(det_valid),
    .out_valid(weightless_valid), .flip(weightless_flip)
);

recurrent_decoder recurrent (
    .clk(clk), .rst(rst), .in(det), .in_valid(det_valid),
    .out_valid(recurrent_valid), .flip(recurrent_flip)
);

endmodule
