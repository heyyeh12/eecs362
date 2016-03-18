`include "constants.vh"
module pipeline(
    clk, rst, initPC,
    instruction, iAddr, memInstr,
    memAddr, memRdData, memWrData, dSize, memWr,
    busA, busB, busFP, rs1, rs2, rd, regWrData, regWr, fp
);
    
    // Cycle Control
    input clk, rst;
    input [31:0] initPC;            // initial instruction address
    
    // IMEM Interface
    input [31:0] instruction;       // instruction at current PC
    output [31:0] iAddr;            // address to fetch instruction
    output [31:0] memInstr;         // address for checking TRAP
    
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
    
    // Multiplier FSM
    wire [1:0] multCtrl;
   // 
    
///////////////////////////////////////////////////////////////////
    
    // Saved inputs from MEM/WB Register
    //wire [31:0] prevPC_3;
   
////// IF Module
    // New outputs of module
    wire [31:0] incPC_0, nextPC_3;
    wire pc_enable, not_trap_3, takeLeap;
    
    ifetch ifetch(
    // Inputs
    //.takeLeap(takeLeap),
        .clk(clk), .rst(rst), .initPC(initPC), .nextPC(nextPC_3), .takeLeap(takeLeap), .enable(pc_enable), .not_trap(not_trap_3),
    // Outputs
        .curPC(iAddr), .incPC(incPC_0)
    );
    
///////////////////////////////////////////////////////////////////
    

////// IF/ID Register (in = 0, out = 1)
    // New outputs of register
    wire [31:0] incPC_1, instr_1;
    wire [1:0] if_id_ctrl;
    wire valid_1;
    
    if_id if_id(
        .clk(clk), .rst(rst), .ctrl(if_id_ctrl),
    // Inputs
        .incPC_d(incPC_0), .instr_d(instruction),
    // Outputs
        .incPC_q(incPC_1), .instr_q(instr_1), .valid_q(valid_1)
    );
    
////// ID Module
    // New outputs of module
    wire [3:0] aluCtrl_1;
    wire aluSrc_1, setInv_1,
        regDst_1, memRd_1, memWr_1, regWr_1, signExt_1, zeroExt_1,
        branch_1, jr_1, jump_1, link_1, op0_1, fp_1, not_trap_1;
    wire [1:0] dSize_1;
    wire [31:0] imm32_1;
    wire [4:0] rd_1;
    
    
    id id(
    // Inputs
        .instruction(instr_1),
    // Outputs
        .aluCtrl(aluCtrl_1), .aluSrc(aluSrc_1), .setInv(setInv_1),
        .regDst(regDst_1), .memRd(memRd_1), .memWr(memWr_1), .regWr(regWr_1),
        .branch(branch_1), .jr(jr_1), .jump(jump_1), .link(link_1),
        .dSize(dSize_1), .imm32(imm32_1),
        .rs1(rs1), .rs2(rs2), .rd(rd_1), .op0(op0_1), .fp(fp_1), .zeroExt(zeroExt_1), .not_trap(not_trap_1)
    );
    
    

///////////////////////////////////////////////////////////////////
// Hazard Detection / Forwarding Unit

// outputs from hazard_detect
wire [1:0] busA_sel, busB_sel, memWrData_sel;
wire [1:0] id_ex_ctrl, ex_mem_ctrl, mem_wb_ctrl;
wire [31:0] instr_2,  instr_3;
wire valid_2, memWr_2,  memRd_3, valid_3;
wire [4:0] rd_2, rd_3;
wire [3:0] aluCtrl_2;

// no wires for rs1 rs2, problem?

    hazard_detect hazard_detect(
        .clk(clk), .rst(rst),
        .id_instr(instr_1), .ex_instr(instr_2), 
        .mem_instr(instr_3), .id_rs1(rs1), .id_rs2(rs2), .ex_rd(rd_2), 
        .mem_rd(rd_3), .id_regDst(regDst_1), .ex_valid(valid_2), .mem_valid(valid_3), .ex_memWr(memWr_2), .mem_memRd(memRd_3),
        .busA_sel(busA_sel), .busB_sel(busB_sel), .memWrData_sel(memWrData_sel), 
        .if_id_ctrl(if_id_ctrl), .id_ex_ctrl(id_ex_ctrl), .ex_mem_ctrl(ex_mem_ctrl), .mem_wb_ctrl(mem_wb_ctrl),
        .pc_enable(pc_enable), .takeLeap(takeLeap), .aluCtrl1(aluCtrl_1), .aluCtrl2(aluCtrl_2), .multCtrl(multCtrl)
    );

///////////////////////////////////////////////////////////////////
     
////// ID/EX Register (in = 1, out = 2)
    // New outputs of register
    wire [31:0] incPC_2, busA_2, busB_2, busFP_2;
    wire aluSrc_2, setInv_2,
        regDst_2, memRd_2, regWr_2, signExt_2,
        branch_2, jr_2, jump_2, link_2, op0_2, fp_2, zeroExt_2, not_trap_2;
    wire [1:0] dSize_2;
    wire [31:0] imm32_2;
    wire [1:0] busA_sel_2, busB_sel_2, memWrData_sel_2;
    

    id_ex id_ex(
        .clk(clk), .rst(rst), .ctrl(id_ex_ctrl),
    // Inputs
        .incPC_d(incPC_1), .busA_d(busA), .busB_d(busB), .busFP_d(busFP), 
        .aluCtrl_d(aluCtrl_1), .aluSrc_d(aluSrc_1), .setInv_d(setInv_1),
        .regDst_d(regDst), .memRd_d(memRd_1), .memWr_d(memWr_1), .regWr_d(regWr_1),
        .branch_d(branch_1), .jr_d(jr_1), .jump_d(jump_1), .link_d(link_1), .op0_d(op0_1), .fp_d(fp_1), .zeroExt_d(zeroExt_1),
        .dSize_d(dSize_1), .imm32_d(imm32_1),
        .rd_d(rd_1), .instr_d(instr_1), .valid_d(valid_1),
        .busA_sel_d(busA_sel), .busB_sel_d(busB_sel), .memWrData_sel_d(memWrData_sel),
        .not_trap_d(not_trap_1),
        
    // Outputs
        .incPC_q(incPC_2), .busA_q(busA_2), .busB_q(busB_2), .busFP_q(busFP_2),
        .aluCtrl_q(aluCtrl_2), .aluSrc_q(aluSrc_2), .setInv_q(setInv_2),
        .regDst_q(regDst_2), .memRd_q(memRd_2), .memWr_q(memWr_2), .regWr_q(regWr_2),
        .branch_q(branch_2), .jr_q(jr_2), .jump_q(jump_2), .link_q(link_2), .op0_q(op0_2), .fp_q(fp_2), .zeroExt_q(zeroExt_2),
        .dSize_q(dSize_2), .imm32_q(imm32_2),
        .rd_q(rd_2), .instr_q(instr_2), .valid_q(valid_2),
        .busA_sel_q(busA_sel_2), .busB_sel_q(busB_sel_2), .memWrData_sel_q(memWrData_sel_2),
        .not_trap_q(not_trap_2)
    );    // multiplier_fsm multipli );
    
    
////// EX Module
    // New outputs of module
    wire [31:0] busA_in, busB_in; //inputs into ex
    wire [31:0] aluRes_2, aluRes_3, product_in_3;
    wire isZero_2;
    
        // Forwarding busA MUX
    // mux4to1 #(32) ForwardBusA(.src0(busA_2), .src1(aluRes_3), .src2(memRdData_0), .src3(32'h00), .sel(busA_sel_2), .z(busA_in));
    mux4to1 #(32) ForwardBusA(.src0(busA_2), .src1(aluRes_3), .src2(regWrData), .src3(32'h00), .sel(busA_sel_2), .z(busA_in));
        
    // Forwarding busB MUX
    // mux4to1 #(32) ForwardBusB(.src0(busB_2), .src1(aluRes_3), .src2(memRdData_0), .src3(32'h00), .sel(busB_sel_2), .z(busB_in));
    mux4to1 #(32) ForwardBusB(.src0(busB_2), .src1(aluRes_3), .src2(regWrData), .src3(32'h00), .sel(busB_sel_2), .z(busB_in));
            
    
    ex ex(
        .aluSrc(aluSrc_2), .aluCtrl(aluCtrl_2), .setInv(setInv_2), 
        .busA(busA_in), .busB(busB_in), .imm32(imm32_2),
        .aluRes(aluRes_2), .isZero(isZero_2), .fp(fp_2), .zeroExt(zeroExt_2),
        .multCtrl(multCtrl), .product_in(product_in_3)
    );


/////////////////////////////////////////////////////////////////// 

////// EX/MEM Register (in = 2, out = 3)
    // New outputs of register
    wire [31:0] incPC_3, busA_3, busB_3, imm32_3, busFP_3;
    wire regDst_3, memWr_3, regWr_3,
                branch_3, jr_3, jump_3, link_3, op0_3, fp_3, isZero_3;
    wire [1:0] dSize_3;
    wire [1:0] memWrData_sel_3;
    
    ex_mem ex_mem(
        .clk(clk), .rst(rst), .ctrl(ex_mem_ctrl),
    //Inputs
        .incPC_d(incPC_2), .busA_d(busA_in), .busB_d(busB_in), .imm32_d(imm32_2), .busFP_d(busFP_2), .aluRes_d(aluRes_2), .product_in_d(aluRes_2),
        .regDst_d(regDst_2), .memRd_d(memRd_2), .memWr_d(memWr_2), .regWr_d(regWr_2),
        .branch_d(branch_2), .jr_d(jr_2), .jump_d(jump_2), .link_d(link_2), .op0_d(op0_2),.fp_d(fp_2), 
        .dSize_d(dSize_2),
        .rd_d(rd_2), .instr_d(instr_2), .memWrData_sel_d(memWrData_sel_2),
        .valid_d(valid_2), .isZero_d(isZero_2), .not_trap_d(not_trap_2),
    //Outputs
        .incPC_q(incPC_3), .busA_q(busA_3), .busB_q(busB_3), .imm32_q(imm32_3), .busFP_q(busFP_3), .aluRes_q(aluRes_3), .product_in_q(product_in_3),
        .regDst_q(regDst_3), .memRd_q(memRd_3), .memWr_q(memWr_3), .regWr_q(regWr_3),
        .branch_q(branch_3), .jr_q(jr_3), .jump_q(jump_3), .link_q(link_3), .op0_q(op0_3), .fp_q(fp_3), 
        .dSize_q(dSize_3),
        .rd_q(rd_3), .instr_q(instr_3), .memWrData_sel_q(memWrData_sel_3),
        .valid_q(valid_3), .isZero_q(isZero_3), .not_trap_q(not_trap_3)
    );
    
////// MEM Module
    // New outputs of module
    wire [31:0] reg31Val_3, memRdData_0;
    
    // Forwarding memWrData MUX
    
    mem mem(
        .isZero(isZero_3), .op0(op0_3), .branch(branch_3), 
        .jump(jump_3), .jr(jr_3), 
        .incPC(incPC_3), .imm32(imm32_3), .busA(busA_3),
        .reg31Val(reg31Val_3), .nextPC(nextPC_3), .takeLeap(takeLeap)
    );
    
    
    assign memAddr = aluRes_3;
    assign memWr = memWr_3;
    assign dSize = dSize_3;
    assign memInstr = instr_3;
    
    
    //Forwarding memWrData MUX
    mux4to1 #(32) ForwardData(.src0(32'h00), .src1(aluRes_3), .src2(busB_3), .src3(memRdData_0), .sel(memWrData_sel_3), .z(memWrData));
            // assign memWrData = busB_3;

    

////// MEM/WB Register (in = 3, out = 0)
    // New outputs of register
    wire [31:0] nextPC_0, aluRes_0, reg31Val_0, busFP_0, instr_0;
    wire regDst_0, regWr, link_0, fp_0;
    wire [1:0] dSize_0;
    wire [4:0] rd_0;
    wire valid_0, memRd_0;
    
    mem_wb mem_wb(
        .clk(clk), .rst(rst), .ctrl(mem_wb_ctrl),
    // Inputs
        //.nextPC_d(nextPC_3),
        .regDst_d(regDst_3), .memRd_d(memRd_3), .regWr_d(regWr_3), .link_d(link_3), .fp_d(fp_3),
        .dSize_d(dSize_3), .rd_d(rd_3), .instr_d(instr_3),
        .aluRes_d(aluRes_3), .memRdData_d(memRdData), .reg31Val_d(reg31Val_3),
        .busFP_d(busFP_3), .valid_d(valid_3),
    //Outputs
        //.nextPC_q(nextPC_0),
        .regDst_q(regDst_0), .memRd_q(memRd_0), .regWr_q(regWr), .link_q(link_0), .fp_q(fp_0), 
        .dSize_q(dSize_0), .rd_q(rd), .instr_q(instr_0),
        .aluRes_q(aluRes_0), .memRdData_q(memRdData_0), .reg31Val_q(reg31Val_0),
        .busFP_q(busFP_0), .valid_q(valid_0)
    );
  
////// WB Module
    // New outputs of module
    
    
    wb wb(
        .memRd(memRd_0),
        .link(link_0),  
        .regWr(regWr),
        .fp(fp_0),      
        .memRdData(memRdData_0),
        .aluRes(aluRes_0),
        .reg31Val(reg31Val_0),
        .busFP(busFP_0),
        .regWrData(regWrData),
        .dSize(dSize_0),
        .instr(instr_0)
    );

endmodule // pipeline
