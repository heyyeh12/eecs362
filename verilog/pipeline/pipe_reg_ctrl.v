`include "constants.vh"

// module pipe_reg_ctrl(
//     input id_opa_sel_in,
//     output id_opa_sel,
//     output if_stall,
//     output id_stall,
//     output ex_stall,
//     output mem_stall
// );

// if (id_opa_sel_in = `ALU_OPA_IS_REGA)
// begin
//     if ( ra = id_ex_rd && id_ex_valid && id_ex_rd != `R0)
    
//         id_stall = `TRUE;
    
//     else (ra == ex_mem_rd && id_ex_inst[31:26] == `LD_INST)
        
//         id_opa_sel = `ALU_OPA_FROM_EX;
// end
// else if (ra == ex_mem_rd && ex_mem_valid && ex_mem_rd != `R0)
        
//         id_opa_sel = `ALU_OPA_FROM_MEM;

// else
        
//         id_opa_sel = `ALU_OPA_IS_REGA;
        
// end
// else
//     id_opa_sel = id_opa_sel_in;

// endmodule