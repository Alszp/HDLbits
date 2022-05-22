module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout;
    wire [15:0] sum1,sum2;
    add16 initi(a[15:0],b[15:0],0,sum[15:0],cout);
    add16 nocar(a[31:16],b[31:16],0,sum1[15:0]);  
    add16 car(a[31:16],b[31:16],1,sum2[15:0]);
    assign sum[31:16]=sum1*!cout+sum2*cout;
                
endmodule
