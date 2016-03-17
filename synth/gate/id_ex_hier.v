
module id_ex ( clk, rst, ctrl, valid_d, instr_d, incPC_d, busA_d, busB_d, 
        busFP_d, aluCtrl_d, aluSrc_d, setInv_d, regDst_d, memRd_d, memWr_d, 
        regWr_d, branch_d, jr_d, jump_d, link_d, op0_d, fp_d, zeroExt_d, 
        dSize_d, imm32_d, rd_d, busA_sel_d, busB_sel_d, memWrData_sel_d, 
        not_trap_d, instr_q, incPC_q, busA_q, busB_q, busFP_q, aluCtrl_q, 
        aluSrc_q, setInv_q, regDst_q, memRd_q, memWr_q, regWr_q, branch_q, 
        jr_q, jump_q, link_q, op0_q, fp_q, zeroExt_q, dSize_q, imm32_q, rd_q, 
        busA_sel_q, busB_sel_q, memWrData_sel_q, valid_q, not_trap_q, Port58
 );
  input [1:0] ctrl;
  input [31:0] instr_d;
  input [31:0] incPC_d;
  input [31:0] busA_d;
  input [31:0] busB_d;
  input [31:0] busFP_d;
  input [3:0] aluCtrl_d;
  input [1:0] dSize_d;
  input [31:0] imm32_d;
  input [4:0] rd_d;
  input [1:0] busA_sel_d;
  input [1:0] busB_sel_d;
  input [1:0] memWrData_sel_d;
  output [31:0] instr_q;
  output [31:0] incPC_q;
  output [31:0] busA_q;
  output [31:0] busB_q;
  output [31:0] busFP_q;
  output [3:0] aluCtrl_q;
  output [1:0] dSize_q;
  output [31:0] imm32_q;
  output [4:0] rd_q;
  output [1:0] busA_sel_q;
  output [1:0] busB_sel_q;
  output [1:0] memWrData_sel_q;
  input clk, rst, valid_d, aluSrc_d, setInv_d, regDst_d, memRd_d, memWr_d,
         regWr_d, branch_d, jr_d, jump_d, link_d, op0_d, fp_d, zeroExt_d,
         not_trap_d;
  output aluSrc_q, setInv_q, regDst_q, memRd_q, memWr_q, regWr_q, branch_q,
         jr_q, jump_q, link_q, op0_q, fp_q, zeroExt_q, valid_q, not_trap_q;
  inout Port58;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
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
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436;

  DFFR_X1 \memWrData_sel_q_reg[1]  ( .D(n389), .CK(clk), .RN(n432), .Q(
        memWrData_sel_q[1]) );
  DFFR_X1 \memWrData_sel_q_reg[0]  ( .D(n388), .CK(clk), .RN(n433), .Q(
        memWrData_sel_q[0]) );
  DFFR_X1 valid_q_reg ( .D(n387), .CK(clk), .RN(n425), .Q(valid_q) );
  DFFR_X1 \instr_q_reg[31]  ( .D(n385), .CK(clk), .RN(n421), .Q(instr_q[31])
         );
  DFFR_X1 \instr_q_reg[30]  ( .D(n384), .CK(clk), .RN(n433), .Q(instr_q[30])
         );
  DFFR_X1 \instr_q_reg[29]  ( .D(n383), .CK(clk), .RN(n433), .Q(instr_q[29])
         );
  DFFR_X1 \instr_q_reg[28]  ( .D(n382), .CK(clk), .RN(n421), .Q(instr_q[28])
         );
  DFFR_X1 \instr_q_reg[27]  ( .D(n381), .CK(clk), .RN(n433), .Q(instr_q[27])
         );
  DFFR_X1 \instr_q_reg[26]  ( .D(n380), .CK(clk), .RN(n421), .Q(instr_q[26])
         );
  DFFR_X1 \instr_q_reg[25]  ( .D(n379), .CK(clk), .RN(n433), .Q(instr_q[25])
         );
  DFFR_X1 \instr_q_reg[24]  ( .D(n378), .CK(clk), .RN(n421), .Q(instr_q[24])
         );
  DFFR_X1 \instr_q_reg[23]  ( .D(n377), .CK(clk), .RN(n433), .Q(instr_q[23])
         );
  DFFR_X1 \instr_q_reg[22]  ( .D(n376), .CK(clk), .RN(n421), .Q(instr_q[22])
         );
  DFFR_X1 \instr_q_reg[21]  ( .D(n375), .CK(clk), .RN(n433), .Q(instr_q[21])
         );
  DFFR_X1 \instr_q_reg[20]  ( .D(n374), .CK(clk), .RN(n421), .Q(instr_q[20])
         );
  DFFR_X1 \instr_q_reg[19]  ( .D(n373), .CK(clk), .RN(n421), .Q(instr_q[19])
         );
  DFFR_X1 \instr_q_reg[18]  ( .D(n372), .CK(clk), .RN(n433), .Q(instr_q[18])
         );
  DFFR_X1 \instr_q_reg[17]  ( .D(n371), .CK(clk), .RN(n421), .Q(instr_q[17])
         );
  DFFR_X1 \instr_q_reg[16]  ( .D(n370), .CK(clk), .RN(n433), .Q(instr_q[16])
         );
  DFFR_X1 \instr_q_reg[15]  ( .D(n369), .CK(clk), .RN(n421), .Q(instr_q[15])
         );
  DFFR_X1 \instr_q_reg[14]  ( .D(n368), .CK(clk), .RN(n432), .Q(instr_q[14])
         );
  DFFR_X1 \instr_q_reg[13]  ( .D(n367), .CK(clk), .RN(n421), .Q(instr_q[13])
         );
  DFFR_X1 \instr_q_reg[12]  ( .D(n366), .CK(clk), .RN(n432), .Q(instr_q[12])
         );
  DFFR_X1 \instr_q_reg[11]  ( .D(n365), .CK(clk), .RN(n421), .Q(instr_q[11])
         );
  DFFR_X1 \instr_q_reg[10]  ( .D(n364), .CK(clk), .RN(n432), .Q(instr_q[10])
         );
  DFFR_X1 \instr_q_reg[9]  ( .D(n363), .CK(clk), .RN(n433), .Q(instr_q[9]) );
  DFFR_X1 \instr_q_reg[8]  ( .D(n362), .CK(clk), .RN(n428), .Q(instr_q[8]) );
  DFFR_X1 \instr_q_reg[7]  ( .D(n361), .CK(clk), .RN(n421), .Q(instr_q[7]) );
  DFFR_X1 \instr_q_reg[6]  ( .D(n360), .CK(clk), .RN(n429), .Q(instr_q[6]) );
  DFFR_X1 \instr_q_reg[5]  ( .D(n359), .CK(clk), .RN(n433), .Q(instr_q[5]) );
  DFFS_X1 \instr_q_reg[4]  ( .D(n358), .CK(clk), .SN(n429), .Q(instr_q[4]) );
  DFFR_X1 \instr_q_reg[3]  ( .D(n357), .CK(clk), .RN(n433), .Q(instr_q[3]) );
  DFFS_X1 \instr_q_reg[2]  ( .D(n356), .CK(clk), .SN(n430), .Q(instr_q[2]) );
  DFFR_X1 \instr_q_reg[1]  ( .D(n355), .CK(clk), .RN(n433), .Q(instr_q[1]) );
  DFFS_X1 \instr_q_reg[0]  ( .D(n354), .CK(clk), .SN(n431), .Q(instr_q[0]) );
  DFFR_X1 \incPC_q_reg[31]  ( .D(n353), .CK(clk), .RN(n422), .Q(incPC_q[31])
         );
  DFFR_X1 \incPC_q_reg[30]  ( .D(n352), .CK(clk), .RN(n432), .Q(incPC_q[30])
         );
  DFFR_X1 \incPC_q_reg[29]  ( .D(n351), .CK(clk), .RN(n432), .Q(incPC_q[29])
         );
  DFFR_X1 \incPC_q_reg[28]  ( .D(n350), .CK(clk), .RN(n422), .Q(incPC_q[28])
         );
  DFFR_X1 \incPC_q_reg[27]  ( .D(n349), .CK(clk), .RN(n432), .Q(incPC_q[27])
         );
  DFFR_X1 \incPC_q_reg[26]  ( .D(n348), .CK(clk), .RN(n422), .Q(incPC_q[26])
         );
  DFFR_X1 \incPC_q_reg[25]  ( .D(n347), .CK(clk), .RN(n432), .Q(incPC_q[25])
         );
  DFFR_X1 \incPC_q_reg[24]  ( .D(n346), .CK(clk), .RN(n422), .Q(incPC_q[24])
         );
  DFFR_X1 \incPC_q_reg[23]  ( .D(n345), .CK(clk), .RN(n432), .Q(incPC_q[23])
         );
  DFFR_X1 \incPC_q_reg[22]  ( .D(n344), .CK(clk), .RN(n422), .Q(incPC_q[22])
         );
  DFFR_X1 \incPC_q_reg[21]  ( .D(n343), .CK(clk), .RN(n426), .Q(incPC_q[21])
         );
  DFFR_X1 \incPC_q_reg[20]  ( .D(n342), .CK(clk), .RN(n422), .Q(incPC_q[20])
         );
  DFFR_X1 \incPC_q_reg[19]  ( .D(n341), .CK(clk), .RN(n422), .Q(incPC_q[19])
         );
  DFFR_X1 \incPC_q_reg[18]  ( .D(n340), .CK(clk), .RN(n427), .Q(incPC_q[18])
         );
  DFFR_X1 \incPC_q_reg[17]  ( .D(n339), .CK(clk), .RN(n422), .Q(incPC_q[17])
         );
  DFFR_X1 \incPC_q_reg[16]  ( .D(n338), .CK(clk), .RN(n428), .Q(incPC_q[16])
         );
  DFFR_X1 \incPC_q_reg[15]  ( .D(n337), .CK(clk), .RN(n422), .Q(incPC_q[15])
         );
  DFFR_X1 \incPC_q_reg[14]  ( .D(n336), .CK(clk), .RN(n429), .Q(incPC_q[14])
         );
  DFFR_X1 \incPC_q_reg[13]  ( .D(n335), .CK(clk), .RN(n423), .Q(incPC_q[13])
         );
  DFFR_X1 \incPC_q_reg[12]  ( .D(n334), .CK(clk), .RN(n430), .Q(incPC_q[12])
         );
  DFFR_X1 \incPC_q_reg[11]  ( .D(n333), .CK(clk), .RN(n423), .Q(incPC_q[11])
         );
  DFFR_X1 \incPC_q_reg[10]  ( .D(n332), .CK(clk), .RN(n431), .Q(incPC_q[10])
         );
  DFFR_X1 \incPC_q_reg[9]  ( .D(n331), .CK(clk), .RN(n432), .Q(incPC_q[9]) );
  DFFR_X1 \incPC_q_reg[8]  ( .D(n330), .CK(clk), .RN(n421), .Q(incPC_q[8]) );
  DFFR_X1 \incPC_q_reg[7]  ( .D(n329), .CK(clk), .RN(n432), .Q(incPC_q[7]) );
  DFFR_X1 \incPC_q_reg[6]  ( .D(n328), .CK(clk), .RN(n422), .Q(incPC_q[6]) );
  DFFR_X1 \incPC_q_reg[5]  ( .D(n327), .CK(clk), .RN(n432), .Q(incPC_q[5]) );
  DFFR_X1 \incPC_q_reg[4]  ( .D(n326), .CK(clk), .RN(n422), .Q(incPC_q[4]) );
  DFFR_X1 \incPC_q_reg[3]  ( .D(n325), .CK(clk), .RN(n432), .Q(incPC_q[3]) );
  DFFR_X1 \incPC_q_reg[2]  ( .D(n324), .CK(clk), .RN(n422), .Q(incPC_q[2]) );
  DFFR_X1 \incPC_q_reg[1]  ( .D(n323), .CK(clk), .RN(n433), .Q(incPC_q[1]) );
  DFFR_X1 \incPC_q_reg[0]  ( .D(n322), .CK(clk), .RN(n423), .Q(incPC_q[0]) );
  DFFR_X1 \busA_q_reg[31]  ( .D(n321), .CK(clk), .RN(n429), .Q(busA_q[31]) );
  DFFR_X1 \busA_q_reg[30]  ( .D(n320), .CK(clk), .RN(n426), .Q(busA_q[30]) );
  DFFR_X1 \busA_q_reg[29]  ( .D(n319), .CK(clk), .RN(n426), .Q(busA_q[29]) );
  DFFR_X1 \busA_q_reg[28]  ( .D(n318), .CK(clk), .RN(n428), .Q(busA_q[28]) );
  DFFR_X1 \busA_q_reg[27]  ( .D(n317), .CK(clk), .RN(n426), .Q(busA_q[27]) );
  DFFR_X1 \busA_q_reg[26]  ( .D(n316), .CK(clk), .RN(n428), .Q(busA_q[26]) );
  DFFR_X1 \busA_q_reg[25]  ( .D(n315), .CK(clk), .RN(n426), .Q(busA_q[25]) );
  DFFR_X1 \busA_q_reg[24]  ( .D(n314), .CK(clk), .RN(n428), .Q(busA_q[24]) );
  DFFR_X1 \busA_q_reg[23]  ( .D(n313), .CK(clk), .RN(n426), .Q(busA_q[23]) );
  DFFR_X1 \busA_q_reg[22]  ( .D(n312), .CK(clk), .RN(n428), .Q(busA_q[22]) );
  DFFR_X1 \busA_q_reg[21]  ( .D(n311), .CK(clk), .RN(n426), .Q(busA_q[21]) );
  DFFR_X1 \busA_q_reg[20]  ( .D(n310), .CK(clk), .RN(n428), .Q(busA_q[20]) );
  DFFR_X1 \busA_q_reg[19]  ( .D(n309), .CK(clk), .RN(n428), .Q(busA_q[19]) );
  DFFR_X1 \busA_q_reg[18]  ( .D(n308), .CK(clk), .RN(n427), .Q(busA_q[18]) );
  DFFR_X1 \busA_q_reg[17]  ( .D(n307), .CK(clk), .RN(n428), .Q(busA_q[17]) );
  DFFR_X1 \busA_q_reg[16]  ( .D(n306), .CK(clk), .RN(n427), .Q(busA_q[16]) );
  DFFR_X1 \busA_q_reg[15]  ( .D(n305), .CK(clk), .RN(n428), .Q(busA_q[15]) );
  DFFR_X1 \busA_q_reg[14]  ( .D(n304), .CK(clk), .RN(n427), .Q(busA_q[14]) );
  DFFR_X1 \busA_q_reg[13]  ( .D(n303), .CK(clk), .RN(n428), .Q(busA_q[13]) );
  DFFR_X1 \busA_q_reg[12]  ( .D(n302), .CK(clk), .RN(n427), .Q(busA_q[12]) );
  DFFR_X1 \busA_q_reg[11]  ( .D(n301), .CK(clk), .RN(n428), .Q(busA_q[11]) );
  DFFR_X1 \busA_q_reg[10]  ( .D(n300), .CK(clk), .RN(n427), .Q(busA_q[10]) );
  DFFR_X1 \busA_q_reg[9]  ( .D(n299), .CK(clk), .RN(n426), .Q(busA_q[9]) );
  DFFR_X1 \busA_q_reg[8]  ( .D(n298), .CK(clk), .RN(n429), .Q(busA_q[8]) );
  DFFR_X1 \busA_q_reg[7]  ( .D(n297), .CK(clk), .RN(n426), .Q(busA_q[7]) );
  DFFR_X1 \busA_q_reg[6]  ( .D(n296), .CK(clk), .RN(n429), .Q(busA_q[6]) );
  DFFR_X1 \busA_q_reg[5]  ( .D(n295), .CK(clk), .RN(n426), .Q(busA_q[5]) );
  DFFR_X1 \busA_q_reg[4]  ( .D(n294), .CK(clk), .RN(n429), .Q(busA_q[4]) );
  DFFR_X1 \busA_q_reg[3]  ( .D(n293), .CK(clk), .RN(n426), .Q(busA_q[3]) );
  DFFR_X1 \busA_q_reg[2]  ( .D(n292), .CK(clk), .RN(n429), .Q(busA_q[2]) );
  DFFR_X1 \busA_q_reg[1]  ( .D(n291), .CK(clk), .RN(n427), .Q(busA_q[1]) );
  DFFR_X1 \busA_q_reg[0]  ( .D(n290), .CK(clk), .RN(n428), .Q(busA_q[0]) );
  DFFR_X1 \busB_q_reg[31]  ( .D(n289), .CK(clk), .RN(n430), .Q(busB_q[31]) );
  DFFR_X1 \busB_q_reg[30]  ( .D(n288), .CK(clk), .RN(n425), .Q(busB_q[30]) );
  DFFR_X1 \busB_q_reg[29]  ( .D(n287), .CK(clk), .RN(n425), .Q(busB_q[29]) );
  DFFR_X1 \busB_q_reg[28]  ( .D(n286), .CK(clk), .RN(n430), .Q(busB_q[28]) );
  DFFR_X1 \busB_q_reg[27]  ( .D(n285), .CK(clk), .RN(n425), .Q(busB_q[27]) );
  DFFR_X1 \busB_q_reg[26]  ( .D(n284), .CK(clk), .RN(n430), .Q(busB_q[26]) );
  DFFR_X1 \busB_q_reg[25]  ( .D(n283), .CK(clk), .RN(n425), .Q(busB_q[25]) );
  DFFR_X1 \busB_q_reg[24]  ( .D(n282), .CK(clk), .RN(n430), .Q(busB_q[24]) );
  DFFR_X1 \busB_q_reg[23]  ( .D(n281), .CK(clk), .RN(n425), .Q(busB_q[23]) );
  DFFR_X1 \busB_q_reg[22]  ( .D(n280), .CK(clk), .RN(n430), .Q(busB_q[22]) );
  DFFR_X1 \busB_q_reg[21]  ( .D(n279), .CK(clk), .RN(n425), .Q(busB_q[21]) );
  DFFR_X1 \busB_q_reg[20]  ( .D(n278), .CK(clk), .RN(n430), .Q(busB_q[20]) );
  DFFR_X1 \busB_q_reg[19]  ( .D(n277), .CK(clk), .RN(n429), .Q(busB_q[19]) );
  DFFR_X1 \busB_q_reg[18]  ( .D(n276), .CK(clk), .RN(n425), .Q(busB_q[18]) );
  DFFR_X1 \busB_q_reg[17]  ( .D(n275), .CK(clk), .RN(n429), .Q(busB_q[17]) );
  DFFR_X1 \busB_q_reg[16]  ( .D(n274), .CK(clk), .RN(n425), .Q(busB_q[16]) );
  DFFR_X1 \busB_q_reg[15]  ( .D(n273), .CK(clk), .RN(n429), .Q(busB_q[15]) );
  DFFR_X1 \busB_q_reg[14]  ( .D(n272), .CK(clk), .RN(n425), .Q(busB_q[14]) );
  DFFR_X1 \busB_q_reg[13]  ( .D(n271), .CK(clk), .RN(n429), .Q(busB_q[13]) );
  DFFR_X1 \busB_q_reg[12]  ( .D(n270), .CK(clk), .RN(n425), .Q(busB_q[12]) );
  DFFR_X1 \busB_q_reg[11]  ( .D(n269), .CK(clk), .RN(n429), .Q(busB_q[11]) );
  DFFR_X1 \busB_q_reg[10]  ( .D(n268), .CK(clk), .RN(n426), .Q(busB_q[10]) );
  DFFR_X1 \busB_q_reg[9]  ( .D(n267), .CK(clk), .RN(n424), .Q(busB_q[9]) );
  DFFR_X1 \busB_q_reg[8]  ( .D(n266), .CK(clk), .RN(n430), .Q(busB_q[8]) );
  DFFR_X1 \busB_q_reg[7]  ( .D(n265), .CK(clk), .RN(n424), .Q(busB_q[7]) );
  DFFR_X1 \busB_q_reg[6]  ( .D(n264), .CK(clk), .RN(n430), .Q(busB_q[6]) );
  DFFR_X1 \busB_q_reg[5]  ( .D(n263), .CK(clk), .RN(n424), .Q(busB_q[5]) );
  DFFR_X1 \busB_q_reg[4]  ( .D(n262), .CK(clk), .RN(n430), .Q(busB_q[4]) );
  DFFR_X1 \busB_q_reg[3]  ( .D(n261), .CK(clk), .RN(n425), .Q(busB_q[3]) );
  DFFR_X1 \busB_q_reg[2]  ( .D(n260), .CK(clk), .RN(n430), .Q(busB_q[2]) );
  DFFR_X1 \busB_q_reg[1]  ( .D(n259), .CK(clk), .RN(n425), .Q(busB_q[1]) );
  DFFR_X1 \busB_q_reg[0]  ( .D(n258), .CK(clk), .RN(n429), .Q(busB_q[0]) );
  DFFR_X1 \aluCtrl_q_reg[3]  ( .D(n257), .CK(clk), .RN(n427), .Q(aluCtrl_q[3])
         );
  DFFR_X1 \aluCtrl_q_reg[2]  ( .D(n256), .CK(clk), .RN(n427), .Q(aluCtrl_q[2])
         );
  DFFR_X1 \aluCtrl_q_reg[1]  ( .D(n255), .CK(clk), .RN(n427), .Q(aluCtrl_q[1])
         );
  DFFR_X1 \aluCtrl_q_reg[0]  ( .D(n254), .CK(clk), .RN(n427), .Q(aluCtrl_q[0])
         );
  DFFR_X1 aluSrc_q_reg ( .D(n253), .CK(clk), .RN(n428), .Q(aluSrc_q) );
  DFFR_X1 setInv_q_reg ( .D(n252), .CK(clk), .RN(n430), .Q(setInv_q) );
  DFFR_X1 memRd_q_reg ( .D(n250), .CK(clk), .RN(n422), .Q(memRd_q) );
  DFFR_X1 memWr_q_reg ( .D(n249), .CK(clk), .RN(n432), .Q(memWr_q) );
  DFFR_X1 regWr_q_reg ( .D(n248), .CK(clk), .RN(n423), .Q(regWr_q) );
  DFFR_X1 branch_q_reg ( .D(n247), .CK(clk), .RN(n427), .Q(branch_q) );
  DFFR_X1 jr_q_reg ( .D(n246), .CK(clk), .RN(n433), .Q(jr_q) );
  DFFR_X1 jump_q_reg ( .D(n245), .CK(clk), .RN(n424), .Q(jump_q) );
  DFFR_X1 link_q_reg ( .D(n244), .CK(clk), .RN(n422), .Q(link_q) );
  DFFR_X1 fp_q_reg ( .D(n242), .CK(clk), .RN(n431), .Q(fp_q) );
  DFFR_X1 zeroExt_q_reg ( .D(n241), .CK(clk), .RN(n427), .Q(zeroExt_q) );
  DFFR_X1 \dSize_q_reg[1]  ( .D(n240), .CK(clk), .RN(n424), .Q(dSize_q[1]) );
  DFFR_X1 \dSize_q_reg[0]  ( .D(n239), .CK(clk), .RN(n430), .Q(dSize_q[0]) );
  DFFR_X1 \imm32_q_reg[31]  ( .D(n238), .CK(clk), .RN(n423), .Q(imm32_q[31])
         );
  DFFR_X1 \imm32_q_reg[30]  ( .D(n237), .CK(clk), .RN(n432), .Q(imm32_q[30])
         );
  DFFR_X1 \imm32_q_reg[29]  ( .D(n236), .CK(clk), .RN(n431), .Q(imm32_q[29])
         );
  DFFR_X1 \imm32_q_reg[28]  ( .D(n235), .CK(clk), .RN(n423), .Q(imm32_q[28])
         );
  DFFR_X1 \imm32_q_reg[27]  ( .D(n234), .CK(clk), .RN(n431), .Q(imm32_q[27])
         );
  DFFR_X1 \imm32_q_reg[26]  ( .D(n233), .CK(clk), .RN(n423), .Q(imm32_q[26])
         );
  DFFR_X1 \imm32_q_reg[25]  ( .D(n232), .CK(clk), .RN(n431), .Q(imm32_q[25])
         );
  DFFR_X1 \imm32_q_reg[24]  ( .D(n231), .CK(clk), .RN(n423), .Q(imm32_q[24])
         );
  DFFR_X1 \imm32_q_reg[23]  ( .D(n230), .CK(clk), .RN(n431), .Q(imm32_q[23])
         );
  DFFR_X1 \imm32_q_reg[22]  ( .D(n229), .CK(clk), .RN(n423), .Q(imm32_q[22])
         );
  DFFR_X1 \imm32_q_reg[21]  ( .D(n228), .CK(clk), .RN(n431), .Q(imm32_q[21])
         );
  DFFR_X1 \imm32_q_reg[20]  ( .D(n227), .CK(clk), .RN(n424), .Q(imm32_q[20])
         );
  DFFR_X1 \imm32_q_reg[19]  ( .D(n226), .CK(clk), .RN(n424), .Q(imm32_q[19])
         );
  DFFR_X1 \imm32_q_reg[18]  ( .D(n225), .CK(clk), .RN(n431), .Q(imm32_q[18])
         );
  DFFR_X1 \imm32_q_reg[17]  ( .D(n224), .CK(clk), .RN(n424), .Q(imm32_q[17])
         );
  DFFR_X1 \imm32_q_reg[16]  ( .D(n223), .CK(clk), .RN(n431), .Q(imm32_q[16])
         );
  DFFR_X1 \imm32_q_reg[15]  ( .D(n222), .CK(clk), .RN(n424), .Q(imm32_q[15])
         );
  DFFR_X1 \imm32_q_reg[14]  ( .D(n221), .CK(clk), .RN(n431), .Q(imm32_q[14])
         );
  DFFR_X1 \imm32_q_reg[13]  ( .D(n220), .CK(clk), .RN(n424), .Q(imm32_q[13])
         );
  DFFR_X1 \imm32_q_reg[12]  ( .D(n219), .CK(clk), .RN(n431), .Q(imm32_q[12])
         );
  DFFR_X1 \imm32_q_reg[11]  ( .D(n218), .CK(clk), .RN(n424), .Q(imm32_q[11])
         );
  DFFR_X1 \imm32_q_reg[10]  ( .D(n217), .CK(clk), .RN(n431), .Q(imm32_q[10])
         );
  DFFR_X1 \imm32_q_reg[9]  ( .D(n216), .CK(clk), .RN(n422), .Q(imm32_q[9]) );
  DFFR_X1 \imm32_q_reg[8]  ( .D(n215), .CK(clk), .RN(n423), .Q(imm32_q[8]) );
  DFFR_X1 \imm32_q_reg[7]  ( .D(n214), .CK(clk), .RN(n421), .Q(imm32_q[7]) );
  DFFR_X1 \imm32_q_reg[6]  ( .D(n213), .CK(clk), .RN(n423), .Q(imm32_q[6]) );
  DFFR_X1 \imm32_q_reg[5]  ( .D(n212), .CK(clk), .RN(n423), .Q(imm32_q[5]) );
  DFFR_X1 \imm32_q_reg[4]  ( .D(n211), .CK(clk), .RN(n423), .Q(imm32_q[4]) );
  DFFR_X1 \imm32_q_reg[3]  ( .D(n210), .CK(clk), .RN(n424), .Q(imm32_q[3]) );
  DFFR_X1 \imm32_q_reg[2]  ( .D(n209), .CK(clk), .RN(n423), .Q(imm32_q[2]) );
  DFFR_X1 \imm32_q_reg[1]  ( .D(n208), .CK(clk), .RN(n431), .Q(imm32_q[1]) );
  DFFR_X1 \imm32_q_reg[0]  ( .D(n207), .CK(clk), .RN(n424), .Q(imm32_q[0]) );
  DFFR_X1 \rd_q_reg[4]  ( .D(n206), .CK(clk), .RN(n425), .Q(rd_q[4]) );
  DFFR_X1 \rd_q_reg[3]  ( .D(n205), .CK(clk), .RN(n423), .Q(rd_q[3]) );
  DFFR_X1 \rd_q_reg[2]  ( .D(n204), .CK(clk), .RN(n426), .Q(rd_q[2]) );
  DFFR_X1 \rd_q_reg[1]  ( .D(n203), .CK(clk), .RN(n424), .Q(rd_q[1]) );
  DFFR_X1 \rd_q_reg[0]  ( .D(n202), .CK(clk), .RN(n427), .Q(rd_q[0]) );
  DFFR_X1 \busA_sel_q_reg[1]  ( .D(n201), .CK(clk), .RN(n426), .Q(
        busA_sel_q[1]) );
  DFFR_X1 \busA_sel_q_reg[0]  ( .D(n200), .CK(clk), .RN(n429), .Q(
        busA_sel_q[0]) );
  DFFR_X1 \busB_sel_q_reg[1]  ( .D(n199), .CK(clk), .RN(n424), .Q(
        busB_sel_q[1]) );
  DFFR_X1 \busB_sel_q_reg[0]  ( .D(n198), .CK(clk), .RN(n430), .Q(
        busB_sel_q[0]) );
  INV_X1 U3 ( .A(n1), .ZN(n241) );
  AOI22_X1 U4 ( .A1(zeroExt_d), .A2(n400), .B1(zeroExt_q), .B2(n419), .ZN(n1)
         );
  INV_X1 U5 ( .A(n4), .ZN(n387) );
  AOI22_X1 U6 ( .A1(valid_d), .A2(n399), .B1(valid_q), .B2(n419), .ZN(n4) );
  INV_X1 U7 ( .A(n5), .ZN(n252) );
  AOI22_X1 U8 ( .A1(setInv_q), .A2(n410), .B1(setInv_d), .B2(n394), .ZN(n5) );
  INV_X1 U9 ( .A(n7), .ZN(n248) );
  AOI22_X1 U10 ( .A1(regWr_d), .A2(n399), .B1(regWr_q), .B2(n419), .ZN(n7) );
  INV_X1 U11 ( .A(n8), .ZN(n251) );
  AOI22_X1 U12 ( .A1(regDst_q), .A2(n407), .B1(regDst_d), .B2(n415), .ZN(n8)
         );
  INV_X1 U13 ( .A(n9), .ZN(n206) );
  AOI22_X1 U14 ( .A1(rd_q[4]), .A2(n407), .B1(rd_d[4]), .B2(n394), .ZN(n9) );
  INV_X1 U15 ( .A(n10), .ZN(n205) );
  AOI22_X1 U16 ( .A1(rd_q[3]), .A2(n407), .B1(rd_d[3]), .B2(n415), .ZN(n10) );
  INV_X1 U17 ( .A(n11), .ZN(n204) );
  AOI22_X1 U18 ( .A1(rd_q[2]), .A2(n407), .B1(rd_d[2]), .B2(n393), .ZN(n11) );
  INV_X1 U19 ( .A(n12), .ZN(n203) );
  AOI22_X1 U20 ( .A1(rd_q[1]), .A2(n407), .B1(rd_d[1]), .B2(n415), .ZN(n12) );
  INV_X1 U21 ( .A(n13), .ZN(n202) );
  AOI22_X1 U22 ( .A1(rd_q[0]), .A2(n407), .B1(rd_d[0]), .B2(n415), .ZN(n13) );
  INV_X1 U23 ( .A(n14), .ZN(n243) );
  AOI22_X1 U24 ( .A1(op0_q), .A2(n407), .B1(op0_d), .B2(n397), .ZN(n14) );
  INV_X1 U25 ( .A(n15), .ZN(n386) );
  AOI221_X1 U26 ( .B1(not_trap_q), .B2(n419), .C1(not_trap_d), .C2(n390), .A(
        n16), .ZN(n15) );
  INV_X1 U27 ( .A(n17), .ZN(n249) );
  AOI22_X1 U28 ( .A1(memWr_d), .A2(n399), .B1(memWr_q), .B2(n420), .ZN(n17) );
  INV_X1 U29 ( .A(n18), .ZN(n389) );
  AOI22_X1 U30 ( .A1(memWrData_sel_d[1]), .A2(n399), .B1(memWrData_sel_q[1]), 
        .B2(n419), .ZN(n18) );
  INV_X1 U31 ( .A(n19), .ZN(n388) );
  AOI22_X1 U32 ( .A1(memWrData_sel_d[0]), .A2(n399), .B1(memWrData_sel_q[0]), 
        .B2(n420), .ZN(n19) );
  INV_X1 U33 ( .A(n20), .ZN(n250) );
  AOI22_X1 U34 ( .A1(memRd_q), .A2(n407), .B1(memRd_d), .B2(n397), .ZN(n20) );
  INV_X1 U35 ( .A(n21), .ZN(n244) );
  AOI22_X1 U36 ( .A1(link_q), .A2(n407), .B1(link_d), .B2(n397), .ZN(n21) );
  INV_X1 U37 ( .A(n22), .ZN(n245) );
  AOI22_X1 U38 ( .A1(jump_q), .A2(n407), .B1(jump_d), .B2(n397), .ZN(n22) );
  INV_X1 U39 ( .A(n23), .ZN(n246) );
  AOI22_X1 U40 ( .A1(jr_q), .A2(n407), .B1(jr_d), .B2(n397), .ZN(n23) );
  INV_X1 U41 ( .A(n24), .ZN(n363) );
  AOI22_X1 U42 ( .A1(instr_d[9]), .A2(n400), .B1(instr_q[9]), .B2(n419), .ZN(
        n24) );
  INV_X1 U43 ( .A(n25), .ZN(n362) );
  AOI22_X1 U44 ( .A1(instr_d[8]), .A2(n399), .B1(instr_q[8]), .B2(n419), .ZN(
        n25) );
  INV_X1 U45 ( .A(n26), .ZN(n361) );
  AOI22_X1 U46 ( .A1(instr_d[7]), .A2(n400), .B1(instr_q[7]), .B2(n420), .ZN(
        n26) );
  INV_X1 U47 ( .A(n27), .ZN(n360) );
  AOI22_X1 U48 ( .A1(instr_d[6]), .A2(n400), .B1(instr_q[6]), .B2(n419), .ZN(
        n27) );
  INV_X1 U49 ( .A(n28), .ZN(n359) );
  AOI22_X1 U50 ( .A1(instr_d[5]), .A2(n400), .B1(instr_q[5]), .B2(n419), .ZN(
        n28) );
  INV_X1 U51 ( .A(n29), .ZN(n358) );
  AOI221_X1 U52 ( .B1(instr_q[4]), .B2(n420), .C1(instr_d[4]), .C2(n390), .A(
        n16), .ZN(n29) );
  INV_X1 U53 ( .A(n30), .ZN(n357) );
  AOI22_X1 U54 ( .A1(instr_d[3]), .A2(n399), .B1(instr_q[3]), .B2(n419), .ZN(
        n30) );
  INV_X1 U55 ( .A(n31), .ZN(n385) );
  AOI22_X1 U56 ( .A1(instr_d[31]), .A2(n400), .B1(instr_q[31]), .B2(n419), 
        .ZN(n31) );
  INV_X1 U57 ( .A(n32), .ZN(n384) );
  AOI22_X1 U58 ( .A1(instr_d[30]), .A2(n399), .B1(instr_q[30]), .B2(n419), 
        .ZN(n32) );
  INV_X1 U59 ( .A(n33), .ZN(n356) );
  AOI221_X1 U60 ( .B1(instr_q[2]), .B2(n420), .C1(instr_d[2]), .C2(n390), .A(
        n16), .ZN(n33) );
  INV_X1 U61 ( .A(n34), .ZN(n383) );
  AOI22_X1 U62 ( .A1(instr_d[29]), .A2(n401), .B1(instr_q[29]), .B2(n419), 
        .ZN(n34) );
  INV_X1 U63 ( .A(n35), .ZN(n382) );
  AOI22_X1 U64 ( .A1(instr_d[28]), .A2(n400), .B1(instr_q[28]), .B2(n419), 
        .ZN(n35) );
  INV_X1 U65 ( .A(n36), .ZN(n381) );
  AOI22_X1 U66 ( .A1(instr_d[27]), .A2(n401), .B1(instr_q[27]), .B2(n419), 
        .ZN(n36) );
  INV_X1 U67 ( .A(n37), .ZN(n380) );
  AOI22_X1 U68 ( .A1(instr_d[26]), .A2(n400), .B1(instr_q[26]), .B2(n419), 
        .ZN(n37) );
  INV_X1 U69 ( .A(n38), .ZN(n379) );
  AOI22_X1 U70 ( .A1(instr_d[25]), .A2(n401), .B1(instr_q[25]), .B2(n419), 
        .ZN(n38) );
  INV_X1 U71 ( .A(n39), .ZN(n378) );
  AOI22_X1 U72 ( .A1(instr_d[24]), .A2(n401), .B1(instr_q[24]), .B2(n420), 
        .ZN(n39) );
  INV_X1 U73 ( .A(n40), .ZN(n377) );
  AOI22_X1 U74 ( .A1(instr_d[23]), .A2(n401), .B1(instr_q[23]), .B2(n420), 
        .ZN(n40) );
  INV_X1 U75 ( .A(n41), .ZN(n376) );
  AOI22_X1 U76 ( .A1(instr_d[22]), .A2(n399), .B1(instr_q[22]), .B2(n420), 
        .ZN(n41) );
  INV_X1 U77 ( .A(n42), .ZN(n375) );
  AOI22_X1 U78 ( .A1(instr_d[21]), .A2(n401), .B1(instr_q[21]), .B2(n420), 
        .ZN(n42) );
  INV_X1 U79 ( .A(n43), .ZN(n374) );
  AOI22_X1 U80 ( .A1(instr_d[20]), .A2(n401), .B1(instr_q[20]), .B2(n420), 
        .ZN(n43) );
  INV_X1 U81 ( .A(n44), .ZN(n355) );
  AOI22_X1 U82 ( .A1(instr_d[1]), .A2(n401), .B1(instr_q[1]), .B2(n420), .ZN(
        n44) );
  INV_X1 U83 ( .A(n45), .ZN(n373) );
  AOI22_X1 U84 ( .A1(instr_d[19]), .A2(n401), .B1(instr_q[19]), .B2(n420), 
        .ZN(n45) );
  INV_X1 U85 ( .A(n46), .ZN(n372) );
  AOI22_X1 U86 ( .A1(instr_d[18]), .A2(n400), .B1(instr_q[18]), .B2(n420), 
        .ZN(n46) );
  INV_X1 U87 ( .A(n47), .ZN(n371) );
  AOI22_X1 U88 ( .A1(instr_d[17]), .A2(n400), .B1(instr_q[17]), .B2(n420), 
        .ZN(n47) );
  INV_X1 U89 ( .A(n48), .ZN(n370) );
  AOI22_X1 U90 ( .A1(instr_d[16]), .A2(n400), .B1(instr_q[16]), .B2(n420), 
        .ZN(n48) );
  INV_X1 U91 ( .A(n49), .ZN(n369) );
  AOI22_X1 U92 ( .A1(instr_d[15]), .A2(n401), .B1(instr_q[15]), .B2(n420), 
        .ZN(n49) );
  INV_X1 U93 ( .A(n50), .ZN(n368) );
  AOI22_X1 U94 ( .A1(instr_d[14]), .A2(n399), .B1(instr_q[14]), .B2(n420), 
        .ZN(n50) );
  INV_X1 U95 ( .A(n51), .ZN(n367) );
  AOI22_X1 U96 ( .A1(instr_d[13]), .A2(n401), .B1(instr_q[13]), .B2(n419), 
        .ZN(n51) );
  INV_X1 U97 ( .A(n52), .ZN(n366) );
  AOI22_X1 U98 ( .A1(instr_d[12]), .A2(n390), .B1(instr_q[12]), .B2(n420), 
        .ZN(n52) );
  INV_X1 U99 ( .A(n53), .ZN(n365) );
  AOI22_X1 U100 ( .A1(instr_d[11]), .A2(n400), .B1(instr_q[11]), .B2(n419), 
        .ZN(n53) );
  INV_X1 U101 ( .A(n54), .ZN(n364) );
  AOI22_X1 U102 ( .A1(instr_d[10]), .A2(n399), .B1(instr_q[10]), .B2(n420), 
        .ZN(n54) );
  INV_X1 U103 ( .A(n55), .ZN(n354) );
  AOI221_X1 U104 ( .B1(instr_q[0]), .B2(n420), .C1(instr_d[0]), .C2(n390), .A(
        n16), .ZN(n55) );
  NOR2_X1 U105 ( .A1(n3), .A2(ctrl[0]), .ZN(n16) );
  INV_X1 U106 ( .A(n56), .ZN(n331) );
  AOI22_X1 U107 ( .A1(incPC_q[9]), .A2(n407), .B1(incPC_d[9]), .B2(n395), .ZN(
        n56) );
  INV_X1 U108 ( .A(n57), .ZN(n330) );
  AOI22_X1 U109 ( .A1(incPC_q[8]), .A2(n407), .B1(incPC_d[8]), .B2(n396), .ZN(
        n57) );
  INV_X1 U110 ( .A(n58), .ZN(n329) );
  AOI22_X1 U111 ( .A1(incPC_q[7]), .A2(n407), .B1(incPC_d[7]), .B2(n395), .ZN(
        n58) );
  INV_X1 U112 ( .A(n59), .ZN(n328) );
  AOI22_X1 U113 ( .A1(incPC_q[6]), .A2(n407), .B1(incPC_d[6]), .B2(n396), .ZN(
        n59) );
  INV_X1 U114 ( .A(n60), .ZN(n327) );
  AOI22_X1 U115 ( .A1(incPC_q[5]), .A2(n407), .B1(incPC_d[5]), .B2(n395), .ZN(
        n60) );
  INV_X1 U116 ( .A(n61), .ZN(n326) );
  AOI22_X1 U117 ( .A1(incPC_q[4]), .A2(n407), .B1(incPC_d[4]), .B2(n396), .ZN(
        n61) );
  INV_X1 U118 ( .A(n62), .ZN(n325) );
  AOI22_X1 U119 ( .A1(incPC_q[3]), .A2(n407), .B1(incPC_d[3]), .B2(n395), .ZN(
        n62) );
  INV_X1 U120 ( .A(n63), .ZN(n353) );
  AOI22_X1 U121 ( .A1(incPC_q[31]), .A2(n408), .B1(incPC_d[31]), .B2(n398), 
        .ZN(n63) );
  INV_X1 U122 ( .A(n64), .ZN(n352) );
  AOI22_X1 U123 ( .A1(incPC_q[30]), .A2(n408), .B1(incPC_d[30]), .B2(n398), 
        .ZN(n64) );
  INV_X1 U124 ( .A(n65), .ZN(n324) );
  AOI22_X1 U125 ( .A1(incPC_q[2]), .A2(n408), .B1(incPC_d[2]), .B2(n398), .ZN(
        n65) );
  INV_X1 U126 ( .A(n66), .ZN(n351) );
  AOI22_X1 U127 ( .A1(incPC_q[29]), .A2(n408), .B1(incPC_d[29]), .B2(n398), 
        .ZN(n66) );
  INV_X1 U128 ( .A(n67), .ZN(n350) );
  AOI22_X1 U129 ( .A1(incPC_q[28]), .A2(n408), .B1(incPC_d[28]), .B2(n398), 
        .ZN(n67) );
  INV_X1 U130 ( .A(n68), .ZN(n349) );
  AOI22_X1 U131 ( .A1(incPC_q[27]), .A2(n408), .B1(incPC_d[27]), .B2(n397), 
        .ZN(n68) );
  INV_X1 U132 ( .A(n69), .ZN(n348) );
  AOI22_X1 U133 ( .A1(incPC_q[26]), .A2(n408), .B1(incPC_d[26]), .B2(n397), 
        .ZN(n69) );
  INV_X1 U134 ( .A(n70), .ZN(n347) );
  AOI22_X1 U135 ( .A1(incPC_q[25]), .A2(n408), .B1(incPC_d[25]), .B2(n397), 
        .ZN(n70) );
  INV_X1 U136 ( .A(n71), .ZN(n346) );
  AOI22_X1 U137 ( .A1(incPC_q[24]), .A2(n408), .B1(incPC_d[24]), .B2(n397), 
        .ZN(n71) );
  INV_X1 U138 ( .A(n72), .ZN(n345) );
  AOI22_X1 U139 ( .A1(incPC_q[23]), .A2(n408), .B1(incPC_d[23]), .B2(n397), 
        .ZN(n72) );
  INV_X1 U140 ( .A(n73), .ZN(n344) );
  AOI22_X1 U141 ( .A1(incPC_q[22]), .A2(n408), .B1(incPC_d[22]), .B2(n397), 
        .ZN(n73) );
  INV_X1 U142 ( .A(n74), .ZN(n343) );
  AOI22_X1 U143 ( .A1(incPC_q[21]), .A2(n408), .B1(incPC_d[21]), .B2(n397), 
        .ZN(n74) );
  INV_X1 U144 ( .A(n75), .ZN(n342) );
  AOI22_X1 U145 ( .A1(incPC_q[20]), .A2(n408), .B1(incPC_d[20]), .B2(n415), 
        .ZN(n75) );
  INV_X1 U146 ( .A(n76), .ZN(n323) );
  AOI22_X1 U147 ( .A1(incPC_q[1]), .A2(n408), .B1(incPC_d[1]), .B2(n415), .ZN(
        n76) );
  INV_X1 U148 ( .A(n77), .ZN(n341) );
  AOI22_X1 U149 ( .A1(incPC_q[19]), .A2(n408), .B1(incPC_d[19]), .B2(n415), 
        .ZN(n77) );
  INV_X1 U150 ( .A(n78), .ZN(n340) );
  AOI22_X1 U151 ( .A1(incPC_q[18]), .A2(n408), .B1(incPC_d[18]), .B2(n415), 
        .ZN(n78) );
  INV_X1 U152 ( .A(n79), .ZN(n339) );
  AOI22_X1 U153 ( .A1(incPC_q[17]), .A2(n408), .B1(incPC_d[17]), .B2(n415), 
        .ZN(n79) );
  INV_X1 U154 ( .A(n80), .ZN(n338) );
  AOI22_X1 U155 ( .A1(incPC_q[16]), .A2(n408), .B1(incPC_d[16]), .B2(n415), 
        .ZN(n80) );
  INV_X1 U156 ( .A(n81), .ZN(n337) );
  AOI22_X1 U157 ( .A1(incPC_q[15]), .A2(n408), .B1(incPC_d[15]), .B2(n398), 
        .ZN(n81) );
  INV_X1 U158 ( .A(n82), .ZN(n336) );
  AOI22_X1 U159 ( .A1(incPC_q[14]), .A2(n408), .B1(incPC_d[14]), .B2(n398), 
        .ZN(n82) );
  INV_X1 U160 ( .A(n83), .ZN(n335) );
  AOI22_X1 U161 ( .A1(incPC_q[13]), .A2(n408), .B1(incPC_d[13]), .B2(n398), 
        .ZN(n83) );
  INV_X1 U162 ( .A(n84), .ZN(n334) );
  AOI22_X1 U163 ( .A1(incPC_q[12]), .A2(n408), .B1(incPC_d[12]), .B2(n398), 
        .ZN(n84) );
  INV_X1 U164 ( .A(n85), .ZN(n333) );
  AOI22_X1 U165 ( .A1(incPC_q[11]), .A2(n408), .B1(incPC_d[11]), .B2(n398), 
        .ZN(n85) );
  INV_X1 U166 ( .A(n86), .ZN(n332) );
  AOI22_X1 U167 ( .A1(incPC_q[10]), .A2(n408), .B1(incPC_d[10]), .B2(n398), 
        .ZN(n86) );
  INV_X1 U168 ( .A(n87), .ZN(n322) );
  AOI22_X1 U169 ( .A1(incPC_q[0]), .A2(n408), .B1(incPC_d[0]), .B2(n395), .ZN(
        n87) );
  INV_X1 U170 ( .A(n88), .ZN(n216) );
  AOI22_X1 U171 ( .A1(imm32_q[9]), .A2(n408), .B1(imm32_d[9]), .B2(n395), .ZN(
        n88) );
  INV_X1 U172 ( .A(n89), .ZN(n215) );
  AOI22_X1 U173 ( .A1(imm32_q[8]), .A2(n408), .B1(imm32_d[8]), .B2(n395), .ZN(
        n89) );
  INV_X1 U174 ( .A(n90), .ZN(n214) );
  AOI22_X1 U175 ( .A1(imm32_q[7]), .A2(n409), .B1(imm32_d[7]), .B2(n395), .ZN(
        n90) );
  INV_X1 U176 ( .A(n91), .ZN(n213) );
  AOI22_X1 U177 ( .A1(imm32_q[6]), .A2(n409), .B1(imm32_d[6]), .B2(n395), .ZN(
        n91) );
  INV_X1 U178 ( .A(n92), .ZN(n212) );
  AOI22_X1 U179 ( .A1(imm32_q[5]), .A2(n409), .B1(imm32_d[5]), .B2(n394), .ZN(
        n92) );
  INV_X1 U180 ( .A(n93), .ZN(n211) );
  AOI22_X1 U181 ( .A1(imm32_q[4]), .A2(n409), .B1(imm32_d[4]), .B2(n393), .ZN(
        n93) );
  INV_X1 U182 ( .A(n94), .ZN(n210) );
  AOI22_X1 U183 ( .A1(imm32_q[3]), .A2(n409), .B1(imm32_d[3]), .B2(n394), .ZN(
        n94) );
  INV_X1 U184 ( .A(n95), .ZN(n238) );
  AOI22_X1 U185 ( .A1(imm32_q[31]), .A2(n409), .B1(imm32_d[31]), .B2(n393), 
        .ZN(n95) );
  INV_X1 U186 ( .A(n96), .ZN(n237) );
  AOI22_X1 U187 ( .A1(imm32_q[30]), .A2(n409), .B1(imm32_d[30]), .B2(n394), 
        .ZN(n96) );
  INV_X1 U188 ( .A(n97), .ZN(n209) );
  AOI22_X1 U189 ( .A1(imm32_q[2]), .A2(n409), .B1(imm32_d[2]), .B2(n398), .ZN(
        n97) );
  INV_X1 U190 ( .A(n98), .ZN(n236) );
  AOI22_X1 U191 ( .A1(imm32_q[29]), .A2(n409), .B1(imm32_d[29]), .B2(n390), 
        .ZN(n98) );
  INV_X1 U192 ( .A(n99), .ZN(n235) );
  AOI22_X1 U193 ( .A1(imm32_q[28]), .A2(n409), .B1(imm32_d[28]), .B2(n396), 
        .ZN(n99) );
  INV_X1 U194 ( .A(n100), .ZN(n234) );
  AOI22_X1 U195 ( .A1(imm32_q[27]), .A2(n409), .B1(imm32_d[27]), .B2(n396), 
        .ZN(n100) );
  INV_X1 U196 ( .A(n101), .ZN(n233) );
  AOI22_X1 U197 ( .A1(imm32_q[26]), .A2(n409), .B1(imm32_d[26]), .B2(n396), 
        .ZN(n101) );
  INV_X1 U198 ( .A(n102), .ZN(n232) );
  AOI22_X1 U199 ( .A1(imm32_q[25]), .A2(n409), .B1(imm32_d[25]), .B2(n396), 
        .ZN(n102) );
  INV_X1 U200 ( .A(n103), .ZN(n231) );
  AOI22_X1 U201 ( .A1(imm32_q[24]), .A2(n409), .B1(imm32_d[24]), .B2(n396), 
        .ZN(n103) );
  INV_X1 U202 ( .A(n104), .ZN(n230) );
  AOI22_X1 U203 ( .A1(imm32_q[23]), .A2(n409), .B1(imm32_d[23]), .B2(n395), 
        .ZN(n104) );
  INV_X1 U204 ( .A(n105), .ZN(n229) );
  AOI22_X1 U205 ( .A1(imm32_q[22]), .A2(n409), .B1(imm32_d[22]), .B2(n395), 
        .ZN(n105) );
  INV_X1 U206 ( .A(n106), .ZN(n228) );
  AOI22_X1 U207 ( .A1(imm32_q[21]), .A2(n409), .B1(imm32_d[21]), .B2(n395), 
        .ZN(n106) );
  INV_X1 U208 ( .A(n107), .ZN(n227) );
  AOI22_X1 U209 ( .A1(imm32_q[20]), .A2(n409), .B1(imm32_d[20]), .B2(n395), 
        .ZN(n107) );
  INV_X1 U210 ( .A(n108), .ZN(n208) );
  AOI22_X1 U211 ( .A1(imm32_q[1]), .A2(n409), .B1(imm32_d[1]), .B2(n395), .ZN(
        n108) );
  INV_X1 U212 ( .A(n109), .ZN(n226) );
  AOI22_X1 U213 ( .A1(imm32_q[19]), .A2(n409), .B1(imm32_d[19]), .B2(n395), 
        .ZN(n109) );
  INV_X1 U214 ( .A(n110), .ZN(n225) );
  AOI22_X1 U215 ( .A1(imm32_q[18]), .A2(n409), .B1(imm32_d[18]), .B2(n395), 
        .ZN(n110) );
  INV_X1 U216 ( .A(n111), .ZN(n224) );
  AOI22_X1 U217 ( .A1(imm32_q[17]), .A2(n409), .B1(imm32_d[17]), .B2(n396), 
        .ZN(n111) );
  INV_X1 U218 ( .A(n112), .ZN(n223) );
  AOI22_X1 U219 ( .A1(imm32_q[16]), .A2(n409), .B1(imm32_d[16]), .B2(n395), 
        .ZN(n112) );
  INV_X1 U220 ( .A(n113), .ZN(n222) );
  AOI22_X1 U221 ( .A1(imm32_q[15]), .A2(n409), .B1(imm32_d[15]), .B2(n396), 
        .ZN(n113) );
  INV_X1 U222 ( .A(n114), .ZN(n221) );
  AOI22_X1 U223 ( .A1(imm32_q[14]), .A2(n409), .B1(imm32_d[14]), .B2(n395), 
        .ZN(n114) );
  INV_X1 U224 ( .A(n115), .ZN(n220) );
  AOI22_X1 U225 ( .A1(imm32_q[13]), .A2(n409), .B1(imm32_d[13]), .B2(n396), 
        .ZN(n115) );
  INV_X1 U226 ( .A(n116), .ZN(n219) );
  AOI22_X1 U227 ( .A1(imm32_q[12]), .A2(n409), .B1(imm32_d[12]), .B2(n396), 
        .ZN(n116) );
  INV_X1 U228 ( .A(n117), .ZN(n218) );
  AOI22_X1 U229 ( .A1(imm32_q[11]), .A2(n410), .B1(imm32_d[11]), .B2(n396), 
        .ZN(n117) );
  INV_X1 U230 ( .A(n118), .ZN(n217) );
  AOI22_X1 U231 ( .A1(imm32_q[10]), .A2(n410), .B1(imm32_d[10]), .B2(n392), 
        .ZN(n118) );
  INV_X1 U232 ( .A(n119), .ZN(n207) );
  AOI22_X1 U233 ( .A1(imm32_q[0]), .A2(n410), .B1(imm32_d[0]), .B2(n393), .ZN(
        n119) );
  INV_X1 U234 ( .A(n120), .ZN(n242) );
  AOI22_X1 U235 ( .A1(fp_q), .A2(n410), .B1(fp_d), .B2(n393), .ZN(n120) );
  INV_X1 U236 ( .A(n121), .ZN(n240) );
  AOI22_X1 U237 ( .A1(dSize_q[1]), .A2(n410), .B1(dSize_d[1]), .B2(n394), .ZN(
        n121) );
  INV_X1 U238 ( .A(n122), .ZN(n239) );
  AOI22_X1 U239 ( .A1(dSize_q[0]), .A2(n410), .B1(dSize_d[0]), .B2(n393), .ZN(
        n122) );
  INV_X1 U240 ( .A(n123), .ZN(n199) );
  AOI22_X1 U241 ( .A1(busB_sel_d[1]), .A2(n399), .B1(busB_sel_q[1]), .B2(n419), 
        .ZN(n123) );
  INV_X1 U242 ( .A(n124), .ZN(n198) );
  AOI22_X1 U243 ( .A1(busB_sel_d[0]), .A2(n399), .B1(busB_sel_q[0]), .B2(n420), 
        .ZN(n124) );
  INV_X1 U244 ( .A(n125), .ZN(n267) );
  AOI22_X1 U245 ( .A1(busB_q[9]), .A2(n410), .B1(busB_d[9]), .B2(n392), .ZN(
        n125) );
  INV_X1 U246 ( .A(n126), .ZN(n266) );
  AOI22_X1 U247 ( .A1(busB_q[8]), .A2(n410), .B1(busB_d[8]), .B2(n391), .ZN(
        n126) );
  INV_X1 U248 ( .A(n127), .ZN(n265) );
  AOI22_X1 U249 ( .A1(busB_q[7]), .A2(n410), .B1(busB_d[7]), .B2(n391), .ZN(
        n127) );
  INV_X1 U250 ( .A(n128), .ZN(n264) );
  AOI22_X1 U251 ( .A1(busB_q[6]), .A2(n410), .B1(busB_d[6]), .B2(n391), .ZN(
        n128) );
  INV_X1 U252 ( .A(n129), .ZN(n263) );
  AOI22_X1 U253 ( .A1(busB_q[5]), .A2(n410), .B1(busB_d[5]), .B2(n392), .ZN(
        n129) );
  INV_X1 U254 ( .A(n130), .ZN(n262) );
  AOI22_X1 U255 ( .A1(busB_q[4]), .A2(n410), .B1(busB_d[4]), .B2(n394), .ZN(
        n130) );
  INV_X1 U256 ( .A(n131), .ZN(n261) );
  AOI22_X1 U257 ( .A1(busB_q[3]), .A2(n410), .B1(busB_d[3]), .B2(n393), .ZN(
        n131) );
  INV_X1 U258 ( .A(n132), .ZN(n289) );
  AOI22_X1 U259 ( .A1(busB_q[31]), .A2(n410), .B1(busB_d[31]), .B2(n392), .ZN(
        n132) );
  INV_X1 U260 ( .A(n133), .ZN(n288) );
  AOI22_X1 U261 ( .A1(busB_q[30]), .A2(n410), .B1(busB_d[30]), .B2(n393), .ZN(
        n133) );
  INV_X1 U262 ( .A(n134), .ZN(n260) );
  AOI22_X1 U263 ( .A1(busB_q[2]), .A2(n410), .B1(busB_d[2]), .B2(n393), .ZN(
        n134) );
  INV_X1 U264 ( .A(n135), .ZN(n287) );
  AOI22_X1 U265 ( .A1(busB_q[29]), .A2(n410), .B1(busB_d[29]), .B2(n393), .ZN(
        n135) );
  INV_X1 U266 ( .A(n136), .ZN(n286) );
  AOI22_X1 U267 ( .A1(busB_q[28]), .A2(n410), .B1(busB_d[28]), .B2(n394), .ZN(
        n136) );
  INV_X1 U268 ( .A(n137), .ZN(n285) );
  AOI22_X1 U269 ( .A1(busB_q[27]), .A2(n410), .B1(busB_d[27]), .B2(n393), .ZN(
        n137) );
  INV_X1 U270 ( .A(n138), .ZN(n284) );
  AOI22_X1 U271 ( .A1(busB_q[26]), .A2(n410), .B1(busB_d[26]), .B2(n393), .ZN(
        n138) );
  INV_X1 U272 ( .A(n139), .ZN(n283) );
  AOI22_X1 U273 ( .A1(busB_q[25]), .A2(n410), .B1(busB_d[25]), .B2(n393), .ZN(
        n139) );
  INV_X1 U274 ( .A(n140), .ZN(n282) );
  AOI22_X1 U275 ( .A1(busB_q[24]), .A2(n410), .B1(busB_d[24]), .B2(n393), .ZN(
        n140) );
  INV_X1 U276 ( .A(n141), .ZN(n281) );
  AOI22_X1 U277 ( .A1(busB_q[23]), .A2(n410), .B1(busB_d[23]), .B2(n393), .ZN(
        n141) );
  INV_X1 U278 ( .A(n142), .ZN(n280) );
  AOI22_X1 U279 ( .A1(busB_q[22]), .A2(n410), .B1(busB_d[22]), .B2(n393), .ZN(
        n142) );
  INV_X1 U280 ( .A(n143), .ZN(n279) );
  AOI22_X1 U281 ( .A1(busB_q[21]), .A2(n410), .B1(busB_d[21]), .B2(n394), .ZN(
        n143) );
  INV_X1 U282 ( .A(n144), .ZN(n278) );
  AOI22_X1 U283 ( .A1(busB_q[20]), .A2(n410), .B1(busB_d[20]), .B2(n394), .ZN(
        n144) );
  INV_X1 U284 ( .A(n145), .ZN(n259) );
  AOI22_X1 U285 ( .A1(busB_q[1]), .A2(n411), .B1(busB_d[1]), .B2(n394), .ZN(
        n145) );
  INV_X1 U286 ( .A(n146), .ZN(n277) );
  AOI22_X1 U287 ( .A1(busB_q[19]), .A2(n411), .B1(busB_d[19]), .B2(n394), .ZN(
        n146) );
  INV_X1 U288 ( .A(n147), .ZN(n276) );
  AOI22_X1 U289 ( .A1(busB_q[18]), .A2(n411), .B1(busB_d[18]), .B2(n394), .ZN(
        n147) );
  INV_X1 U290 ( .A(n148), .ZN(n275) );
  AOI22_X1 U291 ( .A1(busB_q[17]), .A2(n411), .B1(busB_d[17]), .B2(n393), .ZN(
        n148) );
  INV_X1 U292 ( .A(n149), .ZN(n274) );
  AOI22_X1 U293 ( .A1(busB_q[16]), .A2(n411), .B1(busB_d[16]), .B2(n391), .ZN(
        n149) );
  INV_X1 U294 ( .A(n150), .ZN(n273) );
  AOI22_X1 U295 ( .A1(busB_q[15]), .A2(n411), .B1(busB_d[15]), .B2(n394), .ZN(
        n150) );
  INV_X1 U296 ( .A(n151), .ZN(n272) );
  AOI22_X1 U297 ( .A1(busB_q[14]), .A2(n411), .B1(busB_d[14]), .B2(n394), .ZN(
        n151) );
  INV_X1 U298 ( .A(n152), .ZN(n271) );
  AOI22_X1 U299 ( .A1(busB_q[13]), .A2(n411), .B1(busB_d[13]), .B2(n394), .ZN(
        n152) );
  INV_X1 U300 ( .A(n153), .ZN(n270) );
  AOI22_X1 U301 ( .A1(busB_q[12]), .A2(n411), .B1(busB_d[12]), .B2(n394), .ZN(
        n153) );
  INV_X1 U302 ( .A(n154), .ZN(n269) );
  AOI22_X1 U303 ( .A1(busB_q[11]), .A2(n411), .B1(busB_d[11]), .B2(n394), .ZN(
        n154) );
  INV_X1 U304 ( .A(n155), .ZN(n268) );
  AOI22_X1 U305 ( .A1(busB_q[10]), .A2(n411), .B1(busB_d[10]), .B2(n391), .ZN(
        n155) );
  INV_X1 U306 ( .A(n156), .ZN(n258) );
  AOI22_X1 U307 ( .A1(busB_q[0]), .A2(n411), .B1(busB_d[0]), .B2(n391), .ZN(
        n156) );
  INV_X1 U308 ( .A(n157), .ZN(n201) );
  AOI22_X1 U309 ( .A1(busA_sel_d[1]), .A2(n401), .B1(busA_sel_q[1]), .B2(n419), 
        .ZN(n157) );
  INV_X1 U310 ( .A(n158), .ZN(n200) );
  AOI22_X1 U311 ( .A1(busA_sel_d[0]), .A2(n400), .B1(busA_sel_q[0]), .B2(n420), 
        .ZN(n158) );
  INV_X1 U312 ( .A(n159), .ZN(n3) );
  OAI21_X1 U313 ( .B1(ctrl[1]), .B2(ctrl[0]), .A(n412), .ZN(n159) );
  INV_X1 U314 ( .A(n160), .ZN(n299) );
  AOI22_X1 U315 ( .A1(busA_q[9]), .A2(n411), .B1(busA_d[9]), .B2(n390), .ZN(
        n160) );
  INV_X1 U316 ( .A(n161), .ZN(n298) );
  AOI22_X1 U317 ( .A1(busA_q[8]), .A2(n411), .B1(busA_d[8]), .B2(n390), .ZN(
        n161) );
  INV_X1 U318 ( .A(n162), .ZN(n297) );
  AOI22_X1 U319 ( .A1(busA_q[7]), .A2(n411), .B1(busA_d[7]), .B2(n390), .ZN(
        n162) );
  INV_X1 U320 ( .A(n163), .ZN(n296) );
  AOI22_X1 U321 ( .A1(busA_q[6]), .A2(n411), .B1(busA_d[6]), .B2(n391), .ZN(
        n163) );
  INV_X1 U322 ( .A(n164), .ZN(n295) );
  AOI22_X1 U323 ( .A1(busA_q[5]), .A2(n411), .B1(busA_d[5]), .B2(n390), .ZN(
        n164) );
  INV_X1 U324 ( .A(n165), .ZN(n294) );
  AOI22_X1 U325 ( .A1(busA_q[4]), .A2(n411), .B1(busA_d[4]), .B2(n390), .ZN(
        n165) );
  INV_X1 U326 ( .A(n166), .ZN(n293) );
  AOI22_X1 U327 ( .A1(busA_q[3]), .A2(n411), .B1(busA_d[3]), .B2(n390), .ZN(
        n166) );
  INV_X1 U328 ( .A(n167), .ZN(n321) );
  AOI22_X1 U329 ( .A1(busA_q[31]), .A2(n411), .B1(busA_d[31]), .B2(n393), .ZN(
        n167) );
  INV_X1 U330 ( .A(n168), .ZN(n320) );
  AOI22_X1 U331 ( .A1(busA_q[30]), .A2(n411), .B1(busA_d[30]), .B2(n392), .ZN(
        n168) );
  INV_X1 U332 ( .A(n169), .ZN(n292) );
  AOI22_X1 U333 ( .A1(busA_q[2]), .A2(n411), .B1(busA_d[2]), .B2(n392), .ZN(
        n169) );
  INV_X1 U334 ( .A(n170), .ZN(n319) );
  AOI22_X1 U335 ( .A1(busA_q[29]), .A2(n411), .B1(busA_d[29]), .B2(n392), .ZN(
        n170) );
  INV_X1 U336 ( .A(n171), .ZN(n318) );
  AOI22_X1 U337 ( .A1(busA_q[28]), .A2(n411), .B1(busA_d[28]), .B2(n392), .ZN(
        n171) );
  INV_X1 U338 ( .A(n172), .ZN(n317) );
  AOI22_X1 U339 ( .A1(busA_q[27]), .A2(n411), .B1(busA_d[27]), .B2(n391), .ZN(
        n172) );
  INV_X1 U340 ( .A(n173), .ZN(n316) );
  AOI22_X1 U341 ( .A1(busA_q[26]), .A2(n411), .B1(busA_d[26]), .B2(n391), .ZN(
        n173) );
  INV_X1 U342 ( .A(n174), .ZN(n315) );
  AOI22_X1 U343 ( .A1(busA_q[25]), .A2(n411), .B1(busA_d[25]), .B2(n391), .ZN(
        n174) );
  INV_X1 U344 ( .A(n175), .ZN(n314) );
  AOI22_X1 U345 ( .A1(busA_q[24]), .A2(n412), .B1(busA_d[24]), .B2(n392), .ZN(
        n175) );
  INV_X1 U346 ( .A(n176), .ZN(n313) );
  AOI22_X1 U347 ( .A1(busA_q[23]), .A2(n412), .B1(busA_d[23]), .B2(n391), .ZN(
        n176) );
  INV_X1 U348 ( .A(n177), .ZN(n312) );
  AOI22_X1 U349 ( .A1(busA_q[22]), .A2(n412), .B1(busA_d[22]), .B2(n391), .ZN(
        n177) );
  INV_X1 U350 ( .A(n178), .ZN(n311) );
  AOI22_X1 U351 ( .A1(busA_q[21]), .A2(n412), .B1(busA_d[21]), .B2(n391), .ZN(
        n178) );
  INV_X1 U352 ( .A(n179), .ZN(n310) );
  AOI22_X1 U353 ( .A1(busA_q[20]), .A2(n412), .B1(busA_d[20]), .B2(n391), .ZN(
        n179) );
  INV_X1 U354 ( .A(n180), .ZN(n291) );
  AOI22_X1 U355 ( .A1(busA_q[1]), .A2(n412), .B1(busA_d[1]), .B2(n391), .ZN(
        n180) );
  INV_X1 U356 ( .A(n181), .ZN(n309) );
  AOI22_X1 U357 ( .A1(busA_q[19]), .A2(n412), .B1(busA_d[19]), .B2(n391), .ZN(
        n181) );
  INV_X1 U358 ( .A(n182), .ZN(n308) );
  AOI22_X1 U359 ( .A1(busA_q[18]), .A2(n412), .B1(busA_d[18]), .B2(n391), .ZN(
        n182) );
  INV_X1 U360 ( .A(n183), .ZN(n307) );
  AOI22_X1 U361 ( .A1(busA_q[17]), .A2(n412), .B1(busA_d[17]), .B2(n392), .ZN(
        n183) );
  INV_X1 U362 ( .A(n184), .ZN(n306) );
  AOI22_X1 U363 ( .A1(busA_q[16]), .A2(n412), .B1(busA_d[16]), .B2(n392), .ZN(
        n184) );
  INV_X1 U364 ( .A(n185), .ZN(n305) );
  AOI22_X1 U365 ( .A1(busA_q[15]), .A2(n412), .B1(busA_d[15]), .B2(n392), .ZN(
        n185) );
  INV_X1 U366 ( .A(n186), .ZN(n304) );
  AOI22_X1 U367 ( .A1(busA_q[14]), .A2(n412), .B1(busA_d[14]), .B2(n392), .ZN(
        n186) );
  INV_X1 U368 ( .A(n187), .ZN(n303) );
  AOI22_X1 U369 ( .A1(busA_q[13]), .A2(n412), .B1(busA_d[13]), .B2(n392), .ZN(
        n187) );
  INV_X1 U370 ( .A(n188), .ZN(n302) );
  AOI22_X1 U371 ( .A1(busA_q[12]), .A2(n412), .B1(busA_d[12]), .B2(n392), .ZN(
        n188) );
  INV_X1 U372 ( .A(n189), .ZN(n301) );
  AOI22_X1 U373 ( .A1(busA_q[11]), .A2(n412), .B1(busA_d[11]), .B2(n392), .ZN(
        n189) );
  INV_X1 U374 ( .A(n190), .ZN(n300) );
  AOI22_X1 U375 ( .A1(busA_q[10]), .A2(n412), .B1(busA_d[10]), .B2(n392), .ZN(
        n190) );
  INV_X1 U376 ( .A(n191), .ZN(n290) );
  AOI22_X1 U377 ( .A1(busA_q[0]), .A2(n412), .B1(busA_d[0]), .B2(n392), .ZN(
        n191) );
  INV_X1 U378 ( .A(n192), .ZN(n247) );
  AOI22_X1 U379 ( .A1(branch_q), .A2(n412), .B1(branch_d), .B2(n396), .ZN(n192) );
  INV_X1 U380 ( .A(n193), .ZN(n253) );
  AOI22_X1 U381 ( .A1(aluSrc_q), .A2(n412), .B1(aluSrc_d), .B2(n396), .ZN(n193) );
  INV_X1 U382 ( .A(n194), .ZN(n257) );
  AOI22_X1 U383 ( .A1(aluCtrl_q[3]), .A2(n412), .B1(aluCtrl_d[3]), .B2(n396), 
        .ZN(n194) );
  INV_X1 U384 ( .A(n195), .ZN(n256) );
  AOI22_X1 U385 ( .A1(aluCtrl_q[2]), .A2(n412), .B1(aluCtrl_d[2]), .B2(n396), 
        .ZN(n195) );
  INV_X1 U386 ( .A(n196), .ZN(n255) );
  AOI22_X1 U387 ( .A1(aluCtrl_q[1]), .A2(n412), .B1(aluCtrl_d[1]), .B2(n396), 
        .ZN(n196) );
  INV_X1 U388 ( .A(n197), .ZN(n254) );
  AOI22_X1 U389 ( .A1(aluCtrl_q[0]), .A2(n407), .B1(aluCtrl_d[0]), .B2(n391), 
        .ZN(n197) );
  NAND2_X1 U391 ( .A1(ctrl[1]), .A2(ctrl[0]), .ZN(n6) );
  INV_X4 U392 ( .A(n6), .ZN(n418) );
  INV_X4 U393 ( .A(n417), .ZN(n413) );
  INV_X4 U394 ( .A(n418), .ZN(n417) );
  INV_X4 U395 ( .A(n415), .ZN(n402) );
  INV_X4 U396 ( .A(n414), .ZN(n409) );
  INV_X4 U397 ( .A(n413), .ZN(n410) );
  INV_X4 U398 ( .A(n413), .ZN(n412) );
  INV_X4 U399 ( .A(n413), .ZN(n411) );
  INV_X4 U400 ( .A(n414), .ZN(n407) );
  INV_X4 U401 ( .A(n403), .ZN(n397) );
  INV_X4 U402 ( .A(n403), .ZN(n398) );
  INV_X4 U403 ( .A(n414), .ZN(n408) );
  INV_X4 U404 ( .A(n402), .ZN(n401) );
  INV_X4 U405 ( .A(n407), .ZN(n390) );
  INV_X4 U406 ( .A(rst), .ZN(n435) );
  INV_X4 U407 ( .A(n435), .ZN(n424) );
  INV_X4 U408 ( .A(n436), .ZN(n423) );
  INV_X4 U409 ( .A(n436), .ZN(n427) );
  INV_X4 U410 ( .A(n435), .ZN(n426) );
  INV_X4 U411 ( .A(n434), .ZN(n431) );
  INV_X4 U412 ( .A(n434), .ZN(n430) );
  INV_X4 U413 ( .A(n436), .ZN(n429) );
  INV_X4 U414 ( .A(n434), .ZN(n428) );
  INV_X4 U415 ( .A(n435), .ZN(n425) );
  INV_X4 U416 ( .A(n418), .ZN(n416) );
  INV_X4 U417 ( .A(n416), .ZN(n414) );
  INV_X4 U418 ( .A(n414), .ZN(n406) );
  INV_X4 U419 ( .A(n406), .ZN(n391) );
  INV_X4 U420 ( .A(n406), .ZN(n392) );
  INV_X4 U421 ( .A(rst), .ZN(n434) );
  INV_X4 U422 ( .A(n414), .ZN(n404) );
  INV_X4 U423 ( .A(n404), .ZN(n395) );
  INV_X4 U424 ( .A(n404), .ZN(n396) );
  INV_X4 U425 ( .A(n414), .ZN(n405) );
  INV_X4 U426 ( .A(n405), .ZN(n393) );
  INV_X4 U427 ( .A(n405), .ZN(n394) );
  INV_X4 U428 ( .A(rst), .ZN(n436) );
  INV_X4 U429 ( .A(n436), .ZN(n432) );
  INV_X4 U430 ( .A(n436), .ZN(n433) );
  INV_X4 U431 ( .A(n415), .ZN(n403) );
  INV_X4 U432 ( .A(n416), .ZN(n415) );
  INV_X4 U433 ( .A(n402), .ZN(n399) );
  INV_X4 U434 ( .A(n402), .ZN(n400) );
  INV_X4 U435 ( .A(n159), .ZN(n419) );
  INV_X4 U436 ( .A(n159), .ZN(n420) );
  INV_X4 U437 ( .A(n436), .ZN(n421) );
  INV_X4 U438 ( .A(n436), .ZN(n422) );
  DFFR_X1 regDst_q_reg ( .D(n251), .CK(clk), .RN(rst), .Q(regDst_q) );
  DFFS_X1 not_trap_q_reg ( .D(n386), .CK(clk), .SN(rst), .Q(not_trap_q) );
  DFFR_X1 op0_q_reg ( .D(n243), .CK(clk), .RN(rst), .Q(op0_q) );
endmodule

