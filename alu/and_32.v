// 32-bit AND GATE
// //////////////////////
//
// Uses generate statement and and_gate 
//
// Question: is this how you use a module in a module?
// /////////////////////

module and_32 (a, b, z)

// Ports

    input [31:0] a, b;
    output [31:0] z;

// Implementation

    genvar i;
    generate
        for(i=0; i<32; i=i+1)
            and_gate bit_i (a[i], b[i], z[i]);
        end
    endgenerate
endmodule