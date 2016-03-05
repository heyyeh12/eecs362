`include "constants.vh"
module pipeline(
    clk, rst, initPC,
    instruction, iAddr,
    memAddr, memRdData, memWrData, dSize, memWr,
    busA, busB, busFP, rs1, rs2, rd, regWrData, regWr, fp
);
    
    // Cycle Control
    input clk, rst;
    input [31:0] initPC;            // initial instruction address
    
    // IMEM Interface
    input [31:0] instruction;       // instruction at current PC
    output [31:0] iAddr;            // address to fetch instruction
    
    // DMEM Interface
    input [31:0] memRdData;         // data read from data memory
    output [31:0] memAddr;          // address to write in data memory
    output [31:0] memWrData;        // data to write to data memory
    output [1:0] dSize;             // size of memory to write
    output memWr;                   // enable write to data memory
    
    // Regfile Interface
    input [31:0] busA, busB;        // data read from regfile ports, //busA set to aluRes if FP instruction
    output [4:0] rs1, rs2, rd;      // registers to read from / write to, also being used for FP Regfile -- fpregfile only takes rs1 and rd
    output [31:0] regWrData;        // data to write to regfile
    output regWr;                   // enable write to regfile, also being used for FP Regfile
    
    // FP Regfile Interface
    input [31:0] busFP;             // data read from fpregfile port
    output fp;                      // will tell FP regfile wheter or not to write (!regWr && fp = write enabled)
    
    // TEMP: Pipeline Reg Control
    wire [1:0] ctrl = 2'b11;
    
///////////////////////////////////////////////////////////////////
    
    // Saved inputs from MEM/WB Register
    wire [31:0] prevPC_3;
   
////// IF Module
    // New outputs of module
    wire [31:0] incPC_0;
    
    ifetch ifetch(
    // Inputs
        .clk(clk), .rst(rst), .initPC(initPC), .prevPC(prevPC_3),
    // Outputs
        .curPC(iAddr), .incPC(incPC_0)
    );
    
///////////////////////////////////////////////////////////////////
    

////// IF/ID Register (in = 0, out = 1)
    // New outputs of register
    wire [31:0] incPC_1, instr_1;
    
    if_id if_id(
        .clk(clk), .rst(rst), .ctrl(ctrl),
    // Inputs
        .incPC_d(incPC_0), .instr_d(instruction),
    // Outputs
        .incPC_q(incPC_1), .instr_q(instr_1)
    );
    
////// ID Module
    // New outputs of module
    wire [3:0] aluCtrl_1;
    wire aluSrc_1, setInv_1,
        regDst_1, memRd_1, memWr_1, regWr_1, signExt_1,
        branch_1, jr_1, jump_1, link_1, op0_1, fp_1;
    wire [1:0] dSize_1;
    wire [31:0] imm32_1;
    wire [4:0] rd_1;
    
    id id(
    // Inputs
        .instruction(instruction),
    // Outputs
        .aluCtrl(aluCtrl_1), .aluSrc(aluSrc_1), .setInv(setInv_1),
        .regDst(regDst_1), .memRd(memRd_1), .memWr(dWrite_1), .regWr(regWr_1),
        .branch(branch_1), .jr(jr_1), .jump(jump_1), .link(link_1),
        .dSize(dSize_1), .imm32(imm32_1),
        .rs1(rs1), .rs2(rs2), .rd(rd_1), .op0(op0_1), .fp(fp_1)
    );

///////////////////////////////////////////////////////////////////
    
////// ID/EX Register (in = 1, out = 2)
    // New outputs of register
    wire [31:0] incPC_2, busA_2, busB_2, busFP_2;
    wire [3:0] aluCtrl_2;
    wire aluSrc_2, setInv_2,
        regDst_2, memRd_2, memWr_2, regWr_2, signExt_2,
        branch_2, jr_2, jump_2, link_2, op0_2, fp_2;
    wire [1:0] dSize_2;
    wire [31:0] imm32_2;
    wire [4:0] rd_2;
    
    id_ex id_ex(
        .clk(clk), .rst(rst), .ctrl(ctrl),
    // Inputs
        .incPC_d(incPC_1), .busA_d(busA), .busB_d(busB), .busFP_d(busFP), // update id/ex reg
        .aluCtrl_d(aluCtrl_1), .aluSrc_d(aluSrc_1), .setInv_d(setInv_1),
        .regDst_d(regDst), .memRd_d(memRd_1), .memWr_d(memWr_1), .regWr_d(regWr_1),
        .branch_d(branch_1), .jr_d(jr_1), .jump_d(jump_1), .link_d(link_1), .op0_d(op0_1), .fp_d(fp_1),// update id/ex reg
        .dSize_d(dSize_1), .imm32_d(imm32_1),
        .rd_d(rd_1),
    // Outputs
        .incPC_q(incPC_2), .busA_q(busA_2), .busB_q(busB_2), .busFP_q(busFP_2),// update id/ex reg
        .aluCtrl_q(aluCtrl_2), .aluSrc_q(aluSrc_2), .setInv_q(setInv_2),
        .regDst_q(regDst_2), .memRd_q(memRd_2), .memWr_q(memWr_2), .regWr_q(regWr_2),
        .branch_q(branch_2), .jr_q(jr_2), .jump_q(jump_2), .link_q(link_2), .op0_q(op0_2), .fp_q(fp_2),// update id/ex reg
        .dSize_q(dSize_2), .imm32_q(imm32_2),
        .rd_q(rd_2)
    );
    
////// EX Module
    // New outputs of module
    wire [31:0] aluRes_2;
    wire isZero_2;
    
    ex ex(
        .aluSrc(aluSrc_2), .aluCtrl(aluCtrl_2), .setInv(setInv_2), 
        .busA(busA_2), .busB(busB_2), .imm32(imm32_2),
        .aluRes(aluRes_2), .isZero(isZero_2)
    );

/////////////////////////////////////////////////////////////////// // where is aluRes in next register?

////// EX/MEM Register (in = 2, out = 3)
    // New outputs of register
    wire [31:0] incPC_3, busB_3, imm32_3, busFP_3, aluRes_3;
    wire regDst_3, memRd_3, memWr_3, regWr_3,
                branch_3, jr_3, jump_3, link_3, op0_3, fp_3;
    wire [1:0] dSize_3;
    wire [4:0] rd_3;
    
    ex_mem ex_mem(
        .clk(clk), .rst(rst), .ctrl(ctrl),
    //Inputs
        .incPC_d(incPC_2), .busB_d(busB_2), .imm32_d(imm32_2), .busFP_d(busFP_2), .aluRes_d(aluRes_2),
        .regDst_d(regDst_2), .memRd_d(memRd_2), .memWr_d(memWr_2), .regWr_d(regWr_2),
        .branch_d(branch_2), .jr_d(jr_2), .jump_d(jump_2), .link_d(link_2), .op0_d(op0_2),.fp_d(fp_2), 
        .dSize_d(dSize_2),
        .rd_d(rd_2),
    //Outputs
        .incPC_q(incPC_3), .busB_q(busB_3), .imm32_q(imm32_3), .busFP_q(busFP_3), .aluRes_q(aluRes_3), 
        .regDst_q(regDst_3), .memRd_q(memRd_3), .memWr_q(memWr_3), .regWr_q(regWr_3),
        .branch_q(branch_3), .jr_q(jr_3), .jump_q(jump_3), .link_q(link_3), .op0_q(op0_3), .fp_q(fp_3), 
        .dSize_q(dSize_3),
        .rd_q(rd_3)
    );
    
////// MEM Module
    // New outputs of module
    wire [31:0] reg31Val_3, nextPC_3;
    
    mem mem(
        .isZero(isZero_3), .op0(op0_3), .branch(branch_3), 
        .jump(jump_3), .jr(jr_3), 
        .incPC(incPC_3), .imm32(imm32_3), .busB(busB_3),
        .reg31Val(reg31Val_3), .nextPC(nextPC_3)
    );
    

////// MEM/WB Register (in = 3, out = 0)
    // New outputs of register
    wire [31:0] nextPC_0, aluRes_0, memRdData_0, reg31Val_0, busFP_0;
    wire regDst_0, regWr_0, link_0, fp_0;
    wire [1:0] dSize_0;
    wire [4:0] rd_0;
    
    mem_wb mem_wb(
        .clk(clk), .rst(rst), .ctrl(ctrl),
    // Inputs
        .nextPC_d(nextPC_3),
        .regDst_d(regDst_3), .memRd_d(memRd_3), .regWr_d(regWr_3), .link_d(link_3), .fp_d(fp_3),//update mem/wb reg
        .dSize_d(dSize_3), .rd_d(rd_3),
        .aluRes_d(aluRes_3), .memRdData_d(memRdData), .reg31Val_d(reg31Val_3), .busFP_d(busFP_3), //update mem/wb reg
    //Outputs
        .nextPC_q(nextPC_0),
        .regDst_q(regDst_0), .memRd_q(memRd_0), .regWr_q(regWr_0), .link_q(link_0), .fp_q(fp_0),//update mem/wb reg
        .dSize_q(dSize_0), .rd_q(rd_0),
        .aluRes_q(aluRes_0), .memRdData_q(memRdData_0), .reg31Val_q(reg31Val_0), .busFP_q(busFP_0)//update mem/wb reg
    );
    
////// WB Module
    // New outputs of module
    wb wb(
        .memRd(memRd_0),
        .link(link_0),  
        .regWr(regWr_0),
        .fp(fp_0),      
        .memRdData(memRdData_0),
        .aluRes(aluRes_0),
        .reg31Val(reg31Val_0),
        .busFP(busFP_0),
        .regWrData(regWrData)
    );
    

endmodule // pipeline