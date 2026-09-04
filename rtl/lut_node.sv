// Single weightless-network node: an N-input truth table, addressed little-endian so pin k carries weight 2**k.
module lut_node #(
    parameter int                     N    = 6,
    parameter logic [(1 << N) - 1:0]  INIT = '0
) (
    input  logic [N-1:0] addr,
    output logic         out
);
    assign out = INIT[addr];
endmodule
