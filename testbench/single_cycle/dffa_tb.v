module testbench;
    reg [31:0] d, aload;
    reg clk, rst, enable, arst;
    wire [31:0] q;

    dffa #(32) dffa(d, clk, rst, enable, q, aload, arst);
    
    initial begin

        $monitoro("@%0dns d=%x, clk = %b, rst = %b, enable = %b, q = %x, aload = %x, arst = %b\n",
                    $time, d, clk, rst, enable, q, aload, arst);
        // sll
        $display("---ZERO FLAG TEST--");
        enable = 1'b1;
        clk = 0;
        rst = 1;
        d = 32'h1;
        #0 
        #10 rst = 0; d = 32'h2;
        #10 d = 32'h3;
        #10 d = 32'h4;
        #10 d = 32'h5;
        #10 $finish;

    end
    
    always
        #5 clk = !clk;
        
endmodule