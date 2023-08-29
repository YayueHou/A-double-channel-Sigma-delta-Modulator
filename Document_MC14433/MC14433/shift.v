`include "dflop2.v"

module shift(clk,A1,G1,Q8,Q8B,E1,H1,J1,I1,F1,N1,H1B,J1B,L1,K1,M1,O1,O1B);
input clk,A1,Q8,Q8B;
output G1,E1,H1,J1,I1,F1,N1,H1B,J1B,L1,K1,M1,O1,O1B;
supply1 vdd;
wire q1,q2,q3,q1b,q2b,q3b;
wire sh1,sh2;
wire drv1,drv2,drv3;

d_flop2 dd1(.data(q3b),.r1(A1),.r2(H1),.r3(I1),.clk(clk),.q(q1),.qb(q1b)),
	dd2(.data(q1),.r1(A1),.r2(E1),.r3(G1),.clk(clk),.q(q2),.qb(q2b)),
	dd3(.data(q2),.r1(A1),.r2(H1),.r3(I1),.clk(clk),.q(q3),.qb(q3b));
	

nand  s1(I1,q1,q3),
      s2(J1,q1,q2b),
      s3(H1,q2b,q3),
      s4(E1,q1b,q2),
      s5(Z1,q1b,q3b),
      s6(G1,q2,q3b),
      s7(F1,Z1,G1),
      s8(N1,H1,E1),
      s9(M1,J1,E1,H1);
    
not  inv1(H1B,H1),
     inv2(J1B,J1),
     inv3(O1B,O1);

nor   s10(O1,J1B,N1),
      s11(K1,Q8,I1),  
      s12(L1,Q8B,I1);

endmodule

