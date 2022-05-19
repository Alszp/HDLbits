module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        case(state)
            1'b0:next_state = in?1'b0:1'b1;
			1'b1:next_state = in?1'b1:1'b0;
        endcase
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        if(areset) state<=1'b0;
        else state<=next_state;
    end

    assign out=!state;

endmodule
