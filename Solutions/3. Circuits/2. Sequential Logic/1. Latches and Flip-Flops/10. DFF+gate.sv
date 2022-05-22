module top_module (
    input clk,
    input in, 
    output out);
    
wire xorer;
    assign xorer = out^in;
    always @(posedge clk) begin
        out=xorer;
    end
endmodule
