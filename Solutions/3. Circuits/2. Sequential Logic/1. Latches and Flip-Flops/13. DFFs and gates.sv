module top_module (
    input clk,
    input x,
    output z
); 
wire Gate1, Gate2, Gate3;
wire Q1, Q2, Q3;
wire Qn1, Qn2, Qn3;
	assign Gate1 = Q1^x;
    assign Gate2 = Qn2&x;
    assign Gate3 = x|Qn3;
    
    flip flip1(Gate1, clk, Q1, Qn1);
    flip flip2(Gate2, clk, Q2, Qn2);
    flip flip3(Gate3, clk, Q3, Qn3);
    
    assign z=~(Q1|Q2|Q3);
    
endmodule
	
module flip(input D, input clk, output Q, output Qnot);
    always @(posedge clk) begin
        if(clk) begin
        Q<=D;
        end else begin
            Q=0;
        end
    end
    assign Qnot=~Q;
endmodule
