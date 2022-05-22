module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] L;
    always @(posedge clk) begin
        if(clk) begin
        	L<=in;
            out <= (L&~out&~{32{reset}}&~in)|out&~{32{reset}};
        end
        else out<=32'b0;
    end

endmodule
