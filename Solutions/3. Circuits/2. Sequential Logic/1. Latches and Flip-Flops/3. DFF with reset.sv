module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
    dfff dff1(clk, reset, d[0], q[0]);
    dfff dff2(clk, reset, d[1], q[1]);
    dfff dff3(clk, reset, d[2], q[2]);
    dfff dff4(clk, reset, d[3], q[3]);
    dfff dff5(clk, reset, d[4], q[4]);
    dfff dff6(clk, reset, d[5], q[5]);
    dfff dff7(clk, reset, d[6], q[6]);
    dfff dff8(clk, reset, d[7], q[7]);
   
endmodule
module dfff(input clk, input reset, input d, output q);
    always @(posedge clk) begin
        q<=d;
        if(reset)
            q<=0;
    end
endmodule

