
module hazard_detect ( id_instr, ex_instr, mem_instr, id_rs1, id_rs2, ex_rd, 
        mem_rd, wb_rd, id_regDst, ex_valid, mem_valid, wb_valid, mem_memRd, 
        ex_memWr, takeLeap, busA_sel, busB_sel, memWrData_sel, if_id_ctrl, 
        id_ex_ctrl, ex_mem_ctrl, mem_wb_ctrl, pc_enable );
  input [31:0] id_instr;
  input [31:0] ex_instr;
  input [31:0] mem_instr;
  input [4:0] id_rs1;
  input [4:0] id_rs2;
  input [4:0] ex_rd;
  input [4:0] mem_rd;
  input [4:0] wb_rd;
  output [1:0] busA_sel;
  output [1:0] busB_sel;
  output [1:0] memWrData_sel;
  output [1:0] if_id_ctrl;
  output [1:0] id_ex_ctrl;
  output [1:0] ex_mem_ctrl;
  output [1:0] mem_wb_ctrl;
  input id_regDst, ex_valid, mem_valid, wb_valid, mem_memRd, ex_memWr,
         takeLeap;
  output pc_enable;
  wire   n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113;

  NAND2_X1 U45 ( .A1(n45), .A2(ex_mem_ctrl[1]), .ZN(if_id_ctrl[1]) );
  NAND2_X1 U46 ( .A1(n46), .A2(memWrData_sel[0]), .ZN(memWrData_sel[1]) );
  INV_X1 U47 ( .A(mem_memRd), .ZN(n46) );
  NOR4_X1 U48 ( .A1(n47), .A2(n48), .A3(n49), .A4(n50), .ZN(memWrData_sel[0])
         );
  NAND4_X1 U49 ( .A1(n51), .A2(n52), .A3(n53), .A4(n54), .ZN(n50) );
  NOR3_X1 U50 ( .A1(ex_instr[25]), .A2(ex_instr[27]), .A3(ex_instr[26]), .ZN(
        n54) );
  NOR2_X1 U51 ( .A1(ex_instr[24]), .A2(ex_instr[23]), .ZN(n53) );
  NOR3_X1 U52 ( .A1(ex_instr[20]), .A2(ex_instr[22]), .A3(ex_instr[21]), .ZN(
        n52) );
  NOR2_X1 U53 ( .A1(ex_instr[1]), .A2(ex_instr[19]), .ZN(n51) );
  NAND4_X1 U54 ( .A1(n55), .A2(n56), .A3(n57), .A4(n58), .ZN(n49) );
  NOR3_X1 U55 ( .A1(ex_instr[7]), .A2(ex_instr[9]), .A3(ex_instr[8]), .ZN(n58)
         );
  NOR2_X1 U56 ( .A1(ex_instr[6]), .A2(ex_instr[5]), .ZN(n57) );
  NOR3_X1 U57 ( .A1(ex_instr[30]), .A2(ex_instr[3]), .A3(ex_instr[31]), .ZN(
        n56) );
  NOR2_X1 U58 ( .A1(ex_instr[29]), .A2(ex_instr[28]), .ZN(n55) );
  NAND4_X1 U59 ( .A1(ex_memWr), .A2(ex_instr[4]), .A3(n59), .A4(n60), .ZN(n48)
         );
  NOR4_X1 U60 ( .A1(n61), .A2(n62), .A3(n63), .A4(n64), .ZN(n60) );
  XOR2_X1 U61 ( .A(mem_rd[0]), .B(ex_rd[0]), .Z(n64) );
  XOR2_X1 U62 ( .A(mem_rd[2]), .B(ex_rd[2]), .Z(n63) );
  XNOR2_X1 U63 ( .A(mem_rd[1]), .B(n65), .ZN(n62) );
  NAND2_X1 U64 ( .A1(n66), .A2(n67), .ZN(n61) );
  XOR2_X1 U65 ( .A(n68), .B(mem_rd[3]), .Z(n67) );
  XOR2_X1 U66 ( .A(n69), .B(mem_rd[4]), .Z(n66) );
  AND3_X1 U67 ( .A1(ex_instr[0]), .A2(n70), .A3(ex_instr[2]), .ZN(n59) );
  INV_X1 U68 ( .A(n71), .ZN(n70) );
  NAND4_X1 U69 ( .A1(n72), .A2(n73), .A3(n74), .A4(n75), .ZN(n47) );
  NOR3_X1 U70 ( .A1(ex_instr[16]), .A2(ex_instr[18]), .A3(ex_instr[17]), .ZN(
        n75) );
  NOR2_X1 U71 ( .A1(ex_instr[15]), .A2(ex_instr[14]), .ZN(n74) );
  NOR3_X1 U72 ( .A1(ex_instr[11]), .A2(ex_instr[13]), .A3(ex_instr[12]), .ZN(
        n73) );
  NOR2_X1 U73 ( .A1(ex_instr[10]), .A2(n76), .ZN(n72) );
  NOR2_X1 U74 ( .A1(takeLeap), .A2(n45), .ZN(id_ex_ctrl[1]) );
  AOI21_X1 U75 ( .B1(n77), .B2(n78), .A(n79), .ZN(n45) );
  INV_X1 U76 ( .A(n80), .ZN(n79) );
  NOR4_X1 U77 ( .A1(n81), .A2(n82), .A3(n71), .A4(n83), .ZN(busB_sel[1]) );
  XOR2_X1 U78 ( .A(mem_rd[3]), .B(id_rs2[3]), .Z(n83) );
  NAND2_X1 U79 ( .A1(n78), .A2(n84), .ZN(n82) );
  NAND4_X1 U80 ( .A1(n85), .A2(n86), .A3(n87), .A4(n88), .ZN(n81) );
  XNOR2_X1 U81 ( .A(id_rs2[0]), .B(mem_rd[0]), .ZN(n88) );
  XNOR2_X1 U82 ( .A(id_rs2[1]), .B(mem_rd[1]), .ZN(n87) );
  XNOR2_X1 U83 ( .A(id_rs2[2]), .B(mem_rd[2]), .ZN(n86) );
  XNOR2_X1 U84 ( .A(id_rs2[4]), .B(mem_rd[4]), .ZN(n85) );
  NOR3_X1 U85 ( .A1(n78), .A2(takeLeap), .A3(n80), .ZN(busB_sel[0]) );
  NAND4_X1 U86 ( .A1(n89), .A2(n90), .A3(n91), .A4(n92), .ZN(n78) );
  NOR3_X1 U87 ( .A1(n93), .A2(n94), .A3(n95), .ZN(n92) );
  XOR2_X1 U88 ( .A(id_rs2[2]), .B(ex_rd[2]), .Z(n95) );
  XNOR2_X1 U89 ( .A(id_rs2[4]), .B(n69), .ZN(n94) );
  XOR2_X1 U90 ( .A(id_rs2[3]), .B(ex_rd[3]), .Z(n93) );
  XNOR2_X1 U91 ( .A(id_rs2[0]), .B(ex_rd[0]), .ZN(n91) );
  XOR2_X1 U92 ( .A(id_rs2[1]), .B(n65), .Z(n89) );
  INV_X1 U93 ( .A(ex_rd[1]), .ZN(n65) );
  NOR4_X1 U94 ( .A1(n96), .A2(n97), .A3(n71), .A4(n98), .ZN(busA_sel[1]) );
  XOR2_X1 U95 ( .A(mem_rd[3]), .B(id_rs1[3]), .Z(n98) );
  NAND2_X1 U96 ( .A1(mem_valid), .A2(ex_mem_ctrl[1]), .ZN(n71) );
  INV_X1 U97 ( .A(takeLeap), .ZN(ex_mem_ctrl[1]) );
  NAND2_X1 U98 ( .A1(n77), .A2(n84), .ZN(n97) );
  INV_X1 U99 ( .A(n76), .ZN(n84) );
  NOR4_X1 U100 ( .A1(mem_rd[3]), .A2(mem_rd[4]), .A3(mem_rd[2]), .A4(n99), 
        .ZN(n76) );
  OR2_X1 U101 ( .A1(mem_rd[1]), .A2(mem_rd[0]), .ZN(n99) );
  NAND4_X1 U102 ( .A1(n100), .A2(n101), .A3(n102), .A4(n103), .ZN(n96) );
  XNOR2_X1 U103 ( .A(id_rs1[0]), .B(mem_rd[0]), .ZN(n103) );
  XNOR2_X1 U104 ( .A(id_rs1[1]), .B(mem_rd[1]), .ZN(n102) );
  XNOR2_X1 U105 ( .A(id_rs1[2]), .B(mem_rd[2]), .ZN(n101) );
  XNOR2_X1 U106 ( .A(id_rs1[4]), .B(mem_rd[4]), .ZN(n100) );
  NOR3_X1 U107 ( .A1(n77), .A2(takeLeap), .A3(n80), .ZN(busA_sel[0]) );
  NOR3_X1 U108 ( .A1(ex_instr[29]), .A2(ex_instr[30]), .A3(n104), .ZN(n80) );
  INV_X1 U109 ( .A(ex_instr[31]), .ZN(n104) );
  NAND4_X1 U110 ( .A1(n105), .A2(n90), .A3(n106), .A4(n107), .ZN(n77) );
  NOR3_X1 U111 ( .A1(n108), .A2(n109), .A3(n110), .ZN(n107) );
  XOR2_X1 U112 ( .A(id_rs1[2]), .B(ex_rd[2]), .Z(n110) );
  XNOR2_X1 U113 ( .A(id_rs1[4]), .B(n69), .ZN(n109) );
  INV_X1 U114 ( .A(ex_rd[4]), .ZN(n69) );
  XNOR2_X1 U115 ( .A(id_rs1[3]), .B(n68), .ZN(n108) );
  INV_X1 U116 ( .A(ex_rd[3]), .ZN(n68) );
  XNOR2_X1 U117 ( .A(id_rs1[0]), .B(ex_rd[0]), .ZN(n106) );
  INV_X1 U118 ( .A(n111), .ZN(n90) );
  OAI21_X1 U119 ( .B1(n112), .B2(n113), .A(ex_valid), .ZN(n111) );
  OR2_X1 U120 ( .A1(ex_rd[0]), .A2(ex_rd[1]), .ZN(n113) );
  OR3_X1 U121 ( .A1(ex_rd[3]), .A2(ex_rd[4]), .A3(ex_rd[2]), .ZN(n112) );
  XNOR2_X1 U122 ( .A(id_rs1[1]), .B(ex_rd[1]), .ZN(n105) );
  INV_X4 U123 ( .A(1'b0), .ZN(mem_wb_ctrl[0]) );
  INV_X4 U125 ( .A(1'b0), .ZN(mem_wb_ctrl[1]) );
  INV_X4 U127 ( .A(1'b0), .ZN(if_id_ctrl[0]) );
  BUF_X4 U129 ( .A(if_id_ctrl[1]), .Z(pc_enable) );
  BUF_X4 U130 ( .A(id_ex_ctrl[1]), .Z(id_ex_ctrl[0]) );
  BUF_X4 U131 ( .A(ex_mem_ctrl[1]), .Z(ex_mem_ctrl[0]) );
endmodule

