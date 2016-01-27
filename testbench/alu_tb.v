// `include "./alu_const.vh"
module testbench;
    reg [31:0] A, B;
    reg [1:0] ctrl;
    wire [31:0] Z;
    wire zf, of, cf;

    alu alu(.a(A), .b(B), .ctrl(ctrl), .res(Z), .zf(zf), .of(of), .cf(cf));
    
    initial begin

        $monitoro("@%0dns A=%h B=%h res=%b zf=%b, of=%b, cf=%b",
                    $time, A, B, Z, zf, of, cf);
        $display("--SLL--");
        #0 A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; ctrl = alu_sll;
        
        $display("--ADD--");
        #10 A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; ctrl = alu_add;
        #10 A = 32'hFFFFFFFF; B = 32'h00000000;
        #10 A = 32'hFFFFFFFF; B = 32'hF0F0F0F0;

        #10 $display("--SUB--");
        #10 A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; ctrl = alu_sub;
        #10 A = 32'hFFFFFFFF; B = 32'h00000000;
        #10 A = 32'hFFFFFFFF; B = 32'hF0F0F0F0;


    end
endmodule