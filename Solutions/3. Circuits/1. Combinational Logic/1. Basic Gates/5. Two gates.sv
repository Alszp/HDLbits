module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    assign out=(~(in2^in1)^in3);
endmodule
