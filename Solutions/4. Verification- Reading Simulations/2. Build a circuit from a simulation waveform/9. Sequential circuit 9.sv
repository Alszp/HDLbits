module top_module (
    input clk,
    input a,
    output [3:0] q );
    always @(posedge clk) begin
        if(a==1) 
            q = 4'b0100;
        else begin
            q=q+4'd1;
            if(q==4'd7)
                q=4'd0;
        end
    end
endmodule
