
// 32-bit OR GATE
// ////////////////
// Uses generate statement and or_gate to create 32-bit OR gate
// 
// Questions: are always statements allowed/useful/necessary?
// ///////////////

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
