module testbench;
    reg [31:0] A, B;
    reg [1:0] ctrl;
    wire [31:0] Z;
    wire cout;

    adder adder(.a(A), .b(B), .ctrl(ctrl), .res(Z), .cout(cout));
    
    initial begin

        $monitoro("@%0dns A=%h B=%h res=%b cout=%b",
                    $time, A, B, Z, cout);
        $display("--ADD--");
        #0 A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; ctrl = 2'b00;
        #10 A = 32'hFFFFFFFF; B = 32'h00000000;
        #10 A = 32'hFFFFFFFF; B = 32'hF0F0F0F0;

        #10 $display("--SUB--");
        #10 A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; ctrl = 2'b01;
        #10 A = 32'hFFFFFFFF; B = 32'h00000000;
        #10 A = 32'hFFFFFFFF; B = 32'hF0F0F0F0;


    end
endmodule