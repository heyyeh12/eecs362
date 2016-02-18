module regfile(rs1, rs2, rd, rData1, rData2, wData, regWr, clk);

    // rsA and rsB are read registers
    // rd is writing to 
    // rdata is read data
    // wdata write data
    // regWr, enabling writing
    
    // Interface
    parameter SIZE=32;
    
    input [4:0] rs1, rs2, rd;
    input [31:0] wData;
    input regWr, clk;
    output [31:0] rData1, rData2;
    reg [31:0] mem[(SIZE-1):0];
    initial mem[0] = 32'd0;
    
   
   integer i;
   initial begin
     for (i = 0; i < 32; i = i + 1)
            mem[i] = 8'h0;
    
    end
    
    // Read
    assign rData1 = mem[rs1];
    assign rData2 = mem[rs2];
    
    // Write
    always @ (posedge clk) begin
        if (regWr) begin
            if (rd == 5'b0)
                $display("don't write to register 0!!!");
            else
                $display("writing val %x to register %x ", wData, rd);
                mem[rd] <= wData[31:0];
        end
        
        $display("============REGISTER DUMP============");
        $display("reg %x: %x \t reg %x: %x", 0, mem[0],  4, mem[4]);
        $display("reg %x: %x \t reg %x: %x", 5, mem[5],  6, mem[6]);
        $display("=====================================");
        // for (i = 0; i < 32; i = i + 1)
        //     $display("reg %x: %x", i, mem[i]);
         
    end
    
endmodule // regfile