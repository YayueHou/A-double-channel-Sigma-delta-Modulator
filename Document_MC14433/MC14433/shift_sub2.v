module shift_sub2(BB,E1,G4,S2,P1,F,A1B,J1B,I,IB,L3);
input BB,E1,G4,S2,P1,F,A1B,J1B;
output I,IB,L3;
wire I,IB;
supply1 vdd;
supply0 vss;

nor	x1(I,BB,E1,G4,S2);

not	x2(IB,I);
not(pull0,pull1)  x3(b,a),
		  x4(a,b);

nand	x5(c,J1B,F),
	X6(L3,b,c,A1B);
	
pmos  	x7(a,vdd,IB);
nmos	x8(a,vss,P1);

endmodule