module d_flop6(data,R,clk,q);
input data,R,clk;
output q;
tri a,b,c,d,e,q;
wire clkb;
supply0 vss; 

not(pull0,pull1)  m1(b,a),
   		  m2(a,b);
not(weak0,weak1)  m3(d,c),
		  m4(c,d);
not		  m5(qb,d);
not		  m7(q,qb);
not 		  m6(clkb,clk);
 
cmos  n1(a,data,clkb,clk),
      n2(c,b,clk,clkb) ;

nmos  nn1(a,vss,R);      
     
endmodule