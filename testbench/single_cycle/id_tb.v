module id_tb;
    reg [31:0] instruction, regData;
    reg clk;
    wire aluSrc, setInv,
            regDst, memRd, memWr, regWr,
            branch, jr, jump, link,
            signExt;
    wire [1:0] dSize;
    wire [3:0] aluCtrl;
    wire [31:0] signExtImm, busA, busB;
    
    id id(
        .instruction(instruction), .regData(regData), .clk(clk),
        .aluCtrl(aluCtrl), .aluSrc(aluSrc), .setInv(setInv),
        .regDst(regDst), .memRd(memRd), .memWr(memWr), .regWr(regWr),
        .branch(branch), .jr(jr), .jump(jump), .link(link),
        .dSize(dSize), .signExt(signExt),
        .signExtImm(signExtImm), .busA(busA), .busB(busB)
    );
    
    initial begin
        clk = 0;
        regData = 32'h0;
        $monitor("signExt: %x, busA: %x, busB: %x", signExtImm, busA, busB);
        #0 instruction = 32'h8c012000;
        $display("Testing instruction %b", instruction);
        #10 instruction = 32'h8c022004;
        $display("Testing instruction %b", instruction);
        #10 instruction = 32'h00631826;
        $display("Testing instruction %b", instruction);
        #10 instruction = 32'h24630008;
        $display("Testing instruction %b", instruction);
        #10 instruction = 32'h00220821;
        $display("Testing instruction %b", instruction);
        #10 
        #10 $finish;
    end
    
    always
        #5 clk = !clk;

endmodule