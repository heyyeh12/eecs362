/*
AND GATE
*/

// Question: is this right?

module and_gate (a, b, z)

// Ports

input a, b;
output z;

// Implementation

always @( a or b)
    begin
        assign z = a & b;
    end
endmodule
