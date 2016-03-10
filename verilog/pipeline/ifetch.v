module ifetch(
    clk, rst, initPC, nextPC, takeLeap, enable, not_halt,
    curPC, incPC
);
    
    input clk, rst;
    input [31:0] initPC;    // address for reset
    input [31:0] nextPC;
    input takeLeap, enable, not_halt;
    output [31:0] curPC;    // going to instruction memory
    output [31:0] incPC;   // PC + 4
    
    wire [31:0] PC_d, PC_q;
    wire enable_PC;
    
    and_gate and_gate (.a(enable), .b(not_halt), .z(enable_PC));
    // PC Register
    dffa #(32) dffa (.d(PC_d), .clk(clk), .rst(1), .enable(enable_PC), .q(PC_q), .aload(initPC), .arst(rst));
   
    
     // assign curPC
    mux2to1 mux2to1 (.src0(PC_q), .src1(nextPC), .sel(takeLeap), .z(curPC));
    
     // PC + 4
    adder add4 (.a(32'b0100), .b(curPC), .ctrl(4'b0000), .res(PC_d));
    
    assign incPC = PC_d;
    
endmodule // ifetch