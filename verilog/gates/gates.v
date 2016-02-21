`ifndef _gates_v_
`define _gates_v_

////////////////////////////////

module and_gate (a, b, z);

// Ports
    input a, b;
    output z;

// Implementation
    assign z = a & b;

endmodule

////////////////////////////////

module and_32 (a, b, z);

// Ports

    input [31:0] a, b;
    output [31:0] z;

// Implementation

    genvar i;
    generate
        for(i=0; i<32; i=i+1)
	begin : anding
            and_gate AND(a[i], b[i], z[i]);
        end
    endgenerate
endmodule

////////////////////////////////

module or_gate (a, b, z);

// Ports

input a, b;
output z;

// Implementation

assign z = a | b;

endmodule

/////////////////////////////

module or32to1 (a, z);
    
    input [31:0] a;
    output z;
    
    wire [15:0] nor16;
    wire [7:0] nor8;
    wire [3:0] nor4;
    wire [1:0] nor2;
    wire or_res;
    
    // 32 to 16
    genvar i;
    generate
        for (i = 0; i < 16; i = i+1) begin : LOOP16
            or_gate NOR16(a[i], a[31-i], nor16[i]);
        end
    endgenerate

    // 16 to 8
    generate
        for (i = 0; i < 8; i = i+1) begin : LOOP8
            or_gate NOR8(nor16[i], nor16[15-i], nor8[i]);
        end
    endgenerate
    
    // 8 to 4
    generate
        for (i = 0; i < 4; i = i+1) begin : LOOP4
            or_gate NOR4(nor8[i], nor8[7-i], nor4[i]);
        end
    endgenerate
    
    // 4 to 2
    generate
        for (i = 0; i < 2; i = i+1) begin : LOOP2
            or_gate NOR2(nor4[i], nor4[3-i], nor2[i]);
        end
    endgenerate
    
    // 2 to 1
    or_gate NOR1(nor2[0], nor2[1], z);

endmodule

////////////////////////////////

module or_32 (a, b, z);

// Ports

    input [31:0] a, b;
    output [31:0] z;

// Implementation
    genvar i;
    generate
        for(i=0; i<32; i=i+1)
	begin : oring
            or_gate OR(a[i], b[i], z[i]);
        end
    endgenerate
endmodule

////////////////////////////////

module xor_gate (a, b, z);

// Ports

input a, b;
output z;

// Implementation
assign z = a ^ b;

endmodule

////////////////////////////////

module xor_32 (a, b, z);

// Ports

    input [31:0] a, b;
    output [31:0] z;

// Implementation

    genvar i;
    generate
        for(i=0; i<32; i=i+1)
	begin : xoring
            xor_gate XOR (a[i], b[i], z[i]);
        end
    endgenerate
endmodule


////////////////////////////////

module not_gate (a, z);

// Ports

input a;
output z;

// Implementation

assign z = ~a;

endmodule

/////////////////////////////

module not_32 (a, z);

// Ports

input [31:0] a;
output [31:0] z;

// Implementation
genvar i;
    generate
        for(i=0; i<32; i=i+1)
	begin : knotting
            not_gate NOT1(a[i], z[i]);
        end
    endgenerate

endmodule

/////////////////////////////

module nand_gate (a, b, z);

// Ports

input a, b;
output z;

// Implementation

assign z = !(a && b);

endmodule

//////////////////////////////

module nor_gate (a, b, z);

// Ports

input a, b;
output z;

// Implementation

assign z = ~(a || b);

endmodule

/////////////////////////////

module nor32to1 (a, z);
    
    input [31:0] a;
    output z;
    
    wire [15:0] nor16;
    wire [7:0] nor8;
    wire [3:0] nor4;
    wire [1:0] nor2;
    wire or_res;
    
    // 32 to 16
    genvar i;
    generate
        for (i = 0; i < 16; i = i+1) begin : LOOP16
            or_gate NOR16(a[i], a[31-i], nor16[i]);
        end
    endgenerate

    // 16 to 8
    generate
        for (i = 0; i < 8; i = i+1) begin : LOOP8
            or_gate NOR8(nor16[i], nor16[15-i], nor8[i]);
        end
    endgenerate
    
    // 8 to 4
    generate
        for (i = 0; i < 4; i = i+1) begin : LOOP4
            or_gate NOR4(nor8[i], nor8[7-i], nor4[i]);
        end
    endgenerate
    
    // 4 to 2
    generate
        for (i = 0; i < 2; i = i+1) begin : LOOP2
            or_gate NOR2(nor4[i], nor4[3-i], nor2[i]);
        end
    endgenerate
    
    // 2 to 1
    or_gate NOR1(nor2[0], nor2[1], or_res);
    
    not_gate NOT1(or_res, z);

