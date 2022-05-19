module top_module (
    input clk,
    input d,
    output q
);
    reg L;
    wire edger;
    always @(posedge edger) begin
        L<=clk;
    end
    assign edger = L^clk;
    always @(posedge edger) begin
        q=d;
    end

endmodule
