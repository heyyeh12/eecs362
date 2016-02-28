module id(
    instruction,
    aluCtrl, aluSrc, setInv,
    regDst, memRd, memWr, regWr,
    branch, jr, jump, link,
    dSize, imm32,
    rs1, rs2, rd, op0
);

    // Interface
    input [31:0] instruction;       //instruction from pipeline (IMEM in toplevel)
    
    output [31:0] imm32;            // sign extended immediate
    output [3:0] aluCtrl;           // outputs from control unit
    output [1:0] dSize;
    output aluSrc, setInv,          
            regDst, memRd, memWr, regWr,
            branch, jr, jump, link, op0;
    output [4:0] rs1, rs2, rd;      // set by instruction, link, and regDst
    
    
    // Internal Signals
    wire [4:0] rs2;
    wire link, regDst, signExt, zeroExt, jump;
    wire [31:0] signExt32;
    wire [31:0] zeroExt32;
    


// Control Unit

    control control(
        .instruction(instruction),
        .aluCtrl(aluCtrl),
        .aluSrc(aluSrc),
        .setInv(setInv),
        .regDst(regDst),
        .memRd(memRd),
        .memWr(memWr),
        .regWr(regWr),
        .branch(branch),
        .jr(jr),
        .jump(jump),
        .link(link),
        .dSize(dSize),
        .signExt(signExt),
        .zeroExt(zeroExt)
        );


    // If jal/jalr, set rs2 to reg31
    mux2to1 #(5) muxReg31 (.src0(instruction[20:16]), .src1(5'b11111), .sel(link), .z(rs2);
    
    // Either rs2 or instruction[15:11] will be the destination register
    mux2to1 #(5) mux2to1(.src0(rs2), .src1(instruction[15:11]), .sel(regDst), .z(rd));
    
    // assign rs1
    assign rs1 = instruction[25:21];
    
    // Sign-extension
    sign_extender sign_extender(.imm(instruction[25:0]), .signExt(signExt), .res(signExt32), .jump(jump));
    zeroExt32 = {instruction[15:0], 16'b0};
    mux2to1 #(32) muxImmExt(.src0(signExt32), .src1(zeroExt32), .sel(zeroExt));
    
    // assign op0 for branch stuff in MEM
    assign op0 = instruction[26];


endmodule // id