module testbench;
    reg [31:0] instruction;
    wire [0:3] aluCtrl;
    wire [0:1] dSize;
    wire regDst, memRd, memWr, regWr, branch, jr, jump, link, setInv, aluSrc, signExt;

    control CONT1 (.instruction(instruction), 
                   .regDst(regDst), 
                   .memRd(memRd), 
                   .memWr(memWr), 
                   .regWr(regWr),
                   .branch(branch),
                   .jr(jr),
                   .jump(jump),
                   .link(link),
                   .setInv(setInv),
                   .aluSrc(aluSrc),
                   .aluCtrl(aluCtrl),
                   .dSize(dSize),
                   .signExt(signExt));
    
    initial begin // testing alu ops

        $monitoro("@%0dns instruction=%h", $time, instruction);
        //$display("--ALU CONTROL TEST: ADD/SUB/AND/SHIFT/SEQ/SNE--");
        #0 instruction = 32'h00000020; // -> 0100
        #10 instruction = 32'h00000022; // -> 0101
        #10 instruction = 32'h00000024; //  -> 1000 10 0100
        #10 instruction = 32'h00000004; //  -> 0010
        #10 instruction = 32'h00000028; //  -> 1100
        #10 instruction = 32'h00000029; //  -> 1100
        
    
// testing imm instructions
//        $display("--IMM CONTROL TEST: ADDUI/SUBI/ORI/SLTI/SGTI--");
        //   #10 instruction = 32'h00000009; // --> 0100
        //   #10 instruction = 32'h0000000a; // --> 0101
        //   #10 instruction = 32'h0000000d; // --> 1001   
        //   #10 instruction = 32'h0000001a; // --> 1110
        //   #10 instruction = 32'h0000001b; // --> 1101

// testing branch
    //    $display("--BRANCH CONTROL TEST: BEQZ/BNEZ--");
        // #10 instruction = 32'h00000004;
        // #10 instruction = 32'h00000005;

// testing jump
     //   $display("--JUMP CONTROL TEST: J/JR/JAL/JALR--");
        // #10 instruction = 32'h00000002;
        // #10 instruction = 32'h00000012;
        // #10 instruction = 32'h00000003;
        // #10 instruction = 32'h00000013;
        
        
  // testing load/store
       // $display("--LOAD/STORE CONTROL TEST: LB/LH/LHI/SB/SH--");
        // #10 instruction = 32'h00000020;
        // #10 instruction = 32'h00000021;
        // #10 instruction = 32'h0000000f;
        // #10 instruction = 32'h00000028;
        // #10 instruction = 32'h00000029;
    end 
    
    
    
endmodule