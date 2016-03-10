module wb(memRd, memRdData, aluRes, reg31Val);

    // Interface
    input memRd, link;                          // from ID
    input [1:0] dSize;                          // from ID
    input [31:0] memRdData;                     // from pipeline
    input [31:0] aluRes;                        // from EX
    input [31:0] reg31Val;                      // from MEM
    
    output [31:0] regWrData;                    // go to regfile
    
    
    // Internal Signals
    wire [31:0] dResize;
    wire [31:0] loadRegData;
    
    // resize memRdData based on dSize
    mux4to1 #(32) dsize_reg(.src0({24'b0, memRdData[31:24]}), .src1({16'b0, memRdData[31:16]}), .src2(memRdData), .src3(memRdData), .sel(dSize), .z(dResize));
    
    // choose between resized data and aluRes
    mux2to1 #(32) LOAD_REG(.src0(aluRes), .src1(dResize), .sel(memRd), .z(loadRegData));
    
    //choose between loadRegData and reg31Val (value to be stored in reg31 if link jump)
    mux2to1 #(32) loadRegORlink(.src0(loadRegData), .src1(reg31Val), .sel(link), .z(regWrData));

endmodule // wb