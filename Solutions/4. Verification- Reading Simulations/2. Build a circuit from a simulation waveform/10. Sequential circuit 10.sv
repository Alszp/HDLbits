module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    always @(posedge clk) begin
        state=(a&b)|(state&b)|(state&a);
    end
    assign q=state^b^a;
            
            
            
endmodule
