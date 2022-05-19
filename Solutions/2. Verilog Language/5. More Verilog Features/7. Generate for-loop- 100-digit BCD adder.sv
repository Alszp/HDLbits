module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
	
    bcd_fadd num(a[3:0],b[3:0],cin,couttemp[0],sum[3:0]);
    wire [99:0] couttemp;
    genvar i;
    generate
        for(i=4;i<397;i=i+4) begin : adder_instantiation
            bcd_fadd num(a[i+3:i],b[i+3:i], couttemp[i/4-1], couttemp[i/4],sum[i+3:i]);
        end
    endgenerate
    assign cout=couttemp[99];        
endmodule
