module regfile_tb;
    reg [31:0] wData;
    reg [4:0] rsA, rsB, rd;
    reg regWr, clk;
    wire [31:0] rDataA, rDataB;
    

    regfile regfile(.rs1(rsA), .rs2(rsB), .rd(rd), .rData1(rDataA), .rData2(rDataB), .wData(wData), .regWr(regWr), .clk(clk));
    
    initial begin
        clk = 0;
        wData = 32'h0;
        $monitor("A) reading val %x from register %x\nB) reading val %x from register %x ", rDataA, rsA, rDataB, rsB);
        #0 wData = 32'h1; rd = 5'd1; regWr = 1'b1; rsA = 5'd0; rsB = 5'd1;
        #10 wData = 32'h2; rd = 5'd2; regWr = 1'b1; rsA = 5'd1; rsB = 5'd2;
        #10 wData = 32'h3; rd = 5'd3; regWr = 1'b0; rsA = 5'd2; rsB = 5'd3;
        #10 wData = 32'h4; rd = 5'd4; regWr = 1'b1; rsA = 5'd3; rsB = 5'd4;
        #10 regWr = 1'b1; rd = 5'd0;
        #10 wData = 32'h1000; rd = 5'd31; rsA = 5'd4;
        #10 regWr = 1'b0;  
        #10 rsA = 5'd31;
        #10 $finish;
    end
    
    always
        #5 clk = !clk;

endmodule