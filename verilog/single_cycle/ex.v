module ex(aluSrc, aluCtrl, setInv, busA, busB, im32, aluRes, zf, of, cf, op0, takeBr, branch, clk);

    input clk;// DEBUG ONLY
    input aluSrc, setInv, op0, branch;
    input [3:0] aluCtrl;
    input [31:0] busA, busB, im32;
    output [31:0] aluRes;
    output zf, of, cf;
    output takeBr;
    
    wire [31:0] aluTmp, multRes, srcB, srcB_2;
    wire andTmp0, andTmp1, multSel;
    wire brTrue, zf_wire;
    
    mux2to1 #(32) Ms3B(.src0(busB), .src1(im32), .sel(aluSrc), .z(srcB));
    mux2to1 #(32) getZeroSrcB(.src0(srcB), .src1(32'b0), .sel(branch), .z(srcB_2));
    alu alu(.a(busA), .b(srcB_2), .alu_ctrl(aluCtrl), .inverse_set(setInv), .res(aluTmp), .zf(zf_wire), .of(of), .cf(cf));
    
    // Multiplier
    assign multRes = busA * srcB;
    and_gate and_gate1 (aluCtrl[0], aluCtrl[1], andTmp0);
    and_gate and_gate2 (aluCtrl[2], aluCtrl[3], andTmp1);
    and_gate and_gate3 (andTmp0, andTmp1, multSel);
    
    // Branch logic
    xor_gate zfXOR (.a(zf_wire), .b(op0), .z(brTrue)); // check branch condition
    and_gate brAND (.a(brTrue), .b(branch), .z(takeBr)); // check if branching
    
    assign zf = zf_wire;
    
    mux2to1 #(32) MultMux(.src0(aluTmp), .src1(multRes), .sel(multSel), .z(aluRes));
    
    // always @ (posedge(clk)) begin
    //     $display("alu inputs: %x, %x \tzf: %b, op0: %b, takeBr: %x", busA, srcB_2, zf, op0, takeBr);
    // end
        
endmodule