module top_module (
    input clk,
    input areset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
    
    dfff dff1(clk, areset, d, q);  
endmodule


module dfff(input clk, input areset, input [7:0] d, output [7:0] q);
    
    always @(posedge clk or posedge areset) begin
        if(areset) begin
        	q<=0;
        end
        else if(clk) begin
            q<=d;
        end
    end
endmodule

