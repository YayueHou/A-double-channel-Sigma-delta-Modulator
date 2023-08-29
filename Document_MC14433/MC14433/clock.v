`include "dflop5.v"
module clock(CP,R,CP5B,CP6,CP6B,CP7,CP7B);
input CP,R;
output CP5B,CP6,CP6B,CP7,CP7B;
wire w2,w3;

not	x1(CP5B,CP);
	

d_flop5	u1(.data(w2),.R(R),.clk(CP),.q(w3),.qb(w2));

nor	y1(CP6,CP,w3),
	y2(CP7,w2,CP);
	
not	x3(CP6B,CP6),
	x4(CP7B,CP7);
	
endmodule	
