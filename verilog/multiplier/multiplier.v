module multiplier(
    input [31:0] a,
    input [31:0] b,
    input [1:0] control,
    input [31:0] product_in,
    output [31:0] product_out
);


wire [31:0] shamt, product_in_sig, partial_product_unshifted, partial_product;
wire [31:0] sum_zero_one, sum_one_two, sum_two_three, sum_three_four, sum_four_five, sum_five_six;
wire [31:0] a_one, a_two, a_three, a_four, a_five, a_six, a_seven;
wire [31:0] product_zero, product_one, product_two, product_three, product_four, product_five, product_six, product_seven;
wire [7:0] b_seven_to_zero, b_fifteen_to_eight, b_twentyThree_to_sixteen, b_thirtyOne_to_twentyFour, partial_b;


// Get shift amount according to the control signal
    // control 11: shamt = 0
    // control 10: shamt = 8
    // control 01: shamt = 16
    // control 00: shamt = 24

assign b_seven_to_zero = b[7:0];
assign b_fifteen_to_eight = b[15:8];
assign b_twentyThree_to_sixteen = b[23:16];
assign b_thirtyOne_to_twentyFour = b[31:24];

// Set the multiplicand to the correct 8-bits of the input

mux4to1 #(8) set_partial_b(.src0(b_thirtyOne_to_twentyFour), .src1(b_twentyThree_to_sixteen), 
.src2(b_fifteen_to_eight), .src3(b_seven_to_zero), .sel(control), .z(partial_b));

// Set the right product_in (aka product in or 0 on init)s
mux4to1 #(32) set_product_in_sig(.src0(product_in), .src1(product_in), .src2(product_in), .src3(32'b0), .sel(control), .z(product_in_sig));


// RIPPLE MULTIPLY EIGHT TIMES
// Product of (a << 0) * b[0]
mux2to1 #(32) get_product_zero(.src0(32'b0), .src1(a), .sel(partial_b[0]), .z(product_zero));

