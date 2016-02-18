module singleCycle(
    clk, rst, initPC,
    instruction, iAddr,
    dAddr, drData, dwData, dWrite, dSize,
    busA, busB, rs1, rs2, rd, regData, regWr
);
    // GENERAL INTERFACE
    input clk, rst;
    input [31:0] initPC;
    
    // IMEM INTERFACE
    input [31:0] instruction;
    output [31:0] iAddr;
    
    // DMEM INTERFACE
    input [31:0] drData;
    output [31:0] dAddr, dwData;
    output dWrite;
    output [1:0] dSize;
    
    // REGFILE INTERFACE
    input [31:0] busA, busB;
    output [4:0] rs1, rs2, rd;
    output [31:0] regData;
    output regWr;
    
    // CONTROL INTERFACE    
    wire signExt, regWr, regRd, jump, regDst,
         aluSrc, setInv, memRd, memWr,
         branch, jr, link;
         
    wire [1:0] dSize;
    wire [3:0] aluCtrl;
    wire jmpBr;
    
    //ALU INTERFACE
    wire[31:0] aluRes;
    wire zf, of, cf;
    
    // ID
    wire[31:0] signExtImm;
    
    // IF
    wire[31:0] nextPC;
    
    ifetch ifetch(
        .initPC(initPC), .firstPC(nextPC), .reg31(busB), .imm32(signExtImm),
        .rst(rst), .clk(clk), .nextPC(nextPC),
        .jr(jr), .jump(jump), .link(link), .takeBr(takeBr), .curPC(iAddr)
    );
    
    // ID
    id id(
        .instruction(instruction), .regData(regData),
        .aluCtrl(aluCtrl), .aluSrc(aluSrc), .setInv(setInv),
        .regDst(regDst), .memRd(memRd), .memWr(dWrite), .regWr(regWr),
        .branch(branch), .jr(jr), .jump(jump), .link(link),
        .dSize(dSize), .signExt(signExt),
        .signExtImm(signExtImm), .busA(busA), .busB(busB),
        .clk(clk),
        .rs1(rs1), .rs2(rs2), .rd(rd)
    );
    
    // EX
    ex ex(
        .clk(clk),
        .aluSrc(aluSrc), .aluCtrl(aluCtrl), .setInv(setInv),
        .busA(busA), .busB(busB), .im32(signExtImm),
        .op0(instruction[26]), .takeBr(takeBr),
        .aluRes(aluRes), .zf(zf), .of(of), .cf(cf), .branch(branch)
    );
    
    // MEM - taken care of in top level (data memory interface)
    // LOL nothing happens
    assign dAddr = aluRes; 
    assign dwData = busB;
    
    // WB
    mux2to1 #(32) LOAD_REG(.src0(aluRes), .src1(drData), .sel(memRd), .z(regData));
    
    always @ (posedge(clk)) begin
        $display("aluRes: %x, drData: %x, memRd: %b, regData: %x", aluRes, drData, memRd, regData);
    end
endmodule // singleCycle