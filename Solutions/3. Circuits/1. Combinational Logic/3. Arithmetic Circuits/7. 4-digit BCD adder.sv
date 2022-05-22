module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire cout2[3:-1];
      

    genvar i;
    generate 
        for(i=0;i<4;i=i+1) begin : adders
            bcd_fadd bcd(a[(i+1)*4-1:i*4],b[(i+1)*4-1:i*4],cout2[i-1],cout2[i],sum[(i+1)*4-1:i*4]);
        end
    endgenerate
    assign cout2[-1]=cin;
    assign cout=cout2[3];
            
            

endmodule
