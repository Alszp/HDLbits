// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    always @(*) begin
        casez (in)
            4'bzzz1: pos=2'd0;
            4'bzz1z: pos=2'd1;
            4'bz1zz: pos=2'd2;
            4'b1zzz: pos=2'd3;
            4'b0000: pos=2'd0;
        endcase
    end
endmodule
