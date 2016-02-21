module id(
    instruction, regData, clk,
    aluCtrl, aluSrc, setInv,
    regDst, memRd, memWr, regWr,
    branch, jr, jump, link,
    dSize, signExt,
    signExtImm,
    rs1, rs2, rd
);
    
    // Interface
    input [31:0] instruction, regData;
    input clk;
    output aluSrc, setInv,
            regDst, memRd, memWr, regWr,
            branch, jr, jump, link,
            signExt;
    output [1:0] dSize;
    output [3:0] aluCtrl;
    output [31:0] signExtImm;
    output [4:0] rs1, rs2, rd;
    
    
   wire [4:0]  rs2_wire;
   wire sel31;
   
   
    
assign rs1 = instruction[25:21];
   
//   or_gate reg31Sel (.a(jr), .b(link), .z(sel31));
   mux2to1 #(5) muxReg31 (.src0(instruction[20:16]), .src1(5'b11111), .sel(link), .z(rs2_wire));
    
    control control(
        .instruction(instruction),
        .aluCtrl(aluCtrl),
        .aluSrc(aluSrc),
        .setInv(setInv),
        .regDst(regDst),
        .memRd(memRd),
        .memWr(memWr),
        .regWr(regWr),
        .branch(branch),
        .jr(jr),
        .jump(jump),
        .link(link),
        .dSize(dSize),
        .signExt(signExt)
        );
    
    mux2to1 #(5) mux2to1(.src0(rs2_wire), .src1(instruction[15:11]), .sel(regDst), .z(rd));
    assign rs2 = rs2_wire;
    
    sign_extender sign_extender(.imm(instruction[25:0]), .signExt(signExt), .res(signExtImm), .jump(jump));
    
    // always @ (posedge(clk)) begin
    //     // $display("signExtended: %x", signExtImm);
    //     // $display("rs2_wire:%x", rs2_wire);
    //     // $display("rd:%x", rd);
    // end
endmodule // id