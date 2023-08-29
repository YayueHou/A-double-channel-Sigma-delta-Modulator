`include "dflop4.v"
module clock1(DH,R6,CP6,CP7,B,BB,CP15,CP15B);
input DH,CP6,CP7,R6;
output B,BB,CP15,CP15B;
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11;

d_flop4	u1(.data(DH),.R6(R6),.clk(CP6),.q(w2),.qb(w1)),
	u2(.data(w6),.R6(R6),.clk(CP7),.q(w3),.qb(w4));
	
not	x1(w5,w2),
	x2(w6,w5),
	x3(BB,B),
	X4(CP15B,w11),
	x5(CP15,CP15B);
	
nand	y1(w7,w1,CP6),
	y2(w8,w6,CP6),
	y3(w9,w3,CP7),
	y4(w10,w4,CP7),
	y5(B,w7,w9),
	y6(w11,w8,w10);
	
endmodule	