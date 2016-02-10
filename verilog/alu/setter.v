// Include
// `include "../gates/gates.v"

// /*
// SETTER
// ===========
// - add_res      adder result [31:0]
// - inverse_set  [1 bit]
// - ctrl         alu_ctrl[1:0]
//                00 => set on equal
//                01 => set on greater than
//                11 => set on greater than or equal

// - a_msb        most significant bit of a
// - b_msb        most significant bit of b

// - res [31:0] result

//  */

module setter (add_res, ctrl, a_msb, b_msb, inverse_set, res);

// Interface
input [31:0] add_res;
input [1:0] ctrl;
input a_msb;
input b_msb;
input inverse_set;

// input cout_mul;
output [31:0] res;

// Internal vars
wire isNotZero, isZero, possible_overflow, res_bit, actual_overflow;
wire [2:0] s1, s2, s3, s4, s5, s6;
wire [31:0] s7, s8, s9; // sle bits[2], sge bits[1], seq bits[0]; 

// sgt = ~bits[2], slt = ~bits[1], seq = ~bits[0] FOR s5

// Checking possible overflow
nor32to1 checkZero(.a(add_res), .z(isZero));
// or32to1 checkZero (.a(add_res), .z(isNotZero));
// not_gate invZero (.a(isNotZero), .z(isZero));

// 29 0's 00000000000000000000000000000

// Check if adder result was 0
mux2to1 #(3) getS1 (.src0(3'b010), .src1(3'b111), .sel(isZero), .z(s1));

// Check if result is negative
mux2to1 #(3) getS2 (.src0(s1), .src1(3'b100), .sel(add_res[31]), .z(s2));

// Check for possible overflow XOR MSB's of A and B
xor_gate getPO(.a(a_msb), .b(b_msb), .z(possible_overflow));
mux2to1 #(3) getS3 (.src0(s2), .src1(3'b100), .sel(possible_overflow), .z(s3));

// Check if B was negative
and_gate getAO (.a(possible_overflow), .b(b_msb), .z(actual_overflow));
mux2to1 #(3) getS4 (.src0(s3), .src1(3'b010), .sel(actual_overflow), .z(s4));
// Set inverse flags
// sle bits[2], sge bits[1], seq bits[0]; 
// sgt = ~bits[2], slt = ~bits[1], seq = ~bits[0] FOR s5

not_gate flip_sle (.a(s4[2]), .z(s5[2]));
not_gate flip_sge (.a(s4[1]), .z(s5[1]));
not_gate flip_seq (.a(s4[0]), .z(s5[0]));

// Decode result based on ctrl[1:0] and inverse set
mux2to1 #(3) getS6 (.src0(s4), .src1(s5), .sel(inverse_set), .z(s6));

// 00 = s6[0], seq/sne -- isZero = 1 & negative = 0 or overflow = 1
// 01 = s6[2], sle/sgt -- isZero = 0, negative = 1, overflow = 
// 10 = s6[1], sge/slt -- isZero = 0, negative = 0, overflow = 

assign s7[31:1] = 31'b0000000000000000000000000000000;
assign s8[31:1] = 31'b0000000000000000000000000000000;
assign s9[31:1] = 31'b0000000000000000000000000000000;

assign s7[0] = s6[0];
assign s8[0] = s6[2];
assign s9[0] = s6[1];

mux4to1 #(32) decode_res (.src0(s7), .src1(s8), .src2(s9), .sel(ctrl), .z(res));



endmodule // setter