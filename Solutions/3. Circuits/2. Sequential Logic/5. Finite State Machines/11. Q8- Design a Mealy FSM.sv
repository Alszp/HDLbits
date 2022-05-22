module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    reg [1:0] state, next_state;
    parameter first = 2'b0, mid= 2'b1, last = 2'b10;
    
    always @(*) begin
        case(state)
            first: next_state = x ? mid:first;
            mid: next_state = x ? mid:last;
            last: next_state = x ? mid:first;
            default: next_state = first;
        endcase
    end
    always @(posedge clk, negedge aresetn) begin
        if(~aresetn) state <= first;
        else state <=next_state;
    end
    assign z= (state==last)&(x==1);
          
endmodule
