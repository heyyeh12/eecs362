`include "/home/ubuntu/workspace/eecs362/verilog/alu/alu_const.vh"
module testbench;
    reg [31:0] A, B;
    reg [3:0] alu_ctrl;
    reg inverse_set;
    wire [31:0] Z;
    wire zf, of, cf;

    alu alu(.a(A), .b(B), .alu_ctrl(alu_ctrl), .inverse_set(inverse_set), .res(Z), .zf(zf), .of(of), .cf(cf));
    
    initial begin

        $monitoro("@%0dns A=%h B=%h res=%h zf=%b, of=%b, cf=%b",
                    $time, A, B, Z, zf, of, cf);
        $display("--SLL--");
        #0 A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; alu_ctrl = 4'b0010; inverse_set = 1'b0; 
        #10 A = 32'hFFFFFFFF; B = 32'h00000000;
        #10 A = 32'hFFFFFFFF; B = 32'hF0F0F0F0;
        
        #10 $display("--ADD--");
        #10 A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; alu_ctrl =  4'b0100; inverse_set = 1'b0; 
        #10 A = 32'hFFFFFFFF; B = 32'h00000000;
        #10 A = 32'hFFFFFFFF; B = 32'hF0F0F0F0;

        #10 $display("--SUB--");
        #10 A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; alu_ctrl = 4'b0101; inverse_set = 1'b0; 
        #10 A = 32'hFFFFFFFF; B = 32'h00000000;
        #10 A = 32'hFFFFFFFF; B = 32'hF0F0F0F0;

        #10 $display("--AND--");
        #10 A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; alu_ctrl = 4'b1000; inverse_set = 1'b1; 
        #10 A = 32'hFFFFFFFF; B = 32'h00000000;
        #10 A = 32'hFFFFFFFF; B = 32'hF0F0F0F0;
        
        #10 $display("--OR--");
        #10 A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; alu_ctrl = 4'b1001; inverse_set = 1'b0; 
        #10 A = 32'h00000000; B = 32'h00000000;
        #10 A = 32'hF0F0F0F0; B = 32'hF0F0F0F0;
        
        #10 $display("--SEQ--");
        #10 A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; alu_ctrl = 4'b1100; inverse_set = 1'b0; 
        #10 A = 32'hFFFFFFFF; B = 32'h00000000;
        #10 A = 32'hFFFFFFFF; B = 32'hF0F0F0F0;
        
        #10 $display("--SNEQ--");
        #10 A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; alu_ctrl = 4'b1100; inverse_set = 1'b1; 
        #10 A = 32'hFFFFFFFF; B = 32'h00000000;
        #10 A = 32'hFFFFFFFF; B = 32'hF0F0F0F0;

    end
endmodule