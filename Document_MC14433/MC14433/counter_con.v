module counter_con(L3,CP15,Q14B,Q11B,Q24B,Q21B,Q34B,Q31B,Q41B,CP11B,CP21,CP21B,E4,CP31,CP31B,D4,CP41,CP41B,P1,P1B);
input L3,CP15,Q14B,Q11B,Q24B,Q21B,Q34B,Q31B,Q41B;
output CP11B,CP21,CP21B,E4,CP31,CP31B,D4,CP41,CP41B,P1,P1B;
supply1 vdd;
supply0 vss;
wire CP11B,CP21,CP21B,E4,CP31,CP31B,D4,CP41,CP41B,P1,P1B;
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27;

pmos	p1(w1,vdd,CP15),
	p2(w2,w1,Q14B),
	p3(w3,w2,L3);
nmos	n1(w3,w4,CP11B),
	n2(w4,vss,L3), 
	n3(w4,w5,Q14B),
	n4(w5,vss,Q11B);
not(pull0,pull1)	x1(w6,w3),
			x2(w3,w6);
not	x3(CP11B,CP15);
nand	y1(CP21B,w6,CP15);
not	x4(CP21,CP21B);



pmos	p4(w7,vdd,CP21),
	p5(w8,w7,Q24B),
	p6(w9,w8,L3);
nmos	n5(w9,w10,CP21B),
	n6(w10,vss,L3),
	n7(w10,w11,Q24B),
	n8(w11,vss,Q21B);
not(pull0,pull1)	x5(w12,w9),
			x6(w9,w12);
not	x7(w13,w12),
	x8(E4,w13);
not	x9(w14,w12);
nor	z1(CP31,CP21B,w14);
not	x10(CP31B,CP31);



pmos	p7(w15,vdd,CP31),
	p8(w16,w15,Q34B),
	p9(w17,w16,L3);
nmos	n9(w17,w18,CP31B),
	n10(w18,vss,L3),
	n11(w18,w19,Q34B),
	n12(w19,vss,Q31B);
not(pull0,pull1)	x20(w20,w17),
			x11(w17,w20);
not	x12(w21,w20),
	x13(D4,w21);
nand	y2(CP41B,CP31,D4);
not	x14(CP41,CP41B)	;



	
pmos	p10(w22,vdd,CP41),
	p11(w23,w22,Q41B),
	p12(w24,w23,L3);
nmos	n13(w24,w25,CP41B),
	n14(w25,vss,L3),
	n15(w25,vss,Q41B);
not(pull0,pull1)	x15(w26,w24),
			x16(w24,w26);
not	x17(w27,w26);
nor	z2(P1,w27,CP41B);
not	x18(P1B,P1);

endmodule
			
