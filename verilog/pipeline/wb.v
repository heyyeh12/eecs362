module wb(
    memRd, link, fp, regWr,
    memRdData, aluRes, reg31Val, busFP, //busA,
    regWrData, dSize);
    
        // Interface
    input memRd, link, fp, regWr;               // from ID
    input [1:0] dSize;                          // from ID
    input [31:0] memRdData;                     // from pipeline
    input [31:0] aluRes;                        // from EX
    input [31:0] reg31Val;                      // from MEM
    input [31:0] busFP;                         // from fp regfile
    //input [31:0] busA;                          // from regfile
    
    output [31:0] regWrData;                    // go to regfile
    
    
    // Internal Signals
    wire [31:0] dResize;
    wire [31:0] loadRegData;
    wire selWhichFP;        // selects which data to write depending on which fp instruction is called
                            // selWhichFP = 1 when instr = movfp2i
    wire [31:0] beforeFP;

    wire [31:0] byteData, wordData, dwordData;

// will need additonal muxing to choose whether or not for fp reg's
    // if movfp2i, write fpr (rs1) value to gpr (rd)

    // resize memRdData based on dSize
    assign byteData = {24'b0, memRdData[31:24]};
    assign wordData = {16'b0, memRdData[31:16]};
    assign dwordData = memRdData;
    mux4to1 #(32) dsize_reg(.src0({24'b0, memRdData[31:24]}), .src1({16'b0, memRdData[31:16]}), .src2(memRdData), .src3(memRdData), .sel(dSize), .z(dResize));
    
    // choose between resized data and aluRes
    mux2to1 #(32) LOAD_REG(.src0(aluRes), .src1(dResize), .sel(memRd), .z(loadRegData));
    
    //choose between loadRegData and reg31Val (value to be stored in reg31 if link jump)
    mux2to1 #(32) loadRegORlink(.src0(loadRegData), .src1(reg31Val), .sel(link), .z(beforeFP));
    
    
    // set selWhichFP
    and_gate saskdjfhf (.a(regWr), .b(fp), .z(selWhichFP));
    //assign selWhichFP = regWr and fp;
    
    // choose between busFP and beforeFP -- this is for movfp2i
    mux2to1 #(32) fpReg(.src0(beforeFP), .src1(busFP), .sel(selWhichFP), .z(regWrData));
    
    

endmodule // wb