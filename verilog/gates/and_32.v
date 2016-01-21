// 32-bit AND GATE
// //////////////////////
//
// Uses generate statement and and_gate 
//
// Question: is this how you use a module in a module?
// /////////////////////
`include "and_gate.v"
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
