// Include
// `include "../gates/gates.v"


    // Sign Extender
    // =============
    
    // INPUTS:
    //     imm = [15:0] immediate value
    //     signExt = 0 for signed extension
        
    // OUTPUTS: 
    //     res = [31:0] result


module sign_extender (imm, signExt, res, jump);

    input [25:0] imm;
    input signExt, jump;
    
    output [31:0] res;
    
    wire [31:0] unsignedOut, unsignedOutJump, unsignedOutNonJump;
    wire [31:0] signedOut, signedOutJump, signedOutNonJump;
    
    // Extend 0's to immediate values
    assign unsignedOutNonJump = {{16{1'b0}}, imm[15:0]};
    assign unsignedOutJump = {{26{1'b0}}, imm};
    mux2to1 #(32) setUnsigned (.src0(unsignedOutNonJump), .src1(unsignedOutJump), .sel(jump), .z(unsignedOut));
    
    // Extend 1's to immediate value
    assign signedOutNonJump = {{16{1'b1}}, imm[15:0]};
    assign signedOutJump = {{26{1'b1}}, imm};
    mux2to1 #(32) setSigned (.src0(signedOutNonJump), .src1(signedOutJump), .sel(jump), .z(signedOut));
    
    // signExt = 0 means signed extension, so get inverse for and_gate
    not_gate invSignExt(.a(signExt), .z(invSign));
    // Check to see whether we have a negative number and we want a signed output
    and_gate getSign(.a(invSign), .b(imm[15]), .z(isSigned));
    
    // Pass the unsigned or the signed output according to the value of "isSigned"
    mux2to1 #(32) setRes(.src0(unsignedOut), .src1(signedOut), .sel(isSigned), .z(res));
    
endmodule // sign_extender
