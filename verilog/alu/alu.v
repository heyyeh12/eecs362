// `define shift 1'b00
// `define add 1'b01
// `define bit 1'b10
// `define set 1'b11

module alu(a, b, ctrl, res, zf, of, cf);
    
    // Interface
    input [31:0] a, b;
    input [3:0] ctrl;
    output [31:0] res;
    output zf, of, cf;
    
    // Internal signals
    wire cout_shft, cout_add;
    wire [31:0] res_shft, res_add, res_bit, res_set;
    
    shifter shift_map (.a(a), .shamt(b), .ctrl(ctrl[1:0]), .res(res_shft), .cout(cout_shft));
    bitwise bit_map (.a(a), .b(b), .ctrl(ctrl[1:0]), .res(res_bit));
    adder add_map (.a(a), .b(b), .ctrl(ctrl[1:0]), .res(res_add), .cout(cout_add));
    // setter set_map (.a(res_add), .ctrl(ctrl[1:0]), .res(res_set));
    
    // Output selector
    mux4to1 mux_map (.src0(res_shft), .src1(res_add), .src2(res_bit), .src3(res_set), .sel(ctrl[3:2]), .z(res));
    
    endmodule