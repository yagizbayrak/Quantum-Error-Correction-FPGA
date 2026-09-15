// Union-Find decoder: grows clusters around the 24 detection events, merges them, then peels a breadth-first spanning forest to one flip bit.
module union_find_decoder (
    input logic clk,
    input logic rst,
    input logic [23:0] in,
    input logic in_valid,
    output logic out_valid,
    output logic flip,
    output logic busy
);
`include "union_find_params.svh"

localparam int COUNT_W = $clog2(NODES + 1);
localparam int ITER_W = $clog2(MAX_ITERATIONS + 1);
localparam int GROUP = 6;
localparam int GROUPS = (EDGES + GROUP - 1) / GROUP;

typedef enum logic [2:0] {IDLE, GROW, MERGE, BFS, PEEL} state_t;
state_t state;

logic [NODE_W-1:0] root_of [NODES];
logic [NODES-1:0] defect;
logic [NODES-1:0] parity;
logic [NODES-1:0] touches;
logic [1:0] growth [EDGES];
logic [EDGES-1:0] grown;
logic [EDGES-1:0] pending;
logic [ITER_W-1:0] iter;

logic [NODES-1:0] seen;
logic [NODES-1:0] has_parent;
logic [NODE_W-1:0] parent [NODES];
logic [NODES-1:0] parent_obs;
logic [NODE_W-1:0] queue [NODES];
logic [COUNT_W-1:0] head;
logic [COUNT_W-1:0] tail;
logic flip_acc;

function automatic logic [NODE_W-1:0] edge_u(input int e);
    return EDGE_U[e*NODE_W +: NODE_W];
endfunction

function automatic logic [NODE_W-1:0] edge_v(input int e);
    return EDGE_V[e*NODE_W +: NODE_W];
endfunction

function automatic logic [EDGES-1:0] lowest_edge(input logic [EDGES-1:0] mask);
    logic [GROUPS*GROUP-1:0] padded;
    logic [GROUPS-1:0] occupied;
    logic [GROUPS-1:0] first;
    logic [GROUP-1:0] slice;
    logic [GROUPS*GROUP-1:0] pick;
    padded = mask;
    for (int g = 0; g < GROUPS; g++)
        occupied[g] = |padded[g*GROUP +: GROUP];
    first = occupied & -occupied;
    for (int g = 0; g < GROUPS; g++) begin
        slice = padded[g*GROUP +: GROUP];
        pick[g*GROUP +: GROUP] = slice & -slice & {GROUP{first[g]}};
    end
    return pick[EDGES-1:0];
endfunction

logic [NODES-1:0] act;
logic [1:0] bump [EDGES];
logic [EDGES-1:0] reach;

logic [EDGES-1:0] merge_pick;
logic [NODE_W-1:0] ru, rv;

logic [NODE_W-1:0] node;
logic [EDGES-1:0] candidates;
logic [EDGES-1:0] tree_pick;
logic [NODES-1:0] found;
logic [NODE_W-1:0] neighbour;
logic found_obs;
logic [NODES-1:0] starts;
logic [NODES-1:0] start_pick;
logic [NODE_W-1:0] start;

logic [NODE_W-1:0] leaf;
logic [NODE_W-1:0] up;

always_comb begin
    for (int v = 0; v < NODES; v++)
        act[v] = root_of[v] == NODE_W'(v) && parity[v] && !touches[v];

    for (int e = 0; e < EDGES; e++) begin
        bump[e] = '0;
        if (!grown[e])
            bump[e] = act[root_of[edge_u(e)]] + (root_of[edge_u(e)] != root_of[edge_v(e)] && act[root_of[edge_v(e)]]);
        reach[e] = !grown[e] && growth[e] + bump[e] >= 2'd2;
    end

    merge_pick = lowest_edge(pending);
    ru = '0;
    rv = '0;
    for (int e = 0; e < EDGES; e++) begin
        ru |= root_of[edge_u(e)] & {NODE_W{merge_pick[e]}};
        rv |= root_of[edge_v(e)] & {NODE_W{merge_pick[e]}};
    end

    node = queue[head];
    candidates = INC[node*EDGES +: EDGES] & grown;
    for (int e = 0; e < EDGES; e++)
        if (seen[edge_u(e)] && seen[edge_v(e)]) candidates[e] = 1'b0;
    tree_pick = lowest_edge(candidates);
    found_obs = |(tree_pick & EDGE_OBS);
    neighbour = node;
    found = '0;
    for (int e = 0; e < EDGES; e++) begin
        neighbour ^= (edge_u(e) ^ edge_v(e)) & {NODE_W{tree_pick[e]}};
        found[edge_u(e)] |= tree_pick[e];
        found[edge_v(e)] |= tree_pick[e];
    end
    found &= ~seen;

    for (int v = 0; v < NODES; v++)
        starts[v] = !seen[v] && |(INC[v*EDGES +: EDGES] & grown);
    start_pick = starts[BOUNDARY] ? 1 << BOUNDARY : starts & -starts;
    start = '0;
    for (int v = 0; v < NODES; v++)
        start |= NODE_W'(v) & {NODE_W{start_pick[v]}};

    leaf = queue[tail - 1'b1];
    up = parent[leaf];
end

assign busy = state != IDLE;

always_ff @(posedge clk) begin
    if (rst) begin
        state <= IDLE;
        out_valid <= 1'b0;
        flip <= 1'b0;
    end else begin
        out_valid <= 1'b0;
        case (state)
            IDLE: if (in_valid) begin
                defect <= {1'b0, in};
                parity <= {1'b0, in};
                touches <= 1 << BOUNDARY;
                grown <= '0;
                pending <= '0;
                iter <= '0;
                for (int v = 0; v < NODES; v++)
                    root_of[v] <= NODE_W'(v);
                for (int e = 0; e < EDGES; e++)
                    growth[e] <= '0;
                state <= GROW;
            end

            GROW: if (iter == ITER_W'(MAX_ITERATIONS) || act == '0) begin
                seen <= '0;
                has_parent <= '0;
                head <= '0;
                tail <= '0;
                state <= BFS;
            end else begin
                for (int e = 0; e < EDGES; e++)
                    growth[e] <= growth[e] + bump[e];
                grown <= grown | reach;
                pending <= reach;
                iter <= iter + 1'b1;
                if (reach != '0) state <= MERGE;
            end

            MERGE: begin
                pending <= pending & ~merge_pick;
                if ((pending & ~merge_pick) == '0) state <= GROW;
                if (ru != rv) begin
                    for (int v = 0; v < NODES; v++)
                        if (root_of[v] == rv) root_of[v] <= ru;
                    parity[ru] <= parity[ru] ^ parity[rv];
                    parity[rv] <= 1'b0;
                    touches[ru] <= touches[ru] | touches[rv];
                end
            end

            BFS: if (head != tail) begin
                if (candidates != '0) begin
                    seen <= seen | found;
                    has_parent <= has_parent | found;
                    for (int v = 0; v < NODES; v++)
                        if (found[v]) begin
                            parent[v] <= node;
                            parent_obs[v] <= found_obs;
                        end
                    queue[tail] <= neighbour;
                    tail <= tail + 1'b1;
                end
                if ((candidates & ~tree_pick) == '0) head <= head + 1'b1;
            end else if (starts != '0) begin
                seen <= seen | start_pick;
                queue[tail] <= start;
                tail <= tail + 1'b1;
            end else begin
                flip_acc <= 1'b0;
                state <= PEEL;
            end

            PEEL: if (tail == '0) begin
                flip <= flip_acc;
                out_valid <= 1'b1;
                state <= IDLE;
            end else begin
                if (defect[leaf] && has_parent[leaf]) begin
                    flip_acc <= flip_acc ^ parent_obs[leaf];
                    defect[leaf] <= 1'b0;
                    defect[up] <= !defect[up];
                end
                tail <= tail - 1'b1;
            end

            default: state <= IDLE;
        endcase
    end
end

endmodule
