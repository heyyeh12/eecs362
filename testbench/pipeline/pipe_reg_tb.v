module testbench;
    reg clk, rst;
    
    /// if_id
    reg [1:0] ctrl;
    reg [31:0] incPC_0, instruction;
    wire [31:0] incPC_1, instr_1;    
    if_id if_id1(
        .clk(clk), .rst(rst), .ctrl(ctrl),
    // Inputs
        .incPC_d(incPC_0), .instr_d(instruction),
    // Outputs
        .incPC_q(incPC_1), .instr_q(instr_1)
    );
    
    /// id_ex
    reg [31:0] busA, busB, busFP;
    reg [3:0] aluCtrl;
    reg aluSrc_1, setInv_1, regDst, memRd_1, memWr_1, regWr_1, branch_1, jr_1, jump_1, link_1, op0_1;
    reg [1:0] dSize_1;
    reg [31:0] imm32_1;
    reg [4:0] rd_1;
    wire [31:0] incPC_2, busA_2, busB_2, busFP_2;
    wire [3:0] aluCtrl_2;
    wire aluSrc_2, setInv_2, memRd_2, memWr_2, regWr_2, branch_2, jr_2, jump_2, link_2, op0_2;
    wire [1:0] dSize_2;
    wire [31:0] imm32_2;
    wire [4:0] rd_2;
    
    id_ex id_ex1(
        .clk(clk), .rst(rst), .ctrl(ctrl),
    // Inputs
        .incPC_d(incPC_1), .busA_d(busA), .busB_d(busB), .busFP_d(busFP),
        .aluCtrl_d(aluCtrl), .aluSrc_d(aluSrc_1), .setInv_d(setInv_1),
        .regDst_d(regDst), .memRd_d(memRd_1), .memWr_d(memWr_1), .regWr_d(regWr_1),
        .branch_d(branch_1), .jr_d(jr_1), .jump_d(jump_1), .link_d(link_1), .op0_d(op0_1), .fp_d(fp_1),
        .dSize_d(dSize_1), .imm32_d(imm32_1),
        .rd_d(rd_1),
    // Outputs
        .incPC_q(incPC_2), .busA_q(busA_2), .busB_q(busB_2), .busFP_q(busFP_2),
        .aluCtrl_q(aluCtrl_2), .aluSrc_q(aluSrc_2), .setInv_q(setInv_2),
        .regDst_q(regDst_2), .memRd_q(memRd_2), .memWr_q(memWr_2), .regWr_q(regWr_2),
        .branch_q(branch_2), .jr_q(jr_2), .jump_q(jump_2), .link_q(link_2), .op0_q(op0_2), .fp_q(fp_2),
        .dSize_q(dSize_2), .imm32_q(imm32_2),
        .rd_q(rd_2)
    );
    
    /// ex_mem
    reg [31:0] aluRes;
    reg isZero;
    wire [31:0] incPC_3, busB_3, busFP_3;
    wire regDst_3, memRd_3, memWr_3, regWr_3, branch_3, jr_3, jump_3, link_3, op0_3, fp_3; 
    wire [1:0] dSize_3;
    wire [31:0] imm32_3;
    wire [31:0] aluRes_3;
    wire isZero_3;
    wire [4:0] rd_3;
 
    ex_mem ex_mem1(
        .clk(clk), .rst(rst), .ctrl(ctrl),
    //Inputs
        .incPC_d(incPC_2), .busB_d(busB_2), .imm32_d(imm32_2), .busFP_d(busFP_2),
        .regDst_d(regDst_2), .memRd_d(memRd_2), .memWr_d(memWr_2), .regWr_d(regWr_2),
        .branch_d(branch_2), .jr_d(jr_2), .jump_d(jump_2), .link_d(link_2), .op0_d(op0_2),.fp_d(fp_2),
        .dSize_d(dSize_2),
        .rd_d(rd_2),
    //Outputs
        .incPC_q(incPC_3), .busB_q(busB_3), .imm32_q(imm32_3), .busFP_q(busFP_3),  
        .regDst_q(regDst_3), .memRd_q(memRd_3), .memWr_q(memWr_3), .regWr_q(regWr_3),
        .branch_q(branch_3), .jr_q(jr_3), .jump_q(jump_3), .link_q(link_3), .op0_q(op0_3), .fp_q(fp_3), 
        .dSize_q(dSize_3),
        .rd_q(rd_3)
    );
    
    reg [31:0] nextPC_3;
    reg [31:0] memRdData_3;
    reg [31:0] reg31Val_3;
    wire [31:0] nextPC_0;
    wire [31:0] busFP_0;
    wire memRd_0, regWr_0, fp;
    wire [1:0] dSize_0;
    wire [4:0] rd_0;
    wire [31:0] aluRes_0;
    wire [31:0] memRdData_0;
    wire [31:0] reg31Val_0;

    mem_wb mem_wb1(
        .clk(clk), .rst(rst), .ctrl(ctrl),
    // Inputs
        .nextPC_d(nextPC_3),
        .regDst_d(regDst_3), .memRd_d(memRd_3), .regWr_d(regWr_3), .link_d(link_3), .fp_d(fp_3),
        .dSize_d(dSize_3), .rd_d(rd_3),
        .aluRes_d(aluRes_3), .memRdData_d(memRdData_3), .reg31Val_d(reg31Val_3), .busFP_d(busFP_3),
    //Outputs
        .nextPC_q(nextPC_0),
        .regDst_q(regDst_0), .memRd_q(memRd_0), .regWr_q(regWr_0), .link_q(link_0), .fp_q(fp_0),
        .dSize_q(dSize_0), .rd_q(rd_0),
        .aluRes_q(aluRes_0), .memRdData_q(memRdData_0), .reg31Val_q(reg31Val_0),.busFP_q(busFP_0)
    );
    
    
    initial begin
    
        rst = 1;
        ctrl = 2'b11;
        clk = 0;
        incPC_0 = 32'b1;
        instruction = 32'hffff;
        busA = 32'hffff;
        busB = 32'hffff;
        busFP = 32'hffff;
        aluCtrl = 1'b1;
        aluSrc_1 = 1;
        setInv_1 = 1;
        regDst = 1;
        memRd_1 = 1;
        memWr_1 = 1;
        regWr_1 = 1;
        branch_1 = 1;
        jr_1 = 1;
        jump_1 = 1;
        link_1 = 1;
        op0_1 = 1;
        dSize_1 = 2'b11;
        imm32_1 = 32'hffff;
        rd_1 = 5'b11111;
        memRdData_3 = 32'hffff;
        reg31Val_3 = 32'hffff;
        nextPC_3 = 32'b1;
       // #0
       #50 $finish;
    end
    
    always
        #5 clk = !clk; 
        
        
    // DEBUG
    
    always @ (posedge(clk)) begin
    
        $display("\n----------time: @%0dns---------", $time);
        $display("\t START \t\t IF/ID(1) \t ID/EX(2) \t EX/MEM(3) \t MEM/WB(0) ");
        $display("Instr \t\t \t%x \t\t \t\t \t\t", instr_1);
        $display("incPC \t%x \t%x \t%x \t%x \t\t", incPC_0, incPC_1, incPC_2, incPC_3);
        $display("nextPC \t\t \t\t \t\t \t%x \t%x", nextPC_3, nextPC_0);
        $display("busFP \t\t \t%x \t%x \t%x \t%x", busFP, busFP_2, busFP_3, busFP_0);
        $display("aluSrc \t\t \t%x\t \t%x\t \t\t \t\t", aluSrc_1, aluSrc_2);
        $display("aluCtrl \t \t%x\t \t%x\t \t\t \t\t", aluCtrl, aluCtrl_2);
        $display("regDst \t\t \t%x\t \t%x\t \t%x\t \t%x", regDst, regDst_2, regDst_3, regDst_0);
        $display("memRd \t\t \t%x\t \t%x\t \t%x\t \t\t", memRd_1, memRd_2, memRd_3, memRd_0);
    end
endmodule