`ifndef _constants_vh_
`define _constants_vh_

// Register 0 index
`define R0      5'b0

// Pipeline register controls
`define FLUSH   2'b00
`define GO      2'b11
`define HOLD    2'b01

// Instructions
`define NOP         32'h15
`define LD_INST     3'b100
`define TRAP_INST   32'h44000300 

// Forwarding constants
`define FROM_ID     2'b00
`define FROM_EX     2'b01
`define FROM_MEM    2'b10
`define FROM_WB     2'b11

// 4 Cycle Multiplier
`define CYCLE0      2'b11
`define CYCLE1      2'b10
`define CYCLE2      2'b01
`define IDLE        2'b00

`endif //_constants_vh_