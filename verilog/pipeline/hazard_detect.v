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
     
    
    
    if (mem_valid && mem_rd != `R0 && ex_instr[31:29] == `NOP) // hazard with 2 instructions ahead
        begin 
            if(id_rs1 == mem_rd) 
            begin
                $write("RS1 == MEM_RD\n");
                busA_sel = `FROM_MEM;
            end
            else if(id_rs2 == mem_rd) 
            begin
                $write("RS2 == MEM_RD\n");
                busB_sel = `FROM_MEM;
            end
            else if(mem_memRd && ex_memWr && mem_rd == ex_rd)
            begin
                memWrData_sel = `FROM_WB;
            end
        end

    else if (ex_valid && (ex_rd != `R0)) // hazard with 1 instruction ahead
        begin
            if (id_rs1 == ex_rd) 
            begin
                $write("RS1 == EX_RD\n");
                if (ex_instr[31:29] == `LD_INST)
                begin // if opcode = 100, if instruction is load
                     $write("!!!!!! LOAD INSTRUCTION !!!!!!!\n");
                     if_id_ctrl = `HOLD;
                     id_ex_ctrl = `FLUSH;
                     pc_enable = 1'b0;
                end
                else
                begin
                     busA_sel = `FROM_EX;
                end
            end
            else if (id_rs2 == ex_rd) 
            begin
                $write("RS2 == EX_RD\n");
                if (ex_instr[31:29] == `LD_INST)
                begin// if opcode = 100, if instruction is load
                     $write("!!!!!! LOAD INSTRUCTION !!!!!!!\n");
                     if_id_ctrl = `HOLD;
                     id_ex_ctrl = `FLUSH;
                     pc_enable = 1'b0;
                end
                else
                begin
                     busB_sel = `FROM_EX;
                end
            end
        end 
    
    // FORWARDING FOR LOAD TO NON-STORES
    else
    begin
         busA_sel = `FROM_ID;
         busB_sel = `FROM_ID;
         memWrData_sel = `FROM_MEM;
    end
        
//    end
//else
//    id_opa_sel_out = id_opa_sel_in;

end // always
endmodule