`include "constants.vh"

module if_id(
    clk, rst, ctrl,
    // Control Inputs
    valid_d,
    // Control Outputs
    valid_q,
    // Data Inputs
    incPC_d, instr_d,
    // Data Outputs
    incPC_q, instr_q
); 
    
    parameter initPC = 32'b0;
    
    input           clk, rst;
    input [1:0]     ctrl;
    input           valid_d;
    input [31:0]    incPC_d, instr_d;
    output reg [31:0]   incPC_q, instr_q;
    output reg      valid_q;
     
    always @ (posedge clk or negedge rst)
        if (~rst) begin
            incPC_q <= initPC;
            instr_q <= `NOP;
            valid_q <= 1'b1;
            //valid <= 1; 
        end
        else begin
            // 1. flush register
            if (ctrl == `FLUSH) begin
                // TODO: figure out what matters
                incPC_q <= initPC;
                instr_q <= `NOP;
                valid_q <= 1'b0;
            end
            // 2. proceed as normal
            else if (ctrl == `GO) begin
                incPC_q <= incPC_d;
                instr_q <= instr_d;
                valid_q <= 1'b1;
            end
            // 3. stall (don't update)
        end

endmodule
