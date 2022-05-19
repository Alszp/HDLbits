module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
 parameter WL = 2'b01, WR = 2'b00, FL = 2'b10, FR = 2'b11;
    reg [1:0] state, next_state;

    always @(*) begin
        case (state)
            WL: next_state = ground ? (bump_left ? WR : WL) : FL;
            WR: next_state = ground ? (bump_right ? WL : WR) : FR;
            FL: next_state = ground ? WL : FL;
            FR: next_state = ground ? WR : FR;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset)
            state<=WL;
        else state<=next_state;
    end
           

    // Output logic
    assign walk_left = (state==WL);
    assign walk_right = (state==WR);
    assign aaah = (state[1]==1'b1);

endmodule
