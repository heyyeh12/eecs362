`include "constants.vh"
module multiplier_fsm(
    input clk, rst,
    input [3:0] aluCtrl,
    input [1:0] cur_state,
    output reg [1:0] multCtrl,
    output reg pc_mult_stall, if_id_mult_stall, id_ex_mult_stall,
    output reg [1:0] next_state
);

case(cur_state)
    IDLE: if (aluCtrl == 4'b1111) begin
        
CYCLE0, CYCLE1, CYCLE2, IDLE

endmodule