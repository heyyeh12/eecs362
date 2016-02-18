module testbench;
    reg [15:0] imm;
    reg signExt;
    wire [31:0] res;

    sign_extender SIGN_EXTENSION(.imm(imm), .signExt(signExt), .res(res));
    initial begin // testing alu ops

        $monitoro("@%0dns Immediate value = %b, signExt = %b, Result = %b",
                    $time, imm, signExt, res);
        #0 imm = 16'b1010_1010_1010_1010; signExt = 1'b1;
        #10 imm = 16'b0010_1010_1010_1010; signExt = 1'b1;
        #10 imm = 16'b1111_1111_1111_1111; signExt = 1'b1;
        #10 imm = 16'b0000_1111_0000_1111; signExt = 1'b1;
        #10 imm = 16'b1111_0000_1111_0000; signExt = 1'b1;
        
        #10 imm = 16'b1010_1010_1010_1010; signExt = 1'b0;
        #10 imm = 16'b0010_1010_1010_1010; signExt = 1'b0;
        #10 imm = 16'b1111_1111_1111_1111; signExt = 1'b0;
        #10 imm = 16'b0000_1111_0000_1111; signExt = 1'b0;
        #10 imm = 16'b1111_0000_1111_0000; signExt = 1'b0;
        
    end 
endmodule