module top_module (input x, input y, output z);
    wire ia, ib;
    assign ia=(x^y) & x;
    assign ib= (x==y);
    assign z=(ia&ib)^(ia|ib);
endmodule
