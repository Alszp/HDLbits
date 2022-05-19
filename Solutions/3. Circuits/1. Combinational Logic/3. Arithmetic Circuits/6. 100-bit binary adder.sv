module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
	assign sum = a+b+cin;
    assign cout = (a[99]&b[99])|(~sum[99]&b[99])|(~sum[99]&a[99]);
endmodule
