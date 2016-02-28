module ifetch(
    clk, rst, initPC, prevPC,
    curPC, incPC
);
    
    input clk, rst;
    input [31:0] initPC;    // address for reset
    input [31:0] prevPC;    // from previous cycle
    output [31:0] curPC;    // going to instruction memory
    output [31:0] incPC;   // PC + 4
    
    wire [31:0] curPC_wire;
    
    // PC Register
    dffa #(32) dffa (.d(prevPC), .clk(clk), .rst(0), .enable(1'b1), .q(curPC_wire), .aload(initPC), .arst(rst));
   
    // PC + 4
    adder add4 (.a(32'b0100), .b(curPC_wire), .ctrl(4'b0000), .res(incPC));
   
   // assign curPC
   assign curPC = curPC_wire;
   
endmodule // ifetch