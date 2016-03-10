`include "constants.vh"

module mem_wb(
    clk, rst, ctrl, valid_d,
    // Inputs
    instr_d,// nextPC_d,
    regDst_d, memRd_d, regWr_d, link_d, fp_d,
    dSize_d, rd_d,
    aluRes_d, memRdData_d, reg31Val_d,
    busFP_d, busA_d,
    //Outputs
    instr_q, //nextPC_q,
    regDst_q, memRd_q, regWr_q, link_q, fp_q,
    dSize_q, rd_q,
    aluRes_q, memRdData_q, reg31Val_q,
    busFP_q, busA_q, valid_q
);

   input          clk, rst, valid_d;
   input [1:0]    ctrl;
   
   input [31:0]   instr_d, aluRes_d, memRdData_d, reg31Val_d, busFP_d, busA_d; //nextPC_d,
   input          regDst_d, memRd_d, regWr_d, link_d, fp_d;
   input [1:0]    dSize_d;
   input [4:0]    rd_d;
   
   output reg [31:0]  instr_q, aluRes_q, memRdData_q, reg31Val_q, busFP_q, busA_q; //nextPC_q,
   output reg         regDst_q, memRd_q, regWr_q, link_q, fp_q, valid_q;
   output reg [1:0]   dSize_q;
   output reg [4:0]   rd_q;
   
   always @ (posedge clk or negedge rst)
        if (~rst) begin
            instr_q <= `NOP;
            regWr_q <= 0;
            valid_q <= 1'b1;
            //TODO
        end
        else begin
            // 1. flush register
            if (ctrl == `FLUSH) begin
               instr_q <= `NOP;
               regWr_q <= 0;
               valid_q <= 1'b0;
               // TODO: figure out what else matters
            end
            // 2. proceed as normal
            else if (ctrl == `GO) begin
                instr_q <= instr_d;
                //nextPC_q <= nextPC_d;
                regDst_q <= regDst_d;
                memRd_q <= memRd_d;
                regWr_q <= regWr_d;
                dSize_q <= dSize_d;
                rd_q <= rd_d;
                aluRes_q <= aluRes_d;
                memRdData_q <= memRdData_d;
                reg31Val_q <= reg31Val_d;
                link_q <= link_d;
                fp_q <= fp_d;
                valid_q <= valid_d;
            end
            // 3. stall (don't update)
        end

endmodule