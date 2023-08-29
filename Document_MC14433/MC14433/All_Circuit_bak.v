`include "counter.v"
`include "counter_con.v"
`include "All_clock.v"

module All_Circuit(L3,g2,CP0,R_clock,DH,P1,P1B,S2,G4,E4,D4);
input L3,g2,CP0,R_clock,DH;
output S2,G4,P1,P1B,D4,E4;
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13;
wire w14;
wire P1,P1B;


counter  c1(.clk1(w14),.clk2(w1),.clk3(w4),.clk4(w9),.s1(w2),.s2(w5),.s3(w10),.s4(P1B),.g2(g2),.qb11(w3),.qb21(w8),.qb31(w11),
	.qb41(w13),.qb14(w6),.qb24(w7),.qb34(w12),.S2(S2),.G4(G4));
	
counter_con  c2(.L3(L3),.CP15(w14),.Q14B(w6),.Q11B(w3),.Q24B(w7),.Q21B(w8),.Q34B(w12),.Q31B(w11),.Q41B(w13),
		.CP11B(),.CP21(w1),.CP21B(w2),.E4(E4),.CP31(w4),.CP31B(w5),.D4(D4),.CP41(w9),.CP41B(w10),.P1(P1),.P1B(P1B));

All_clock	c3(.CP(CP0),.R(R_clock),.DH(DH),.CP5B(),.CP6B(),.CP7B(),.B(),.BB(),.CP15(w14),.CP15B());

endmodule