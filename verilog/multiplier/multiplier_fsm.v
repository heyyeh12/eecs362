`include "constants.vh"
module multiplier_fsm(
    input clk, rst,
    input [3:0] aluCtrl,
    output reg [1:0] cur_state,
    output reg pc_mult_ctrl,
    output reg [1:0] if_id_mult_ctrl, id_ex_mult_ctrl, ex_mem_mult_ctrl, mem_wb_mult_ctrl 
);

wire [1:0] next_state;
wire pc_mult_c;
wire [1:0] if_id_mult_c, id_ex_mult_c, ex_mem_mult_c, mem_wb_mult_c;

// SEQUENTIAL LOGIC
always @ (posedge clk or negedge rst)
begin
    if (~rst) begin
        cur_state = `IDLE;
        pc_mult_ctrl = 1'b1;
        if_id_mult_ctrl = `GO;
        id_ex_mult_ctrl = `GO;
        ex_mem_mult_ctrl = `GO;
        mem_wb_mult_ctrl = `GO;
    end else
        case (cur_state)
            `IDLE: begin
                if (aluCtrl == 4'b1111)
                begin
                    cur_state = `CYCLE0;
                    pc_mult_ctrl = 1'b0;
                    if_id_mult_ctrl = `HOLD;
                    id_ex_mult_ctrl = `HOLD;
                    ex_mem_mult_ctrl = `HOLD;
                    mem_wb_mult_ctrl = `HOLD;
                end
                else
                begin
                    cur_state = `IDLE;
                    pc_mult_ctrl = 1'b1;
                    if_id_mult_ctrl = `GO;
                    id_ex_mult_ctrl = `GO;
                    ex_mem_mult_ctrl = `GO;
                    mem_wb_mult_ctrl = `GO;
                end
            end
            
            `CYCLE0: begin
                cur_state = `CYCLE1;
                pc_mult_ctrl = 1'b0;
                if_id_mult_ctrl = `HOLD;
                id_ex_mult_ctrl = `HOLD;
                ex_mem_mult_ctrl = `HOLD;
                mem_wb_mult_ctrl = `HOLD;
            end
            
            `CYCLE1: begin
                cur_state = `CYCLE2;
                pc_mult_ctrl = 1'b0;
                if_id_mult_ctrl = `HOLD;
                id_ex_mult_ctrl = `HOLD;
                ex_mem_mult_ctrl = `HOLD;
                mem_wb_mult_ctrl = `HOLD;
            end
            
            `CYCLE2: begin
                cur_state = `IDLE;
                pc_mult_ctrl = 1'b1;
                if_id_mult_ctrl = `GO;
                id_ex_mult_ctrl = `GO;
                ex_mem_mult_ctrl = `GO;
                mem_wb_mult_ctrl = `GO;
            end
            
            default: begin
                cur_state = `IDLE;
                pc_mult_ctrl = 1'b1;
                if_id_mult_ctrl = `GO;
                id_ex_mult_ctrl = `GO;
                ex_mem_mult_ctrl = `GO;
                mem_wb_mult_ctrl = `GO;
            end
    
        endcase

end

endmodule