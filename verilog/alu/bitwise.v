//
//
// BITWISE OPERATIONS
// ====
// - a  32-bit input into ALU
// - b  32-bit input into ALU
// - ctrl   alu_ctrl[1:0]
//          000 -> AND
//          001 -> OR
//          010 -> XOR
// - res    32-bit result


// `include "../gates/gates.v"


module bitwise(a, b, ctrl, res);
    
    // Interface
    input [31:0] a, b;
    input [1:0] ctrl;
    output [31:0] res;
    
    // Signals 
    wire [31:0] and_res, or_res, xor_res;
    
    // Perform all operations
    and_32 AND1(.a(a), .b(b), .z(and_res));
    or_32 OR1(.a(a), .b(b), .z(or_res));
    xor_32 XOR1(.a(a), .b(b), .z(xor_res));
    
    // Choose result
    mux4to1 #(32) MUXER(.src0(and_res), .src1(or_res), .src2(xor_res), .sel(ctrl), .z(res));
    
    endmodule