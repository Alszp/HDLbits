module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always @(posedge clk) begin
        if(byteena[1])
            q[15:8]<=d[15:8];
        if(byteena[0])
            q[7:0]<=d[7:0];
        if(~resetn)
            q<=16'h0000;
    end
endmodule

