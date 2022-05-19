module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter left = 1'b1, right = 1'b0;
    reg state, next_state;

    always @(*) begin
        case (state)
            left: next_state = bump_left ? right : left;
            right: next_state = bump_right ? left : right; 
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset)
            state<=left;
        else state<=next_state;
    end
           

    // Output logic
            assign walk_left = (state==left);
            assign walk_right = (state==right);

endmodule
