// Include
// `include "../gates/gates.v"

// /**
//  * SHIFTER
//  * =======
//  *  - a     data input [31:0]
//  *  - shamt shift amount [31:0]
//  *  - ctrl  shift type selector [1:0], where
//  *          10 => shift left logical
//  *          00 => shift right logical
//  *          01 => shift right arithmetic
//  *  - res   shifter result [31:0]
//  *  - cout  carry flag [1 bit]
//  */
module shifter2 (a, shamt, ctrl, res, cout);


// Interface
    input [31:0] a, shamt;
    input [1:0] ctrl;
    output [31:0] res;
    output cout;

// Signals
    wire [31:0] rev0, s5, s4, s3, s2, s1, s0, msb32;
    wire msb, big_shift;
    genvar i;

// select - 0: logical, 1: arithemtic
    mux2to1 #(1) MUX_LA(.src0(1'b0), .src1(a[31]), .sel(ctrl[0]), .z(msb));

// data reversal - 0: right shift, 1: left shift
    generate
        for (i = 0; i < 32; i = i+1) begin : reverse0
            mux2to1 MR0(.src0(a[i]), .src1(a[31-i]), .sel(ctrl[1]), .z(rev0[i]));
        end
    endgenerate

// clear for shamt bit 5 or higher
    or32to1 BIG_SHIFT(.a({shamt[31:5], 5'd0}), .z(big_shift));
    mux2to1_32 Ms5A(.src0(32'd0), .src1(32'hFFFFFFFF), .sel(msb), .z(msb32));
    mux2to1_32 Ms5B(.src0(rev0), .src1(msb32), .sel(big_shift), .z(s5));

// 16-bit right shift
    generate
        for (i = 16; i < 32; i = i+1) begin : shift16a
            mux2to1 Ms4A(.src0(s5[i]), .src1(msb), .sel(shamt[4]), .z(s4[i]));
        end
    endgenerate
    generate
        for (i = 0; i < 16; i = i+1) begin : shift16b
            mux2to1 Ms4B(.src0(s5[i]), .src1(s5[i+16]), .sel(shamt[4]), .z(s4[i]));
        end
    endgenerate

// 8-bit right shift    
    generate
        for (i = 24; i < 32; i = i+1) begin : shift8a
            mux2to1 Ms3A(.src0(s4[i]), .src1(msb), .sel(shamt[3]), .z(s3[i]));
        end
    endgenerate
    generate
        for (i = 0; i < 24; i = i+1) begin : shift8b
            mux2to1 Ms3B(.src0(s4[i]), .src1(s4[i+8]), .sel(shamt[3]), .z(s3[i]));
        end
    endgenerate

// 4-bit right shift
    generate
        for (i = 28; i < 32; i = i+1) begin : shift4a
            mux2to1 Ms2A(.src0(s3[i]), .src1(msb), .sel(shamt[2]), .z(s2[i]));
        end
    endgenerate
    generate
        for (i = 0; i < 28; i = i+1) begin : shift4b
            mux2to1 Ms2B(.src0(s3[i]), .src1(s3[i+4]), .sel(shamt[2]), .z(s2[i]));
        end
    endgenerate

// 2-bit right shift
    generate
        for (i = 30; i < 32; i = i+1) begin : shift2a
            mux2to1 Ms1A(.src0(s2[i]), .src1(msb), .sel(shamt[1]), .z(s1[i]));
        end
    endgenerate
    generate
        for (i = 0; i < 30; i = i+1) begin : shift2b
            mux2to1 Ms1B(.src0(s2[i]), .src1(s2[i+2]), .sel(shamt[1]), .z(s1[i]));
        end
    endgenerate

// 1-bit right shift
    mux2to1 Ms0A(.src0(s1[31]), .src1(msb), .sel(shamt[0]), .z(s0[31]));
    generate
        for (i = 0; i < 31; i = i+1) begin : shift1b
            mux2to1 Ms0B(.src0(s1[i]), .src1(s1[i+1]), .sel(shamt[0]), .z(s0[i]));
            
        end
    endgenerate

// undo data reversal - 0: right shift, 1: left shift
    generate
        for (i = 0; i < 32; i = i+1) begin : reverse1
            mux2to1 MR1(.src0(s0[i]), .src1(s0[31-i]), .sel(ctrl[1]), .z(res[i]));
        end
    endgenerate
    
    assign cout = 0;

endmodule // shifter

/////////////////////////////////////////////////

module rshift(a, shamt, ctrl, res, cout);

// Interface
    input [31:0] a, shamt;
    input ctrl;
    output [31:0] res;
    output cout;
    
    wire msb;
    wire [31:0] shift_4, shift_3, shift_2, shift_1;
    
    mux2to1 MSB(.src0(1'b0), .src1(a[31]), .sel(ctrl), .z(msb));
    mux2to1_32 MR4(.src0(), .src1(), .sel(), .z());

endmodule