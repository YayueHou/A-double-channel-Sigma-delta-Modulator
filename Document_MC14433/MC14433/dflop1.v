module d_flop1(data,s,clk,q,qb);
input data,clk,s;
output q,qb;
tri a,b,c,q;
wire clkb;
supply1 vdd;
wire d;

not(pull0,pull1)  m1(b,a),
   		  m2(a,b);
not(weak0,weak1)  m3(d,c),
		  m4(c,d); 
not    		  m5(qb,d);
not		  m7(q,qb);
not 		  m6(clkb,clk);
 
pmos  p1(d,vdd,s);
pmos  p2(a,vdd,s);
cmos  n1(a,data,clkb,clk),
      n2(c,b,clk,clkb) ;
     
endmodule