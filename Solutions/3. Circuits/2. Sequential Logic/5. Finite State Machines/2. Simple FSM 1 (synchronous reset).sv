// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        case(state)
            1'b0:next_state = in?1'b0:1'b1;
			1'b1:next_state = in?1'b1:1'b0;
        endcase
    end

    always @(posedge clk) begin    // This is a sequential always block
        if(reset) state<=1'b0;
        else state<=next_state;
    end

    assign out=!state;

endmodule
