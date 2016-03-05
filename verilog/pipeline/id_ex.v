// NOTE: useful regex to remove port maps in parenthesis: \(([^\)]+)\)
`include "constants.vh"

module id_ex(
    clk, rst, ctrl,
    // Inputs
    incPC_d, busA_d, busB_d, busFP_d,
    aluCtrl_d, aluSrc_d, setInv_d,
    regDst_d, memRd_d, memWr_d, regWr_d,
    branch_d, jr_d, jump_d, link_d, op0_d, fp_d,
    dSize_d, imm32_d,
    rd_d,
    // Outputs
    incPC_q, busA_q, busB_q, busFP_q, busA_q,
    aluCtrl_q, aluSrc_q, setInv_q,
    regDst_q, memRd_q, memWr_q, regWr_q,
    branch_q, jr_q, jump_q, link_q, op0_q, fp_q,
    dSize_q, imm32_q,
    rd_q 
);

    input           clk, rst;
    input [1:0]     ctrl;
    
    input [31:0]    incPC_d, busA_d, busB_d, busFP_d;
    input [3:0]     aluCtrl_d;
    input           aluSrc_d, setInv_d,
                    regDst_d, memRd_d, memWr_d, regWr_d,
                    branch_d, jr_d, jump_d, link_d, op0_d, fp_d;
    input [1:0]     dSize_d;
    input [31:0]    imm32_d;
    input [4:0]     rd_d;

    output reg [31:0]   incPC_q, busA_q, busB_q, busFP_q;
    output reg [3:0]    aluCtrl_q;
    output reg          aluSrc_q, setInv_q,
                        regDst_q, memRd_q, memWr_q, regWr_q,
                        branch_q, jr_q, jump_q, link_q, op0_q, fp_q;
    output reg [1:0]    dSize_q;
    output reg [31:0]   imm32_q;
    output reg [4:0]    rd_q;
    
    always @ (posedge clk or negedge rst)
        if (~rst) begin
            // TODO: figure out what matters
            incPC_q = 32'b0;
            busA_q = 32'b0;
            busB_q = 32'b0;
            aluCtrl_q = 4'b0;
            aluSrc_q = 1'b0;
            setInv_q = 1'b0;
            regDst_q = 1'b0;
            memRd_q = 1'b0;
            memWr_q = 1'b0;
            regWr_q = 1'b0;
            branch_q = 1'b0;
            jr_q = 1'b0;
            jump_q = 1'b0;
            link_q = 1'b0;
            op0_q = 1'b0;
            fp_q = 1'b0;
            dSize_q = 1'b0;
            imm32_q = 1'b0;
            rd_q = 1'b0;
        end
        else begin
            // 1. flush register
            if (ctrl == `SQUASH) begin
                memWr_q = 0;
                regWr_q = 0;
                // TODO
            end
            // 2. proceed as normal
            else if (ctrl == `GO) begin
                incPC_q = incPC_d;
                busA_q = busA_d;
                busB_q = busB_d;
                aluCtrl_q = aluCtrl_d;
                aluSrc_q = aluSrc_d;
                setInv_q = setInv_d;
                regDst_q = regDst_d;
                memRd_q = memRd_d;
                memWr_q = memWr_d;
                regWr_q = regWr_d;
                branch_q = branch_d;
                jr_q = jr_d;
                jump_q = jump_d;
                link_q = link_d;
                fp_q = fp_d;
                op0_q = op0_d;
                dSize_q = dSize_d;
                imm32_q = imm32_d;
                rd_q = rd_d;
            end
            // 3. stall (don't update)
        end
           
            

    
endmodule