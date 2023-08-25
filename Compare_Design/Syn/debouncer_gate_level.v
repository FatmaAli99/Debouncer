/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Fri Aug 25 22:52:50 2023
/////////////////////////////////////////////////////////////


module sync ( clk, rst_n, in_sig, out_sig );
  input clk, rst_n, in_sig;
  output out_sig;
  wire   \sync_reg[1] ;

  DFFRQX2M \sync_reg_reg[1]  ( .D(in_sig), .CK(clk), .RN(rst_n), .Q(
        \sync_reg[1] ) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(\sync_reg[1] ), .CK(clk), .RN(rst_n), .Q(
        out_sig) );
endmodule


module debouncer_2 ( clk, rst_n, noisy_in, debouncer_out );
  input clk, rst_n, noisy_in;
  output debouncer_out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n19, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102;
  wire   [99:0] Q_reg;

  DFFRQX2M \Q_reg_reg[95]  ( .D(Q_reg[96]), .CK(clk), .RN(n99), .Q(Q_reg[95])
         );
  DFFRQX2M \Q_reg_reg[94]  ( .D(Q_reg[95]), .CK(clk), .RN(n98), .Q(Q_reg[94])
         );
  DFFRQX2M \Q_reg_reg[89]  ( .D(Q_reg[90]), .CK(clk), .RN(n98), .Q(Q_reg[89])
         );
  DFFRQX2M \Q_reg_reg[83]  ( .D(Q_reg[84]), .CK(clk), .RN(n98), .Q(Q_reg[83])
         );
  DFFRQX2M \Q_reg_reg[68]  ( .D(Q_reg[69]), .CK(clk), .RN(n96), .Q(Q_reg[68])
         );
  DFFRQX2M \Q_reg_reg[62]  ( .D(Q_reg[63]), .CK(clk), .RN(n96), .Q(Q_reg[62])
         );
  DFFRQX2M \Q_reg_reg[57]  ( .D(Q_reg[58]), .CK(clk), .RN(n95), .Q(Q_reg[57])
         );
  DFFRQX2M \Q_reg_reg[56]  ( .D(Q_reg[57]), .CK(clk), .RN(n95), .Q(Q_reg[56])
         );
  DFFRQX2M \Q_reg_reg[50]  ( .D(Q_reg[51]), .CK(clk), .RN(n95), .Q(Q_reg[50])
         );
  DFFRQX2M \Q_reg_reg[45]  ( .D(Q_reg[46]), .CK(clk), .RN(n94), .Q(Q_reg[45])
         );
  DFFRQX2M \Q_reg_reg[44]  ( .D(Q_reg[45]), .CK(clk), .RN(n94), .Q(Q_reg[44])
         );
  DFFRQX2M \Q_reg_reg[43]  ( .D(Q_reg[44]), .CK(clk), .RN(n94), .Q(Q_reg[43])
         );
  DFFRQX2M \Q_reg_reg[39]  ( .D(Q_reg[40]), .CK(clk), .RN(n94), .Q(Q_reg[39])
         );
  DFFRQX2M \Q_reg_reg[38]  ( .D(Q_reg[39]), .CK(clk), .RN(n94), .Q(Q_reg[38])
         );
  DFFRQX2M \Q_reg_reg[33]  ( .D(Q_reg[34]), .CK(clk), .RN(n93), .Q(Q_reg[33])
         );
  DFFRQX2M \Q_reg_reg[32]  ( .D(Q_reg[33]), .CK(clk), .RN(n93), .Q(Q_reg[32])
         );
  DFFRQX2M \Q_reg_reg[40]  ( .D(Q_reg[41]), .CK(clk), .RN(n94), .Q(Q_reg[40])
         );
  DFFRQX2M \Q_reg_reg[42]  ( .D(Q_reg[43]), .CK(clk), .RN(n94), .Q(Q_reg[42])
         );
  DFFRQX2M \Q_reg_reg[41]  ( .D(Q_reg[42]), .CK(clk), .RN(n94), .Q(Q_reg[41])
         );
  DFFRQX2M \Q_reg_reg[0]  ( .D(Q_reg[1]), .CK(clk), .RN(n91), .Q(Q_reg[0]) );
  DFFRQX2M \Q_reg_reg[4]  ( .D(Q_reg[5]), .CK(clk), .RN(n91), .Q(Q_reg[4]) );
  DFFRQX2M \Q_reg_reg[28]  ( .D(Q_reg[29]), .CK(clk), .RN(n93), .Q(Q_reg[28])
         );
  DFFRQX2M \Q_reg_reg[22]  ( .D(Q_reg[23]), .CK(clk), .RN(n92), .Q(Q_reg[22])
         );
  DFFRQX2M \Q_reg_reg[11]  ( .D(Q_reg[12]), .CK(clk), .RN(n92), .Q(Q_reg[11])
         );
  DFFRQX2M \Q_reg_reg[10]  ( .D(Q_reg[11]), .CK(clk), .RN(n91), .Q(Q_reg[10])
         );
  DFFRQX2M \Q_reg_reg[17]  ( .D(Q_reg[18]), .CK(clk), .RN(n92), .Q(Q_reg[17])
         );
  DFFRQX2M \Q_reg_reg[16]  ( .D(Q_reg[17]), .CK(clk), .RN(n92), .Q(Q_reg[16])
         );
  DFFRQX2M \Q_reg_reg[3]  ( .D(Q_reg[4]), .CK(clk), .RN(n91), .Q(Q_reg[3]) );
  DFFRQX2M \Q_reg_reg[8]  ( .D(Q_reg[9]), .CK(clk), .RN(n91), .Q(Q_reg[8]) );
  DFFRQX2M \Q_reg_reg[90]  ( .D(Q_reg[91]), .CK(clk), .RN(n98), .Q(Q_reg[90])
         );
  DFFRQX2M \Q_reg_reg[58]  ( .D(Q_reg[59]), .CK(clk), .RN(n95), .Q(Q_reg[58])
         );
  DFFRQX2M \Q_reg_reg[34]  ( .D(Q_reg[35]), .CK(clk), .RN(n93), .Q(Q_reg[34])
         );
  DFFRQX2M \Q_reg_reg[84]  ( .D(Q_reg[85]), .CK(clk), .RN(n98), .Q(Q_reg[84])
         );
  DFFRQX2M \Q_reg_reg[69]  ( .D(Q_reg[70]), .CK(clk), .RN(n96), .Q(Q_reg[69])
         );
  DFFRQX2M \Q_reg_reg[63]  ( .D(Q_reg[64]), .CK(clk), .RN(n96), .Q(Q_reg[63])
         );
  DFFRQX2M \Q_reg_reg[70]  ( .D(Q_reg[71]), .CK(clk), .RN(n96), .Q(Q_reg[70])
         );
  DFFRQX2M \Q_reg_reg[93]  ( .D(Q_reg[94]), .CK(clk), .RN(n98), .Q(Q_reg[93])
         );
  DFFRQX2M \Q_reg_reg[55]  ( .D(Q_reg[56]), .CK(clk), .RN(n95), .Q(Q_reg[55])
         );
  DFFRQX2M \Q_reg_reg[37]  ( .D(Q_reg[38]), .CK(clk), .RN(n94), .Q(Q_reg[37])
         );
  DFFRQX2M \Q_reg_reg[88]  ( .D(Q_reg[89]), .CK(clk), .RN(n98), .Q(Q_reg[88])
         );
  DFFRQX2M \Q_reg_reg[82]  ( .D(Q_reg[83]), .CK(clk), .RN(n97), .Q(Q_reg[82])
         );
  DFFRQX2M \Q_reg_reg[67]  ( .D(Q_reg[68]), .CK(clk), .RN(n96), .Q(Q_reg[67])
         );
  DFFRQX2M \Q_reg_reg[61]  ( .D(Q_reg[62]), .CK(clk), .RN(n96), .Q(Q_reg[61])
         );
  DFFRQX2M \Q_reg_reg[87]  ( .D(Q_reg[88]), .CK(clk), .RN(n98), .Q(Q_reg[87])
         );
  DFFRQX2M \Q_reg_reg[85]  ( .D(Q_reg[86]), .CK(clk), .RN(n98), .Q(Q_reg[85])
         );
  DFFRQX2M \Q_reg_reg[81]  ( .D(Q_reg[82]), .CK(clk), .RN(n97), .Q(Q_reg[81])
         );
  DFFRQX2M \Q_reg_reg[66]  ( .D(Q_reg[67]), .CK(clk), .RN(n96), .Q(Q_reg[66])
         );
  DFFRQX2M \Q_reg_reg[64]  ( .D(Q_reg[65]), .CK(clk), .RN(n96), .Q(Q_reg[64])
         );
  DFFRQX2M \Q_reg_reg[60]  ( .D(Q_reg[61]), .CK(clk), .RN(n96), .Q(Q_reg[60])
         );
  DFFRQX2M \Q_reg_reg[49]  ( .D(Q_reg[50]), .CK(clk), .RN(n95), .Q(Q_reg[49])
         );
  DFFRQX2M \Q_reg_reg[12]  ( .D(Q_reg[13]), .CK(clk), .RN(n92), .Q(Q_reg[12])
         );
  DFFRQX2M \Q_reg_reg[23]  ( .D(Q_reg[24]), .CK(clk), .RN(n93), .Q(Q_reg[23])
         );
  DFFRQX2M \Q_reg_reg[24]  ( .D(Q_reg[25]), .CK(clk), .RN(n93), .Q(Q_reg[24])
         );
  DFFRQX2M \Q_reg_reg[6]  ( .D(Q_reg[7]), .CK(clk), .RN(n91), .Q(Q_reg[6]) );
  DFFRQX2M \Q_reg_reg[96]  ( .D(Q_reg[97]), .CK(clk), .RN(n101), .Q(Q_reg[96])
         );
  DFFRQX2M \Q_reg_reg[51]  ( .D(Q_reg[52]), .CK(clk), .RN(n95), .Q(Q_reg[51])
         );
  DFFRQX2M \Q_reg_reg[18]  ( .D(Q_reg[19]), .CK(clk), .RN(n92), .Q(Q_reg[18])
         );
  DFFRQX2M \Q_reg_reg[5]  ( .D(Q_reg[6]), .CK(clk), .RN(n91), .Q(Q_reg[5]) );
  DFFRQX2M \Q_reg_reg[52]  ( .D(Q_reg[53]), .CK(clk), .RN(n95), .Q(Q_reg[52])
         );
  DFFRQX2M \Q_reg_reg[19]  ( .D(Q_reg[20]), .CK(clk), .RN(n92), .Q(Q_reg[19])
         );
  DFFRQX2M \Q_reg_reg[29]  ( .D(Q_reg[30]), .CK(clk), .RN(n93), .Q(Q_reg[29])
         );
  DFFRQX2M \Q_reg_reg[2]  ( .D(Q_reg[3]), .CK(clk), .RN(n91), .Q(Q_reg[2]) );
  DFFRQX2M \Q_reg_reg[78]  ( .D(Q_reg[79]), .CK(clk), .RN(n97), .Q(Q_reg[78])
         );
  DFFRQX2M \Q_reg_reg[7]  ( .D(Q_reg[8]), .CK(clk), .RN(n91), .Q(Q_reg[7]) );
  DFFRQX2M \Q_reg_reg[26]  ( .D(Q_reg[27]), .CK(clk), .RN(n93), .Q(Q_reg[26])
         );
  DFFRQX2M \Q_reg_reg[20]  ( .D(Q_reg[21]), .CK(clk), .RN(n92), .Q(Q_reg[20])
         );
  DFFRQX2M \Q_reg_reg[27]  ( .D(Q_reg[28]), .CK(clk), .RN(n93), .Q(Q_reg[27])
         );
  DFFRQX2M \Q_reg_reg[21]  ( .D(Q_reg[22]), .CK(clk), .RN(n92), .Q(Q_reg[21])
         );
  DFFRQX2M \Q_reg_reg[15]  ( .D(Q_reg[16]), .CK(clk), .RN(n92), .Q(Q_reg[15])
         );
  DFFRQX2M \Q_reg_reg[73]  ( .D(Q_reg[74]), .CK(clk), .RN(n97), .Q(Q_reg[73])
         );
  DFFRQX2M \Q_reg_reg[77]  ( .D(Q_reg[78]), .CK(clk), .RN(n97), .Q(Q_reg[77])
         );
  DFFRQX2M \Q_reg_reg[71]  ( .D(Q_reg[72]), .CK(clk), .RN(n97), .Q(Q_reg[71])
         );
  DFFRQX2M \Q_reg_reg[79]  ( .D(Q_reg[80]), .CK(clk), .RN(n97), .Q(Q_reg[79])
         );
  DFFRQX2M \Q_reg_reg[76]  ( .D(Q_reg[77]), .CK(clk), .RN(n97), .Q(Q_reg[76])
         );
  DFFRQX2M \Q_reg_reg[75]  ( .D(Q_reg[76]), .CK(clk), .RN(n97), .Q(Q_reg[75])
         );
  DFFRQX2M \Q_reg_reg[72]  ( .D(Q_reg[73]), .CK(clk), .RN(n97), .Q(Q_reg[72])
         );
  DFFRQX2M \Q_reg_reg[25]  ( .D(Q_reg[26]), .CK(clk), .RN(n93), .Q(Q_reg[25])
         );
  DFFRQX2M \Q_reg_reg[1]  ( .D(Q_reg[2]), .CK(clk), .RN(n91), .Q(Q_reg[1]) );
  DFFRQX2M \Q_reg_reg[14]  ( .D(Q_reg[15]), .CK(clk), .RN(n92), .Q(Q_reg[14])
         );
  DFFRQX2M \Q_reg_reg[13]  ( .D(Q_reg[14]), .CK(clk), .RN(n92), .Q(Q_reg[13])
         );
  DFFRQX2M \Q_reg_reg[9]  ( .D(Q_reg[10]), .CK(clk), .RN(n91), .Q(Q_reg[9]) );
  DFFRQX2M \Q_reg_reg[30]  ( .D(Q_reg[31]), .CK(clk), .RN(n93), .Q(Q_reg[30])
         );
  DFFRQX2M \Q_reg_reg[86]  ( .D(Q_reg[87]), .CK(clk), .RN(n98), .Q(Q_reg[86])
         );
  DFFRQX2M \Q_reg_reg[80]  ( .D(Q_reg[81]), .CK(clk), .RN(n97), .Q(Q_reg[80])
         );
  DFFRQX2M \Q_reg_reg[65]  ( .D(Q_reg[66]), .CK(clk), .RN(n96), .Q(Q_reg[65])
         );
  DFFRQX2M \Q_reg_reg[91]  ( .D(Q_reg[92]), .CK(clk), .RN(n98), .Q(Q_reg[91])
         );
  DFFRQX2M \Q_reg_reg[59]  ( .D(Q_reg[60]), .CK(clk), .RN(n96), .Q(Q_reg[59])
         );
  DFFRQX2M \Q_reg_reg[35]  ( .D(Q_reg[36]), .CK(clk), .RN(n94), .Q(Q_reg[35])
         );
  DFFRQX2M \Q_reg_reg[31]  ( .D(Q_reg[32]), .CK(clk), .RN(n93), .Q(Q_reg[31])
         );
  DFFRQX2M \Q_reg_reg[53]  ( .D(Q_reg[54]), .CK(clk), .RN(n95), .Q(Q_reg[53])
         );
  DFFRQX2M \Q_reg_reg[92]  ( .D(Q_reg[93]), .CK(clk), .RN(n98), .Q(Q_reg[92])
         );
  DFFRQX2M \Q_reg_reg[36]  ( .D(Q_reg[37]), .CK(clk), .RN(n94), .Q(Q_reg[36])
         );
  DFFRQX2M \Q_reg_reg[48]  ( .D(Q_reg[49]), .CK(clk), .RN(n95), .Q(Q_reg[48])
         );
  DFFRQX2M \Q_reg_reg[54]  ( .D(Q_reg[55]), .CK(clk), .RN(n95), .Q(Q_reg[54])
         );
  DFFRQX2M \Q_reg_reg[99]  ( .D(noisy_in), .CK(clk), .RN(n99), .Q(Q_reg[99])
         );
  DFFRQX2M \Q_reg_reg[46]  ( .D(Q_reg[47]), .CK(clk), .RN(n94), .Q(Q_reg[46])
         );
  DFFRQX2M \Q_reg_reg[74]  ( .D(Q_reg[75]), .CK(clk), .RN(n97), .Q(Q_reg[74])
         );
  DFFRQX2M \Q_reg_reg[47]  ( .D(Q_reg[48]), .CK(clk), .RN(n95), .Q(Q_reg[47])
         );
  DFFRQX2M \Q_reg_reg[98]  ( .D(Q_reg[99]), .CK(clk), .RN(n100), .Q(Q_reg[98])
         );
  DFFRQX2M \Q_reg_reg[97]  ( .D(Q_reg[98]), .CK(clk), .RN(n102), .Q(Q_reg[97])
         );
  DFFRHQX8M debouncer_out_reg ( .D(n90), .CK(clk), .RN(rst_n), .Q(
        debouncer_out) );
  NAND4BX1M U3 ( .AN(n19), .B(n20), .C(n21), .D(n22), .Y(n18) );
  OR4X1M U4 ( .A(n47), .B(n48), .C(n49), .D(n50), .Y(n19) );
  CLKBUFX6M U5 ( .A(n101), .Y(n91) );
  BUFX6M U6 ( .A(n101), .Y(n92) );
  BUFX6M U7 ( .A(n101), .Y(n93) );
  BUFX6M U8 ( .A(n100), .Y(n94) );
  BUFX6M U9 ( .A(n100), .Y(n95) );
  BUFX6M U10 ( .A(n100), .Y(n96) );
  BUFX6M U11 ( .A(n99), .Y(n97) );
  BUFX6M U12 ( .A(n99), .Y(n98) );
  BUFX2M U13 ( .A(n102), .Y(n101) );
  BUFX2M U14 ( .A(n102), .Y(n100) );
  BUFX2M U15 ( .A(n102), .Y(n99) );
  BUFX2M U16 ( .A(rst_n), .Y(n102) );
  OAI2BB1XLM U17 ( .A0N(debouncer_out), .A1N(n17), .B0(n18), .Y(n90) );
  NAND4X2M U18 ( .A(n55), .B(n56), .C(n57), .D(n58), .Y(n17) );
  NOR4BX2M U19 ( .AN(n59), .B(n60), .C(n61), .D(n62), .Y(n58) );
  NOR4BX2M U20 ( .AN(n66), .B(Q_reg[79]), .C(Q_reg[7]), .D(Q_reg[78]), .Y(n59)
         );
  NAND4BBX1M U21 ( .AN(Q_reg[8]), .BN(Q_reg[90]), .C(n3), .D(n64), .Y(n61) );
  NAND4BBX1M U22 ( .AN(Q_reg[84]), .BN(Q_reg[85]), .C(n4), .D(n63), .Y(n62) );
  NOR4BX2M U23 ( .AN(n23), .B(n24), .C(n25), .D(n26), .Y(n22) );
  NOR4BX2M U24 ( .AN(n30), .B(Q_reg[76]), .C(Q_reg[77]), .D(Q_reg[75]), .Y(n23) );
  NAND4BX1M U25 ( .AN(Q_reg[93]), .B(n2), .C(n1), .D(n29), .Y(n24) );
  NAND4BBX1M U26 ( .AN(Q_reg[88]), .BN(Q_reg[87]), .C(n3), .D(n28), .Y(n25) );
  NOR4BX2M U27 ( .AN(n67), .B(n68), .C(n69), .D(n70), .Y(n57) );
  NAND4BBX1M U28 ( .AN(Q_reg[67]), .BN(Q_reg[66]), .C(n5), .D(n73), .Y(n68) );
  NAND4BX1M U29 ( .AN(Q_reg[55]), .B(n8), .C(n7), .D(n71), .Y(n70) );
  NAND4BBX1M U30 ( .AN(Q_reg[61]), .BN(Q_reg[60]), .C(n6), .D(n72), .Y(n69) );
  NOR4BX2M U31 ( .AN(n86), .B(Q_reg[0]), .C(Q_reg[10]), .D(Q_reg[11]), .Y(n85)
         );
  NOR3X2M U32 ( .A(Q_reg[12]), .B(Q_reg[14]), .C(Q_reg[13]), .Y(n86) );
  NOR3X4M U33 ( .A(Q_reg[40]), .B(Q_reg[42]), .C(Q_reg[41]), .Y(n45) );
  NAND4BBX1M U34 ( .AN(Q_reg[51]), .BN(Q_reg[52]), .C(n9), .D(n35), .Y(n34) );
  NOR3X2M U35 ( .A(Q_reg[53]), .B(Q_reg[55]), .C(Q_reg[54]), .Y(n35) );
  NAND4BX1M U36 ( .AN(Q_reg[34]), .B(n15), .C(n16), .D(n79), .Y(n78) );
  NOR3X2M U37 ( .A(Q_reg[35]), .B(Q_reg[37]), .C(Q_reg[36]), .Y(n79) );
  NOR4X2M U38 ( .A(Q_reg[49]), .B(Q_reg[48]), .C(Q_reg[47]), .D(Q_reg[46]), 
        .Y(n46) );
  NOR3X2M U39 ( .A(Q_reg[46]), .B(Q_reg[48]), .C(Q_reg[47]), .Y(n80) );
  NOR3X2M U40 ( .A(Q_reg[34]), .B(Q_reg[36]), .C(Q_reg[35]), .Y(n44) );
  NOR4X2M U41 ( .A(n75), .B(n76), .C(n77), .D(n78), .Y(n56) );
  NAND4X2M U42 ( .A(n11), .B(n10), .C(n12), .D(n80), .Y(n76) );
  NAND4BBX1M U43 ( .AN(Q_reg[49]), .BN(Q_reg[4]), .C(n9), .D(n81), .Y(n75) );
  NAND4BX1M U44 ( .AN(Q_reg[3]), .B(n13), .C(n14), .D(n45), .Y(n77) );
  NOR4X2M U45 ( .A(n39), .B(n40), .C(n41), .D(n42), .Y(n20) );
  NAND4X2M U46 ( .A(n11), .B(n10), .C(n12), .D(n46), .Y(n39) );
  NAND4X2M U47 ( .A(n16), .B(n15), .C(Q_reg[0]), .D(n44), .Y(n41) );
  NAND4BX1M U48 ( .AN(Q_reg[37]), .B(n14), .C(n13), .D(n45), .Y(n40) );
  NOR4X2M U49 ( .A(n31), .B(n32), .C(n33), .D(n34), .Y(n21) );
  NAND4BBX1M U50 ( .AN(Q_reg[69]), .BN(Q_reg[70]), .C(n5), .D(n38), .Y(n31) );
  NAND4BBX1M U51 ( .AN(Q_reg[63]), .BN(Q_reg[64]), .C(n6), .D(n37), .Y(n32) );
  NAND4BX1M U52 ( .AN(Q_reg[58]), .B(n7), .C(n8), .D(n36), .Y(n33) );
  NOR4X2M U53 ( .A(Q_reg[99]), .B(Q_reg[98]), .C(Q_reg[97]), .D(Q_reg[96]), 
        .Y(n29) );
  NAND4BX1M U54 ( .AN(Q_reg[96]), .B(n1), .C(n2), .D(n65), .Y(n60) );
  NOR4X2M U55 ( .A(Q_reg[9]), .B(Q_reg[99]), .C(Q_reg[98]), .D(Q_reg[97]), .Y(
        n65) );
  NOR4X2M U56 ( .A(Q_reg[54]), .B(Q_reg[53]), .C(Q_reg[52]), .D(Q_reg[51]), 
        .Y(n81) );
  NOR4X2M U57 ( .A(Q_reg[74]), .B(Q_reg[73]), .C(Q_reg[72]), .D(Q_reg[71]), 
        .Y(n38) );
  NOR3X2M U58 ( .A(Q_reg[90]), .B(Q_reg[92]), .C(Q_reg[91]), .Y(n28) );
  NOR3X2M U59 ( .A(Q_reg[63]), .B(Q_reg[65]), .C(Q_reg[64]), .Y(n72) );
  NOR3X2M U60 ( .A(Q_reg[59]), .B(Q_reg[61]), .C(Q_reg[60]), .Y(n36) );
  NOR3X2M U61 ( .A(Q_reg[91]), .B(Q_reg[93]), .C(Q_reg[92]), .Y(n64) );
  NOR4X2M U62 ( .A(Q_reg[31]), .B(Q_reg[30]), .C(Q_reg[2]), .D(Q_reg[29]), .Y(
        n89) );
  NOR3X2M U63 ( .A(Q_reg[86]), .B(Q_reg[88]), .C(Q_reg[87]), .Y(n63) );
  NOR3X2M U64 ( .A(Q_reg[65]), .B(Q_reg[67]), .C(Q_reg[66]), .Y(n37) );
  NAND4BBX1M U65 ( .AN(Q_reg[82]), .BN(Q_reg[81]), .C(n4), .D(n27), .Y(n26) );
  NOR3X2M U66 ( .A(Q_reg[84]), .B(Q_reg[86]), .C(Q_reg[85]), .Y(n27) );
  NOR3X2M U67 ( .A(Q_reg[58]), .B(Q_reg[5]), .C(Q_reg[59]), .Y(n71) );
  NOR4BX2M U68 ( .AN(n74), .B(Q_reg[72]), .C(Q_reg[73]), .D(Q_reg[71]), .Y(n67) );
  NOR4X2M U69 ( .A(Q_reg[77]), .B(Q_reg[76]), .C(Q_reg[75]), .D(Q_reg[74]), 
        .Y(n74) );
  NOR3X2M U70 ( .A(Q_reg[78]), .B(Q_reg[80]), .C(Q_reg[79]), .Y(n30) );
  NOR3X2M U71 ( .A(Q_reg[69]), .B(Q_reg[70]), .C(Q_reg[6]), .Y(n73) );
  NOR3X2M U72 ( .A(Q_reg[18]), .B(Q_reg[1]), .C(Q_reg[19]), .Y(n87) );
  NOR3X2M U73 ( .A(Q_reg[23]), .B(Q_reg[25]), .C(Q_reg[24]), .Y(n88) );
  NOR3X2M U74 ( .A(Q_reg[80]), .B(Q_reg[82]), .C(Q_reg[81]), .Y(n66) );
  NAND4X2M U75 ( .A(Q_reg[20]), .B(Q_reg[1]), .C(Q_reg[21]), .D(n54), .Y(n47)
         );
  AND4X2M U76 ( .A(Q_reg[16]), .B(Q_reg[17]), .C(Q_reg[18]), .D(Q_reg[19]), 
        .Y(n54) );
  NAND4X2M U77 ( .A(Q_reg[26]), .B(Q_reg[25]), .C(Q_reg[27]), .D(n53), .Y(n48)
         );
  AND3X2M U78 ( .A(Q_reg[24]), .B(Q_reg[22]), .C(Q_reg[23]), .Y(n53) );
  NAND4X2M U79 ( .A(Q_reg[8]), .B(Q_reg[7]), .C(Q_reg[9]), .D(n51), .Y(n50) );
  AND3X2M U80 ( .A(Q_reg[6]), .B(Q_reg[4]), .C(Q_reg[5]), .Y(n51) );
  INVX2M U81 ( .A(Q_reg[44]), .Y(n11) );
  INVX2M U82 ( .A(Q_reg[45]), .Y(n10) );
  INVX2M U83 ( .A(Q_reg[43]), .Y(n12) );
  INVX2M U84 ( .A(Q_reg[32]), .Y(n16) );
  INVX2M U85 ( .A(Q_reg[33]), .Y(n15) );
  INVX2M U86 ( .A(Q_reg[94]), .Y(n2) );
  INVX2M U87 ( .A(Q_reg[95]), .Y(n1) );
  INVX2M U88 ( .A(Q_reg[57]), .Y(n7) );
  INVX2M U89 ( .A(Q_reg[56]), .Y(n8) );
  INVX2M U90 ( .A(Q_reg[38]), .Y(n14) );
  INVX2M U91 ( .A(Q_reg[39]), .Y(n13) );
  INVX2M U92 ( .A(Q_reg[83]), .Y(n4) );
  INVX2M U93 ( .A(Q_reg[89]), .Y(n3) );
  INVX2M U94 ( .A(Q_reg[50]), .Y(n9) );
  INVX2M U95 ( .A(Q_reg[62]), .Y(n6) );
  INVX2M U96 ( .A(Q_reg[68]), .Y(n5) );
  NAND4X2M U97 ( .A(Q_reg[31]), .B(Q_reg[30]), .C(Q_reg[3]), .D(n52), .Y(n49)
         );
  AND3X2M U98 ( .A(Q_reg[2]), .B(Q_reg[28]), .C(Q_reg[29]), .Y(n52) );
  NAND4X2M U99 ( .A(Q_reg[14]), .B(Q_reg[13]), .C(Q_reg[15]), .D(n43), .Y(n42)
         );
  AND3X2M U100 ( .A(Q_reg[12]), .B(Q_reg[10]), .C(Q_reg[11]), .Y(n43) );
  AND4X2M U101 ( .A(n82), .B(n83), .C(n84), .D(n85), .Y(n55) );
  NOR4BX2M U102 ( .AN(n89), .B(Q_reg[27]), .C(Q_reg[26]), .D(Q_reg[28]), .Y(
        n82) );
  NOR4BX2M U103 ( .AN(n88), .B(Q_reg[21]), .C(Q_reg[20]), .D(Q_reg[22]), .Y(
        n83) );
  NOR4BX2M U104 ( .AN(n87), .B(Q_reg[15]), .C(Q_reg[16]), .D(Q_reg[17]), .Y(
        n84) );
endmodule


module debouncer_2_sync ( clk, rst_n, noisy_in, debouncer_out );
  input clk, rst_n, noisy_in;
  output debouncer_out;
  wire   sync_sig;

  sync sync_DUT ( .clk(clk), .rst_n(rst_n), .in_sig(noisy_in), .out_sig(
        sync_sig) );
  debouncer_2 debouncer_DUT ( .clk(clk), .rst_n(rst_n), .noisy_in(sync_sig), 
        .debouncer_out(debouncer_out) );
endmodule

