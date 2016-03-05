module mem(
    isZero, op0, branch, 
    jump, jr, 
    incPC, imm32, busB,
    reg31Val, nextPC);
    
   // input [31:0] aluRes;                // from EX
    input [31:0] busB;                  // from ID
    
    // inputs for choosing nextPC
    input isZero;                       // input from EX, is busA 0
    input op0;                          // lsb of opcode from IF
    input branch, jump, jr;             // from ID
    input [31:0] incPC;                 // from IF
    input [31:0] imm32;                 // from ID, used for choosing nextPC
 
 
    //output [31:0] memWrData;
    //output [31:0] memAddr;
    output [31:0] reg31Val;             // output for link jumps, send to WB
    output [31:0] nextPC;               // send to IF

    
    //Internal signals for choosing nextPC
    wire brTrue, takeBr, takeLeap;
    wire [31:0] leapPC, nextPC;
    
    
   // assign memAddr = aluRes;
   // assign memWrData = busB;
    
    
/////////////////////////// choosing nextPC ///////////////////////////////////  
    
    // Take Branch? 
    xor_gate zfXOR (.a(isZero), .b(op0), .z(brTrue));        // brTrue = 1, when isZero xor op0
    and_gate brAND (.a(brTrue), .b(branch), .z(takeBr));    // only branch when branch = 1 and brTrue = 1
    
    // increment PC + 4 by immediate
    adder addImm (.a(incPC), .b(imm32), .ctrl(4'b0000), .res(leapPC));                         // nextPC + imm32 for target address if taking leap
    
    or_gate jmpOR (.a(jump), .b(takeBr), .z(takeLeap));                                    // check if jumping or taking branch
    
    // take nextPC or leap
    mux2to1 #(32) jmpOrBrMux (.src0(incPC), .src1(leapPC), .sel(takeLeap), .z(nextPC));     // taking leap or nextPC as target address
    
    // take register jump
    mux2to1 #(32) jrRegValMux (.src0(nextPC), .src1(busB), .sel(jr), .z(nextPC));            // taking register jump for target address?
  
/////////////////////////////////////////////////////////////////////////////////////////////// 


    // increment PC by 4 again for reg31Val
    adder add8 (.a(32'b0100), .b(incPC), .ctrl(4'b0000), .res(reg31Val));       // PC + 8 stored in reg31 is register jump
    
    
endmodule // mem