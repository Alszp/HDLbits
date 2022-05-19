module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //


    parameter [1:0] In_receive=2'b10, Scan=2'b01, doneS = 2'b11; 
    reg[1:0] state, next_state, count;
    
    always @(*) begin
        case(state)
            Scan: next_state = (in[3]==1'b1)?In_receive:Scan;
            In_receive: next_state = (count>=2'd3)?doneS:In_receive;
            doneS: next_state = (in[3]==1'b1)?In_receive:Scan;
            default: next_state = 2'd0;
        endcase
    end
    
            
    // State flip-flops (sequential)
    always @(posedge clk) begin
        
        if(reset) state<=Scan;
        else begin
            state <= next_state;
    	end
    end

    reg L;
    wire edger;
    always @(posedge edger) begin
        L<=clk;
    end
    assign edger = L^clk;
    always @(posedge edger) begin
        	count<=2'd0;
            if(state==In_receive) count <= count+2'b01;
    end
    
    assign done = state==doneS;

endmodule
