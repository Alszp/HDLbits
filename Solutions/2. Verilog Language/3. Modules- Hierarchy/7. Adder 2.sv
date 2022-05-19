module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire carry16;
    add16 low(a[15:0],b[15:0],,sum[15:0], carry16);
    add16 high(a[31:16],b[31:16],carry16,sum[31:16]);
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
    assign sum = (a^b)^cin;
    assign cout = (a&b)|(a&cin)|(cin&b);
endmodule
