module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q);
    
    
    reg hold;
    parameter right=2'b01, left = 2'b10;
    
    always @(posedge clk) begin
        if(load)
            q<=data;
        else begin 
            case(ena)
                right: q <= {q[0], q[99:1]}; 
                left: q <= {q[98:0], q[99]};
                default:;
        	endcase
        end
    end
endmodule
