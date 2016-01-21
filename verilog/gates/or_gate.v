/*
OR GATE
*/

module or_gate (a, b, z);

// Ports

input a, b;
output z;

// Implementation

assign z = a | b;

endmodule
