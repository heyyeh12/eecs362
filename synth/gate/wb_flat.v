
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
  tri   z2_9_;
  tri   z2_8_;
  tri   z2_7_;
  tri   z2_6_;
  tri   z2_5_;
  tri   z2_4_;
  tri   z2_3_;
  tri   z2_31_;
  tri   z2_30_;
  tri   z2_2_;
  tri   z2_29_;
  tri   z2_28_;
  tri   z2_27_;
  tri   z2_26_;
  tri   z2_25_;
  tri   z2_24_;
  tri   z2_23_;
  tri   z2_22_;
  tri   z2_21_;
  tri   z2_20_;
  tri   z2_1_;
  tri   z2_19_;
  tri   z2_18_;
  tri   z2_17_;
  tri   z2_16_;
  tri   z2_15_;
  tri   z2_14_;
  tri   z2_13_;
  tri   z2_12_;
  tri   z2_11_;
  tri   z2_10_;
  tri   z2_0_;
  tri   z1_9_;
  tri   z1_8_;
  tri   z1_7_;
  tri   z1_6_;
  tri   z1_5_;
  tri   z1_4_;
  tri   z1_3_;
  tri   z1_31_;
  tri   z1_30_;
  tri   z1_2_;
  tri   z1_29_;
  tri   z1_28_;
  tri   z1_27_;
  tri   z1_26_;
  tri   z1_25_;
  tri   z1_24_;
  tri   z1_23_;
  tri   z1_22_;
  tri   z1_21_;
  tri   z1_20_;
  tri   z1_1_;
  tri   z1_19_;
  tri   z1_18_;
  tri   z1_17_;
  tri   z1_16_;
  tri   z1_15_;
  tri   z1_14_;
  tri   z1_13_;
  tri   z1_12_;
  tri   z1_11_;
  tri   z1_10_;
  tri   z1_0_;

  mux16to1 M1 ( .p1(src0), .p2(src1), .p3(src2), .p4(src3), .p5(src4), .p6(
        src5), .p7(src6), .p8(src7), .p9(src8), .p10(src9), .p11(src10), .p12(
        src11), .p13(src12), .p14(src13), .p15(src14), .p16(src15), .p17(
        sel[3:0]), .p18({z1_31_, z1_30_, z1_29_, z1_28_, z1_27_, z1_26_, 
        z1_25_, z1_24_, z1_23_, z1_22_, z1_21_, z1_20_, z1_19_, z1_18_, z1_17_, 
        z1_16_, z1_15_, z1_14_, z1_13_, z1_12_, z1_11_, z1_10_, z1_9_, z1_8_, 
        z1_7_, z1_6_, z1_5_, z1_4_, z1_3_, z1_2_, z1_1_, z1_0_}) );
  mux16to1 M2 ( .p1(src16), .p2(src17), .p3(src18), .p4(src19), .p5(src20), 
        .p6(src21), .p7(src22), .p8(src23), .p9(src24), .p10(src25), .p11(
        src26), .p12(src27), .p13(src28), .p14(src29), .p15(src30), .p16(src31), .p17(sel[3:0]), .p18({z2_31_, z2_30_, z2_29_, z2_28_, z2_27_, z2_26_, z2_25_, 
        z2_24_, z2_23_, z2_22_, z2_21_, z2_20_, z2_19_, z2_18_, z2_17_, z2_16_, 
        z2_15_, z2_14_, z2_13_, z2_12_, z2_11_, z2_10_, z2_9_, z2_8_, z2_7_, 
        z2_6_, z2_5_, z2_4_, z2_3_, z2_2_, z2_1_, z2_0_}) );
  mux2to1 M3 ( .p1({z1_31_, z1_30_, z1_29_, z1_28_, z1_27_, z1_26_, z1_25_, 
        z1_24_, z1_23_, z1_22_, z1_21_, z1_20_, z1_19_, z1_18_, z1_17_, z1_16_, 
        z1_15_, z1_14_, z1_13_, z1_12_, z1_11_, z1_10_, z1_9_, z1_8_, z1_7_, 
        z1_6_, z1_5_, z1_4_, z1_3_, z1_2_, z1_1_, z1_0_}), .p2({z2_31_, z2_30_, 
        z2_29_, z2_28_, z2_27_, z2_26_, z2_25_, z2_24_, z2_23_, z2_22_, z2_21_, 
        z2_20_, z2_19_, z2_18_, z2_17_, z2_16_, z2_15_, z2_14_, z2_13_, z2_12_, 
        z2_11_, z2_10_, z2_9_, z2_8_, z2_7_, z2_6_, z2_5_, z2_4_, z2_3_, z2_2_, 
        z2_1_, z2_0_}), .p3(sel[4]), .p4(z) );
endmodule