//Product of (a << 1) * b[1]
//shifter shift_product_by_one(.a(a), .shamt(32'b00000000000000000000000000000001), .ctrl(2'b10), .res(a_one), .cout());
lshift shift_product_by_one(.a(a), .shamt(32'd1), .res(a_one));
mux2to1 #(32) get_product_one(.src0(32'b0), .src1(a_one), .sel(partial_b[1]), .z(product_one));


// Sum product zero and product one
//adder get_sum_zero_one(.a(product_zero), .b(product_one), .ctrl(4'b0000), .res(sum_zero_one), .cout());
fa_nbit get_sum_zero_one(.A(product_zero), .B(product_one), .cin(1'b0), .sum(sum_zero_one), .cout());


//Product of (a << 2) * b[2]
//shifter shift_product_by_two(.a(a), .shamt(32'b00000000000000000000000000000010), .ctrl(2'b10), .res(a_two), .cout());
lshift shift_product_by_two(.a(a), .shamt(32'd2), .res(a_two));
mux2to1 #(32) get_product_two(.src0(32'b0), .src1(a_two), .sel(partial_b[2]), .z(product_two));

// Update Summation
//adder get_sum_one_two(.a(sum_zero_one), .b(product_two), .ctrl(4'b0000), .res(sum_one_two), .cout());
fa_nbit get_sum_one_two(.A(sum_zero_one), .B(product_two), .cin(1'b0), .sum(sum_one_two), .cout());


//Product of (a << 3) * b[3]
//shifter shift_product_by_three(.a(a), .shamt(32'b00000000000000000000000000000011), .ctrl(2'b10), .res(a_three), .cout());
lshift shift_product_by_three(.a(a), .shamt(32'd3), .res(a_three));
mux2to1 #(32) get_product_three(.src0(32'b0), .src1(a_three), .sel(partial_b[3]), .z(product_three));

// Update Summation
//adder get_sum_two_three(.a(sum_one_two), .b(product_three), .ctrl(4'b0000), .res(sum_two_three), .cout());
fa_nbit get_sum_two_three(.A(sum_one_two), .B(product_three), .cin(1'b0), .sum(sum_two_three), .cout());


//Product of (a << 4) * b[4]
//shifter shift_product_by_four(.a(a), .shamt(32'b00000000000000000000000000000100), .ctrl(2'b10), .res(a_four), .cout());
lshift shift_product_by_four(.a(a), .shamt(32'd4), .res(a_four));
mux2to1 #(32) get_product_four(.src0(32'b0), .src1(a_four), .sel(partial_b[4]), .z(product_four));

// Update Summation
//adder get_sum_three_four(.a(sum_two_three), .b(product_four), .ctrl(4'b0000), .res(sum_three_four), .cout());
fa_nbit get_sum_three_four(.A(sum_two_three), .B(product_four), .cin(1'b0), .sum(sum_three_four), .cout());


//Product of (a << 5) * b[5]
//shifter shift_product_by_five(.a(a), .shamt(32'b00000000000000000000000000000101), .ctrl(2'b10), .res(a_five), .cout());
lshift shift_product_by_five(.a(a), .shamt(32'd5), .res(a_five));
mux2to1 #(32) get_product_five(.src0(32'b0), .src1(a_five), .sel(partial_b[5]), .z(product_five));

// Update Summation
//adder get_sum_four_five(.a(sum_three_four), .b(product_five), .ctrl(4'b0000), .res(sum_four_five), .cout());
fa_nbit get_sum_four_five(.A(sum_three_four), .B(product_five), .cin(4'b0), .sum(sum_four_five), .cout());


//Product of (a << 6) * b[6]
//shifter shift_product_by_six(.a(a), .shamt(32'b00000000000000000000000000000110), .ctrl(2'b10), .res(a_six), .cout());
lshift shift_product_by_six(.a(a), .shamt(32'd6), .res(a_six));
mux2to1 #(32) get_product_six(.src0(32'b0), .src1(a_six), .sel(partial_b[6]), .z(product_six));

// Update Summation
//adder get_sum_five_six(.a(sum_four_five), .b(product_six), .ctrl(4'b0000), .res(sum_five_six), .cout());
fa_nbit get_sum_five_six(.A(sum_four_five), .B(product_six), .cin(1'b0), .sum(sum_five_six), .cout());


//Product of (a << 7) * b[7]
//shifter shift_product_by_seven(.a(a), .shamt(32'b00000000000000000000000000000111), .ctrl(2'b10), .res(a_seven), .cout());
lshift shift_product_by_seven(.a(a), .shamt(32'd7), .res(a_seven));
mux2to1 #(32) get_product_seven(.src0(32'b0), .src1(a_seven), .sel(partial_b[7]), .z(product_seven));

// Update Summation
//adder get_sum_six_seven(.a(sum_five_six), .b(product_seven), .ctrl(4'b0000), .res(partial_product_unshifted), .cout());
fa_nbit get_sum_six_seven(.A(sum_five_six), .B(product_seven), .cin(1'b0), .sum(partial_product_unshifted), .cout());


// Get shift amount according to the control signal
    // control 11: shamt = 0
    // control 10: shamt = 8
    // control 01: shamt = 16
    // control 00: shamt = 24
    
mux4to1 #(32) get_shamt(.src0(32'b00000000000000000000000000011000), .src1(32'b00000000000000000000000000010000), 
.src2(32'b00000000000000000000000000001000), .src3(32'b0), .sel(control), .z(shamt));

// Shift the found sum over the correct amount of bits to get an
// acccurate 32 bit result.
    // shifter ctrl = 10 for shift left logical
    
//shifter shift_partial_sum(.a(partial_product_unshifted), .shamt(shamt), .ctrl(2'b10), .res(partial_product), .cout());
lshift shift_partial_sum(.a(partial_product_unshifted), .shamt(shamt), .res(partial_product));

//adder update_product(.a(product_in_sig), .b(partial_product), .ctrl(4'b0000), .res(product_out), .cout());
fa_nbit update_product(.A(product_in_sig), .B(partial_product), .cin(1'b0), .sum(product_out), .cout());







endmodule