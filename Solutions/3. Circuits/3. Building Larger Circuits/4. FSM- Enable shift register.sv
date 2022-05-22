module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
	
    reg [1:0] count;
    always @(posedge clk) begin
        if(reset)
            shift_ena<= 1'b1;
        if(shift_ena)
        	count<=count+2'b01;
        if(count==2'b11) begin
            shift_ena <= 1'b0;
        	count<= 2'b00;
        end
    end
      
endmodule
