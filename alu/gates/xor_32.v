// 32-bit XOR GATE

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
