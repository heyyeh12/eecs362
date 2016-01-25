// Include
`include "../gates/nor_gate.v"
`include "../gates/nand_gate.v"
`include "../gates/mux_n.v"
`include "../gates/and_gate.v"
// /*
// FLAG SETTER
// ===========
// - alu_res      result from ALU [31:0]
// - ctrl         alu_ctrl[4:2]
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
input [2:0] ctrl;
input cout_add;
input cout_shft;
// input cout_mul;
output zf, of, cf;

// Internal vars
wire carry, cf_int, cf_int2;

// Zflag logic

// TODO : move to a 32 downto 1 nor component
    
    wire [31:0] nor32_in;
    
    assign nor32_in = alu_res;
    
    wire [15:0] nor16;
    wire [7:0] nor8;
    wire [3:0] nor4;
    wire [1:0] nor2;
    wire nor32_out;
    
    // 32 to 16
    genvar i;
    generate
        for (i = 0; i < 16; i = i+1) begin : LOOP16
            nor_gate NOR16(nor32_in[i], nor32_in[31-i], nor16[i]);
        end
    endgenerate

    // 16 to 8
    generate
        for (i = 0; i < 8; i = i+1) begin : LOOP8
            nor_gate NOR8(nor16[i], nor16[15-i], nor8[i]);
        end
    endgenerate
    
    // 8 to 4
    generate
        for (i = 0; i < 4; i = i+1) begin : LOOP4
            nor_gate NOR4(nor8[i], nor8[7-i], nor4[i]);
        end
    endgenerate
    
    // 4 to 2
    generate
        for (i = 0; i < 2; i = i+1) begin : LOOP2
            nor_gate NOR2(nor4[i], nor4[3-i], nor2[i]);
        end
    endgenerate
    
    // 2 to 1
    nor_gate NOR1(nor4[0], nor4[1], nor32_out);
    
    assign zf = nor32_out;
///

// nor32to1 Z_FLAG(.a(alu_res),.z(zf));

// Overflow logic
    xor OF_FLAG(cf_int2, alu_res[31], of);

// Cflag selector - only if ctrl = 000 or 001
    nand_gate C_ON(.a(ctrl[2]), .b(ctrl[1]), .z(carry));
    mux2to1 #(1) C_FLAG(cout_shft, cout_add, ctrl[0], cf_int);
    and_gate C_OUT(.a(carry), .b(cf_int), .z(cf_int2));
    
    assign cf = cf_int2;

endmodule // flag_setter