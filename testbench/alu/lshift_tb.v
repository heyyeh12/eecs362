module testbench;
    reg [31:0] A, B;
    reg [1:0] ctrl;
    wire [31:0] Z;

    lshift lshift(.a(A), .shamt(B), .res(Z));

    initial begin

        $monitoro("@%0dns A=%h shamt=%d res=%b",
                    $time, A, B, Z);
        // sll
        $display("---SHIFT LEFT LOGICAL--");
        #0 A = 32'hFFFFFFFF; B = 32'd1;
        #10 A = 32'hFFFFFFFF; B = 32'd2;
        #10 A = 32'hFFFFFFFF; B = 32'd3;
        #10 A = 32'hFFFFFFFF; B = 32'd7;
        #10 A = 32'hFFFFFFFF; B = 32'd15;
        #10 A = 32'hFFFFFFFF; B = 32'd16;
        #10 A = 32'h0FFFFFFF; B = 32'd31;
        #10 A = 32'h00000000; B = 32'd32;
        #10 A = 32'h00000000; B = 32'd33;

    end
endmodule