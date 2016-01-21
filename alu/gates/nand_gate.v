// NAND GATE


// Assuming we can use operators and not having to build from AND and NOT gates

module nand_gate (a, b, z);

// Ports

input a, b;
output z;

// Implementation

assign z = ~(a & b);

endmodule
