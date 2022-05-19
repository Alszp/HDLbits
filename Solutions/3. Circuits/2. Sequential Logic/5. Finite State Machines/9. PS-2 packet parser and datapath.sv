module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    parameter [1:0] byte2=2'b10, Scan=2'b01, doneS = 2'b11, byte3 = 2'b00; 
    reg[1:0] state, next_state, count; 
    
                        always @(*) begin
                            case(state)
                                Scan: next_state = (in[3]==1'b1)?byte2:Scan;
                                byte2: next_state = byte3;
                                byte3: next_state = doneS;
                                doneS: next_state = (in[3]==1'b1)?byte2:Scan;
                            endcase
                        end

            
    
    // State flip-flops (sequential)
    always @(posedge clk) begin    
        if(reset) state<=Scan;
        else begin
            state <= next_state;
            case(state)
                Scan: out_bytes[23:16] <=in;
                doneS: out_bytes[23:16] <=in;
                byte2: out_bytes[15:8] <=in;
                byte3: out_bytes[7:0] <=in;
            endcase
    	end
    end

    assign done = state==doneS;

endmodule