/*
FLAG SETTER
===========
- alu_res      result from ALU [31:0]
- ctrl         alu_ctrl[4:2]
               000 => cout_sft
               001 => cout_add
               111 => cout_mul
- cout_add     cout from adder [1bit]
- cout_shft    cout from shifter [1bit]
- cout_mul     cout from multiplier [1bit]
- zf           zero flag [1bit]
- of           overflow flag [1bit]
- cf           carry flag [1bit]

QUESTIONS:
- Do we need a negative flag?
- Are the multiply flags included?

TODO:
- untested! need to make testbench
 */

module flag_setter (alu_res, cout_add, cout_shft, cout_mul, zf, of, cf);

// Ports
input [31:0] alu_res;
input [2:0] ctrl;
input cout_add;
input cout_shft;
input cout_mul;
output zf, of, cf;

// Internal vars
reg zf, of, cf;

// Zflag logic
always @ (alu_res)
begin
    zf <= ~(|alu_res);
end

// Overflow logic
always @ (alu_res, cf)
begin
    of <= cf^alu_res[31];
end

// Cflag selector
always @ (ctrl)
begin:cf_sel
   case (ctrl)
      3'b000 : cf <= cout_shft;
      3'b001 : cf <= cout_add;
      3'b111 : cf <= cout_mul;
    endcase
end // cf_sel

endmodule // flag_setter