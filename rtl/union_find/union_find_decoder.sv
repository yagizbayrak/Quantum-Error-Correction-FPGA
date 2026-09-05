`include "union_find_params.svh"

module union_find_decoder (
    input logic clk,
    input logic rst,
    input logic [23:0] in,
    input logic in_valid,
    output logic out_valid,
    output logic flip,
    output logic busy
);

logic [NODE_W-1:0] root_of [NODES]; // Seperate 5 bit number (the nodes root) for each 25 node,
logic [NODES-1:0] members [NODES]; // 25-bit row saying which nodes are in each cluster. Stored in a per-node array, indexed by the cluster's root.
logic [NODES-1:0] defect; // 25 sensor node actigvations
logic [NODES-1:0] parity; // Parity of the cluster each node is in, stored in a per-node array, indexed by the cluster's root.
logic [NODES-1:0] touches; // Whether each node touches the boundary node, stored in a per-node array, indexed by the cluster's root.
logic [1:0] growth [EDGES]; // 2 bit counter per 78 edge between 24 + boundary nodes. +1 every iteration per node that is active.
logic [EDGES-1:0] grown;
logic [3:0] iter; // Iteration count max 10 (by choice)

typedef enum logic [2:0] {IDLE, LOAD, GROW, BFS, PEEL, DONE, MERGE} state_t;
state_t state, next_state;

always_comb begin
    next_state = state;
    case(state)
        IDLE: if (in_valid) next_state = LOAD;
        LOAD: next_state = GROW;
        GROW: begin
            
        end
        BFS:
        PEEL:
        DONE: 
        MERGE:
    endcase
end'

always_ff @(posedge clk) begin
    if (rst) begin
        state <= IDLE;
        busy <= 1'b0;
        out_valid <= 1'b0;
        flip <= 1'b0;
        iter <= '0;
        pending <= '0;
        grown <= '0;
        defect <= '0;
        parity <= '0;
        touches <= '0;
        seen <= '0;
        frontier <= '0; // define
        flip_acc <= 1'b0; // define
        for (int v = 0; v < NODES; v++) begin
            root_of[v] <= v; // Every node starts as its own root
            members[v] <= '0;
            parent_edge[v] <= '0;
            depth[v] <= '0;
        end
        for (int e = 0; e < EDGES; e++)
            growth[e] <= 2'd0;

    end else if (state == LOAD) begin
        busy <= 1'b1;
        out_valid <= 1'b0;
        flip <= 1'b0;
        iter <= '0;
        pending <= '0;
        grown <= '0;
        defect <= {1'b0, in};
        parity <= {1'b0, in};
        touches <= NODES'(1) << BOUNDARY;
        seen <= '0;
        frontier <= '0;
        flip_acc <= 1'b0;
        for (int v = 0; v < NODES; v++) begin
            root_of[v] <= v;
            members[v] <= 1 << v;
            parent_edge[v] <= '0;
            depth[v] <= '0;
        end
        for (int e = 0; e < EDGES; e++)
            growth[e] <= 2'd0;
    end
end

endmodule 