endmodule

/////////////////////////////

module mux2to1 (src0, src1, sel, z);
    
    // Interface
    parameter N_BITS = 32;
    input [N_BITS-1:0] src0, src1;
    input sel;
    output [N_BITS-1:0] z;

    assign z = (sel) ? src1 : src0;

endmodule

/////////////////////////////

// /* 4 to 1 mux for N_BITS sources */
module mux4to1 (src0, src1, src2, src3, sel, z);
    
    // Interface
    parameter N_BITS = 32;
    input [N_BITS-1:0] src0, src1, src2, src3;
    input [1:0] sel;
    output [N_BITS-1:0] z;

    // Signals
    wire [N_BITS-1:0] z, z1, z2;

    // Implementation
    mux2to1 #(N_BITS) M1(src0, src1, sel[0], z1);
    mux2to1 #(N_BITS) M2(src2, src3, sel[0], z2);
    mux2to1 #(N_BITS) M3(z1, z2, sel[1], z);

endmodule

/////////////////////////////

// /* 8 to 1 mux for N_BITS sources */
module mux8to1 (src0, src1, src2, src3, src4, src5, src6, src7, sel, z);
    
    // Interface
    parameter N_BITS = 32;
    input [N_BITS-1:0] src0, src1, src2, src3, src4, src5, src6, src7;
    input [2:0] sel;
    output [N_BITS-1:0] z;

    // Signals
    wire [N_BITS-1:0] z, z1, z2;

    // Implementation
    mux4to1 #(N_BITS) M1(src0, src1, src2, src3, sel[1:0], z1);
    mux4to1 #(N_BITS) M2(src4, src5, src6, src7, sel[1:0], z2);
    mux2to1 #(N_BITS) M3(z1, z2, sel[2], z);

endmodule

/////////////////////////////

// /* 16 to 1 mux for N_BITS sources */
module mux16to1 (src0, src1, src2, src3,
                 src4, src5, src6, src7,
                 src8, src9, src10, src11,
                 src12, src13, src14, src15,
                 sel, z);
    
    // Interface
    parameter N_BITS = 32;
    input [N_BITS-1:0] src0, src1, src2, src3,
                       src4, src5, src6, src7,
                       src8, src9, src10, src11,
                       src12, src13, src14, src15;
    input [3:0] sel;
    output [N_BITS-1:0] z;

    // Signals
    wire [N_BITS-1:0] z, z1, z2, z3, z4;

    // Implementation
    mux4to1 #(N_BITS) M1 (src0, src1, src2, src3, sel[1:0], z1);
    mux4to1 #(N_BITS) M2 (src4, src5, src6, src7, sel[1:0], z2);
    mux4to1 #(N_BITS) M3 (src8, src9, src10, src11, sel[1:0], z3);
    mux4to1 #(N_BITS) M4 (src12, src13, src14, src15, sel[1:0], z4);
    mux4to1 #(N_BITS) M5 (z1, z2, z3, z4, sel[3:2], z);

endmodule

/////////////////////////////

// /* 32 to 1 mux for N_BITS sources */
module mux32to1 (src0, src1, src2, src3, src4, src5, src6, src7,
                 src8, src9, src10, src11, src12, src13, src14, src15,
                 src16, src17, src18, src19, src20, src21, src22, src23,
                 src24, src25, src26, src27, src28, src29, src30, src31,
                 sel, z);
    
    // Interface
    parameter N_BITS = 32;
    input [N_BITS-1:0] src0, src1, src2, src3, src4, src5, src6, src7,
                 src8, src9, src10, src11, src12, src13, src14, src15,
                 src16, src17, src18, src19, src20, src21, src22, src23,
                 src24, src25, src26, src27, src28, src29, src30, src31;
    input [4:0] sel;
    output [N_BITS-1:0] z;

    // Signals
    wire [N_BITS-1:0] z, z1, z2;

    // Implementation
    mux16to1 #(N_BITS) M1 (
        src0, src1, src2, src3, src4, src5, src6, src7,
        src8, src9, src10, src11, src12, src13, src14, src15,
        sel[3:0], z1
        );
    mux16to1 #(N_BITS) M2 (
        src16, src17, src18, src19, src20, src21, src22, src23,
        src24, src25, src26, src27, src28, src29, src30, src31,
        sel[3:0], z2);
    mux2to1 #(N_BITS) M3 (z1, z2, sel[4], z);

endmodule

/////////////////////////////

`endif