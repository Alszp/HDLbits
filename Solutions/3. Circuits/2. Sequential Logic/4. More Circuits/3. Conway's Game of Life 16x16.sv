module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 
    
    
    reg [2:0] neighbors [255:0];
    integer i,j,k;
 
    always @(*) begin
        for(k=0;k<16;k=k+1) begin
            for(j=0;j<16;j=j+1) begin
                neighbors[k*16+j] = q[(16*k) + (j==0 ? 15 : j-1)]
                					+q[(16*k) + (j==15 ? 0 : j+1)]
                
               						+q[(16*(k==0 ? 15: k-1)) + (j==0 ? 15 : j-1)]
                					+q[(16*(k==0 ? 15: k-1)) + (j==15 ? 0 : j+1)]
                					+q[(16*(k==0 ? 15: k-1)) + (j)]
                
                                    +q[(16*(k==15 ? 0: k+1)) + (j==0 ? 15 : j-1)]
                                    +q[(16*(k==15 ? 0: k+1)) + (j==15 ? 0 : j+1)]
                					+q[(16*(k==15 ? 0: k+1)) + (j)];
            end
        end
    end
    
    always @(posedge clk) begin
        if(load) begin
            q<=data;                       
        end  
        else begin
            for (i=0;i<256;i=i+1) begin
                case(neighbors[i])
                    3'd2:q[i]=q[i];
                    3'd3:q[i]=1'b1;
                    default:q[i]=1'b0;
                endcase        
            end    
        end
    end
endmodule

