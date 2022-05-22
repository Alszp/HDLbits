module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    dfl dflipflop1(d[0], q[0], clk);
    dfl dflipflop2(d[1], q[1], clk);  
    dfl dflipflop3(d[2], q[2], clk);  
    dfl dflipflop4(d[3], q[3], clk);  
    dfl dflipflop5(d[4], q[4], clk);  
    dfl dflipflop6(d[5], q[5], clk);  
    dfl dflipflop7(d[6], q[6], clk);  
    dfl dflipflop8(d[7], q[7], clk);  
    
   

endmodule
module dfl(input d,output q, input clk);
    always @(posedge clk) begin
        q<=d;
    end
endmodule
    