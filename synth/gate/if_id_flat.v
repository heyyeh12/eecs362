
module if_id ( clk, rst, ctrl, valid_d, valid_q, incPC_d, instr_d, incPC_q, 
        instr_q );
  input [1:0] ctrl;
  input [31:0] incPC_d;
  input [31:0] instr_d;
  output [31:0] incPC_q;
  output [31:0] instr_q;
  input clk, rst, valid_d;
  output valid_q;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149;

  DFFR_X1 incPC_q_reg_31_ ( .D(n135), .CK(clk), .RN(n146), .Q(incPC_q[31]) );
  DFFR_X1 incPC_q_reg_30_ ( .D(n134), .CK(clk), .RN(rst), .Q(incPC_q[30]) );
  DFFR_X1 incPC_q_reg_29_ ( .D(n133), .CK(clk), .RN(rst), .Q(incPC_q[29]) );
  DFFR_X1 incPC_q_reg_28_ ( .D(n132), .CK(clk), .RN(n146), .Q(incPC_q[28]) );
  DFFR_X1 incPC_q_reg_27_ ( .D(n131), .CK(clk), .RN(rst), .Q(incPC_q[27]) );
  DFFR_X1 incPC_q_reg_26_ ( .D(n130), .CK(clk), .RN(n146), .Q(incPC_q[26]) );
  DFFR_X1 incPC_q_reg_25_ ( .D(n129), .CK(clk), .RN(rst), .Q(incPC_q[25]) );
  DFFR_X1 incPC_q_reg_24_ ( .D(n128), .CK(clk), .RN(n146), .Q(incPC_q[24]) );
  DFFR_X1 incPC_q_reg_23_ ( .D(n127), .CK(clk), .RN(rst), .Q(incPC_q[23]) );
  DFFR_X1 incPC_q_reg_22_ ( .D(n126), .CK(clk), .RN(n146), .Q(incPC_q[22]) );
  DFFR_X1 incPC_q_reg_21_ ( .D(n125), .CK(clk), .RN(rst), .Q(incPC_q[21]) );
  DFFR_X1 incPC_q_reg_20_ ( .D(n124), .CK(clk), .RN(n146), .Q(incPC_q[20]) );
  DFFR_X1 incPC_q_reg_19_ ( .D(n123), .CK(clk), .RN(n146), .Q(incPC_q[19]) );
  DFFR_X1 incPC_q_reg_18_ ( .D(n122), .CK(clk), .RN(n147), .Q(incPC_q[18]) );
  DFFR_X1 incPC_q_reg_17_ ( .D(n121), .CK(clk), .RN(n147), .Q(incPC_q[17]) );
  DFFR_X1 incPC_q_reg_16_ ( .D(n120), .CK(clk), .RN(n147), .Q(incPC_q[16]) );
  DFFR_X1 incPC_q_reg_15_ ( .D(n119), .CK(clk), .RN(n147), .Q(incPC_q[15]) );
  DFFR_X1 incPC_q_reg_14_ ( .D(n118), .CK(clk), .RN(n147), .Q(incPC_q[14]) );
  DFFR_X1 incPC_q_reg_13_ ( .D(n117), .CK(clk), .RN(n147), .Q(incPC_q[13]) );
  DFFR_X1 incPC_q_reg_12_ ( .D(n116), .CK(clk), .RN(n147), .Q(incPC_q[12]) );
  DFFR_X1 incPC_q_reg_11_ ( .D(n115), .CK(clk), .RN(n147), .Q(incPC_q[11]) );
  DFFR_X1 incPC_q_reg_10_ ( .D(n114), .CK(clk), .RN(n147), .Q(incPC_q[10]) );
  DFFR_X1 incPC_q_reg_9_ ( .D(n113), .CK(clk), .RN(rst), .Q(incPC_q[9]) );
  DFFR_X1 incPC_q_reg_8_ ( .D(n112), .CK(clk), .RN(n146), .Q(incPC_q[8]) );
  DFFR_X1 incPC_q_reg_7_ ( .D(n111), .CK(clk), .RN(rst), .Q(incPC_q[7]) );
  DFFR_X1 incPC_q_reg_6_ ( .D(n110), .CK(clk), .RN(n146), .Q(incPC_q[6]) );
  DFFR_X1 incPC_q_reg_5_ ( .D(n109), .CK(clk), .RN(rst), .Q(incPC_q[5]) );
  DFFR_X1 incPC_q_reg_4_ ( .D(n108), .CK(clk), .RN(n146), .Q(incPC_q[4]) );
  DFFR_X1 incPC_q_reg_3_ ( .D(n107), .CK(clk), .RN(n147), .Q(incPC_q[3]) );
  DFFR_X1 incPC_q_reg_2_ ( .D(n106), .CK(clk), .RN(n146), .Q(incPC_q[2]) );
  DFFR_X1 incPC_q_reg_1_ ( .D(n105), .CK(clk), .RN(n147), .Q(incPC_q[1]) );
  DFFR_X1 incPC_q_reg_0_ ( .D(n104), .CK(clk), .RN(n147), .Q(incPC_q[0]) );
  DFFR_X1 instr_q_reg_31_ ( .D(n103), .CK(clk), .RN(n145), .Q(instr_q[31]) );
  DFFR_X1 instr_q_reg_30_ ( .D(n102), .CK(clk), .RN(n148), .Q(instr_q[30]) );
  DFFR_X1 instr_q_reg_29_ ( .D(n101), .CK(clk), .RN(n148), .Q(instr_q[29]) );
  DFFR_X1 instr_q_reg_28_ ( .D(n100), .CK(clk), .RN(n145), .Q(instr_q[28]) );
  DFFR_X1 instr_q_reg_27_ ( .D(n99), .CK(clk), .RN(n148), .Q(instr_q[27]) );
  DFFR_X1 instr_q_reg_26_ ( .D(n98), .CK(clk), .RN(n145), .Q(instr_q[26]) );
  DFFR_X1 instr_q_reg_25_ ( .D(n97), .CK(clk), .RN(n148), .Q(instr_q[25]) );
  DFFR_X1 instr_q_reg_24_ ( .D(n96), .CK(clk), .RN(n145), .Q(instr_q[24]) );
  DFFR_X1 instr_q_reg_23_ ( .D(n95), .CK(clk), .RN(n148), .Q(instr_q[23]) );
  DFFR_X1 instr_q_reg_22_ ( .D(n94), .CK(clk), .RN(n145), .Q(instr_q[22]) );
  DFFR_X1 instr_q_reg_21_ ( .D(n93), .CK(clk), .RN(n148), .Q(instr_q[21]) );
  DFFR_X1 instr_q_reg_20_ ( .D(n92), .CK(clk), .RN(n145), .Q(instr_q[20]) );
  DFFR_X1 instr_q_reg_19_ ( .D(n91), .CK(clk), .RN(n145), .Q(instr_q[19]) );
  DFFR_X1 instr_q_reg_18_ ( .D(n90), .CK(clk), .RN(n148), .Q(instr_q[18]) );
  DFFR_X1 instr_q_reg_17_ ( .D(n89), .CK(clk), .RN(n145), .Q(instr_q[17]) );
  DFFR_X1 instr_q_reg_16_ ( .D(n88), .CK(clk), .RN(n148), .Q(instr_q[16]) );
  DFFR_X1 instr_q_reg_15_ ( .D(n87), .CK(clk), .RN(n145), .Q(instr_q[15]) );
  DFFR_X1 instr_q_reg_14_ ( .D(n86), .CK(clk), .RN(n148), .Q(instr_q[14]) );
  DFFR_X1 instr_q_reg_13_ ( .D(n85), .CK(clk), .RN(n145), .Q(instr_q[13]) );
  DFFR_X1 instr_q_reg_12_ ( .D(n84), .CK(clk), .RN(n148), .Q(instr_q[12]) );
  DFFR_X1 instr_q_reg_11_ ( .D(n83), .CK(clk), .RN(n146), .Q(instr_q[11]) );
  DFFR_X1 instr_q_reg_10_ ( .D(n82), .CK(clk), .RN(rst), .Q(instr_q[10]) );
  DFFR_X1 instr_q_reg_9_ ( .D(n81), .CK(clk), .RN(n147), .Q(instr_q[9]) );
  DFFR_X1 instr_q_reg_8_ ( .D(n80), .CK(clk), .RN(n145), .Q(instr_q[8]) );
  DFFR_X1 instr_q_reg_7_ ( .D(n79), .CK(clk), .RN(rst), .Q(instr_q[7]) );
  DFFR_X1 instr_q_reg_6_ ( .D(n78), .CK(clk), .RN(n145), .Q(instr_q[6]) );
  DFFR_X1 instr_q_reg_5_ ( .D(n77), .CK(clk), .RN(n148), .Q(instr_q[5]) );
  DFFS_X1 instr_q_reg_4_ ( .D(n76), .CK(clk), .SN(rst), .Q(instr_q[4]) );
  DFFR_X1 instr_q_reg_3_ ( .D(n75), .CK(clk), .RN(n148), .Q(instr_q[3]) );
  DFFS_X1 instr_q_reg_2_ ( .D(n74), .CK(clk), .SN(rst), .Q(instr_q[2]) );
  DFFR_X1 instr_q_reg_1_ ( .D(n73), .CK(clk), .RN(n148), .Q(instr_q[1]) );
  DFFS_X1 instr_q_reg_0_ ( .D(n72), .CK(clk), .SN(n145), .Q(instr_q[0]) );
  DFFS_X1 valid_q_reg ( .D(n71), .CK(clk), .SN(n146), .Q(valid_q) );
  INV_X1 U3 ( .A(n1), .ZN(n71) );
  AOI21_X1 U4 ( .B1(n142), .B2(valid_q), .A(n137), .ZN(n1) );
  INV_X1 U5 ( .A(n4), .ZN(n81) );
  AOI22_X1 U6 ( .A1(instr_d[9]), .A2(n137), .B1(instr_q[9]), .B2(n143), .ZN(n4) );
  INV_X1 U7 ( .A(n5), .ZN(n80) );
  AOI22_X1 U8 ( .A1(instr_d[8]), .A2(n137), .B1(instr_q[8]), .B2(n143), .ZN(n5) );
  INV_X1 U9 ( .A(n6), .ZN(n79) );
  AOI22_X1 U10 ( .A1(instr_d[7]), .A2(n136), .B1(instr_q[7]), .B2(n141), .ZN(
        n6) );
  INV_X1 U11 ( .A(n7), .ZN(n78) );
  AOI22_X1 U12 ( .A1(instr_d[6]), .A2(n138), .B1(instr_q[6]), .B2(n143), .ZN(
        n7) );
  INV_X1 U13 ( .A(n8), .ZN(n77) );
  AOI22_X1 U14 ( .A1(instr_d[5]), .A2(n138), .B1(instr_q[5]), .B2(n142), .ZN(
        n8) );
  INV_X1 U15 ( .A(n9), .ZN(n76) );
  AOI221_X1 U16 ( .B1(instr_q[4]), .B2(n142), .C1(instr_d[4]), .C2(n137), .A(
        n10), .ZN(n9) );
  INV_X1 U17 ( .A(n11), .ZN(n75) );
  AOI22_X1 U18 ( .A1(instr_d[3]), .A2(n138), .B1(instr_q[3]), .B2(n141), .ZN(
        n11) );
  INV_X1 U19 ( .A(n12), .ZN(n103) );
  AOI22_X1 U20 ( .A1(instr_d[31]), .A2(n138), .B1(instr_q[31]), .B2(n141), 
        .ZN(n12) );
  INV_X1 U21 ( .A(n13), .ZN(n102) );
  AOI22_X1 U22 ( .A1(instr_d[30]), .A2(n138), .B1(instr_q[30]), .B2(n142), 
        .ZN(n13) );
  INV_X1 U23 ( .A(n14), .ZN(n74) );
  AOI221_X1 U24 ( .B1(instr_q[2]), .B2(n142), .C1(instr_d[2]), .C2(n137), .A(
        n10), .ZN(n14) );
  INV_X1 U25 ( .A(n15), .ZN(n101) );
  AOI22_X1 U26 ( .A1(instr_d[29]), .A2(n138), .B1(instr_q[29]), .B2(n142), 
        .ZN(n15) );
  INV_X1 U27 ( .A(n16), .ZN(n100) );
  AOI22_X1 U28 ( .A1(instr_d[28]), .A2(n136), .B1(instr_q[28]), .B2(n141), 
        .ZN(n16) );
  INV_X1 U29 ( .A(n17), .ZN(n99) );
  AOI22_X1 U30 ( .A1(instr_d[27]), .A2(n136), .B1(instr_q[27]), .B2(n142), 
        .ZN(n17) );
  INV_X1 U31 ( .A(n18), .ZN(n98) );
  AOI22_X1 U32 ( .A1(instr_d[26]), .A2(n136), .B1(instr_q[26]), .B2(n142), 
        .ZN(n18) );
  INV_X1 U33 ( .A(n19), .ZN(n97) );
  AOI22_X1 U34 ( .A1(instr_d[25]), .A2(n136), .B1(instr_q[25]), .B2(n143), 
        .ZN(n19) );
  INV_X1 U35 ( .A(n20), .ZN(n96) );
  AOI22_X1 U36 ( .A1(instr_d[24]), .A2(n136), .B1(instr_q[24]), .B2(n141), 
        .ZN(n20) );
  INV_X1 U37 ( .A(n21), .ZN(n95) );
  AOI22_X1 U38 ( .A1(instr_d[23]), .A2(n136), .B1(instr_q[23]), .B2(n141), 
        .ZN(n21) );
  INV_X1 U39 ( .A(n22), .ZN(n94) );
  AOI22_X1 U40 ( .A1(instr_d[22]), .A2(n136), .B1(instr_q[22]), .B2(n141), 
        .ZN(n22) );
  INV_X1 U41 ( .A(n23), .ZN(n93) );
  AOI22_X1 U42 ( .A1(instr_d[21]), .A2(n136), .B1(instr_q[21]), .B2(n141), 
        .ZN(n23) );
  INV_X1 U43 ( .A(n24), .ZN(n92) );
  AOI22_X1 U44 ( .A1(instr_d[20]), .A2(n136), .B1(instr_q[20]), .B2(n141), 
        .ZN(n24) );
  INV_X1 U45 ( .A(n25), .ZN(n73) );
  AOI22_X1 U46 ( .A1(instr_d[1]), .A2(n136), .B1(instr_q[1]), .B2(n141), .ZN(
        n25) );
  INV_X1 U47 ( .A(n26), .ZN(n91) );
  AOI22_X1 U48 ( .A1(instr_d[19]), .A2(n136), .B1(instr_q[19]), .B2(n141), 
        .ZN(n26) );
  INV_X1 U49 ( .A(n27), .ZN(n90) );
  AOI22_X1 U50 ( .A1(instr_d[18]), .A2(n136), .B1(instr_q[18]), .B2(n141), 
        .ZN(n27) );
  INV_X1 U51 ( .A(n28), .ZN(n89) );
  AOI22_X1 U52 ( .A1(instr_d[17]), .A2(n136), .B1(instr_q[17]), .B2(n141), 
        .ZN(n28) );
  INV_X1 U53 ( .A(n29), .ZN(n88) );
  AOI22_X1 U54 ( .A1(instr_d[16]), .A2(n136), .B1(instr_q[16]), .B2(n141), 
        .ZN(n29) );
  INV_X1 U55 ( .A(n30), .ZN(n87) );
  AOI22_X1 U56 ( .A1(instr_d[15]), .A2(n136), .B1(instr_q[15]), .B2(n141), 
        .ZN(n30) );
  INV_X1 U57 ( .A(n31), .ZN(n86) );
  AOI22_X1 U58 ( .A1(instr_d[14]), .A2(n136), .B1(instr_q[14]), .B2(n141), 
        .ZN(n31) );
  INV_X1 U59 ( .A(n32), .ZN(n85) );
  AOI22_X1 U60 ( .A1(instr_d[13]), .A2(n136), .B1(instr_q[13]), .B2(n141), 
        .ZN(n32) );
  INV_X1 U61 ( .A(n33), .ZN(n84) );
  AOI22_X1 U62 ( .A1(instr_d[12]), .A2(n136), .B1(instr_q[12]), .B2(n141), 
        .ZN(n33) );
  INV_X1 U63 ( .A(n34), .ZN(n83) );
  AOI22_X1 U64 ( .A1(instr_d[11]), .A2(n136), .B1(instr_q[11]), .B2(n141), 
        .ZN(n34) );
  INV_X1 U65 ( .A(n35), .ZN(n82) );
  AOI22_X1 U66 ( .A1(instr_d[10]), .A2(n136), .B1(instr_q[10]), .B2(n141), 
        .ZN(n35) );
  INV_X1 U67 ( .A(n36), .ZN(n72) );
  AOI221_X1 U68 ( .B1(instr_q[0]), .B2(n143), .C1(instr_d[0]), .C2(n137), .A(
        n10), .ZN(n36) );
  NOR2_X1 U69 ( .A1(n2), .A2(ctrl[0]), .ZN(n10) );
  INV_X1 U70 ( .A(n37), .ZN(n113) );
  AOI22_X1 U71 ( .A1(incPC_d[9]), .A2(n136), .B1(incPC_q[9]), .B2(n141), .ZN(
        n37) );
  INV_X1 U72 ( .A(n38), .ZN(n112) );
  AOI22_X1 U73 ( .A1(incPC_d[8]), .A2(n136), .B1(incPC_q[8]), .B2(n141), .ZN(
        n38) );
  INV_X1 U74 ( .A(n39), .ZN(n111) );
  AOI22_X1 U75 ( .A1(incPC_d[7]), .A2(n136), .B1(incPC_q[7]), .B2(n142), .ZN(
        n39) );
  INV_X1 U76 ( .A(n40), .ZN(n110) );
  AOI22_X1 U77 ( .A1(incPC_d[6]), .A2(n137), .B1(incPC_q[6]), .B2(n142), .ZN(
        n40) );
  INV_X1 U78 ( .A(n41), .ZN(n109) );
  AOI22_X1 U79 ( .A1(incPC_d[5]), .A2(n137), .B1(incPC_q[5]), .B2(n142), .ZN(
        n41) );
  INV_X1 U80 ( .A(n42), .ZN(n108) );
  AOI22_X1 U81 ( .A1(incPC_d[4]), .A2(n137), .B1(incPC_q[4]), .B2(n142), .ZN(
        n42) );
  INV_X1 U82 ( .A(n43), .ZN(n107) );
  AOI22_X1 U83 ( .A1(incPC_d[3]), .A2(n137), .B1(incPC_q[3]), .B2(n142), .ZN(
        n43) );
  INV_X1 U84 ( .A(n44), .ZN(n135) );
  AOI22_X1 U85 ( .A1(incPC_d[31]), .A2(n137), .B1(incPC_q[31]), .B2(n142), 
        .ZN(n44) );
  INV_X1 U86 ( .A(n45), .ZN(n134) );
  AOI22_X1 U87 ( .A1(incPC_d[30]), .A2(n137), .B1(incPC_q[30]), .B2(n142), 
        .ZN(n45) );
  INV_X1 U88 ( .A(n46), .ZN(n106) );
  AOI22_X1 U89 ( .A1(incPC_d[2]), .A2(n137), .B1(incPC_q[2]), .B2(n142), .ZN(
        n46) );
  INV_X1 U90 ( .A(n47), .ZN(n133) );
  AOI22_X1 U91 ( .A1(incPC_d[29]), .A2(n137), .B1(incPC_q[29]), .B2(n142), 
        .ZN(n47) );
  INV_X1 U92 ( .A(n48), .ZN(n132) );
  AOI22_X1 U93 ( .A1(incPC_d[28]), .A2(n137), .B1(incPC_q[28]), .B2(n142), 
        .ZN(n48) );
  INV_X1 U94 ( .A(n49), .ZN(n131) );
  AOI22_X1 U95 ( .A1(incPC_d[27]), .A2(n137), .B1(incPC_q[27]), .B2(n142), 
        .ZN(n49) );
  INV_X1 U96 ( .A(n50), .ZN(n130) );
  AOI22_X1 U97 ( .A1(incPC_d[26]), .A2(n137), .B1(incPC_q[26]), .B2(n142), 
        .ZN(n50) );
  INV_X1 U98 ( .A(n51), .ZN(n129) );
  AOI22_X1 U99 ( .A1(incPC_d[25]), .A2(n137), .B1(incPC_q[25]), .B2(n143), 
        .ZN(n51) );
  INV_X1 U100 ( .A(n52), .ZN(n128) );
  AOI22_X1 U101 ( .A1(incPC_d[24]), .A2(n138), .B1(incPC_q[24]), .B2(n143), 
        .ZN(n52) );
  INV_X1 U102 ( .A(n53), .ZN(n127) );
  AOI22_X1 U103 ( .A1(incPC_d[23]), .A2(n138), .B1(incPC_q[23]), .B2(n143), 
        .ZN(n53) );
  INV_X1 U104 ( .A(n54), .ZN(n126) );
  AOI22_X1 U105 ( .A1(incPC_d[22]), .A2(n138), .B1(incPC_q[22]), .B2(n143), 
        .ZN(n54) );
  INV_X1 U106 ( .A(n55), .ZN(n125) );
  AOI22_X1 U107 ( .A1(incPC_d[21]), .A2(n138), .B1(incPC_q[21]), .B2(n143), 
        .ZN(n55) );
  INV_X1 U108 ( .A(n56), .ZN(n124) );
  AOI22_X1 U109 ( .A1(incPC_d[20]), .A2(n138), .B1(incPC_q[20]), .B2(n143), 
        .ZN(n56) );
  INV_X1 U110 ( .A(n57), .ZN(n105) );
  AOI22_X1 U111 ( .A1(incPC_d[1]), .A2(n138), .B1(incPC_q[1]), .B2(n143), .ZN(
        n57) );
  INV_X1 U112 ( .A(n58), .ZN(n123) );
  AOI22_X1 U113 ( .A1(incPC_d[19]), .A2(n138), .B1(incPC_q[19]), .B2(n143), 
        .ZN(n58) );
  INV_X1 U114 ( .A(n59), .ZN(n122) );
  AOI22_X1 U115 ( .A1(incPC_d[18]), .A2(n138), .B1(incPC_q[18]), .B2(n143), 
        .ZN(n59) );
  INV_X1 U116 ( .A(n60), .ZN(n121) );
  AOI22_X1 U117 ( .A1(incPC_d[17]), .A2(n138), .B1(incPC_q[17]), .B2(n143), 
        .ZN(n60) );
  INV_X1 U118 ( .A(n61), .ZN(n120) );
  AOI22_X1 U119 ( .A1(incPC_d[16]), .A2(n138), .B1(incPC_q[16]), .B2(n143), 
        .ZN(n61) );
  INV_X1 U120 ( .A(n62), .ZN(n119) );
  AOI22_X1 U121 ( .A1(incPC_d[15]), .A2(n138), .B1(incPC_q[15]), .B2(n143), 
        .ZN(n62) );
  INV_X1 U122 ( .A(n63), .ZN(n118) );
  AOI22_X1 U123 ( .A1(incPC_d[14]), .A2(n138), .B1(incPC_q[14]), .B2(n143), 
        .ZN(n63) );
  INV_X1 U124 ( .A(n64), .ZN(n117) );
  AOI22_X1 U125 ( .A1(incPC_d[13]), .A2(n138), .B1(incPC_q[13]), .B2(n142), 
        .ZN(n64) );
  INV_X1 U126 ( .A(n65), .ZN(n116) );
  AOI22_X1 U127 ( .A1(incPC_d[12]), .A2(n138), .B1(incPC_q[12]), .B2(n143), 
        .ZN(n65) );
  INV_X1 U128 ( .A(n66), .ZN(n115) );
  AOI22_X1 U129 ( .A1(incPC_d[11]), .A2(n138), .B1(incPC_q[11]), .B2(n142), 
        .ZN(n66) );
  INV_X1 U130 ( .A(n67), .ZN(n114) );
  AOI22_X1 U131 ( .A1(incPC_d[10]), .A2(n138), .B1(incPC_q[10]), .B2(n143), 
        .ZN(n67) );
  INV_X1 U132 ( .A(n68), .ZN(n104) );
  AOI22_X1 U133 ( .A1(incPC_d[0]), .A2(n138), .B1(incPC_q[0]), .B2(n143), .ZN(
        n68) );
  INV_X1 U134 ( .A(n69), .ZN(n2) );
  OAI21_X1 U135 ( .B1(ctrl[1]), .B2(ctrl[0]), .A(n70), .ZN(n69) );
  INV_X1 U136 ( .A(n70), .ZN(n3) );
  NAND2_X1 U137 ( .A1(ctrl[1]), .A2(ctrl[0]), .ZN(n70) );
  INV_X4 U138 ( .A(n2), .ZN(n140) );
  INV_X4 U139 ( .A(n149), .ZN(n147) );
  INV_X4 U140 ( .A(n149), .ZN(n148) );
  INV_X4 U141 ( .A(n139), .ZN(n136) );
  INV_X4 U142 ( .A(n2), .ZN(n144) );
  INV_X4 U143 ( .A(n140), .ZN(n141) );
  INV_X4 U144 ( .A(n144), .ZN(n142) );
  INV_X4 U145 ( .A(n144), .ZN(n143) );
  INV_X4 U146 ( .A(n3), .ZN(n139) );
  INV_X4 U147 ( .A(n139), .ZN(n137) );
  INV_X4 U148 ( .A(n139), .ZN(n138) );
  INV_X4 U149 ( .A(rst), .ZN(n149) );
  INV_X4 U150 ( .A(n149), .ZN(n145) );
  INV_X4 U151 ( .A(n149), .ZN(n146) );
endmodule

