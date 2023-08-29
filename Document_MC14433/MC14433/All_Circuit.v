`include "counter.v"
`include "counter_con.v"
`include "All_clock.v"
`include "All_shift.v"
`include "V_con.v"
`include "dflop7.v"

module All_Circuit(CP0,R8,R_clock,D,A1,P1,P1B,CPL0B);
input R8,CP0,R_clock,D,A1;
output P1,P1B,CPL0B;
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13;
wire w14;
wire w15,w16,w17,w18,w19,w20,w21,w22;
wire P1,P1B;
wire w23,w24,w25,w26,w27,w28,w29,w30,w31;
wire DB;


counter  c1(.clk1(w14),.clk2(w1),.clk3(w4),.clk4(w9),.s1(w2),.s2(w5),.s3(w10),.s4(P1B),.g2(w16),.qb11(w3),.qb21(w8),.qb31(w11),
	.qb41(w13),.qb14(w6),.qb24(w7),.qb34(w12),.S2(w18),.G4(w17));
	
counter_con  c2(.L3(w15),.CP15(w14),.Q14B(w6),.Q11B(w3),.Q24B(w7),.Q21B(w8),.Q34B(w12),.Q31B(w11),.Q41B(w13),
		.CP11B(),.CP21(w1),.CP21B(w2),.E4(w19),.CP31(w4),.CP31B(w5),.D4(w20),.CP41(w9),.CP41B(w10),.P1(P1),.P1B(P1B));

All_clock	c3(.CP(CP0),.R(R_clock),.DH(w30),.CP5B(),.CP6B(),.CP7B(),.B(w21),.BB(),.CP15(w14),.CP15B());

All_shift	c4(.R(R8),.A1(A1),.G4(w17),.S2(w18),.D(D),.Q14b(w6),.Q41b(w13),.E4(w19),.D4(w20),.B(w21),.CP15(w14),.P1(P1),
			.L3(w15),.G2(w16),.V(w23),.J1B(w25),.E(w26),.N1(w29));
	
			
V_con		c5(.P1(P1),.B(w21),.V(w23),.CPL0B(CPL0B));			

not	inv1(DB,D);
nand  	u1(w24,w21,w25,w26);
not	inv2(w27,w24);

d_flop7	c6(.data(DB),.R(P1B),.clk(w27),.q(w28));

//not inv3(w31,w21);
nand	u2(w30,w28,w29);

endmodule