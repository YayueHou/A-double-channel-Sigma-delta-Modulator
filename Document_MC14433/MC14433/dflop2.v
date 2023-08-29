module d_flop2(data,r1,r2,r3,clk,q,qb);
input data,clk,r1,r2,r3;
output q,qb;
tri a,b,c,d,e,q;
wire clkb;
wire drv;
supply1 vdd;
supply0 vss;

not(pull0,pull1)  m1(b,a),
   		  m2(a,b);
not(weak0,weak1)  m3(e,c),
		  m4(c,e);
not    		  m5(qb,e);
not 		  m6(clkb,clk);
not		  m7(drv,e);
not		  m8(q,drv);
 
pmos  p1(d,vdd,r2);
pmos  p2(c,d,r3);
nmos  nn1(a,vss,r1);
cmos  n1(a,data,clkb,clk),
      n2(c,b,clk,clkb) ;
     
endmodule