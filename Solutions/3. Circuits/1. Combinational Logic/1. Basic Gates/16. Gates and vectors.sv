module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );

    integer i;
    always @(*) begin
        for (i=0;i<3;i=i+8'b1) begin
            out_both[i]=in[i]&in[i+1]&1'b1;
            out_any[i+1]=in[i+1]|in[i];
            out_different[i]=in[i]^in[i+1];
        end
    end
    assign out_different[3]=in[3]^in[0];
    
endmodule
