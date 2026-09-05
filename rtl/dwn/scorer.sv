// Reduces the final LUT layer to one bit: the observable flipped if the upper group outpolls the lower, ties reading as no flip.
module scorer #(
    parameter int GROUP_SIZE = 16,
    parameter int SCORE_W    = 5
) (
    input  logic [2*GROUP_SIZE-1:0] bits,
    output logic                    flip
);
    logic [SCORE_W-1:0] score0, score1;

    always_comb begin
        score0 = '0;
        score1 = '0;
        for (int j = 0; j < GROUP_SIZE; j++) begin
            score0 += SCORE_W'(bits[j]);
            score1 += SCORE_W'(bits[GROUP_SIZE + j]);
        end
    end

    assign flip = (score1 > score0);
endmodule
