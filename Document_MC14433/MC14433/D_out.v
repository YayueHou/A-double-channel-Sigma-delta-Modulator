module V_out(data,CPL0,D_out);
input data,CPL0;
output V_out;

not m1(CPL0B,CPL0);
cmos c1(data,w1,CPL0B,CPL0);
not(pull0,pull1) m2(w3,w2),
		 m3(w2,w3);
not m4(w4,w3);
not m5(D_out,w4);
endmodule
		 

