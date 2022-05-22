module top_module (
    input clk,
    input reset,
    output [9:0] q);
    always @(posedge clk) begin
        
        if(q==10'd999|reset)
    		q <= 10'd0;
        else
            q <= q+1;
    end
endmodule
