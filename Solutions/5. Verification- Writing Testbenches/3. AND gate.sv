module top_module(output out);
timeunit 1ps;
    reg [1:0] in;
    parameter period = 10;
    initial begin 
        in = 2'b0;
        #10 in=2'd1;
        #10 in=2'd2;
        #10 in=2'd3;
    end

    andgate gate1(in,out);
endmodule
