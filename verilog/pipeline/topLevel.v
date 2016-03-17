module topLevel();

//  implement interface between pipeline & data memory & instruction memory
// this is directly copied from memory.v - memload_example()
    parameter IMEMFILE = "instr.hex";
    parameter DMEMFILE = "data.hex";
    reg [8*80-1:0] filename;
    
    reg clk, rst;
    wire [31:0] iaddr, instr;
    wire [31:0] memAddr, memWrData, memRdData, busA, busB, busFP, regWrData;
    wire [1:0] dsize;
    wire [4:0] rs1, rs2, rd;
    wire memWr, fp, regWr;
    // created wire for regWr - do we need one?


    integer dfileobj, dmaddr, r, k, i;

    // CONNECTING THE WIRES
    imem #(.SIZE(16384)) IMEM(.addr(iaddr), .instr(instr));
    dmem #(.SIZE(16384)) DMEM(.addr(memAddr), .rData(memRdData), .wData(memWrData), .writeEnable(memWr), .dsize(dsize), .clk(clk));
    
    regfile regfile(
        .rs1(rs1), .rs2(rs2), .rd(rd), .rData1(busA), .rData2(busB),
        .wData(regWrData), .regWr(regWr), .clk(clk)
    );
    
    fpregfile fpreg (
        .rs(rs1), .rd(rd), .rData(busFP),
        .wData(regWrData), .regWr(regWr), .fp(fp), .clk(clk)
    );
    
    pipeline CPU(
        .clk(clk), .rst(rst), .initPC(32'h1000),
        .instruction(instr), .iAddr(iaddr),
        .memAddr(memAddr), .memRdData(memRdData), .memWrData(memWrData), .dSize(dsize), .memWr(memWr),
        .busA(busA), .busB(busB), .busFP(busFP), .rs1(rs1), .rs2(rs2), .rd(rd), .regWrData(regWrData), .regWr(regWr), .fp(fp)
    );
    
    // EXECUTING INSTRUCTIONS
    initial begin
    
        // Clear DMEM
        for (i = 0; i < DMEM.SIZE; i = i + 1)
            DMEM.mem[i] = 8'h0;

        // Load IMEM from file
        if (!$value$plusargs("instrfile=%s", filename)) begin
            filename = IMEMFILE;
        end
        $readmemh(filename, IMEM.mem);
        
        // Load DMEM from file
        if (!$value$plusargs("datafile=%s", filename)) begin
            filename = DMEMFILE;
        end
        $readmemh(filename, DMEM.mem);
        $writememh("dmem_initial", DMEM.mem);
   
        clk = 1; rst = 0;
        
        // $monitor("%b: Instr [%x] = %x", clk, iaddr, instr);
    
        #0
        #7 rst = 1;
        #9960 $writememh("dmem_final_19500", DMEM.mem); $finish;
        

    end // initial
    
    always
        #5 clk = !clk;
    
    // DEBUG
    
    always @ (posedge(clk)) begin
    
        // NOTE: printing register dump of previous cycle b/c read ready on negedge(clk)
    
        // // UNSIGNED SUM DEMO
        //  $display("===============REGISTER DUMP===============");
        //  $display("reg %x: %x \t reg %x: %x", 0, regfile.mem[0],  4, regfile.mem[4]);
        //  $display("reg %x: %x \t reg %x: %x", 5, regfile.mem[5],  6, regfile.mem[6]);
        //  $display("===========================================");
        
        // // FIB DEMO
        $display("\n===============REGISTER DUMP===============");
        $display("reg %x: %x \t reg %x: %x", 1, regfile.mem[1],  2, regfile.mem[2]);
        $display("reg %x: %x \t reg %x: %x", 3, regfile.mem[3],  4, regfile.mem[4]);
        $display("===========================================");
        
        // // QUICKSORT DEMO
        // $display("\n===============REGISTER DUMP===============");
        // $display("reg %d: %x", 0, regfile.mem[0]);
        // $display("reg %d: %x \t reg %d: %x", 1, regfile.mem[1],  29, regfile.mem[29]);
        // $display("reg %d: %x \t reg %d: %x", 2, regfile.mem[2],  30, regfile.mem[30]);
        // $display("reg %d: %x \t reg %d: %x", 3, regfile.mem[3],  31, regfile.mem[31]);
        // $display("===========================================");
        
        ////////////////////////////
        
        $display("\n~~~~~~~~~~~~~time: @%0dns~~~~~~~~~~~~~", $time);
        $display("Instr [%x] = %x", iaddr, instr);
        $display("memAddr: %x, memRdData: %x, memWrData: %x, memWr: %b", memAddr, memRdData, memWrData, memWr);
        // $display("not_trap: %x %x %x", CPU.not_trap_1, CPU.not_trap_2, CPU.not_trap_3);
        // CHECK instruction fetching
        // $display("ifetch PC_d=%x PC_q=%x incPC=%x", CPU.ifetch.PC_d, CPU.ifetch.PC_q, CPU.ifetch.incPC);
        // $display("takeLeap=%x", CPU.mem.takeLeap);
        // $display("if/id incPC_d=%x incPC_q=%x", CPU.incPC_0, CPU.incPC_1);
        // $display("id/ex incPC_d=%x, incPC_q=%x", CPU.incPC_1, CPU.incPC_2);
        // $display("ex/mem incPC_d=%x incPC_q=%x", CPU.incPC_2, CPU.incPC_3);
        
        // CHECK Instructions
        // $display("if/id instr_d=%x instr_q=%x", CPU.instruction, CPU.instr_1);
        // $display("id/ex instr_d=%x, instr_q=%x", CPU.instr_1, CPU.instr_2);
        // $display("ex/mem instr_d=%x instr_q=%x", CPU.instr_2, CPU.instr_3);
        // $display("mem/wb instr_d=%x instr_q=%x", CPU.instr_3, CPU.instr_0);
        
        
        // $display("regfile: rs1=%x, rs2=%x, rd=%x, busA=%x, busB=%x, regWrData=%x, regWr=%x", rs1, rs2, rd, busA, busB, regWrData, regWr);
       
        // CHECK BUS A & B & AluRes
        // $display("id/ex busA %x => %x", CPU.busA, CPU.busA_2);
        // $display("id/ex busB %x => %x", CPU.busB, CPU.busB_2);
        // $display("ex/mem busB %x => %x", CPU.busB_2, CPU.busB_3);
        // $display("ex/mem aluRes %x => %x", CPU.ex.aluRes, CPU.aluRes_3);
        // $display("mem/wb aluRes %x => %x", CPU.aluRes_3, CPU.aluRes_2);
        
        //$display("mem/wb incPC_d=%x, incPC_q=%x", CPU.incPC_3, CPU.incPC_0);
       // $display("mem/wb nextPC_d=%x, nextPC_q=%x", CPU.nextPC_3, CPU.nextPC_0);
        // $display("PC enable=%x", CPU.pc_enable);
        $display("Not trap=%x", CPU.not_trap_3);
        
        $display("----------IF-----------");
        $display("instr=%x", CPU.instruction);
        // $display("cur_PC=%x", CPU.ifetch.curPC);
        // // $display("pc_d=%x", CPU.ifetch.PC_d);
        // // $display("pc_q=%x", CPU.ifetch.PC_q);
        // $display("nextPC=%x", CPU.ifetch.nextPC);
        // $display("takeLeap=%x", CPU.ifetch.takeLeap);
        // $display("enable_PC=%x", CPU.ifetch.enable_PC);
        // $display("ctrl if_id=%x", CPU.if_id_ctrl);
        
        $display("----------ID-----------");
        $display("instr=%x", CPU.instr_1);
        // $display("busA=%x, rs1=%x", busA, rs1);
        // $display("busB=%x, rs2=%x", busB, rs2);
        // // $display("imm32=%x", CPU.imm32_1);
        // // $display("regWr=%x", CPU.regWr_1);
        // $display("signExt=%x", CPU.id.signExt);
        // $display("regDst=%x", CPU.id.regDst);
        // $display("rd=%x", CPU.rd_1);
    //    $display("aluCtrl=%b", CPU.aluCtrl_1);
       // $display("aluCtrl(ctrl)=%b", CPU.id.control.aluCtrl);
        
        // // $display("memWr=%x", CPU.memWr_1);
        // $display("ctrl id_ex=%x", CPU.id_ex_ctrl);
        
        // $display("----------HAZARD DETECTION-----------")
        // $display("busA_sel=%x", CPU.busA_sel);
        // $display("busB_sel=%x", CPU.busB_sel);
        // $display("memWrData_sel=%x", CPU.memWrData_sel);
        // $display("id_rs1=%x", CPU.hazard_detect.id_rs1);
        // $display("id_rs2=%x", CPU.hazard_detect.id_rs2);
        // $display("ex_valid=%x", CPU.hazard_detect.ex_valid);
        // $display("ex_rd=%x", CPU.hazard_detect.ex_rd);
        // $display("ex_instr=%x", CPU.hazard_detect.ex_instr);
        // $display("mem_valid=%x", CPU.hazard_detect.mem_valid);
        // $display("mem_rd=%x", CPU.hazard_detect.mem_rd);
        
        
        $display("----------EX-----------");
        $display("instr=%x", CPU.instr_2);
        // $display("busA=%x, busA_sel=%x", CPU.busA_in, CPU.busA_sel_2);
        // $display("busB=%x, busB_sel=%x", CPU.busB_in, CPU.busB_sel_2);
        // $display("imm32=%x", CPU.imm32_2);
        // $display("regWr=%x", CPU.regWr_2);
        // $display("rd=%x", CPU.rd_2);
        // $display("alu=%x", CPU.aluRes_2);
        // $display("aluRes_int=%x", CPU.ex.aluRes_int);
        // $display("aluCtrl=%b", CPU.ex.aluCtrl);
        // // $display("memWr=%x", CPU.memWr_2);
        // $display("ctrl ex_mem=%x", CPU.ex_mem_ctrl);
        
        $display("----------MEM-----------");
        $display("instr=%x", CPU.instr_3);
        // $display("busB=%x", CPU.busB_3);
        // $display("jr=%x", CPU.mem.jr);
        // $display("alu=%x", CPU.aluRes_3);
        // $display("imm32=%x", CPU.imm32_3);
        // $display("regWr=%x", CPU.regWr_3);
        // $display("rd=%x", CPU.rd_3);
        // $display("memRd=%x, memWr=%x", CPU.memRd_3, CPU.memWr_3);
        $display("takeLeap=%x", CPU.takeLeap);
        // $display("target addr=%x",CPU.nextPC_3);
        // $display("incPC=%x", CPU.mem.incPC);
        // $display("leapPC=%x", CPU.mem.leapPC);
        // $display("nextPC=%x", CPU.mem.nextPC);
        // $display("ctrl mem_wb=%x", CPU.mem_wb_ctrl);
        
        $display("----------WB-----------");
        $display("instr=%x", CPU.instr_0);
        // $display("regWr=%x", CPU.regWr);
        // $display("regWrData=%x, rd=%", CPU.regWrData, CPU.rd);
        // $display("alu=%x", CPU.aluRes_0);
        // $display("memRdData=%x", CPU.wb.memRdData);

        // // // $display("byteData=%x", CPU.wb.byteData);
        // // // $display("wordData=%x", CPU.wb.wordData);
        // // // $display("dwordData=%x", CPU.wb.dwordData);
        // // $display("dSize=%x", CPU.wb.dSize);
        // // $display("memRd=%x", CPU.wb.memRd);
        // // $display("link=%x", CPU.wb.link);
        // // $display("selWhichFP=%x", CPU.wb.selWhichFP);
        // // $display("dResize=%x", CPU.wb.dResize);
        // // $display("loadRegData=%x", CPU.wb.loadRegData);
       
    end
        
endmodule
