module topLevel();

//  implement interface between pipeline & data memory & instruction memory
// this is directly copied from memory.v - memload_example()
    parameter IMEMFILE = "instr.hex";
    parameter DMEMFILE = "data.hex";
    reg [8*80-1:0] filename;
    
    reg clk, rst;
    wire [31:0] iaddr, instr;
    wire [31:0] memAddr, memWrData, memRdData, busA, busB, busFP, regWrData;
    wire [1:0] dsize;
    wire [4:0] rs1, rs2, rd;
    wire memWr, fp, regWr;
    // created wire for regWr - do we need one?


    integer dfileobj, dmaddr, r, k, i;

    // CONNECTING THE WIRES
    imem #(.SIZE(16384)) IMEM(.addr(iaddr), .instr(instr));
    dmem #(.SIZE(16384)) DMEM(.addr(memAddr), .rData(memRdData), .wData(memWrData), .writeEnable(memWr), .dsize(dsize), .clk(clk));
    regfile regfile(
        .rs1(rs1), .rs2(rs2), .rd(rd), .rData1(busA), .rData2(busB),
        .wData(regWrData), .regWr(regWr), .clk(clk)
    );
    
    fpregfile fpreg (
        .rs(rs1), .rd(rd), .rData(busFP), 
        .wData(regWrData), .regWr(regWr), .fp(fp), .clk(clk)
    );
    
    pipeline CPU(
        .clk(clk), .rst(rst), .initPC(32'h0000),
        .instruction(instr), .iAddr(iaddr),
        .memAddr(memAddr), .memRdData(memRdData), .memWrData(memWrData), .dSize(dsize), .memWr(memWr),
        .busA(busA), .busB(busB), .busFP(busFP), .rs1(rs1), .rs2(rs2), .rd(rd), .regWrData(regWrData), .regWr(regWr), .fp(fp)
    );
    
    // EXECUTING INSTRUCTIONS
    initial begin
    
        // Clear DMEM
        for (i = 0; i < DMEM.SIZE; i = i + 1)
            DMEM.mem[i] = 8'h0;

        // Load IMEM from file
        if (!$value$plusargs("instrfile=%s", filename)) begin
            filename = IMEMFILE;
        end
        $readmemh(filename, IMEM.mem);
        
        // Load DMEM from file
        if (!$value$plusargs("datafile=%s", filename)) begin
            filename = DMEMFILE;
        end
        $readmemh(filename, DMEM.mem);

        //// Debug: dump memory
        $writememh("imem", IMEM.mem);
        $writememh("dmem", DMEM.mem);
   
        clk = 1;rst = 1;
        // $monitor("%b: Instr [%x] = %x", clk, iaddr, instr);
    
        #0
        #7 rst = 0;
        #50 $finish;
        

    end // initial
    
    always
        #5 clk = !clk; 
    
    // DEBUG
    
    always @ (posedge(clk)) begin
    
        $display("\n----------time: @%0dns---------", $time);
        $display("Instr [%x] = %x", iaddr, instr);
        //$display("memAddr: %x, memRdData: %x, memWrData: %x, memWr: %b", memAddr, memRdData, memWrData, memWr);
        $display("reg4 =%x", regfile.mem[4]);
        $display("reg5 =%x", regfile.mem[5]);
        $display("reg6 =%x", regfile.mem[6]);
        
        $display("if/id incPC=%x", CPU.incPC_0);
       // $display("reg4 =%x", regfile.mem[4]);
       
    end
        
endmodule