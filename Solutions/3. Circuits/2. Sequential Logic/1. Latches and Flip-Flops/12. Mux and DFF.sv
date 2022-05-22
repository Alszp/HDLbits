module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    reg mux1, mux2;
    always @(posedge clk) begin
        if(E==1)
            mux1=w;
        else 
        	mux1=Q;
        if(L==1)
            mux2=R;
        else
            mux2=mux1;
        Q=mux2;
    end

endmodule
