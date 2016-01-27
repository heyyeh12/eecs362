// Include
// `include "../gates/gates.v"

// /*
// FLAG SETTER
// ===========
// - alu_res      result from ALU [31:0]
// - ctrl         alu_ctrl[3:2]
//                00 => cout_sft
//                01 => cout_add
//                11 => cout_mul
// - cout_add     cout from adder [1bit]
// - cout_shft    cout from shifter [1bit]
// - cout_mul     cout from multiplier [1bit]
// - zf           zero flag [1bit]
// - of           overflow flag [1bit]
// - cf           carry flag [1bit]
//  */

module flag_setter (alu_res, ctrl, cout_add, cout_shft, zf, of, cf);

// Interface
input [31:0] alu_res;
input [1:0] ctrl;
input cout_add;
input cout_shft;
// input cout_mul;
output zf, of, cf;

// Internal vars
wire carry, cf_mux, not_ctrl1, cf_int, cf;
// Zflag logic
    nor32to1 Z_FLAG(.a(alu_res),.z(zf));

// Cflag logic - only if ctrl = 00 or 01
    mux2to1 #(1) C_FLAG(cout_shft, cout_add, ctrl[0], cf_mux);
    not_gate NOT_MAP(.a(ctrl[1]), .z(not_ctrl1));
    and_gate CARRY(.a(cf_mux), .b(not_ctrl1), .z(cf_int));

    assign cf = cf_int;
    
// Overflow logic
    xor_gate OF_FLAG(cf_int, alu_res[31], of);
    
endmodule // flag_setter