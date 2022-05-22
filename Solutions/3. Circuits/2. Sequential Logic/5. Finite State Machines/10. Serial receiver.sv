module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    reg [1:0] state, next_state;
    reg [4:0] count;
    parameter i = 2'b00, d = 2'b01, don = 2'b10;
    
    always @(*) begin
        case(state)
            i: next_state = in? i:d;
            d: next_state = (in&(count==8))? don:(in&(count>8))? i:d;
            don: next_state = in? i:d;
            default: next_state = i;
        endcase
    end
    
    always @(posedge clk) begin
        if(reset) state <= i;
        else state <= next_state;
        
        if(state == d) count <= count+1;
        else count <= 0;
    end

    assign done = state==don;
endmodule
