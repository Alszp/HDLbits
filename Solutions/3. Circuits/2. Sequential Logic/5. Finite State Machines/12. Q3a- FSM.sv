module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    reg [2:0] state, next_state, check;
    parameter A= 3'd0, W1= 3'd1, W2= 3'd2, W3= 3'd3;
   
    always @(*) begin
        case(state)
            A: next_state = s;
            W1: next_state = W2;
            W2: next_state = W3;
            W3: next_state = W1;
            default: next_state = A;
        endcase
        
    end
   
    always @(posedge clk) begin
        
        if(reset) begin 
            state <= A;
            W1:check[0] = 0;
            W2:check[1] = 0;
            W3:check[2] = 0;
        end
        else state <= next_state;
        
        case(state)
            W1:check[0] = w;
            W2:check[1] = w;
            W3:check[2] = w;
        endcase 
    end
    
    assign z = (state==W1)&(~^check&(|check));
  
        

endmodule
