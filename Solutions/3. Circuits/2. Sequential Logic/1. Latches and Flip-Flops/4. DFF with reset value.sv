module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
    wire [7:0] di;
    dfff dff1(clk, di[0], q[0]);
    dfff dff2(clk, di[1], q[1]);
    dfff dff3(clk, di[2], q[2]);
    dfff dff4(clk, di[3], q[3]);
    dfff dff5(clk, di[4], q[4]);
    dfff dff6(clk, di[5], q[5]);
    dfff dff7(clk, di[6], q[6]);
    dfff dff8(clk, di[7], q[7]);
    assign di= (reset)? 7'h34:d;
   
endmodule
module dfff(input clk, input d, output q);
    always @(negedge clk) begin
        q<=d;
    end
endmodule

