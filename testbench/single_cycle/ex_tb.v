module ex_tb;
    reg [31:0] busA, busB, im32;
    reg [3:0] aluCtrl;
    reg aluSrc, setInv, clk;
    wire [31:0] aluRes;
    wire zf, of, cf;
    
    ex ex(  .aluSrc(aluSrc),
            .aluCtrl(aluCtrl), 
            .setInv(setInv), 
            .busA(busA), 
            .busB(busB),
            .im32(im32), 
            .aluRes(aluRes),
            .zf(zf),
            .of(of),
            .cf(cf));
            
    initial begin
        clk = 0;
        $monitor("Inputs are busA: %d, busB: %d, im32: %d, aluCtrl: %b, aluSrc: %b, setInv: %b, aluRes = %d", busA, busB, im32, aluCtrl, aluSrc, setInv, aluRes);
        
        #0 busA = 32'd45; busB = 32'd3; im32 = 32'd8; aluCtrl = 4'b1111; aluSrc = 1'b0; setInv = 1'b0;
        #10 busA = 32'd123; busB = 32'd5; im32 = 32'd8; aluCtrl = 4'b1111; aluSrc = 1'b0; setInv = 1'b0;
        #10 busA = 32'd90; busB = 32'd6; im32 = 32'd8; aluCtrl = 4'b1111; aluSrc = 1'b1; setInv = 1'b0;
        #10 $finish;
    end
    
    always
        #5 clk = !clk;

endmodule