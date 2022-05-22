module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

parameter L = 1'b1, R = 1'b0, F = 3'b10, W=2'b00, D=2'b01, S=2'b11;
    reg [1:0] state, next_state;
    reg dir, next_dir, uhoh;
    reg [4:0] count;

    always @(*) begin
        case (state)
            W: next_state = ground ? (dig ? D : W) : F;
            F: next_state = ground ? (uhoh ? S : W) : F;
            D: next_state = ground ? D : F;
            S: next_state = S;
        endcase
        case (dir)
            L: next_dir = ( state==W & (next_state==W) ) ? (bump_left ? R : L) : L;
            R: next_dir = ( state==W & (next_state==W) ) ? (bump_right ? L : R) : R;
        endcase
        
    end

    always @(posedge clk, posedge areset) begin
        if(areset) begin
            state<=W;
        	dir<=L;
        end else begin
            state<=next_state;
            dir<=next_dir;
        end
    end
    always @(posedge clk) begin
        if(state==F) begin
            count <= count+5'd1;
            if(count==5'd19)
                uhoh<=1'b1;
        end else begin 
            count <= 5'd0;
            uhoh <= 1'b0;
        end    
    end
             

    // Output logic
    assign walk_left = (state==W&dir==L);
    assign walk_right = (state==W&dir==R);
    assign aaah = (state==F);
    assign digging = (state==D);

endmodule
