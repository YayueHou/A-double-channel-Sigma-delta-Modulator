`include "dflop1.v"
`include "buf1.v"

module counter(clk1,clk2,clk3,clk4,s1,s2,s3,s4,g2,qb11,qb21,qb31,qb41,qb14,qb24,qb34,S2,G4);
input clk1,clk2,clk3,clk4,s1,s2,s3,s4,g2;
output qb11,qb21,qb31,qb41,qb14,qb24,qb34,S2,G4;
wire out11,out12,out13,out14,out21,out22,out23,out24,out31,out32;
//wire out11,out12,out13,out14;
wire q11,q12,q13,q14,qb11,qb12,qb13,qb14;
wire q21,q22,q23,q24,qb21,qb22,qb23,qb24;
wire q31,q32,q33,q34,qb31,qb32,qb33,qb34;
wire q41,qb41;
supply0 vss;
supply1 vdd;
wand S2,G4;

/*The first grade*/
d_flop1 d1(.data(qb11),.s(s1),.clk(clk1),.q(q11),.qb(qb11)),
	d2(.data(qb12),.s(s1),.clk(q11),.q(q12),.qb(qb12)),
	d3(.data(qb13),.s(s1),.clk(q12),.q(q13),.qb(qb13)),
	d4(.data(qb14),.s(s1),.clk(q13),.q(q14),.qb(qb14));
	
d_buf   b1(.data(qb11),.g2(g2),.q1(q11),.q1b(qb11),.out(out11)),
	b2(.data(qb12),.g2(g2),.q1(q12),.q1b(qb12),.out(out12)),
	b3(.data(qb13),.g2(g2),.q1(q13),.q1b(qb13),.out(out13)),
	b4(.data(qb14),.g2(g2),.q1(q14),.q1b(qb14),.out(out14));
	
/*The 2nd grade*/
d_flop1	d5(.data(qb21),.s(s2),.clk(clk2),.q(q21),.qb(qb21)),
	d6(.data(qb22),.s(s2),.clk(q21),.q(q22),.qb(qb22)),
	d7(.data(qb23),.s(s2),.clk(q22),.q(q23),.qb(qb23)),
	d8(.data(qb24),.s(s2),.clk(q23),.q(q24),.qb(qb24));
	
d_buf   b5(.data(qb21),.g2(g2),.q1(q21),.q1b(qb21),.out(out21)),
	b6(.data(qb22),.g2(g2),.q1(q22),.q1b(qb22),.out(out22)),
	b7(.data(qb23),.g2(g2),.q1(q23),.q1b(qb23),.out(out23)),
	b8(.data(qb24),.g2(g2),.q1(q24),.q1b(qb24),.out(out24));	
	
/*The 3rd grade*/
d_flop1	d9(.data(qb31),.s(s3),.clk(clk3),.q(q31),.qb(qb31)),
	d10(.data(qb32),.s(s3),.clk(q31),.q(q32),.qb(qb32)),
	d11(.data(qb33),.s(s3),.clk(q32),.q(q33),.qb(qb33)),
	d12(.data(qb34),.s(s3),.clk(q33),.q(q34),.qb(qb34));
	
d_buf   b9(.data(qb31),.g2(g2),.q1(q31),.q1b(qb31),.out(out31)),
	b10(.data(qb32),.g2(g2),.q1(q32),.q1b(qb32),.out(out32));
	/*b11(.data(qb33),.g2(g2),.q1(q33),.q1b(qb33),.out(out33)),
	b12(.data(qb34),.g2(g2),.q1(q34),.q1b(qb34),.out(out34));*/
	
/*The 4th grade*/
d_flop1	d13(.data(qb41),.s(s4),.clk(clk4),.q(q41),.qb(qb41));
			
pmos	p1(S2,vdd,vss),
	p2(G4,vdd,vss);
nmos	n1(S2,w2,out11),
	n2(w2,w3,out12),
	n3(w3,w4,out13),
	n4(w4,vss,out14),
	n5(G4,w6,out21),
	n6(w6,w7,out22),
	n7(w7,w8,out23),
	n8(w8,w9,out24),
	n9(w9,w10,out31),
	n10(w10,vss,out32);
	
endmodule                           

