module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 
    wire[511:0] next_state;
    assign next_state[510:1] = ~q[510:1]&q[509:0] 
      						    |~q[511:2]&q[510:1]
        				        |q[510:1]&~q[509:0];
    assign next_state[511] = ~q[511]&q[510] 
        					  |1'b1&q[511]
        					  |q[511]&~q[510];
    assign next_state[0] = ~q[0]&1'b0 
        					|~q[1]&q[0]
        					|q[0]&1'b1;

    always @(posedge clk) begin
        if(load)
            q<=data;
        else begin
            q<= next_state;
        end
    end

endmodule
