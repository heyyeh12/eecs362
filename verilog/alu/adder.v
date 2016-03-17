// `include "../gates/gates.v"

module adder(a, b, ctrl, res, cout);
    // Interface
    input [31:0] a, b;
    input [3:0] ctrl; // if 11XX(src12-15) - subtract, if 0101(src5) - subtract, else - add
    output [31:0] res;
    output cout;
    
    // Internal Signals
    wire [31:0] b_not, b_int;
    wire carry_int;
    
    not_32 not_map(.a(b), .z(b_not));
    mux16to1 #(32) mux_map1(.src0(b), 
                           .src1(b),
                           .src2(b),
                           .src3(b),
                           .src4(b),
                           .src5(b_not),
                           .src6(b),
                           .src7(b),
                           .src8(b),
                           .src9(b),
                           .src10(b),
                           .src11(b),
                           .src12(b_not),
                           .src13(b_not),
                           .src14(b_not),
                           .src15(b_not),
                           .sel(ctrl[3:0]), 
                           .z(b_int));
                           
        mux16to1 #(1) mux_map2(.src0(1'b0), 
                           .src1(1'b0),
                           .src2(1'b0),
                           .src3(1'b0),
                           .src4(1'b0),
                           .src5(1'b1),
                           .src6(1'b0),
                           .src7(1'b0),
                           .src8(1'b0),
                           .src9(1'b0),
                           .src10(1'b0),
                           .src11(1'b0),
                           .src12(1'b1),
                           .src13(1'b1),
                           .src14(1'b1),
                           .src15(1'b1),
                           .sel(ctrl[3:0]), 
                           .z(carry_int));
                           
    // cin should be 1 if alu_ctrl is 11XX or 0101, another mux16to1?
    fa_nbit fa_map(.A(a), .B(b_int), .cin(carry_int), .sum(res), .cout(cout));

endmodule // adder

module fa(a, b, cin, sum, cout);
    input a, b, cin;
    output sum, cout;

    assign sum = a ^ b ^ cin;
    assign cout = (a&b)^(cin&(a^b));
endmodule // fa

// Simple n-bit ripple-carry adder
module fa_nbit(A, B, cin, sum, cout); // synopsys template
    parameter WIDTH=32;
    input [0:(WIDTH-1)] A, B;
    input cin;
    output [0:(WIDTH-1)] sum;
    output cout;

    // Carry will need WIDTH+1 bits total
    wire [0:(WIDTH)] carry;

    // Generate WIDTH full adders and wire them appropriately
    genvar i;
    generate
        for (i=0; i<WIDTH; i=i+1) begin: FA_NBIT
            // Carry-out of previous wired to carry-in of next
            // (MSB is 0, LSB is 31, carry[31] feeds cin[30])
            // This is an endianness issue.
            fa FA (
                .a(A[i]),
                .b(B[i]),
                .cin(carry[i+1]),
                .sum(sum[i]),
                .cout(carry[i]));
        end
    endgenerate
    // cin & cout wiring
    assign cout = carry[0];
    assign carry[WIDTH] = cin;
endmodule // fa_nbit
