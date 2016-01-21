/* 2 to 1 mux for N_BITS sources */
module mux2to1 (src0, src1, sel, z);
    
    parameter N_BITS = 32;
    input [N_BITS-1:0] src0, src1;
    input sel;
    output [N_BITS-1:0] z;
    assign z = (sel) ? src1 : src0;
endmodule

/* 4 to 1 mux for N_BITS sources */
module mux4to1 (src0, src1, src2, src3, sel, z);
    
    parameter N_BITS = 32;
    input [N_BITS-1:0] src0, src1, src2, src3;
    input [1:0] sel;
    output [N_BITS-1:0] z;

    wire [N_BITS-1:0] z, z1, z2;

    mux2to1 #(N_BITS) M1(src0, src1, sel[0], z1);
    mux2to1 #(N_BITS) M2(src2, src3, sel[0], z2);
    mux2to1 #(N_BITS) M3(z1, z2, sel[1], z);

endmodule

/* 16 to 1 mux for N_BITS sources */
module mux16to1 (src0, src1, src2, src3,
                 src4, src5, src6, src7,
                 src8, src9, src10, src11,
                 src12, src13, src14, src15,
                 sel, z);
    
    parameter N_BITS = 32;
    input [N_BITS-1:0] src0, src1, src2, src3,
                       src4, src5, src6, src7,
                       src8, src9, src10, src11,
                       src12, src13, src14, src15;
    input [1:0] sel;
    output [N_BITS-1:0] z;

    wire [N_BITS-1:0] z, z1, z2, z3, z4;

    mux4to1 #(N_BITS) M1 (src0, src1, src2, src3, sel[1:0], z1);
    mux4to1 #(N_BITS) M2 (src4, src5, src6, src7, sel[1:0], z2);
    mux4to1 #(N_BITS) M3 (src8, src9, src10, src11, sel[1:0], z3);
    mux4to1 #(N_BITS) M4 (src12, src13, src14, src15, sel[1:0], z4);
    mux4to1 #(N_BITS) M5 (z1, z2, z3, z4, sel[3:2], z);

endmodule

/* 32 to 1 mux for N_BITS sources */
module mux32to1 (src0, src1, src2, src3,
                 src4, src5, src6, src7,
                 src8, src9, src10, src11,
                 src12, src13, src14, src15,
                 sel, z);
    
    parameter N_BITS = 32;
    input [N_BITS-1:0] src0, src1, src2, src3,
                       src4, src5, src6, src7,
                       src8, src9, src10, src11,
                       src12, src13, src14, src15;
    input [1:0] sel;
    output [N_BITS-1:0] z;

    wire [N_BITS-1:0] z, z1, z2, z3, z4;

    mux4to1 #(N_BITS) M1 (src0, src1, src2, src3, sel[1:0], z1);
    mux4to1 #(N_BITS) M2 (src4, src5, src6, src7, sel[1:0], z2);
    mux4to1 #(N_BITS) M3 (src8, src9, src10, src11, sel[1:0], z3);
    mux4to1 #(N_BITS) M4 (src12, src13, src14, src15, sel[1:0], z4);
    mux4to1 #(N_BITS) M5 (z1, z2, z3, z4, sel[3:2], z);

endmodule
