//
//
//
// control
//
// TODO: floating point and mul/mulu aluCtrl
//

module control (instruction, aluCtrl, aluSrc, setInv, regDst, memRd, memWr, regWr, branch, jr, jump, link, dSize, signExt, zeroExt, fp, not_trap);

    // Interface
    input [31:0] instruction;
    output regDst, memRd, memWr, regWr, branch, jr, jump, link, setInv, aluSrc, signExt, zeroExt,fp;
    output [3:0] aluCtrl;
    output [1:0] dSize;
    output not_trap;


    // Internal Signals
    reg [5:0] opcode;
    reg [5:0] func;
    reg regDst, memRd, memWr, regWr, branch, jr, jump, link, setInv, aluSrc, signExt, zeroExt, fp;
    reg [3:0] aluCtrl;
    reg [1:0] dSize;
    reg not_trap;
    

    always @ (instruction) begin
    
    // initialize outputs
    aluCtrl = 4'b0000;
    setInv = 0;
    aluSrc = 1;
    regDst = 0;
    memRd = 0;
    memWr = 0;
    regWr = 1;
    branch = 0;
    jr = 0;
    jump = 0;
    link = 0;
    dSize = 2'b00;
    signExt = instruction[0]; // == 1 when unsigned
    zeroExt = 0;
    fp = 0;
    
    opcode = instruction [31:26];
    func = instruction [5:0];
    not_trap = 1;
    
        
   //// for alu operations, sets signals aluCtrl, setInv, and aluSrc ////
        casex(opcode)
            6'b010001 : begin //TRAP
                not_trap = 0;
                aluCtrl = 4'b0100;
                jump = 1;
                signExt = 0;
            end
            6'b000000 : begin // R - Type Insructions
                regDst = 1;
                aluSrc = 0;
                casex(func) 
                    6'b000???: begin // shift 
                        regDst = 0;
                        aluCtrl[3:2] = 2'b00;
                        aluCtrl[1] = ~func[1];
                        aluCtrl[0] = func[0];
                    end
                    6'b1000?? : begin //add, addu, sub, subu
                        aluCtrl[3:1] = 3'b010;
                        aluCtrl[0] = func[1];
                    end
                    6'b1001?? : begin // bitwise
                        aluCtrl[3:2] = 2'b10;
                        aluCtrl[1] = func[1];
                        aluCtrl[0] = func[0];
                    end
                    6'b101??? : begin // set 
                        aluCtrl[3:2] = 2'b11;
                        casex(func[2:0])
                            3'b00? : begin // seq, sne
                                aluCtrl[1:0] = 2'b00; 
                                setInv = func[0];
                            end
                            3'b011 : aluCtrl[1:0] = 4'b01; // sgt       
                            3'b100 : begin // sle
                                aluCtrl[1:0] = 4'b01;
                                setInv = 1;
                            end
                            3'b101 : aluCtrl[1:0] = 4'b10; // sge   
                            3'b010 : begin // slt
                                aluCtrl[1:0] = 4'b10;
                                setInv = 1;
                            end
                        endcase
                    end
                    6'b010101 : regWr = 0; // nop
                    6'b11???? : begin // fp instructions
                        regWr = ~func[0];           // only write to regfile for movfp2i - write busFP
                        fp = 1;                     // write to fp = ~regWr && fp for movi2pf (write aluRes (busA))
                        regDst = 1;
                        aluSrc = 0;
                    end
                endcase // func
          //  $display("--opcode=%b aluCtrl=%b aluSrc=%b setInv=%b regDst=%b--", opcode, aluCtrl, aluSrc, setInv, regDst);
            end // end R - Type 
            
            6'b0?001? : begin // J - Type Instructions + I - type jump instructions
                aluCtrl = 4'b0100;
                regWr = opcode[0];
                jump = 1;
                jr = opcode[4];
                link = opcode[0];
                aluSrc = 0;
             //   $display("--Jump Instruction: jump=%b jr=%b link=%b--", jump, jr, link);
            end
            
            // I - Type Instructions
            6'b10???? : begin // load, store - does not include lhi
                aluCtrl = 4'b0100;
                regWr = ~opcode[3];
                memWr = opcode[3];
                regDst = 0;
                memRd = regWr;
                dSize = opcode[1:0];
                signExt = 0;
                case(opcode[3:0])
                    // 4'b0101 : signExt = 0;
                    // 4'b0100 : signExt = 0;
                    4'b0011 : dSize = 2'b11;
                    4'b1100 : dSize = 2'b11;
                endcase
             //   $display("--Load/Store: regWr=%b memWr=%b regDst=%b memRd=%b dSize=%b --", regWr, memWr, regDst, memRd, dSize);
            end
            6'b0010?? : begin // addi, subi
                aluCtrl[3:1] = 3'b010;
                signExt = opcode[0];
                aluCtrl[0] = opcode[1];
            end
            6'b001111 : begin // lhi 
                 regDst = 0;
                 aluCtrl = 4'b0100;
                 zeroExt = 1;
            end
            6'b0011?? : begin // bitwisei and lhi
                aluCtrl[3:2] = 2'b10;           //
                aluCtrl[1:0] = opcode[1:0];     //
            end
            6'b0101? : begin // shifti
                aluCtrl[3:2] = 2'b00;
                aluCtrl[0] = opcode[0];
                aluCtrl[1] = ~opcode[1];
            end
            6'b011??? : begin //seti
                aluCtrl[3:2] = 2'b11;
                 casex(opcode[2:0])
                    3'b00? : begin // seqi, snei
                        aluCtrl[1:0] = 4'b00; 
                        setInv = opcode[0];
                    end
                    3'b101 : aluCtrl[1:0] = 4'b10; // sgei
                    3'b010 : begin // slti
                        aluCtrl[1:0] = 4'b10;
                        setInv = 1;
                    end
                    3'b011 : aluCtrl[1:0] = 4'b01; // sgti    
                    3'b100 : begin // slei
                        aluCtrl = 4'b00;
                        setInv = 1;
                    end
                endcase
            end
            6'b000001 : begin // mult, multu
                aluCtrl = 4'b1111;
                aluSrc = 0;
                regDst = 1;
            end
            6'b00010? : begin // beq, bnez
                aluCtrl = 4'b0100;
                regWr = 0;
                branch = 1;
            end
            // 6'b001111 : begin // lhi 
            //     regDst = 0;
            //     aluCtrl = 4'b0100;
            //     zeroExt = 1;
            // end
        endcase
        // $display("--Jump Instruction: jump=%b jr=%b link=%b--", jump, jr, link);
        // $display("--Branch Instruction: branch=%b--", branch);
end
endmodule