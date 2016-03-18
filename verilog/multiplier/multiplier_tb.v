module testbench;
    reg [31:0] a, b;
    wire [31:0] product_in_0, product_in_1, product_in_2, product_in_3;
    wire [31:0] product_out;
    
    multiplier multiplier_0(.a(a), .b(b), .product_in(product_in_0), .control(2'b11), .product_out(product_in_1));
    multiplier multiplier_1(.a(a), .b(b), .product_in(product_in_1), .control(2'b10), .product_out(product_in_2));
    multiplier multiplier_2(.a(a), .b(b), .product_in(product_in_2), .control(2'b01), .product_out(product_in_3));
    multiplier multiplier_3(.a(a), .b(b), .product_in(product_in_3), .control(2'b00), .product_out(product_out));
    
    initial begin

        $monitoro("@%0dns a=%h b=%h product_out=%h",
                    $time, a, b,product_out);
        $display("--MULTIPLICATION First Cycle--");
        #0 a = 32'd1; b = 32'hffffffff;
        #10 a = 32'hfffffffc; b = 32'hfffffffc;
        //#10 finish;
    end

endmodule