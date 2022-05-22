module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );


    parameter P1=4'b0000, P2=4'b0001, P3=4'b0010, P4=4'b0011, S1=4'b0100, S2=4'b0101, S3=4'b0110, S4=4'b0111, H=4'b1000, D=4'b1001;   
    reg [3:0] state, next_state, countdown;
    reg [9:0] thousand;
    reg next;
 
    always @(posedge clk) begin
        if(reset) state <= P1;
        else state <= next_state;
        thousand<= 10'b0000000000;
        case(state)
            S1: countdown[3]<=data;
            S2: countdown[2]<=data;
            S3: countdown[1]<=data;
            S4: countdown[0]<=data;
            H:  begin
                	thousand<= thousand+10'b0000000001;
                next<= (countdown==4'b0000&thousand==10'd998)? 1'b1:1'b0;
                	if(thousand==10'd999) begin
               			countdown<= countdown-4'b0001;
                    	thousand<= 10'b0000000000;
                	end
            	end
        endcase
    end
    
    always @(*) begin
        case(state)
            P1: next_state= data ? P2 : P1;
            P2: next_state= data ? P3 : P1;
            P3: next_state= data ? P3 : P4;
            P4: next_state= data ? S1 : P1;
            S1: next_state= S2;
            S2: next_state= S3;
            S3: next_state= S4;
            S4: next_state= H;
            H: next_state= next==(1'b1) ? D : H;
            D: next_state= ack ? P1 : D;
        endcase
    end
    
    assign counting = state==H;
    assign done = state==D;
    assign count = (countdown);
endmodule

