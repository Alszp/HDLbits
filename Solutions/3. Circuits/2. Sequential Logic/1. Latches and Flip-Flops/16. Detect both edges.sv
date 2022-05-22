module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] L;
    always @(posedge clk) begin
        
        anyedge[7:0]<=in[7:0]^L[7:0];
        L[7:0]<= in; 
    end
endmodule
