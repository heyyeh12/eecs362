
// NOT GATE



module not_gate (a, z)

// Ports

input a;
output z;

// Implementation

always @(a)
    begin
        assign z = ~a;
    end
endmodule
