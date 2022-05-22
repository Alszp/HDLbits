module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cout;
    wire [31:0] Bneg;
    assign Bneg = {32{sub}}^b;
    add16 init(a[15:0],Bneg[15:0],sub,sum[15:0],cout);
    add16 higher(a[31:16],Bneg[31:16],cout,sum[31:16]);          

endmodule
