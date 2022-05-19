module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] q1,q2,q3;
    my_dff8 guy1(clk, d[7:0], q1);
    my_dff8 guy2(clk, q1[7:0], q2);
    my_dff8 guy3(clk, q2[7:0], q3);
    assign q = (sel[1]&sel[0])*q3+(sel[1]&~sel[0])*q2+(~sel[1]&sel[0])*q1+(~sel[1]&!sel[0])*d;
    
endmodule
