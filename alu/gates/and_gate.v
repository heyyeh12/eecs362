/*
AND GATE
*/

// Question: is this right?

module and_gate (a, b, z);

// Ports
    input a, b;
    output z;

// Implementation
    assign z = a & b;

endmodule
