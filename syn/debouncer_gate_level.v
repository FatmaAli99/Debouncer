/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Fri Aug 25 22:46:33 2023
/////////////////////////////////////////////////////////////


module sync ( clk, rst_n, in_sig, out_sig );
  input clk, rst_n, in_sig;
  output out_sig;
  wire   \sync_reg[1] ;

  DFFRQX2M \sync_reg_reg[0]  ( .D(\sync_reg[1] ), .CK(clk), .RN(rst_n), .Q(
        out_sig) );
  DFFRQX2M \sync_reg_reg[1]  ( .D(in_sig), .CK(clk), .RN(rst_n), .Q(
        \sync_reg[1] ) );
endmodule


module FSM ( clk, rst_n, noisy_sig, timer_done, debunced_sig, timer_en );
  input clk, rst_n, noisy_sig, timer_done;
  output debunced_sig, timer_en;
  wire   n4, n1, n2;
  wire   [1:0] next_state;

  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(rst_n), 
        .Q(timer_en) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(rst_n), 
        .Q(n4) );
  BUFX10M U3 ( .A(n4), .Y(debunced_sig) );
  NOR2X2M U4 ( .A(n1), .B(n2), .Y(next_state[0]) );
  XNOR2X1M U5 ( .A(debunced_sig), .B(noisy_sig), .Y(n2) );
  AO2B2XLM U6 ( .B0(n1), .B1(noisy_sig), .A0(debunced_sig), .A1N(n1), .Y(
        next_state[1]) );
  AND2X2M U7 ( .A(timer_done), .B(timer_en), .Y(n1) );
endmodule


module timer_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module timer ( clk, rst_n, enable, done );
  input clk, rst_n, enable;
  output done;
  wire   N8, N9, N10, N11, N12, N13, N14, N22, N23, N24, N25, N26, N27, N28,
         N29, n1, n2, n3;
  wire   [6:0] counter;

  timer_DW01_inc_0 add_23 ( .A(counter), .SUM({N14, N13, N12, N11, N10, N9, N8}) );
  DFFRQX2M done_reg ( .D(N29), .CK(clk), .RN(rst_n), .Q(done) );
  EDFFHQX2M \counter_reg[6]  ( .D(N28), .E(rst_n), .CK(clk), .Q(counter[6]) );
  EDFFHQX2M \counter_reg[5]  ( .D(N27), .E(rst_n), .CK(clk), .Q(counter[5]) );
  EDFFHQX2M \counter_reg[2]  ( .D(N24), .E(rst_n), .CK(clk), .Q(counter[2]) );
  EDFFHQX2M \counter_reg[3]  ( .D(N25), .E(rst_n), .CK(clk), .Q(counter[3]) );
  EDFFHQX2M \counter_reg[4]  ( .D(N26), .E(rst_n), .CK(clk), .Q(counter[4]) );
  EDFFHQX2M \counter_reg[1]  ( .D(N23), .E(rst_n), .CK(clk), .Q(counter[1]) );
  EDFFHQX2M \counter_reg[0]  ( .D(N22), .E(rst_n), .CK(clk), .Q(counter[0]) );
  NAND2X4M U3 ( .A(enable), .B(n1), .Y(n2) );
  NOR2BX2M U4 ( .AN(N13), .B(n2), .Y(N27) );
  NOR2BX2M U5 ( .AN(N12), .B(n2), .Y(N26) );
  NOR2BX2M U6 ( .AN(N11), .B(n2), .Y(N25) );
  NOR2BX2M U7 ( .AN(N10), .B(n2), .Y(N24) );
  NOR2BX2M U8 ( .AN(N9), .B(n2), .Y(N23) );
  NAND4X2M U9 ( .A(counter[5]), .B(counter[1]), .C(counter[6]), .D(n3), .Y(n1)
         );
  NOR4BX2M U10 ( .AN(counter[0]), .B(counter[4]), .C(counter[3]), .D(
        counter[2]), .Y(n3) );
  NOR2BX2M U11 ( .AN(N14), .B(n2), .Y(N28) );
  NOR2BX2M U12 ( .AN(N8), .B(n2), .Y(N22) );
  NOR2BX2M U13 ( .AN(enable), .B(n1), .Y(N29) );
endmodule


module debouncer ( clk, rst_n, noisy_in, debouncer_out );
  input clk, rst_n, noisy_in;
  output debouncer_out;
  wire   timer_done, timer_en;

  FSM FSM_DUT ( .clk(clk), .rst_n(rst_n), .noisy_sig(noisy_in), .timer_done(
        timer_done), .debunced_sig(debouncer_out), .timer_en(timer_en) );
  timer timer_DUT ( .clk(clk), .rst_n(rst_n), .enable(timer_en), .done(
        timer_done) );
endmodule


module debouncer_sync ( clk, rst_n, noisy_in, debouncer_out );
  input clk, rst_n, noisy_in;
  output debouncer_out;
  wire   sync_sig, n1;

  sync sync_DUT ( .clk(clk), .rst_n(n1), .in_sig(noisy_in), .out_sig(sync_sig)
         );
  debouncer debouncer_DUT ( .clk(clk), .rst_n(n1), .noisy_in(sync_sig), 
        .debouncer_out(debouncer_out) );
  BUFX6M U1 ( .A(rst_n), .Y(n1) );
endmodule

