/*
XOR GATE
*/


module or_gate (a, b, z)

// Ports

input a, b;
output z;

// Implementation
    begin
        assign z = a ^ b;
    end
endmodule
