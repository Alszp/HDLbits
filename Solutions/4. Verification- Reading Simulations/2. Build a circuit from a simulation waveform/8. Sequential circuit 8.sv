module top_module (
    input clock,
    input a,
    output p,
    output q );
    wire temp;
	assign temp=q;
    always @(*) begin
        if (clock==1)
            p=a;
    end
    always @(negedge clock) begin
        q <= p;
    end
    
endmodule
