`include "dflop6.v"
module V_con(P1,B,V,CPL0B);
input P1,V,B;
output CPL0B;
wire VB,w1,w2,w3,w4,w5;
supply1 vdd;

not m1(w1,P1);
nand	m2(CP4,w1,V);
d_flop6	D1(.data(vdd),.R(VB),.clk(CP4),.q(w2));
not m3(VB,V);
cmos c1(w3,w2,V,VB);
not(pull0,pull1)  m4(w4,w3),
		  m5(w3,w4);
nand m6(w5,w3,VB,B);		  
not m7(CPL0B,w5);
endmodule
