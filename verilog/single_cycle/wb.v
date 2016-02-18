module wb(memRd, rData, aluRes, wReg);

    input memRd;
    input [31:0] rData, aluRes;
    output [31:0] wReg;
    mux2to1 #(32) MUX(.src0(aluRes), .src1(rData), .sel(memRd), .z(wReg));

endmodule // wb