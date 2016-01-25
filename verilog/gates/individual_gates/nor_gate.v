
// NOR GATE


// Assuming it is okay to make NOR using operators instead of building from OR and NOT gates
// NOR has it's own symbol http://www.asic-world.com/verilog/operators2.html

module nor_gate (a, b, z);

// Ports

input a, b;
output z;

// Implementation

assign z = a ~| b;

endmodule


// module nor32to1 (a, z);

// // Ports

// input [31:0] a;
// output z;

// // Implementation
    
//     wire [15:0] nor16;
//     wire [7:0] nor8;
//     wire [3:0] nor4;
//     wire [1:0] nor2;
    
//     // 32 to 16
//     genvar i;
//     generate
//         for (i = 0; i < 16; i = i+1) begin :
//             nor_gate NOR16(.a(a[i]), .b(a[31-i]), .z(nor16[i]));
//         end
//     endgenerate

//     // 16 to 8
//     generate
//         for (i = 0; i < 8; i = i+1) begin :
//             nor_gate NOR8(.a(nor16[i]), .b(nor16[15-i]), .z(nor8[i]));
//         end
//     endgenerate
    
//     // 8 to 4
//     generate
//         for (i = 0; i < 4; i = i+1) begin :
//             nor_gate NOR4(.a(nor8[i]), .b(nor8[7-i]), .z(nor4[i]));
//         end
//     endgenerate
    
//     // 4 to 2
//     generate
//         for (i = 0; i < 2; i = i+1) begin :
//             nor_gate NOR2(.a(nor4[i]), .b(nor4[3-i]), .z(nor2[i]));
//         end
//     endgenerate
    
//     // 2 to 1
//     nor_gate NOR1(.a(nor4[0]), .b(nor4[1]), .z(z);

// endmodule // nor32to1