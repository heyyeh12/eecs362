`include "constants.vh"

module mem_wb(
    clk, rst, ctrl,
    // Inputs
    nextPC_d,
    regDst_d, memRd_d, regWr_d, link_d, fp_d,
    dSize_d, rd_d,
    aluRes_d, memRdData_d, reg31Val_d,
    busFP_d, busA_d,
    //Outputs
    nextPC_q,
    regDst_q, memRd_q, regWr_q, link_q, fp_q,
    dSize_q, rd_q,
    aluRes_q, memRdData_q, reg31Val_q,
    busFP_q, busA_q
);

   input          clk, rst;
   input [1:0]    ctrl;
   
   input [31:0]   nextPC_d, aluRes_d, memRdData_d, reg31Val_d, busFP_d, busA_d;
   input          regDst_d, memRd_d, regWr_d, link_d, fp_d;
   input [1:0]    dSize_d;
   input [4:0]    rd_d;
   
   output reg [31:0]  nextPC_q, aluRes_q, memRdData_q, reg31Val_q, busFP_q, busA_q;
   output reg         regDst_q, memRd_q, regWr_q, link_q, fp_q;
   output reg [1:0]   dSize_q;
   output reg [4:0]   rd_q;
   
   always @ (posedge clk or negedge rst)
        if (~rst) begin
            //TODO
        end
        else begin
            // 1. flush register
            if (ctrl == `SQUASH) begin
               regWr_q = 0;
               // TODO: figure out what else matters
            end
            // 2. proceed as normal
            else if (ctrl == `GO) begin
                nextPC_q = nextPC_d;
                regDst_q = regDst_d;
                memRd_q = memRd_d;
                regWr_q = regWr_d;
                dSize_q = dSize_d;
                rd_q = rd_d;
                aluRes_q = aluRes_d;
                memRdData_q = memRdData_d;
                reg31Val_q = reg31Val_d;
                link_q = link_d;
                fp_q = fp_d;
            end
            // 3. stall (don't update)
        end

endmodule