module top_module ();
reg clk, reset, t;
wire q;
    initial begin
        clk=0;
        reset=0;
        t=0;
        #10 reset=1;
        #10 reset = 0;
        #10 t = 1;
        #10 t=0;
    end
    always begin
        #10 clk=~clk;
    end
    tff tff1(clk,reset,t,q);
endmodule
