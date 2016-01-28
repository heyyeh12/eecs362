// `define shift 1'b00
// `define add 1'b01
// `define bit 1'b10
// `define set 1'b11

module alu(a, b, alu_ctrl, inverse_set, res, zf, of, cf);
    
    // Interface
    input [31:0] a, b;
    input [3:0] alu_ctrl;
    input inverse_set; // inverting bit for the setter
    output [31:0] res;
    output zf, of, cf;
    
    // Internal signals
    wire cout_shft, cout_add;
    wire [31:0] res_shft, res_add, res_bit, res_set;
    wire [31:0] int_res;
    
    shifter shift_map (.a(a), .shamt(b), .ctrl(alu_ctrl[1:0]), .res(res_shft), .cout(cout_shft));
    bitwise bit_map (.a(a), .b(b), .ctrl(alu_ctrl[1:0]), .res(res_bit));
    adder add_map (.a(a), .b(b), .ctrl(alu_ctrl[3:0]), .res(res_add), .cout(cout_add));
    setter set_map (.add_res(res_add), .ctrl(alu_ctrl[1:0]), .inverse_set(inverse_set), .a_msb(a[31]), .b_msb(b[31]), .res(res_set));
    

    // Output selector
    mux4to1 mux_map (.src0(res_shft), .src1(res_add), .src2(res_bit), .src3(res_set), .sel(alu_ctrl[3:2]), .z(int_res));
    
    flag_setter  flag_map (.alu_res(int_res), .ctrl(alu_ctrl[3:2]), .cout_add(cout_add), .cout_shft(coud_shft), .zf(zf), .of(of), .cf(cf));
    assign res = int_res;
    
    endmodule