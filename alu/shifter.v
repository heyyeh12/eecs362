/*
SHIFTER
=======
- a      data input [31:0] 
- shamt  shift amount [4:0]
- ctrl   shift type selector [2:0]
         00 => shift left logical
         01 => shift right logical
         10 => shift right arithmetic
- res    shifter result [31:0]
- cout   carry flag [1bit]

QUESTIONS:
- What's the difference between wire & reg assignments?

TODO:
- untested! need to make testbench
*/

module shifter (a, shamt, ctrl, res, cout);

// Ports
input [31:0] a;
input [4:0] shamt;
input [1:0] ctrl;
output [31:0] res;
output cout;

// Internal vars
reg [31:0] res;
wire cout;
wire [31:0] res_sll, res_srl, res_sra;
integer shamt_int;

// Shift amount integer
always @ (shamt)
begin:shift_int
    shamt_int <= {1'b0,shamt};
end

// Shift left logical
assign res_sll = a << shamt_int;

// Shift right logical
assign res_srl = a >> shamt_int;

// Shift right arithmetic
assign res_sra = a >>> shamt_int;

// Shift selector
always @ (ctrl)
begin:shift
    case (ctrl)
        0 : res <= res_sll;
        1 : res <= res_srl;
        2 : res <= res_sra;
    endcase
end // shift

endmodule // shifter