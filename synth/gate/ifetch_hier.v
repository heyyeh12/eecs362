
module ifetch ( clk, rst, initPC, nextPC, takeLeap, enable, not_trap, curPC, 
        incPC );
  input [31:0] initPC;
  input [31:0] nextPC;
  output [31:0] curPC;
  output [31:0] incPC;
  input clk, rst, takeLeap, enable, not_trap;
  wire   n3, n5, n15, n53, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n251, n252, n253, n286,
         n287, n288, n289, n290, n291, n292, n293, n296, n297, n298, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n317, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n340, n341, n342, n343,
         n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, n354,
         n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387,
         n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398,
         n399, n400, n401, n402, n403, n404, n405, n406, n407, n408, n409,
         n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420,
         n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431,
         n432, n433, n434, n435, n436, n437, n438, n439, n440, n441, n442,
         n443, n444, n445, n446, n447, n448, n449, n450, n451, n452, n453,
         n454, n455, n456, n457, n458, n459, n460, n461, n462, n463, n464,
         n465, n466, n467, n468, n469, n470, n471, n472, n473, n474, n475,
         n476, n477, n478, n479, n480, n481, n482, n483, n484, n485, n486,
         n487, n488, n489, n490, n491, n492, n493, n494, n495, n496, n497,
         n498, n499, n500, n501, n502, n503, n504, n505, n506, n507, n508,
         n509, n510, n511, n512, n513, n514, n515, n516, n517, n518, n519,
         n520, n521, n522, n523, n524, n525, n526, n527, n528, n529, n530,
         n531, n532, n533, n534, n535, n536, n537, n538, n539, n540, n541,
         n542, n543, n548, n549;
  wire   [31:2] PC_q;

  DFFRS_X1 \dffa/q_reg[0]  ( .D(n253), .CK(clk), .RN(n221), .SN(n220), .QN(
        n289) );
  DFFRS_X1 \dffa/q_reg[1]  ( .D(n252), .CK(clk), .RN(n219), .SN(n218), .QN(
        n290) );
  DFFRS_X1 \dffa/q_reg[3]  ( .D(n329), .CK(clk), .RN(n215), .SN(n214), .Q(
        PC_q[3]), .QN(n286) );
  DFFRS_X1 \dffa/q_reg[4]  ( .D(n249), .CK(clk), .RN(n213), .SN(n212), .Q(
        PC_q[4]), .QN(n291) );
  DFFRS_X1 \dffa/q_reg[6]  ( .D(n247), .CK(clk), .RN(n209), .SN(n208), .Q(
        PC_q[6]), .QN(n305) );
  DFFRS_X1 \dffa/q_reg[7]  ( .D(n246), .CK(clk), .RN(n207), .SN(n206), .Q(
        PC_q[7]), .QN(n306) );
  DFFRS_X1 \dffa/q_reg[8]  ( .D(n245), .CK(clk), .RN(n205), .SN(n204), .Q(
        PC_q[8]), .QN(n314) );
  DFFRS_X1 \dffa/q_reg[9]  ( .D(n244), .CK(clk), .RN(n203), .SN(n202), .Q(
        PC_q[9]), .QN(n287) );
  DFFRS_X1 \dffa/q_reg[10]  ( .D(n243), .CK(clk), .RN(n201), .SN(n200), .Q(
        PC_q[10]) );
  DFFRS_X1 \dffa/q_reg[13]  ( .D(n240), .CK(clk), .RN(n195), .SN(n194), .Q(
        PC_q[13]), .QN(n308) );
  DFFRS_X1 \dffa/q_reg[14]  ( .D(n239), .CK(clk), .RN(n193), .SN(n192), .Q(
        PC_q[14]) );
  DFFRS_X1 \dffa/q_reg[15]  ( .D(n238), .CK(clk), .RN(n191), .SN(n190), .Q(
        PC_q[15]), .QN(n309) );
  DFFRS_X1 \dffa/q_reg[16]  ( .D(n237), .CK(clk), .RN(n189), .SN(n188), .Q(
        PC_q[16]), .QN(n310) );
  DFFRS_X1 \dffa/q_reg[17]  ( .D(n236), .CK(clk), .RN(n187), .SN(n186), .Q(
        PC_q[17]), .QN(n311) );
  DFFRS_X1 \dffa/q_reg[18]  ( .D(n235), .CK(clk), .RN(n185), .SN(n184), .Q(
        PC_q[18]) );
  DFFRS_X1 \dffa/q_reg[19]  ( .D(n234), .CK(clk), .RN(n183), .SN(n182), .Q(
        PC_q[19]), .QN(n312) );
  DFFRS_X1 \dffa/q_reg[20]  ( .D(n233), .CK(clk), .RN(n181), .SN(n180), .Q(
        PC_q[20]), .QN(n307) );
  DFFRS_X1 \dffa/q_reg[21]  ( .D(n232), .CK(clk), .RN(n179), .SN(n178), .Q(
        PC_q[21]), .QN(n313) );
  DFFRS_X1 \dffa/q_reg[22]  ( .D(n231), .CK(clk), .RN(n177), .SN(n176), .Q(
        PC_q[22]) );
  DFFRS_X1 \dffa/q_reg[23]  ( .D(n230), .CK(clk), .RN(n175), .SN(n174), .Q(
        PC_q[23]), .QN(n304) );
  DFFRS_X1 \dffa/q_reg[24]  ( .D(n229), .CK(clk), .RN(n173), .SN(n172), .Q(
        PC_q[24]), .QN(n303) );
  DFFRS_X1 \dffa/q_reg[25]  ( .D(n228), .CK(clk), .RN(n171), .SN(n170), .Q(
        PC_q[25]), .QN(n302) );
  DFFRS_X1 \dffa/q_reg[26]  ( .D(n227), .CK(clk), .RN(n169), .SN(n168), .Q(
        PC_q[26]) );
  DFFRS_X1 \dffa/q_reg[27]  ( .D(n226), .CK(clk), .RN(n167), .SN(n166), .Q(
        PC_q[27]), .QN(n301) );
  DFFRS_X1 \dffa/q_reg[28]  ( .D(n225), .CK(clk), .RN(n165), .SN(n164), .Q(
        PC_q[28]), .QN(n300) );
  DFFRS_X1 \dffa/q_reg[29]  ( .D(n224), .CK(clk), .RN(n163), .SN(n162), .Q(
        PC_q[29]) );
  DFFRS_X1 \dffa/q_reg[30]  ( .D(n223), .CK(clk), .RN(n161), .SN(n160), .Q(
        PC_q[30]), .QN(n293) );
  DFFRS_X1 \dffa/q_reg[31]  ( .D(n222), .CK(clk), .RN(n159), .SN(n158), .Q(
        PC_q[31]), .QN(n292) );
  NAND2_X1 U34 ( .A1(initPC[9]), .A2(n336), .ZN(n202) );
  OR2_X1 U35 ( .A1(n334), .A2(initPC[9]), .ZN(n203) );
  NAND2_X1 U41 ( .A1(initPC[8]), .A2(n337), .ZN(n204) );
  OR2_X1 U42 ( .A1(n334), .A2(initPC[8]), .ZN(n205) );
  NAND2_X1 U46 ( .A1(initPC[7]), .A2(n336), .ZN(n206) );
  OR2_X1 U47 ( .A1(n334), .A2(initPC[7]), .ZN(n207) );
  NAND2_X1 U52 ( .A1(initPC[6]), .A2(n336), .ZN(n208) );
  OR2_X1 U53 ( .A1(n334), .A2(initPC[6]), .ZN(n209) );
  NAND2_X1 U57 ( .A1(initPC[5]), .A2(n337), .ZN(n210) );
  OR2_X1 U58 ( .A1(n334), .A2(initPC[5]), .ZN(n211) );
  INV_X1 U67 ( .A(nextPC[4]), .ZN(n15) );
  NAND2_X1 U68 ( .A1(initPC[4]), .A2(n337), .ZN(n212) );
  OR2_X1 U69 ( .A1(n334), .A2(initPC[4]), .ZN(n213) );
  NAND2_X1 U76 ( .A1(initPC[3]), .A2(n337), .ZN(n214) );
  OR2_X1 U77 ( .A1(n334), .A2(initPC[3]), .ZN(n215) );
  NAND2_X1 U87 ( .A1(initPC[31]), .A2(n337), .ZN(n158) );
  OR2_X1 U88 ( .A1(n334), .A2(initPC[31]), .ZN(n159) );
  NAND2_X1 U99 ( .A1(initPC[30]), .A2(n337), .ZN(n160) );
  OR2_X1 U100 ( .A1(n334), .A2(initPC[30]), .ZN(n161) );
  NAND2_X1 U103 ( .A1(initPC[2]), .A2(n337), .ZN(n216) );
  OR2_X1 U104 ( .A1(n334), .A2(initPC[2]), .ZN(n217) );
  NAND2_X1 U113 ( .A1(initPC[29]), .A2(n337), .ZN(n162) );
  OR2_X1 U114 ( .A1(n334), .A2(initPC[29]), .ZN(n163) );
  NAND2_X1 U122 ( .A1(initPC[28]), .A2(n337), .ZN(n164) );
  OR2_X1 U123 ( .A1(n335), .A2(initPC[28]), .ZN(n165) );
  NAND2_X1 U129 ( .A1(initPC[27]), .A2(n337), .ZN(n166) );
  OR2_X1 U130 ( .A1(n335), .A2(initPC[27]), .ZN(n167) );
  NAND2_X1 U140 ( .A1(initPC[26]), .A2(n337), .ZN(n168) );
  OR2_X1 U141 ( .A1(n335), .A2(initPC[26]), .ZN(n169) );
  NAND2_X1 U147 ( .A1(initPC[25]), .A2(n337), .ZN(n170) );
  OR2_X1 U148 ( .A1(n335), .A2(initPC[25]), .ZN(n171) );
  NAND2_X1 U156 ( .A1(initPC[24]), .A2(n337), .ZN(n172) );
  OR2_X1 U157 ( .A1(n335), .A2(initPC[24]), .ZN(n173) );
  NAND2_X1 U163 ( .A1(initPC[23]), .A2(n337), .ZN(n174) );
  OR2_X1 U164 ( .A1(n335), .A2(initPC[23]), .ZN(n175) );
  NAND2_X1 U174 ( .A1(initPC[22]), .A2(n337), .ZN(n176) );
  OR2_X1 U175 ( .A1(n335), .A2(initPC[22]), .ZN(n177) );
  NAND2_X1 U181 ( .A1(initPC[21]), .A2(n337), .ZN(n178) );
  OR2_X1 U182 ( .A1(n335), .A2(initPC[21]), .ZN(n179) );
  NAND2_X1 U190 ( .A1(initPC[20]), .A2(n337), .ZN(n180) );
  OR2_X1 U191 ( .A1(n335), .A2(initPC[20]), .ZN(n181) );
  OAI22_X1 U192 ( .A1(n3), .A2(n53), .B1(n549), .B2(n290), .ZN(n252) );
  INV_X1 U194 ( .A(nextPC[1]), .ZN(n3) );
  NAND2_X1 U195 ( .A1(initPC[1]), .A2(n337), .ZN(n218) );
  OR2_X1 U196 ( .A1(n335), .A2(initPC[1]), .ZN(n219) );
  NAND2_X1 U202 ( .A1(initPC[19]), .A2(n337), .ZN(n182) );
  OR2_X1 U203 ( .A1(n335), .A2(initPC[19]), .ZN(n183) );
  NAND2_X1 U213 ( .A1(initPC[18]), .A2(n337), .ZN(n184) );
  OR2_X1 U214 ( .A1(n335), .A2(initPC[18]), .ZN(n185) );
  NAND2_X1 U220 ( .A1(initPC[17]), .A2(n337), .ZN(n186) );
  OR2_X1 U221 ( .A1(n334), .A2(initPC[17]), .ZN(n187) );
  NAND2_X1 U229 ( .A1(initPC[16]), .A2(n337), .ZN(n188) );
  OR2_X1 U230 ( .A1(rst), .A2(initPC[16]), .ZN(n189) );
  NAND2_X1 U236 ( .A1(initPC[15]), .A2(n337), .ZN(n190) );
  OR2_X1 U237 ( .A1(rst), .A2(initPC[15]), .ZN(n191) );
  NAND2_X1 U247 ( .A1(initPC[14]), .A2(n337), .ZN(n192) );
  OR2_X1 U248 ( .A1(rst), .A2(initPC[14]), .ZN(n193) );
  NAND2_X1 U254 ( .A1(initPC[13]), .A2(n337), .ZN(n194) );
  OR2_X1 U255 ( .A1(rst), .A2(initPC[13]), .ZN(n195) );
  NAND2_X1 U262 ( .A1(initPC[12]), .A2(n337), .ZN(n196) );
  OR2_X1 U263 ( .A1(rst), .A2(initPC[12]), .ZN(n197) );
  NAND2_X1 U271 ( .A1(initPC[11]), .A2(n337), .ZN(n198) );
  OR2_X1 U272 ( .A1(rst), .A2(initPC[11]), .ZN(n199) );
  NAND2_X1 U306 ( .A1(initPC[10]), .A2(n337), .ZN(n200) );
  OR2_X1 U307 ( .A1(rst), .A2(initPC[10]), .ZN(n201) );
  OAI22_X1 U308 ( .A1(n5), .A2(n53), .B1(n549), .B2(n289), .ZN(n253) );
  INV_X1 U314 ( .A(nextPC[0]), .ZN(n5) );
  NAND2_X1 U315 ( .A1(initPC[0]), .A2(n337), .ZN(n220) );
  OR2_X1 U317 ( .A1(rst), .A2(initPC[0]), .ZN(n221) );
  DFFRS_X2 \dffa/q_reg[11]  ( .D(n242), .CK(clk), .RN(n199), .SN(n198), .Q(
        PC_q[11]) );
  DFFRS_X2 \dffa/q_reg[12]  ( .D(n241), .CK(clk), .RN(n197), .SN(n196), .Q(
        PC_q[12]), .QN(n326) );
  DFFRS_X2 \dffa/q_reg[5]  ( .D(n248), .CK(clk), .RN(n211), .SN(n210), .Q(
        PC_q[5]), .QN(n325) );
  DFFRS_X2 \dffa/q_reg[2]  ( .D(n251), .CK(clk), .RN(n217), .SN(n216), .Q(
        PC_q[2]), .QN(n288) );
  NAND2_X1 U318 ( .A1(n428), .A2(n469), .ZN(n533) );
  NAND2_X1 U319 ( .A1(n444), .A2(n469), .ZN(n532) );
  NAND2_X1 U320 ( .A1(n459), .A2(n469), .ZN(n531) );
  NAND2_X1 U321 ( .A1(n436), .A2(n469), .ZN(n438) );
  OAI21_X4 U322 ( .B1(n527), .B2(n370), .A(n369), .ZN(n469) );
  NOR2_X2 U323 ( .A1(n15), .A2(n503), .ZN(n364) );
  NAND3_X2 U324 ( .A1(n287), .A2(PC_q[10]), .A3(n332), .ZN(n525) );
  NOR2_X1 U325 ( .A1(n527), .A2(nextPC[10]), .ZN(n473) );
  OAI21_X2 U326 ( .B1(takeLeap), .B2(n523), .A(n511), .ZN(n476) );
  NOR2_X2 U327 ( .A1(n53), .A2(n481), .ZN(n483) );
  NOR2_X2 U328 ( .A1(n314), .A2(takeLeap), .ZN(n482) );
  INV_X4 U329 ( .A(n331), .ZN(n511) );
  NOR2_X2 U330 ( .A1(n514), .A2(n504), .ZN(n496) );
  NAND3_X2 U331 ( .A1(n286), .A2(PC_q[4]), .A3(n332), .ZN(n518) );
  NOR2_X2 U332 ( .A1(n53), .A2(n503), .ZN(n506) );
  NOR2_X2 U333 ( .A1(curPC[3]), .A2(n330), .ZN(n505) );
  INV_X8 U334 ( .A(incPC[2]), .ZN(curPC[2]) );
  INV_X4 U335 ( .A(n376), .ZN(n449) );
  NAND3_X2 U336 ( .A1(nextPC[9]), .A2(nextPC[10]), .A3(takeLeap), .ZN(n370) );
  INV_X4 U337 ( .A(n469), .ZN(n440) );
  NOR2_X2 U338 ( .A1(n412), .A2(n392), .ZN(n393) );
  NOR2_X2 U339 ( .A1(n538), .A2(n504), .ZN(n391) );
  NOR2_X2 U340 ( .A1(n390), .A2(n389), .ZN(n396) );
  NOR2_X2 U341 ( .A1(n53), .A2(n388), .ZN(n389) );
  INV_X4 U342 ( .A(takeLeap), .ZN(n333) );
  AOI21_X2 U343 ( .B1(curPC[10]), .B2(n527), .A(n526), .ZN(n528) );
  AOI21_X2 U344 ( .B1(nextPC[30]), .B2(n427), .A(n400), .ZN(n402) );
  NAND3_X2 U345 ( .A1(n525), .A2(n475), .A3(n474), .ZN(n243) );
  OAI21_X2 U346 ( .B1(n298), .B2(n524), .A(n549), .ZN(n474) );
  NOR2_X2 U347 ( .A1(n483), .A2(n482), .ZN(n485) );
  NAND3_X2 U348 ( .A1(n518), .A2(n502), .A3(n501), .ZN(n249) );
  OAI21_X2 U349 ( .B1(n500), .B2(n516), .A(n499), .ZN(n501) );
  NOR2_X2 U350 ( .A1(n286), .A2(n508), .ZN(n509) );
  NAND2_X2 U351 ( .A1(not_trap), .A2(enable), .ZN(n331) );
  INV_X4 U352 ( .A(takeLeap), .ZN(n332) );
  NAND2_X2 U353 ( .A1(not_trap), .A2(enable), .ZN(n330) );
  INV_X4 U354 ( .A(n336), .ZN(n334) );
  INV_X4 U355 ( .A(n336), .ZN(n335) );
  NAND2_X2 U356 ( .A1(n511), .A2(takeLeap), .ZN(n53) );
  XOR2_X2 U357 ( .A(n426), .B(n425), .Z(incPC[23]) );
  XOR2_X2 U358 ( .A(n413), .B(n412), .Z(incPC[28]) );
  AND2_X4 U359 ( .A1(PC_q[3]), .A2(n333), .ZN(n296) );
  AND2_X4 U360 ( .A1(curPC[26]), .A2(curPC[25]), .ZN(n297) );
  AND2_X4 U361 ( .A1(nextPC[10]), .A2(n527), .ZN(n298) );
  NAND2_X2 U362 ( .A1(not_trap), .A2(enable), .ZN(n504) );
  XOR2_X2 U363 ( .A(curPC[25]), .B(n422), .Z(incPC[25]) );
  XOR2_X2 U364 ( .A(n491), .B(n490), .Z(incPC[7]) );
  XOR2_X2 U365 ( .A(n493), .B(n492), .Z(incPC[6]) );
  OR2_X4 U366 ( .A1(PC_q[31]), .A2(n538), .ZN(n317) );
  XOR2_X2 U367 ( .A(n468), .B(n467), .Z(incPC[12]) );
  XOR2_X2 U368 ( .A(n415), .B(n414), .Z(incPC[27]) );
  XOR2_X2 U369 ( .A(n438), .B(n437), .Z(incPC[20]) );
  XOR2_X2 U370 ( .A(n451), .B(n450), .Z(incPC[17]) );
  XOR2_X2 U371 ( .A(n454), .B(n453), .Z(incPC[16]) );
  XOR2_X2 U372 ( .A(n457), .B(n456), .Z(incPC[15]) );
  XOR2_X2 U373 ( .A(n466), .B(n465), .Z(incPC[13]) );
  OR2_X4 U374 ( .A1(curPC[9]), .A2(n331), .ZN(n327) );
  AND2_X4 U375 ( .A1(n542), .A2(n397), .ZN(n328) );
  OR2_X4 U376 ( .A1(n510), .A2(n509), .ZN(n329) );
  INV_X4 U377 ( .A(rst), .ZN(n336) );
  INV_X4 U378 ( .A(rst), .ZN(n337) );
  XNOR2_X1 U379 ( .A(curPC[29]), .B(n535), .ZN(incPC[29]) );
  XOR2_X1 U380 ( .A(curPC[2]), .B(curPC[3]), .Z(incPC[3]) );
  NOR2_X2 U381 ( .A1(curPC[2]), .A2(n15), .ZN(n500) );
  OAI21_X2 U382 ( .B1(takeLeap), .B2(curPC[2]), .A(n511), .ZN(n507) );
  NAND3_X2 U383 ( .A1(takeLeap), .A2(curPC[2]), .A3(n364), .ZN(n365) );
  OAI211_X1 U384 ( .C1(n543), .C2(n332), .A(n542), .B(n541), .ZN(incPC[31]) );
  NAND2_X4 U385 ( .A1(n407), .A2(curPC[29]), .ZN(n394) );
  INV_X8 U386 ( .A(n535), .ZN(n407) );
  INV_X4 U387 ( .A(n381), .ZN(n428) );
  NOR2_X1 U388 ( .A1(n530), .A2(n330), .ZN(n471) );
  OAI221_X1 U389 ( .B1(PC_q[10]), .B2(n530), .C1(n529), .C2(n332), .A(n528), 
        .ZN(incPC[10]) );
  NAND2_X4 U390 ( .A1(n380), .A2(curPC[21]), .ZN(n381) );
  INV_X8 U391 ( .A(n433), .ZN(n380) );
  NAND2_X4 U392 ( .A1(n449), .A2(curPC[17]), .ZN(n377) );
  NAND2_X4 U393 ( .A1(n378), .A2(curPC[19]), .ZN(n379) );
  INV_X8 U394 ( .A(n439), .ZN(n378) );
  NAND2_X4 U395 ( .A1(n436), .A2(curPC[20]), .ZN(n433) );
  INV_X8 U396 ( .A(n379), .ZN(n436) );
  NAND2_X4 U397 ( .A1(n444), .A2(curPC[18]), .ZN(n439) );
  INV_X8 U398 ( .A(n377), .ZN(n444) );
  NAND3_X2 U399 ( .A1(PC_q[4]), .A2(curPC[2]), .A3(n296), .ZN(n366) );
  NAND2_X2 U400 ( .A1(n367), .A2(n495), .ZN(n527) );
  XNOR2_X1 U401 ( .A(n470), .B(n469), .ZN(incPC[11]) );
  NOR2_X1 U402 ( .A1(n440), .A2(n433), .ZN(n435) );
  NOR2_X1 U403 ( .A1(n440), .A2(n439), .ZN(n442) );
  NAND2_X1 U404 ( .A1(curPC[4]), .A2(incPC[2]), .ZN(n517) );
  XNOR2_X1 U405 ( .A(n495), .B(n494), .ZN(incPC[5]) );
  NOR2_X1 U406 ( .A1(n425), .A2(n426), .ZN(n424) );
  NAND2_X1 U407 ( .A1(n484), .A2(n495), .ZN(n521) );
  NAND2_X1 U408 ( .A1(n495), .A2(curPC[5]), .ZN(n493) );
  NAND2_X1 U409 ( .A1(n489), .A2(n495), .ZN(n491) );
  NOR2_X1 U410 ( .A1(incPC[2]), .A2(nextPC[4]), .ZN(n498) );
  NAND4_X2 U411 ( .A1(PC_q[9]), .A2(n332), .A3(n495), .A4(n367), .ZN(n530) );
  NAND2_X4 U412 ( .A1(n393), .A2(n422), .ZN(n535) );
  NAND3_X2 U413 ( .A1(n398), .A2(n399), .A3(n328), .ZN(n222) );
  NAND2_X4 U414 ( .A1(n366), .A2(n365), .ZN(n495) );
  NAND2_X4 U415 ( .A1(n382), .A2(n428), .ZN(n426) );
  INV_X4 U416 ( .A(n53), .ZN(n549) );
  NAND2_X2 U417 ( .A1(nextPC[30]), .A2(takeLeap), .ZN(n338) );
  NAND2_X2 U418 ( .A1(PC_q[30]), .A2(n333), .ZN(n538) );
  NAND2_X2 U419 ( .A1(n338), .A2(n538), .ZN(curPC[30]) );
  INV_X4 U420 ( .A(curPC[30]), .ZN(n548) );
  MUX2_X2 U421 ( .A(PC_q[29]), .B(nextPC[29]), .S(takeLeap), .Z(curPC[29]) );
  INV_X4 U422 ( .A(nextPC[28]), .ZN(n340) );
  MUX2_X2 U423 ( .A(n300), .B(n340), .S(takeLeap), .Z(n412) );
  INV_X4 U424 ( .A(n412), .ZN(curPC[28]) );
  INV_X4 U425 ( .A(nextPC[27]), .ZN(n341) );
  MUX2_X2 U426 ( .A(n301), .B(n341), .S(takeLeap), .Z(n414) );
  INV_X4 U427 ( .A(n414), .ZN(curPC[27]) );
  MUX2_X2 U428 ( .A(PC_q[26]), .B(nextPC[26]), .S(takeLeap), .Z(curPC[26]) );
  INV_X4 U429 ( .A(nextPC[25]), .ZN(n342) );
  MUX2_X2 U430 ( .A(n302), .B(n342), .S(takeLeap), .Z(n343) );
  INV_X4 U431 ( .A(n343), .ZN(curPC[25]) );
  INV_X4 U432 ( .A(nextPC[24]), .ZN(n344) );
  MUX2_X2 U433 ( .A(n303), .B(n344), .S(takeLeap), .Z(n423) );
  INV_X4 U434 ( .A(n423), .ZN(curPC[24]) );
  INV_X4 U435 ( .A(nextPC[23]), .ZN(n345) );
  MUX2_X2 U436 ( .A(n304), .B(n345), .S(takeLeap), .Z(n425) );
  INV_X4 U437 ( .A(n425), .ZN(curPC[23]) );
  MUX2_X2 U438 ( .A(PC_q[22]), .B(nextPC[22]), .S(takeLeap), .Z(curPC[22]) );
  INV_X4 U439 ( .A(nextPC[8]), .ZN(n481) );
  MUX2_X2 U440 ( .A(n314), .B(n481), .S(takeLeap), .Z(n480) );
  INV_X4 U441 ( .A(n480), .ZN(curPC[8]) );
  INV_X4 U442 ( .A(nextPC[6]), .ZN(n346) );
  MUX2_X2 U443 ( .A(n305), .B(n346), .S(takeLeap), .Z(n492) );
  INV_X4 U444 ( .A(n492), .ZN(curPC[6]) );
  INV_X4 U445 ( .A(nextPC[5]), .ZN(n347) );
  MUX2_X2 U446 ( .A(n325), .B(n347), .S(takeLeap), .Z(n494) );
  INV_X4 U447 ( .A(n494), .ZN(curPC[5]) );
  INV_X4 U448 ( .A(nextPC[7]), .ZN(n348) );
  MUX2_X2 U449 ( .A(n306), .B(n348), .S(takeLeap), .Z(n490) );
  INV_X4 U450 ( .A(n490), .ZN(curPC[7]) );
  INV_X4 U451 ( .A(nextPC[2]), .ZN(n349) );
  MUX2_X2 U452 ( .A(n288), .B(n349), .S(takeLeap), .Z(incPC[2]) );
  INV_X4 U453 ( .A(nextPC[20]), .ZN(n350) );
  MUX2_X2 U454 ( .A(n307), .B(n350), .S(takeLeap), .Z(n437) );
  INV_X4 U455 ( .A(n437), .ZN(curPC[20]) );
  INV_X4 U456 ( .A(nextPC[13]), .ZN(n351) );
  MUX2_X2 U457 ( .A(n308), .B(n351), .S(takeLeap), .Z(n465) );
  INV_X4 U458 ( .A(n465), .ZN(curPC[13]) );
  INV_X4 U459 ( .A(nextPC[12]), .ZN(n352) );
  MUX2_X2 U460 ( .A(n326), .B(n352), .S(takeLeap), .Z(n467) );
  INV_X4 U461 ( .A(n467), .ZN(curPC[12]) );
  INV_X4 U462 ( .A(PC_q[11]), .ZN(n354) );
  INV_X4 U463 ( .A(nextPC[11]), .ZN(n353) );
  MUX2_X2 U464 ( .A(n354), .B(n353), .S(takeLeap), .Z(n470) );
  INV_X4 U465 ( .A(n470), .ZN(curPC[11]) );
  MUX2_X2 U466 ( .A(PC_q[14]), .B(nextPC[14]), .S(takeLeap), .Z(curPC[14]) );
  INV_X4 U467 ( .A(nextPC[15]), .ZN(n355) );
  MUX2_X2 U468 ( .A(n309), .B(n355), .S(takeLeap), .Z(n456) );
  INV_X4 U469 ( .A(n456), .ZN(curPC[15]) );
  INV_X4 U470 ( .A(nextPC[16]), .ZN(n356) );
  MUX2_X2 U471 ( .A(n310), .B(n356), .S(takeLeap), .Z(n453) );
  INV_X4 U472 ( .A(n453), .ZN(curPC[16]) );
  INV_X4 U473 ( .A(nextPC[17]), .ZN(n357) );
  MUX2_X2 U474 ( .A(n311), .B(n357), .S(takeLeap), .Z(n450) );
  INV_X4 U475 ( .A(n450), .ZN(curPC[17]) );
  MUX2_X2 U476 ( .A(PC_q[18]), .B(nextPC[18]), .S(takeLeap), .Z(curPC[18]) );
  INV_X4 U477 ( .A(nextPC[19]), .ZN(n358) );
  MUX2_X2 U478 ( .A(n312), .B(n358), .S(takeLeap), .Z(n441) );
  INV_X4 U479 ( .A(n441), .ZN(curPC[19]) );
  INV_X4 U480 ( .A(nextPC[21]), .ZN(n359) );
  MUX2_X2 U481 ( .A(n313), .B(n359), .S(takeLeap), .Z(n434) );
  INV_X4 U482 ( .A(n434), .ZN(curPC[21]) );
  INV_X4 U483 ( .A(nextPC[31]), .ZN(n388) );
  NAND2_X2 U484 ( .A1(curPC[29]), .A2(n388), .ZN(n360) );
  NOR2_X4 U485 ( .A1(n412), .A2(n360), .ZN(n385) );
  NAND2_X2 U486 ( .A1(n297), .A2(curPC[27]), .ZN(n392) );
  INV_X4 U487 ( .A(n392), .ZN(n383) );
  INV_X4 U488 ( .A(curPC[22]), .ZN(n371) );
  NAND2_X2 U489 ( .A1(curPC[6]), .A2(curPC[5]), .ZN(n361) );
  INV_X4 U490 ( .A(n361), .ZN(n489) );
  NAND2_X2 U491 ( .A1(n489), .A2(curPC[7]), .ZN(n362) );
  INV_X4 U492 ( .A(n362), .ZN(n484) );
  NAND2_X2 U493 ( .A1(n484), .A2(curPC[8]), .ZN(n363) );
  INV_X4 U494 ( .A(n363), .ZN(n367) );
  INV_X4 U495 ( .A(nextPC[3]), .ZN(n503) );
  INV_X4 U496 ( .A(n530), .ZN(n368) );
  NAND2_X2 U497 ( .A1(PC_q[10]), .A2(n368), .ZN(n369) );
  NOR2_X4 U498 ( .A1(n371), .A2(n440), .ZN(n382) );
  NAND2_X2 U499 ( .A1(curPC[12]), .A2(curPC[11]), .ZN(n372) );
  INV_X4 U500 ( .A(n372), .ZN(n464) );
  NAND2_X2 U501 ( .A1(n464), .A2(curPC[13]), .ZN(n373) );
  INV_X4 U502 ( .A(n373), .ZN(n459) );
  NAND2_X2 U503 ( .A1(n459), .A2(curPC[14]), .ZN(n374) );
  INV_X4 U504 ( .A(n374), .ZN(n455) );
  NAND2_X2 U505 ( .A1(n455), .A2(curPC[15]), .ZN(n375) );
  INV_X4 U506 ( .A(n375), .ZN(n452) );
  NAND2_X2 U507 ( .A1(n452), .A2(curPC[16]), .ZN(n376) );
  NOR3_X4 U508 ( .A1(n426), .A2(n425), .A3(n423), .ZN(n422) );
  NAND2_X2 U509 ( .A1(n383), .A2(n422), .ZN(n413) );
  INV_X4 U510 ( .A(n413), .ZN(n384) );
  NAND2_X2 U511 ( .A1(n385), .A2(n384), .ZN(n386) );
  MUX2_X2 U512 ( .A(n388), .B(n386), .S(nextPC[30]), .Z(n543) );
  INV_X4 U513 ( .A(n543), .ZN(n387) );
  NAND2_X2 U514 ( .A1(n387), .A2(n549), .ZN(n399) );
  NAND2_X2 U515 ( .A1(PC_q[31]), .A2(n333), .ZN(n536) );
  INV_X4 U516 ( .A(n536), .ZN(n390) );
  NAND2_X2 U517 ( .A1(n390), .A2(n293), .ZN(n542) );
  NAND2_X2 U518 ( .A1(n391), .A2(n292), .ZN(n395) );
  INV_X4 U519 ( .A(n394), .ZN(n539) );
  MUX2_X2 U520 ( .A(n396), .B(n395), .S(n539), .Z(n398) );
  NAND2_X2 U521 ( .A1(PC_q[31]), .A2(n330), .ZN(n397) );
  NAND2_X2 U522 ( .A1(PC_q[30]), .A2(n331), .ZN(n404) );
  INV_X4 U523 ( .A(n538), .ZN(n400) );
  NAND2_X2 U524 ( .A1(n548), .A2(n511), .ZN(n401) );
  MUX2_X2 U525 ( .A(n402), .B(n401), .S(n539), .Z(n403) );
  NAND2_X2 U526 ( .A1(n404), .A2(n403), .ZN(n223) );
  NAND2_X2 U527 ( .A1(PC_q[29]), .A2(n504), .ZN(n411) );
  INV_X4 U528 ( .A(n53), .ZN(n405) );
  AOI22_X2 U529 ( .A1(nextPC[29]), .A2(n405), .B1(PC_q[29]), .B2(n333), .ZN(
        n409) );
  INV_X4 U530 ( .A(curPC[29]), .ZN(n406) );
  NAND2_X2 U531 ( .A1(n417), .A2(n406), .ZN(n408) );
  MUX2_X2 U532 ( .A(n409), .B(n408), .S(n407), .Z(n410) );
  NAND2_X2 U533 ( .A1(n411), .A2(n410), .ZN(n224) );
  MUX2_X2 U534 ( .A(PC_q[28]), .B(incPC[28]), .S(n511), .Z(n225) );
  NAND2_X2 U535 ( .A1(n422), .A2(n297), .ZN(n415) );
  MUX2_X2 U536 ( .A(PC_q[27]), .B(incPC[27]), .S(n511), .Z(n226) );
  NAND2_X2 U537 ( .A1(PC_q[26]), .A2(n330), .ZN(n421) );
  INV_X4 U538 ( .A(n330), .ZN(n417) );
  INV_X4 U539 ( .A(curPC[26]), .ZN(n416) );
  NAND2_X2 U540 ( .A1(n417), .A2(n416), .ZN(n419) );
  AOI22_X2 U541 ( .A1(nextPC[26]), .A2(n499), .B1(PC_q[26]), .B2(n333), .ZN(
        n418) );
  NAND2_X2 U542 ( .A1(n422), .A2(curPC[25]), .ZN(n534) );
  MUX2_X2 U543 ( .A(n419), .B(n418), .S(n534), .Z(n420) );
  NAND2_X2 U544 ( .A1(n421), .A2(n420), .ZN(n227) );
  MUX2_X2 U545 ( .A(PC_q[25]), .B(incPC[25]), .S(n511), .Z(n228) );
  XNOR2_X2 U546 ( .A(n424), .B(n423), .ZN(incPC[24]) );
  MUX2_X2 U547 ( .A(PC_q[24]), .B(incPC[24]), .S(n511), .Z(n229) );
  MUX2_X2 U548 ( .A(PC_q[23]), .B(incPC[23]), .S(n511), .Z(n230) );
  NAND2_X2 U549 ( .A1(PC_q[22]), .A2(n331), .ZN(n432) );
  NAND2_X2 U550 ( .A1(n417), .A2(n371), .ZN(n430) );
  INV_X4 U551 ( .A(n53), .ZN(n427) );
  AOI22_X2 U552 ( .A1(nextPC[22]), .A2(n427), .B1(PC_q[22]), .B2(n333), .ZN(
        n429) );
  MUX2_X2 U553 ( .A(n430), .B(n429), .S(n533), .Z(n431) );
  NAND2_X2 U554 ( .A1(n432), .A2(n431), .ZN(n231) );
  XNOR2_X2 U555 ( .A(n435), .B(n434), .ZN(incPC[21]) );
  MUX2_X2 U556 ( .A(PC_q[21]), .B(incPC[21]), .S(n511), .Z(n232) );
  MUX2_X2 U557 ( .A(PC_q[20]), .B(incPC[20]), .S(n511), .Z(n233) );
  XNOR2_X2 U558 ( .A(n442), .B(n441), .ZN(incPC[19]) );
  MUX2_X2 U559 ( .A(PC_q[19]), .B(incPC[19]), .S(n511), .Z(n234) );
  NAND2_X2 U560 ( .A1(PC_q[18]), .A2(n504), .ZN(n448) );
  INV_X4 U561 ( .A(curPC[18]), .ZN(n443) );
  NAND2_X2 U562 ( .A1(n417), .A2(n443), .ZN(n446) );
  AOI22_X2 U563 ( .A1(nextPC[18]), .A2(n427), .B1(PC_q[18]), .B2(n333), .ZN(
        n445) );
  MUX2_X2 U564 ( .A(n446), .B(n445), .S(n532), .Z(n447) );
  NAND2_X2 U565 ( .A1(n448), .A2(n447), .ZN(n235) );
  NAND2_X2 U566 ( .A1(n449), .A2(n469), .ZN(n451) );
  MUX2_X2 U567 ( .A(PC_q[17]), .B(incPC[17]), .S(n511), .Z(n236) );
  NAND2_X2 U568 ( .A1(n452), .A2(n469), .ZN(n454) );
  MUX2_X2 U569 ( .A(PC_q[16]), .B(incPC[16]), .S(n511), .Z(n237) );
  NAND2_X2 U570 ( .A1(n455), .A2(n469), .ZN(n457) );
  MUX2_X2 U571 ( .A(PC_q[15]), .B(incPC[15]), .S(n511), .Z(n238) );
  NAND2_X2 U572 ( .A1(PC_q[14]), .A2(n330), .ZN(n463) );
  INV_X4 U573 ( .A(curPC[14]), .ZN(n458) );
  NAND2_X2 U574 ( .A1(n417), .A2(n458), .ZN(n461) );
  AOI22_X2 U575 ( .A1(nextPC[14]), .A2(n405), .B1(PC_q[14]), .B2(n333), .ZN(
        n460) );
  MUX2_X2 U576 ( .A(n461), .B(n460), .S(n531), .Z(n462) );
  NAND2_X2 U577 ( .A1(n463), .A2(n462), .ZN(n239) );
  NAND2_X2 U578 ( .A1(n464), .A2(n469), .ZN(n466) );
  MUX2_X2 U579 ( .A(PC_q[13]), .B(incPC[13]), .S(n511), .Z(n240) );
  NAND2_X2 U580 ( .A1(curPC[11]), .A2(n469), .ZN(n468) );
  MUX2_X2 U581 ( .A(PC_q[12]), .B(incPC[12]), .S(n511), .Z(n241) );
  MUX2_X2 U582 ( .A(PC_q[11]), .B(incPC[11]), .S(n511), .Z(n242) );
  INV_X4 U583 ( .A(n527), .ZN(n523) );
  MUX2_X2 U584 ( .A(n471), .B(n476), .S(PC_q[10]), .Z(n472) );
  INV_X4 U585 ( .A(n472), .ZN(n475) );
  MUX2_X2 U586 ( .A(nextPC[10]), .B(n473), .S(nextPC[9]), .Z(n524) );
  MUX2_X2 U587 ( .A(PC_q[9]), .B(nextPC[9]), .S(takeLeap), .Z(curPC[9]) );
  NAND2_X2 U588 ( .A1(n476), .A2(PC_q[9]), .ZN(n479) );
  NAND2_X2 U589 ( .A1(nextPC[9]), .A2(n549), .ZN(n477) );
  MUX2_X2 U590 ( .A(n477), .B(n327), .S(n523), .Z(n478) );
  NAND2_X2 U591 ( .A1(n479), .A2(n478), .ZN(n244) );
  NAND2_X2 U592 ( .A1(n331), .A2(PC_q[8]), .ZN(n488) );
  NAND2_X2 U593 ( .A1(n417), .A2(n480), .ZN(n486) );
  MUX2_X2 U594 ( .A(n486), .B(n485), .S(n521), .Z(n487) );
  NAND2_X2 U595 ( .A1(n488), .A2(n487), .ZN(n245) );
  MUX2_X2 U596 ( .A(PC_q[7]), .B(incPC[7]), .S(n511), .Z(n246) );
  MUX2_X2 U597 ( .A(PC_q[6]), .B(incPC[6]), .S(n511), .Z(n247) );
  MUX2_X2 U598 ( .A(PC_q[5]), .B(incPC[5]), .S(n511), .Z(n248) );
  NAND2_X2 U599 ( .A1(n296), .A2(curPC[2]), .ZN(n514) );
  MUX2_X2 U600 ( .A(n496), .B(n507), .S(PC_q[4]), .Z(n497) );
  INV_X4 U601 ( .A(n497), .ZN(n502) );
  MUX2_X2 U602 ( .A(nextPC[4]), .B(n498), .S(nextPC[3]), .Z(n516) );
  INV_X4 U603 ( .A(n53), .ZN(n499) );
  MUX2_X2 U604 ( .A(PC_q[3]), .B(nextPC[3]), .S(takeLeap), .Z(curPC[3]) );
  MUX2_X2 U605 ( .A(n506), .B(n505), .S(curPC[2]), .Z(n510) );
  INV_X4 U606 ( .A(n507), .ZN(n508) );
  MUX2_X2 U607 ( .A(PC_q[2]), .B(incPC[2]), .S(n511), .Z(n251) );
  MUX2_X2 U608 ( .A(n289), .B(n5), .S(takeLeap), .Z(n512) );
  INV_X4 U609 ( .A(n512), .ZN(curPC[0]) );
  MUX2_X2 U610 ( .A(n290), .B(n3), .S(takeLeap), .Z(n513) );
  INV_X4 U611 ( .A(n513), .ZN(curPC[1]) );
  MUX2_X2 U612 ( .A(PC_q[4]), .B(nextPC[4]), .S(takeLeap), .Z(curPC[4]) );
  INV_X4 U613 ( .A(n514), .ZN(n515) );
  NAND2_X2 U614 ( .A1(n515), .A2(n291), .ZN(n520) );
  NAND2_X2 U615 ( .A1(takeLeap), .A2(n516), .ZN(n519) );
  NAND4_X2 U616 ( .A1(n520), .A2(n519), .A3(n518), .A4(n517), .ZN(incPC[4]) );
  XNOR2_X2 U617 ( .A(curPC[8]), .B(n521), .ZN(incPC[8]) );
  INV_X4 U618 ( .A(curPC[9]), .ZN(n522) );
  XNOR2_X2 U619 ( .A(n523), .B(n522), .ZN(incPC[9]) );
  MUX2_X2 U620 ( .A(PC_q[10]), .B(nextPC[10]), .S(takeLeap), .Z(curPC[10]) );
  INV_X4 U621 ( .A(n524), .ZN(n529) );
  INV_X4 U622 ( .A(n525), .ZN(n526) );
  XNOR2_X2 U623 ( .A(curPC[14]), .B(n531), .ZN(incPC[14]) );
  XNOR2_X2 U624 ( .A(curPC[18]), .B(n532), .ZN(incPC[18]) );
  XNOR2_X2 U625 ( .A(curPC[22]), .B(n533), .ZN(incPC[22]) );
  XNOR2_X2 U626 ( .A(curPC[26]), .B(n534), .ZN(incPC[26]) );
  XNOR2_X2 U627 ( .A(n539), .B(n548), .ZN(incPC[30]) );
  NAND2_X2 U628 ( .A1(nextPC[31]), .A2(takeLeap), .ZN(n537) );
  NAND2_X2 U629 ( .A1(n537), .A2(n536), .ZN(curPC[31]) );
  INV_X4 U630 ( .A(curPC[31]), .ZN(n540) );
  MUX2_X2 U631 ( .A(n540), .B(n317), .S(n539), .Z(n541) );
  BUF_X4 U632 ( .A(curPC[1]), .Z(incPC[1]) );
  BUF_X4 U633 ( .A(curPC[0]), .Z(incPC[0]) );
endmodule

