module ex(
    aluSrc, aluCtrl, setInv, 
    busA, busB, imm32,
    aluRes, isZero
    );
    
    // Interface
    input [3:0] aluCtrl;        // input into ALU, from ID
    input [31:0] busA, busB;    // from pipeline (from toplevel)
    input [31:0] imm32;         // sign extended immediate from sign extender in ID
    input aluSrc, setInv        // control signals from ID 
    
    output [31:0] aluRes;       // alu result
    output isZero               // used for branch logic in MEM stage
    
    
    
    // Internal Signals
    wire [31:0] srcB;           // second input to ALU
    wire [31:0] aluRes; 
    wire [31:0] mulRes;         // result of multiplier
    wire mulSel;                // selects if we take mulRes
    wire andTmp0, andTmp1;      // signals used for setting multiplier selector
    
    // choose between busB or imm32 as srcB for ALU
    mux2to1 #(32) Ms3B(.src0(busB), .src1(imm32), .sel(aluSrc), .z(srcB));
    
    // ALU -- might to explicity say that flag outputs are open
    alu alu(.a(busA), .b(srcB), .alu_ctrl(aluCtrl), .inverse_set(setInv), .res(aluRes));
    
    // Multiplier -- TODO, need to replace with WallaceTreeBooth multiplier
    assign multRes = busA * srcB;
    and_gate and_gate1 (aluCtrl[0], aluCtrl[1], andTmp0);
    and_gate and_gate2 (aluCtrl[2], aluCtrl[3], andTmp1);
    and_gate and_gate3 (andTmp0, andTmp1, multSel);
    
    // select between aluRes and multRes as final result
    mux2to1 #(32) MultMux(.src0(aluRes), .src1(multRes), .sel(multSel), .z(aluRes));
    
    // check if busA is zero for branching, set isZero
    nor32to1 checkisZero(.a(busA), .z(isZero));

    
endmodule