
module control ( instruction, aluCtrl, aluSrc, setInv, regDst, memRd, memWr, 
        regWr, branch, jr, jump, link, dSize, signExt, zeroExt, fp, not_trap
 );
  input [31:0] instruction;
  output [3:0] aluCtrl;
  output [1:0] dSize;
  output aluSrc, setInv, regDst, memRd, memWr, regWr, branch, jr, jump, link,
         signExt, zeroExt, fp, not_trap;
  wire   instruction_5, instruction_4, instruction_3, instruction_2,
         instruction_1, instruction_0, n1, n2, n3, n4, n5, n6, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75;
  assign instruction_5 = instruction[5];
  assign instruction_4 = instruction[4];
  assign instruction_3 = instruction[3];
  assign instruction_2 = instruction[2];
  assign instruction_1 = instruction[1];
  assign instruction_0 = instruction[0];

  OAI22_X2 U3 ( .A1(n16), .A2(n25), .B1(n26), .B2(n24), .ZN(signExt) );
  NOR4_X2 U4 ( .A1(branch), .A2(jump), .A3(n8), .A4(n27), .ZN(n26) );
  OR3_X2 U5 ( .A1(n28), .A2(n29), .A3(n30), .ZN(setInv) );
  NOR4_X2 U8 ( .A1(n9), .A2(n24), .A3(instruction_1), .A4(instruction_2), .ZN(
        n28) );
  OR4_X2 U9 ( .A1(link), .A2(memRd), .A3(n11), .A4(n36), .ZN(regWr) );
  OAI211_X2 U10 ( .C1(n37), .C2(instruction_0), .A(n1), .B(n38), .ZN(n36) );
  NAND2_X2 U12 ( .A1(n37), .A2(n41), .ZN(regDst) );
  AND4_X2 U15 ( .A1(instruction_4), .A2(instruction_2), .A3(n44), .A4(
        instruction_0), .ZN(n42) );
  NAND4_X2 U17 ( .A1(n45), .A2(n46), .A3(n2), .A4(n47), .ZN(not_trap) );
  NAND2_X2 U22 ( .A1(n43), .A2(n8), .ZN(n37) );
  AND2_X2 U23 ( .A1(instruction_4), .A2(instruction_5), .ZN(n43) );
  NAND2_X2 U27 ( .A1(n1), .A2(n45), .ZN(aluSrc) );
  NAND2_X2 U28 ( .A1(n46), .A2(n51), .ZN(n27) );
  NAND4_X2 U29 ( .A1(n45), .A2(n51), .A3(n2), .A4(n47), .ZN(n46) );
  NAND4_X2 U30 ( .A1(n52), .A2(n34), .A3(n14), .A4(n13), .ZN(n51) );
  OAI211_X2 U31 ( .C1(n47), .C2(n53), .A(n54), .B(n5), .ZN(aluCtrl[3]) );
  NAND2_X2 U36 ( .A1(instruction[31]), .A2(n12), .ZN(n48) );
  AND4_X2 U37 ( .A1(n58), .A2(n59), .A3(n60), .A4(n15), .ZN(branch) );
  OAI221_X2 U40 ( .B1(n47), .B2(n62), .C1(n31), .C2(n63), .A(n64), .ZN(
        aluCtrl[1]) );
  NAND2_X2 U42 ( .A1(instruction_1), .A2(n66), .ZN(n65) );
  NAND2_X2 U43 ( .A1(n34), .A2(instruction[28]), .ZN(n63) );
  AOI22_X2 U45 ( .A1(n67), .A2(n23), .B1(n19), .B2(instruction_1), .ZN(n62) );
  NAND2_X2 U46 ( .A1(n17), .A2(n68), .ZN(n67) );
  OR3_X2 U47 ( .A1(n69), .A2(n24), .A3(n22), .ZN(n68) );
  OAI221_X2 U48 ( .B1(n16), .B2(n54), .C1(n31), .C2(n70), .A(n71), .ZN(
        aluCtrl[0]) );
  AOI221_X2 U49 ( .B1(n11), .B2(instruction[27]), .C1(n72), .C2(n8), .A(n29), 
        .ZN(n71) );
  NOR4_X2 U50 ( .A1(n22), .A2(n9), .A3(instruction_0), .A4(instruction_1), 
        .ZN(n29) );
  OAI22_X2 U52 ( .A1(n23), .A2(n57), .B1(n73), .B2(n24), .ZN(n72) );
  NAND2_X2 U57 ( .A1(instruction_3), .A2(n75), .ZN(n69) );
  OR2_X2 U60 ( .A1(n56), .A2(n16), .ZN(n70) );
  NAND2_X2 U61 ( .A1(instruction[27]), .A2(n14), .ZN(n56) );
  NAND2_X2 U62 ( .A1(n52), .A2(instruction[29]), .ZN(n31) );
  NAND2_X2 U64 ( .A1(n58), .A2(n10), .ZN(n54) );
  NAND2_X2 U68 ( .A1(n59), .A2(n50), .ZN(n60) );
  NAND4_X2 U70 ( .A1(n59), .A2(n15), .A3(n14), .A4(n13), .ZN(n47) );
  INV_X4 U72 ( .A(n27), .ZN(n1) );
  INV_X4 U73 ( .A(jump), .ZN(n2) );
  INV_X4 U74 ( .A(n48), .ZN(n3) );
  INV_X4 U75 ( .A(n33), .ZN(n4) );
  INV_X4 U76 ( .A(n61), .ZN(n5) );
  INV_X4 U77 ( .A(n54), .ZN(n6) );
  INV_X4 U78 ( .A(n37), .ZN(fp) );
  INV_X4 U79 ( .A(n47), .ZN(n8) );
  INV_X4 U80 ( .A(n66), .ZN(n9) );
  INV_X4 U81 ( .A(n60), .ZN(n10) );
  INV_X4 U82 ( .A(n25), .ZN(n11) );
  INV_X4 U83 ( .A(instruction[30]), .ZN(n12) );
  INV_X4 U84 ( .A(instruction[29]), .ZN(n13) );
  INV_X4 U85 ( .A(instruction[28]), .ZN(n14) );
  INV_X4 U86 ( .A(instruction[27]), .ZN(n15) );
  INV_X4 U87 ( .A(instruction[26]), .ZN(n16) );
  INV_X4 U88 ( .A(n40), .ZN(n17) );
  INV_X4 U89 ( .A(n57), .ZN(n18) );
  INV_X4 U90 ( .A(n53), .ZN(n19) );
  INV_X4 U91 ( .A(instruction_5), .ZN(n20) );
  INV_X4 U92 ( .A(instruction_3), .ZN(n21) );
  INV_X4 U93 ( .A(instruction_2), .ZN(n22) );
  INV_X4 U94 ( .A(instruction_1), .ZN(n23) );
  INV_X4 U95 ( .A(instruction_0), .ZN(n24) );
  OAI33_X1 U96 ( .A1(n31), .A2(instruction[26]), .A3(n56), .B1(n65), .B2(
        instruction_2), .B3(instruction_0), .ZN(n33) );
  NOR2_X2 U97 ( .A1(n69), .A2(n47), .ZN(n66) );
  NOR2_X2 U98 ( .A1(n12), .A2(instruction[31]), .ZN(n52) );
  NAND3_X2 U99 ( .A1(instruction[29]), .A2(n14), .A3(n59), .ZN(n25) );
  NOR2_X2 U100 ( .A1(instruction[31]), .A2(instruction[30]), .ZN(n59) );
  NOR3_X2 U101 ( .A1(instruction[26]), .A2(instruction[27]), .A3(n14), .ZN(n35) );
  NOR2_X2 U102 ( .A1(n20), .A2(instruction_4), .ZN(n75) );
  NOR3_X2 U103 ( .A1(instruction_4), .A2(instruction_5), .A3(instruction_3), 
        .ZN(n40) );
  NOR2_X2 U104 ( .A1(instruction_3), .A2(instruction_1), .ZN(n44) );
  NOR3_X2 U105 ( .A1(n40), .A2(n43), .A3(n42), .ZN(n39) );
  NOR2_X2 U106 ( .A1(n16), .A2(instruction[27]), .ZN(n34) );
  NAND3_X2 U107 ( .A1(n22), .A2(n21), .A3(n75), .ZN(n57) );
  NOR3_X2 U108 ( .A1(n11), .A2(branch), .A3(n3), .ZN(n45) );
  NAND3_X2 U109 ( .A1(n75), .A2(n21), .A3(instruction_2), .ZN(n53) );
  OAI21_X2 U110 ( .B1(n35), .B2(n31), .A(n9), .ZN(n61) );
  NOR3_X2 U111 ( .A1(n16), .A2(n60), .A3(n15), .ZN(zeroExt) );
  NOR2_X2 U112 ( .A1(n2), .A2(n16), .ZN(link) );
  NOR3_X2 U113 ( .A1(instruction[29]), .A2(instruction[31]), .A3(n56), .ZN(
        jump) );
  NOR2_X2 U114 ( .A1(n13), .A2(n14), .ZN(n50) );
  NAND3_X2 U115 ( .A1(n16), .A2(n15), .A3(n50), .ZN(n49) );
  NOR3_X2 U116 ( .A1(n8), .A2(zeroExt), .A3(n11), .ZN(n58) );
  AOI211_X2 U117 ( .C1(n74), .C2(instruction_1), .A(n40), .B(n19), .ZN(n73) );
  NOR2_X2 U118 ( .A1(instruction_2), .A2(n69), .ZN(n74) );
  AOI21_X2 U119 ( .B1(n49), .B2(n16), .A(n48), .ZN(dSize[0]) );
  AOI21_X2 U120 ( .B1(n49), .B2(n15), .A(n48), .ZN(dSize[1]) );
  NOR2_X2 U121 ( .A1(n2), .A2(n12), .ZN(jr) );
  OAI21_X2 U122 ( .B1(n39), .B2(n40), .A(n8), .ZN(n38) );
  NOR2_X2 U123 ( .A1(n13), .A2(n48), .ZN(memWr) );
  NOR2_X2 U124 ( .A1(n48), .A2(instruction[29]), .ZN(memRd) );
  OAI21_X2 U125 ( .B1(n42), .B2(n39), .A(n8), .ZN(n41) );
  OAI21_X2 U126 ( .B1(n31), .B2(n32), .A(n4), .ZN(n30) );
  AOI21_X2 U127 ( .B1(n14), .B2(n34), .A(n35), .ZN(n32) );
  AOI21_X2 U128 ( .B1(n6), .B2(instruction[27]), .A(n33), .ZN(n64) );
  NAND3_X2 U129 ( .A1(n5), .A2(n45), .A3(n55), .ZN(aluCtrl[2]) );
  AOI211_X2 U130 ( .C1(n18), .C2(n8), .A(zeroExt), .B(jump), .ZN(n55) );
endmodule

