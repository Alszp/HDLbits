module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a mymod(d,out1,a,c,b,out2);
endmodule
