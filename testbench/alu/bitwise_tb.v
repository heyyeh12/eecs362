module testbench;
    reg [31:0] A, B;
    reg [1:0] ctrl;
    wire [31:0] Z;

    bitwise bitwise(.a(A), .b(B), .ctrl(ctrl), .res(Z));

    initial begin

        $monitoro("@%0dns A=%b B=%b res=%b",
                    $time, A, B, Z);
        // sll
        $display("--AND--");
        #0 A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; ctrl = 2'b00;
        #10 A = 32'hFFFFFFFF; B = 32'h00000000;
        #10 A = 32'hFFFFFFFF; B = 32'hF0F0F0F0;


        // srl
        #10 $display("--OR--");
        #10 A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; ctrl = 2'b01;
        #10 A = 32'hFFFFFFFF; B = 32'h00000000;
        #10 A = 32'hFFFFFFFF; B = 32'hF0F0F0F0;


        // sra
        #10 $display("--XOR--");
        #10 A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; ctrl = 2'b10;
        #10 A = 32'hFFFFFFFF; B = 32'h00000000;
        #10 A = 32'hFFFFFFFF; B = 32'hF0F0F0F0;

    end
endmodule