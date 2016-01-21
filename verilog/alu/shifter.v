// Include
`include "../gates/mux_n.v"

/**
 * TODO: Debug and make it work...lol
 */

/**
 * SHIFTER
 * =======
 *  - a     data input [31:0]
 *  - shamt shift amount [31:0]
 *  - ctrl  shift type selector [1:0], where
 *          10 => shift left logical
 *          00 => shift right logical
 *          01 => shift right arithmetic
 *  - res   shifter result [31:0]
 *  - cout  carry flag [1 bit]
 */
module shifter (a, shamt, ctrl, res, cout);


// Interface
    input [31:0] a, shamt;
    input [1:0] ctrl;
    output [31:0] res;
    output cout;

// Signals
    wire [31:0] rev0, s16, s8, s4, s2, s1;
    wire msb;
    genvar i;

// select - 0: logical, 1: arithemtic
    mux2to1 #(1) MUX_LA(.src0(a[31]), .src1(0), .sel(ctrl[0]), .z(msb));

// data reversal - 0: right shift, 1: left shift
    generate
        for (i = 0; i < 32; i = i+1) begin : reverse0
            mux2to1 #(1) MR0(.src0(a[i]), .src1(a[31-i]), .sel(ctrl[1]), .z(rev0[i]));
        end
    endgenerate

// 16-bit right shift
    generate
        for (i = 16; i < 31; i = i+1) begin : shift16a
            mux2to1 #(1) MS16A(.src0(rev0[i]), .src1(msb), .sel(shamt[4]), .z(s16[i]));
        end
    endgenerate
    generate
        for (i = 0; i < 16; i = i+1) begin : shift16b
            mux2to1 #(1) MS16B(.src0(rev0[i]), .src1(rev0[i+2]), .sel(shamt[4]), .z(s16[i]));
        end
    endgenerate

// 8-bit right shift    
    generate
        for (i = 24; i < 31; i = i+1) begin : shift8a
            mux2to1 #(1) MS8A(.src0(s16[i]), .src1(msb), .sel(shamt[3]), .z(s8[i]));
        end
    endgenerate
    generate
        for (i = 0; i < 24; i = i+1) begin : shift8b
            mux2to1 #(1) MS8B(.src0(s16[i]), .src1(s16[i+2]), .sel(shamt[3]), .z(s8[i]));
        end
    endgenerate

// 4-bit right shift
    generate
        for (i = 28; i < 31; i = i+1) begin : shift4a
            mux2to1 #(1) MS4A(.src0(s8[i]), .src1(msb), .sel(shamt[2]), .z(s4[i]));
        end
    endgenerate
    generate
        for (i = 0; i < 28; i = i+1) begin : shift4b
            mux2to1 #(1) MS4B(.src0(s8[i]), .src1(s8[i+2]), .sel(shamt[2]), .z(s4[i]));
        end
    endgenerate

// 2-bit right shift
    generate
        for (i = 30; i < 31; i = i+1) begin : shift2a
            mux2to1 #(1) MS2A(.src0(s4[i]), .src1(msb), .sel(shamt[1]), .z(s2[i]));
        end
    endgenerate
    generate
        for (i = 0; i < 30; i = i+1) begin : shift2b
            mux2to1 #(1) MS2B(.src0(s4[i]), .src1(s4[i+2]), .sel(shamt[1]), .z(s2[i]));
        end
    endgenerate

// 1-bit right shift
    mux2to1 #(1) MS1A(.src0(s2[31]), .src1(msb), .sel(shamt[0]), .z(s1[31]));
    generate
        for (i = 0; i < 31; i = i+1) begin : shift1b
            mux2to1 #(1) MS1B(.src0(s2[i]), .src1(s2[i+1]), .sel(shamt[0]), .z(s1[i]));
        end
    endgenerate

// undo data reversal - 0: right shift, 1: left shift
    generate
        for (i = 0; i < 32; i = i+1) begin : reverse1
            mux2to1 #(1) MR1(.src0(s1[i]), .src1(s1[31-i]), .sel(ctrl[1]), .z(res[i]));
        end
    endgenerate

endmodule // shifter