`include "shift.v"
`include "shift_sub1.v"
`include "shift_sub2.v"
`include "shift_sub3.v"

module All_shift(R,A1,G4,S2,D,Q14b,Q41b,E4,D4,B,CP15,P1,L3,G2,V,J1B,E,N1);
input R,D,A1,G4,S2,Q14b,Q41b,E4,D4,B,CP15,P1;
output L3,G2,V,J1B,E,N1;
wire w1,w2,w3,w4,w5,w6,w7,w8,J1B,E,N1;
wire DB,BB;

shift  s1(.clk(P1),.A1(A1),.G1(),.Q8(w1),.Q8B(w2),.E1(w7),.H1(),.J1(),.I1(),.F1(),.N1(N1),
		.H1B(w6),.J1B(J1B),.L1(),.K1(),.M1(),.O1(),.O1B(w5));
not n1(DB,D);
shift_sub1   s2(.I(w3),.R(R),.D(D),.DB(DB),.Q8(w1),.Q8B(w2));
not  n2(BB,B);
not  n4(CP15B,CP15);
shift_sub3  s4(.I(w3),.J1B(J1B),.O1B(w5),.Q14B(Q14b),.E4(E4),.Q41B(Q41b),.D4(D4),.H1B(w6),.D(D),
		.CP15B(CP15B),.B(B),.E(E),.G2(G2),.F(w8));
not n3(A1B,A1);
shift_sub2  s3(.BB(BB),.E1(w7),.G4(G4),.S2(S2),.P1(P1),.F(w8),.A1B(A1B),.J1B(J1B),.I(w3),.IB(),.L3(L3));

nand m1(V,w8,w6);

endmodule