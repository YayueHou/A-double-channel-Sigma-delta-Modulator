`include "dflop1.v"
`include "All_clock.v"

module test1(cp,s1,s2,dh,qb11,qb12,qb13,qb14);
input cp,s1,s2,dh;
output qb11,qb12,qb13,qb14;
wire qb11,q11,q12,q13,q14,w1;

d_flop1 d1(.data(qb11),.s(s1),.clk(w1),.q(q11),.qb(qb11)),
	d2(.data(qb12),.s(s1),.clk(q11),.q(q12),.qb(qb12)),
	d3(.data(qb13),.s(s1),.clk(q12),.q(q13),.qb(qb13)),
	d4(.data(qb14),.s(s1),.clk(q13),.q(q14),.qb(qb14));
	
All_clock	a1(.CP(cp),.R(s2),.DH(dh),.CP5B(),.CP6B(),.CP7B(),.B(),.BB(),.CP15(w1),.CP15B());	
 
endmodule