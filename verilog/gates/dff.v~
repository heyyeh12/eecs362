// D - Flip Flop A

module dffa (d, clk, rst, enable, q, aload, arst);

// Ports : d, q, clk
    parameter N_BITS = 32;
    input [N_BITS - 1: 0] d, aload;
    input clk, rst, enable, arst;
    output [N_BITS - 1: 0] q;
    reg [N_BITS - 1:0] q;

 always @ (posedge clk or negedge rst or negedge arst)
 begin
    if (!rst) q <= {N_BITS{1'b0}};
    else if (!arst) q <= aload;
    else if (enable == 1) q <= d;
   end
 
endmodule
