// `include "../gates/gates.v"

module adder(a, b, ctrl, res, cout);
    // Interface
    input [31:0] a, b;
    input [1:0] ctrl;
    output [31:0] res;
    output cout;
    
    // Internal Signals
    wire [31:0] b_not, b_int;
    
    not_32 not_map(.a(b), .z(b_not));
    mux2to1 #(32) mux_map(.src0(b), .src1(b_not), .sel(ctrl[0]), .z(b_int));
    fa_nbit fa_map(.A(a), .B(b_int), .cin(ctrl[0]), .sum(res), .cout(cout));

endmodule // adder

module fa(a, b, cin, sum, cout);
    input a, b, cin;
    output sum, cout;

    assign sum = a ^ b ^ cin;
    assign cout = (a&b)^(cin&(a^b));
endmodule // fa

// Simple n-bit ripple-carry adder
module fa_nbit(A, B, cin, sum, cout);
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
endmodule