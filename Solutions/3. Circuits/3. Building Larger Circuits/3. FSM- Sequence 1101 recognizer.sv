module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
  
    
    reg [2:0] state, next_state;
    
    always @(posedge clk) begin 
        if(reset) begin
            state <= 3'b000;
        end
         else state <= next_state;
    end
        
        
    always @(*) begin
        start_shifting <=1'b0;
            case(state)
            3'b000: begin
                    if(data) begin
                  	  next_state <= 3'b001;
                    end else 
                      
                      next_state <= 3'b000;
            	   end
            3'b001: begin
                	if(data) begin

                  	  next_state <= 3'b010;
                    end else 
                      next_state <= 3'b000;
            	   end
            3'b010: begin
                	if(~data) begin
                  	   next_state <= 3'b011;
                    end else 
                       next_state <= 3'b010;
            	   end
            3'b011: begin
                    if(data) begin
                  	  next_state <= 3'b100;
                    end else 
                      next_state <= 3'b000;
            	   end
            3'b100: start_shifting <=1'b1;
                default: begin
                    start_shifting <=1'b0;
                    next_state <= 3'b000;
                end
        endcase
    end
endmodule
