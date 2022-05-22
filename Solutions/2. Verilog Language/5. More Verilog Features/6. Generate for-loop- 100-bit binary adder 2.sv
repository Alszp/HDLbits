module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    full_addr numbah1(a[0],b[0],cin,sum[0],cout[0]);
    
    genvar i;
    generate
        for(i=1;i<100;i=i+1) begin : adder_instantiation
            full_addr num(a[i],b[i],cout[i-1],sum[i],cout[i]);
        end
    endgenerate
    
endmodule
module full_addr(input a, input b, input cin, output sum, output cout);
	assign sum=a^b^cin;
    assign cout=a&cin|a&b|b&cin;
endmodule