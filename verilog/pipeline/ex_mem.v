`include "constants.vh"

module ex_mem(
   clk, rst, ctrl, valid_d,
   //Inputs
   instr_d, incPC_d, busA_d, busB_d, imm32_d, busFP_d, aluRes_d, product_in_d,
   regDst_d, memRd_d, memWr_d, regWr_d,
   branch_d, jr_d, jump_d, link_d, op0_d, fp_d,
   dSize_d,
   rd_d,
   memWrData_sel_d,
   isZero_d, not_trap_d,
   //Outputs
   instr_q, incPC_q, busA_q, busB_q, imm32_q, busFP_q, aluRes_q, product_in_q,
   regDst_q, memRd_q, memWr_q, regWr_q,
   branch_q, jr_q, jump_q, link_q, op0_q, fp_q,
   dSize_q,
   rd_q,
   memWrData_sel_q, valid_q,
   isZero_q, not_trap_q
);

   input          clk, rst, valid_d;
   input [1:0]    ctrl;
   
   input [31:0]   instr_d, incPC_d, busA_d, busB_d, imm32_d, busFP_d, aluRes_d, product_in_d;
   input          regDst_d, memRd_d, memWr_d, regWr_d,
                  branch_d, jr_d, jump_d, link_d, op0_d, fp_d;
   input [1:0]    dSize_d;
   input [4:0]    rd_d;
   input [1:0]    memWrData_sel_d;
   input          isZero_d, not_trap_d;
   
   output reg [31:0]  instr_q, incPC_q, busA_q, busB_q, imm32_q, busFP_q, aluRes_q, product_in_q;
   output reg         regDst_q, memRd_q, memWr_q, regWr_q,
                      branch_q, jr_q, jump_q, link_q, op0_q, fp_q;
   output reg [1:0]   dSize_q;
   output reg [4:0]   rd_q;
   output reg  [1:0]  memWrData_sel_q; 
   output reg valid_q;
   output reg  isZero_q, not_trap_q;
   
   always @ (posedge clk or negedge rst)
        if (~rst) begin
            //TODO
            instr_q <= `NOP;
            incPC_q <= 32'b0;
            busA_q <= 32'b0;
            busB_q <= 32'b0;
            imm32_q <= 32'b0;
            busFP_q <= 32'b0;
            busA_q <= 32'b0; 
            aluRes_q <= 32'b0;
            regDst_q <= 1'b0;
            memRd_q <= 1'b0;
            memWr_q <= 1'b0;
            regWr_q <= 1'b0;
            isZero_q <= 1'b0;          
            jump_q <= 1'b0;
            branch_q <=1'b0;
            jr_q <= 1'b0;
            link_q <= 1'b0;
            op0_q <= 1'b0;
            fp_q <=1'b0;
            memWr_q <= 0;
            regWr_q <= 0;
            memWrData_sel_q <= `FROM_ID;
            valid_q <= 1'b0;
            not_trap_q <= 1'b1;
            rd_q <= 5'b0;
            product_in_q <= 32'b0;
         end
            
        else begin
            // 1. flush register
            if (ctrl == `FLUSH) begin
            instr_q <= `NOP;
            incPC_q <= 32'b0;
            busA_q <= 32'b0;
            busB_q <= 32'b0;
            imm32_q <= 32'b0;
            busFP_q <= 32'b0;
            busA_q <= 32'b0; 
            aluRes_q <= 32'b0;
            regDst_q <= 1'b0;
            memRd_q <= 1'b0;
            memWr_q <= 1'b0;
            regWr_q <= 1'b0;
            isZero_q <= 1'b0;          
            jump_q <= 1'b0;
            branch_q <=1'b0;
            jr_q <= 1'b0;
            link_q <= 1'b0;
            op0_q <= 1'b0;
            fp_q <=1'b0;
            memWr_q <= 0;
            regWr_q <= 0;
            memWrData_sel_q <= `FROM_ID;
            valid_q <= 1'b0;
            not_trap_q <= 1'b1;
            rd_q <= 5'b0;
            product_in_q <= 32'b0;
               // TODO: figure out what else matters
            end
            // 2. proceed as normal
            else if (ctrl == `GO) begin
               isZero_q <= isZero_d;
               instr_q <= instr_d;
               incPC_q <= incPC_d;
               busA_q <= busA_d;
               busB_q <= busB_d;
               imm32_q <= imm32_d;
               regDst_q <= regDst_d;
               busFP_q <= busFP_d;
               busA_q <= busA_d;
               aluRes_q <= aluRes_d;
               memRd_q <= memRd_d;
               memWr_q <= memWr_d;
               regWr_q <= regWr_d;
               branch_q <= branch_d;
               jr_q <= jr_d;
               jump_q <= jump_d;
               link_q <= link_d;
               op0_q <= op0_d;
               fp_q <= fp_d;
               dSize_q <= dSize_d;
               rd_q <= rd_d;
               memWrData_sel_q <= memWrData_sel_d;
               valid_q <= valid_d;
               not_trap_q <= not_trap_d;
            end
            // 3. stall (don't update)
            // except keep updating multiplier register
            product_in_q <= product_in_d;
        end

endmodule
