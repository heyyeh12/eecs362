
module mux32to1 ( src0, src1, src2, src3, src4, src5, src6, src7, src8, src9, 
        src10, src11, src12, src13, src14, src15, src16, src17, src18, src19, 
        src20, src21, src22, src23, src24, src25, src26, src27, src28, src29, 
        src30, src31, sel, z );
  input [31:0] src0;
  input [31:0] src1;
  input [31:0] src2;
  input [31:0] src3;
  input [31:0] src4;
  input [31:0] src5;
  input [31:0] src6;
  input [31:0] src7;
  input [31:0] src8;
  input [31:0] src9;
  input [31:0] src10;
  input [31:0] src11;
  input [31:0] src12;
  input [31:0] src13;
  input [31:0] src14;
  input [31:0] src15;
  input [31:0] src16;
  input [31:0] src17;
  input [31:0] src18;
  input [31:0] src19;
  input [31:0] src20;
  input [31:0] src21;
  input [31:0] src22;
  input [31:0] src23;
  input [31:0] src24;
  input [31:0] src25;
  input [31:0] src26;
  input [31:0] src27;
  input [31:0] src28;
  input [31:0] src29;
  input [31:0] src30;
  input [31:0] src31;
  input [4:0] sel;
  output [31:0] z;

  tri   [31:0] src0;
  tri   [31:0] src1;
  tri   [31:0] src2;
  tri   [31:0] src3;
  tri   [31:0] src4;
  tri   [31:0] src5;
  tri   [31:0] src6;
  tri   [31:0] src7;
  tri   [31:0] src8;
  tri   [31:0] src9;
  tri   [31:0] src10;
  tri   [31:0] src11;
  tri   [31:0] src12;
  tri   [31:0] src13;
  tri   [31:0] src14;
  tri   [31:0] src15;
  tri   [31:0] src16;
  tri   [31:0] src17;
  tri   [31:0] src18;
  tri   [31:0] src19;
  tri   [31:0] src20;
  tri   [31:0] src21;
  tri   [31:0] src22;
  tri   [31:0] src23;
  tri   [31:0] src24;
  tri   [31:0] src25;
  tri   [31:0] src26;
  tri   [31:0] src27;
  tri   [31:0] src28;
  tri   [31:0] src29;
  tri   [31:0] src30;
  tri   [31:0] src31;
  tri   [4:0] sel;
  tri   [31:0] z;
  tri   \z2[9] ;
  tri   \z2[8] ;
  tri   \z2[7] ;
  tri   \z2[6] ;
  tri   \z2[5] ;
  tri   \z2[4] ;
  tri   \z2[3] ;
  tri   \z2[31] ;
  tri   \z2[30] ;
  tri   \z2[2] ;
  tri   \z2[29] ;
  tri   \z2[28] ;
  tri   \z2[27] ;
  tri   \z2[26] ;
  tri   \z2[25] ;
  tri   \z2[24] ;
  tri   \z2[23] ;
  tri   \z2[22] ;
  tri   \z2[21] ;
  tri   \z2[20] ;
  tri   \z2[1] ;
  tri   \z2[19] ;
  tri   \z2[18] ;
  tri   \z2[17] ;
  tri   \z2[16] ;
  tri   \z2[15] ;
  tri   \z2[14] ;
  tri   \z2[13] ;
  tri   \z2[12] ;
  tri   \z2[11] ;
  tri   \z2[10] ;
  tri   \z2[0] ;
  tri   \z1[9] ;
  tri   \z1[8] ;
  tri   \z1[7] ;
  tri   \z1[6] ;
  tri   \z1[5] ;
  tri   \z1[4] ;
  tri   \z1[3] ;
  tri   \z1[31] ;
  tri   \z1[30] ;
  tri   \z1[2] ;
  tri   \z1[29] ;
  tri   \z1[28] ;
  tri   \z1[27] ;
  tri   \z1[26] ;
  tri   \z1[25] ;
  tri   \z1[24] ;
  tri   \z1[23] ;
  tri   \z1[22] ;
  tri   \z1[21] ;
  tri   \z1[20] ;
  tri   \z1[1] ;
  tri   \z1[19] ;
  tri   \z1[18] ;
  tri   \z1[17] ;
  tri   \z1[16] ;
  tri   \z1[15] ;
  tri   \z1[14] ;
  tri   \z1[13] ;
  tri   \z1[12] ;
  tri   \z1[11] ;
  tri   \z1[10] ;
  tri   \z1[0] ;

  mux16to1 M1 ( .p1(src0), .p2(src1), .p3(src2), .p4(src3), .p5(src4), .p6(
        src5), .p7(src6), .p8(src7), .p9(src8), .p10(src9), .p11(src10), .p12(
        src11), .p13(src12), .p14(src13), .p15(src14), .p16(src15), .p17(
        sel[3:0]), .p18({\z1[31] , \z1[30] , \z1[29] , \z1[28] , \z1[27] , 
        \z1[26] , \z1[25] , \z1[24] , \z1[23] , \z1[22] , \z1[21] , \z1[20] , 
        \z1[19] , \z1[18] , \z1[17] , \z1[16] , \z1[15] , \z1[14] , \z1[13] , 
        \z1[12] , \z1[11] , \z1[10] , \z1[9] , \z1[8] , \z1[7] , \z1[6] , 
        \z1[5] , \z1[4] , \z1[3] , \z1[2] , \z1[1] , \z1[0] }) );
  mux16to1 M2 ( .p1(src16), .p2(src17), .p3(src18), .p4(src19), .p5(src20), 
        .p6(src21), .p7(src22), .p8(src23), .p9(src24), .p10(src25), .p11(
        src26), .p12(src27), .p13(src28), .p14(src29), .p15(src30), .p16(src31), .p17(sel[3:0]), .p18({\z2[31] , \z2[30] , \z2[29] , \z2[28] , \z2[27] , 
        \z2[26] , \z2[25] , \z2[24] , \z2[23] , \z2[22] , \z2[21] , \z2[20] , 
        \z2[19] , \z2[18] , \z2[17] , \z2[16] , \z2[15] , \z2[14] , \z2[13] , 
        \z2[12] , \z2[11] , \z2[10] , \z2[9] , \z2[8] , \z2[7] , \z2[6] , 
        \z2[5] , \z2[4] , \z2[3] , \z2[2] , \z2[1] , \z2[0] }) );
  mux2to1 M3 ( .p1({\z1[31] , \z1[30] , \z1[29] , \z1[28] , \z1[27] , \z1[26] , 
        \z1[25] , \z1[24] , \z1[23] , \z1[22] , \z1[21] , \z1[20] , \z1[19] , 
        \z1[18] , \z1[17] , \z1[16] , \z1[15] , \z1[14] , \z1[13] , \z1[12] , 
        \z1[11] , \z1[10] , \z1[9] , \z1[8] , \z1[7] , \z1[6] , \z1[5] , 
        \z1[4] , \z1[3] , \z1[2] , \z1[1] , \z1[0] }), .p2({\z2[31] , \z2[30] , 
        \z2[29] , \z2[28] , \z2[27] , \z2[26] , \z2[25] , \z2[24] , \z2[23] , 
        \z2[22] , \z2[21] , \z2[20] , \z2[19] , \z2[18] , \z2[17] , \z2[16] , 
        \z2[15] , \z2[14] , \z2[13] , \z2[12] , \z2[11] , \z2[10] , \z2[9] , 
        \z2[8] , \z2[7] , \z2[6] , \z2[5] , \z2[4] , \z2[3] , \z2[2] , \z2[1] , 
        \z2[0] }), .p3(sel[4]), .p4(z) );
endmodule

