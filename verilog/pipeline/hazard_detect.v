`include "constants.vh"

module hazard_detect(
    input [31:0] id_instr, // current instruction
    input [31:0] ex_instr, // previous instruction
    input [31:0] mem_instr,
    input [4:0] id_rs1,
    input [4:0] id_rs2,
    input [4:0] ex_rd,
    input [4:0] mem_rd,
    input [4:0] wb_rd,
    input id_regDst,
    input ex_valid,
    input mem_valid,
    input wb_valid,
    input mem_memRd,
    input ex_memWr,
    
    output reg [1:0] busA_sel, // (00 -> busA (ID), 01 -> aluRes (EX), 10 -> memWrData (MEM))
    output reg [1:0] busB_sel, //(00 -> busB (ID), 01 -> aluRes (EX), 10 -> memWrData (MEM))
    output reg [1:0] memWrData_sel, // (00 -> memWrData (MEM), 11 -> memRdData(WB))
    output reg [1:0] if_id_ctrl, id_ex_ctrl, ex_mem_ctrl, mem_wb_ctrl,
    output reg pc_enable
    
    
    );

//if (busA_sel_in = `FROM_ID) -- come back to this!
   // begin

    always @* begin 
    
     busA_sel = `FROM_ID;
     busB_sel = `FROM_ID;
     memWrData_sel = `FROM_MEM;
     if_id_ctrl = `GO;  id_ex_ctrl = `GO;  ex_mem_ctrl = `GO;  mem_wb_ctrl = `GO;
     pc_enable = 1'b1;
     
    
    
    if (mem_valid && mem_rd != `R0)
        begin 
            if(id_rs1 == mem_rd) 
                begin
                     busA_sel = `FROM_MEM;
                end
            else if(id_rs2 == mem_rd)
                begin
                     busB_sel = `FROM_MEM;
                end
            else if(mem_memRd && ex_memWr && mem_rd == ex_rd)
                memWrData_sel = `FROM_WB;
        end

    else if (ex_valid && ex_rd != `R0) // 1 instruction ahead
        begin
        
            if (id_rs1 == ex_rd)
                begin
                    if (ex_instr[31:29] == `LD_INST) begin // if opcode = 100, if instruction is load
                         if_id_ctrl = `HOLD;
                         id_ex_ctrl = `FLUSH;
                         pc_enable = 0;
                    end
                    else
                         busA_sel = `FROM_EX;
                end
            else if (id_rs2 == ex_rd)
                begin
                    if (ex_instr[31:29] == `LD_INST) begin// if opcode = 100, if instruction is load
                         if_id_ctrl = `HOLD;
                         id_ex_ctrl = `FLUSH;
                         pc_enable = 0;
                    end
                    else
                         busB_sel = `FROM_EX;
                end
        end 
    
    // FORWARDING FOR LOAD TO NON-STORES
    else
         busA_sel = `FROM_ID;
        busB_sel = `FROM_ID;
         memWrData_sel = `FROM_MEM;
        
//    end
//else
//    id_opa_sel_out = id_opa_sel_in;
end 
endmodule