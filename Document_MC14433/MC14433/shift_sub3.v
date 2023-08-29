`include "dflop8.v"

module shift_sub3(I,J1B,O1B,Q14B,E4,Q41B,D4,H1B,D,CP15B,B,E,G2,F);
input I,J1B,O1B,Q14B,E4,Q41B,D4,H1B,D,CP15B,B;
output E,G2,F;
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,E;
supply1 vdd;
supply0 vss;

pmos	p1(w2,vdd,O1B),
	p2(w3,vdd,O1B);
	
nmos	n1(w3,w4,O1B),
	n2(w4,vss,I),
	n3(w4,w5,Q14B),
	n4(w5,vss,J1B),
	n5(w2,w6,CP15B),
	n6(w6,w7,O1B),
	n7(w7,w8,D),
	n8(w8,vss,w15),
	n9(w7,w9,Q14B),
	n10(w9,w10,E4),
	n11(w10,w11,Q41B),
	n12(w11,w12,D4),
	n13(w12,vss,H1B);
	
not(pull0,pull1)	x1(w13,w3),
			x2(w3,w13);
			
not	x3(w14,w13),
	x4(w15,w14);

not(pull0,pull1)	x5(w16,w2),
			x6(w2,w16);
			
not 	x30(CP15,CP15B);
cmos	y1(w17,w16,CP15,CP15B);

not(weak0,weak1)	x7(w18,w17),
			x8(w17,w18);
		
not	x9(w19,w18),
	x10(E,w19);
	
d_flop8	z1(.data(E),.clk(CP15),.q(),.qb(w20));

nor	v1(F,E,w20);

not	x19(w21,F),
	x20(w23,w22),
	x21(G2,w23);
	
nand	u1(w22,B,J1B,w21);
	
endmodule	