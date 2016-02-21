// D - Flip Flop
//
//
//
//



module dff (d, clk, rst, enable, q);

// Ports : d, q, clk
    parameter N_BITS = 32;
    input [N_BITS - 1: 0] d;
    input clk, rst, enable;
    output [N_BITS - 1: 0] q;
    
    reg [N_BITS - 1:0] q;

 always @(posedge(clk), posedge(rst))
 begin
    if (rst == 1)
       q <= {N_BITS{1'b0}};
    else if (clk == 1)  
        begin
            if (enable == 1)
                 q <= d;
        end
    end
 
endmodule

// D - Flip Flop A
//
//
//
//

module dffa (d, clk, rst, enable, q, aload, arst);

// Ports : d, q, clk
    parameter N_BITS = 32;
    input [N_BITS - 1: 0] d, aload;
    input clk, rst, enable, arst;
    output [N_BITS - 1: 0] q;
    reg [N_BITS - 1:0] q;

 always @(posedge(clk), posedge(rst))
 begin
    if (rst == 1)
        q <= {N_BITS{1'b0}};
    else if (arst == 1)
        q <= aload;
    else if (clk == 1)  // rising_edge verilog equivalent?
        begin
            if (enable == 1)
                q <= d;
        end
    end
 
endmodule