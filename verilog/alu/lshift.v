module lshift(a, shamt, res);

// Interface
    input [31:0] a, shamt;
    output [31:0] res;
    
    wire [31:0] shift_4, shift_3, shift_2, shift_1;

    mux2to1_32 MR4(.src0(a), .src1({a[15:0], 16'b0}), .sel(shamt[4]), .z(shift_4));
    mux2to1_32 MR3(.src0(shift_4), .src1({shift_4[23:0], 8'b0}), .sel(shamt[3]), .z(shift_3));
    mux2to1_32 MR2(.src0(shift_3), .src1({shift_3[27:0], 4'b0}), .sel(shamt[2]), .z(shift_2));
    mux2to1_32 MR1(.src0(shift_2), .src1({shift_2[29:0], 2'b0}), .sel(shamt[1]), .z(shift_1));
    mux2to1_32 MR0(.src0(shift_1), .src1({shift_1[30:0], 1'b0}), .sel(shamt[0]), .z(res));

endmodule