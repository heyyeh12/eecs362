/*
NOR GATE
*/

// Assuming it is okay to make NOR using operators instead of building from OR and NOT gates

module nor_gate (a, b, z);

// Ports

input a, b;
output z;

// Implementation

assign z = ~(a | b);

endmodule
