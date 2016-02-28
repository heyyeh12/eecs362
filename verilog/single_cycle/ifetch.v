module ifetch(initPC, firstPC, jrRegVal, imm32, rst, clk, curPC, nextPC, reg31Val, jr, jump, link, takeBr);

    // Interface
    input [31:0] initPC, firstPC, jrRegVal, imm32;
    input rst, clk, jr, jump, link, takeBr;
    output [31:0] curPC, nextPC, reg31Val;
   
    wire takeLeap, jr_wire, jump_wire, link_wire, takeBr_wire;
    wire [31:0] incPC, jmpPC, jmpOrBrPC, curPC_wire;
    
    // PC register
    dffa #(32) dffa (.d(firstPC), .clk(clk), .rst(0), .enable(1'b1), .q(curPC_wire), .aload(initPC), .arst(rst));
   assign curPC = curPC_wire;
    
    //
     mux2to1 #(1) getJR (.src0(jr), .src1(1'b0), .sel(rst), .z(jr_wire)); 
     mux2to1 #(1) getJump (.src0(jump), .src1(1'b0), .sel(rst), .z(jump_wire)); 
     mux2to1 #(1) getLink (.src0(link), .src1(1'b0), .sel(rst), .z(link_wire)); 
     mux2to1 #(1) getTakeBr (.src0(takeBr), .src1(1'b0), .sel(rst), .z(takeBr_wire)); 
    
    
    // increment PC by 4
    adder add4 (.a(32'b0100), .b(curPC_wire), .ctrl(4'b0000), .res(incPC));
    
    // increment PC by 4 again for reg31Val
    adder add8 (.a(32'b0100), .b(incPC), .ctrl(4'b0000), .res(reg31Val));
    
    // increment PC + 4 by immediate
    adder addImm (.a(incPC), .b(imm32), .ctrl(4'b0000), .res(jmpPC));
    
    
    or_gate jmpOR (.a(jump_wire), .b(takeBr_wire), .z(takeLeap)); // check if jumping or taking branch
    
    // take jump or branch
    mux2to1 #(32) jmpOrBrMux (.src0(incPC), .src1(jmpPC), .sel(takeLeap), .z(jmpOrBrPC));
    
    // take register jump
    mux2to1 #(32) jrRegValMux (.src0(jmpOrBrPC), .src1(jrRegVal), .sel(jr_wire), .z(nextPC));
    
    
    
    // DEBUG
    always @ (posedge(clk)) begin
        // $display("takeBr=%b", takeBr);
        // $display("incPC=%x, jmpPC=%x, jrRegVal=%x, jmpOrBrPC=%x", jmpOrBrPC, incPC, jmpPC, jrRegVal);
        $display("curPC=%x, nextPC=%x\n\n", curPC, nextPC);
    end
    
endmodule // ifetch