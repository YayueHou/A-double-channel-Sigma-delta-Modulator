module d_flop3(data,R,clk,q);
input data,clk,R;
output q;
tri a,b,c,q;
wire clkb;
supply1 vdd; 

not(pull0,pull1)  m1(b,a),
   		  m2(a,b);
not(weak0,weak1)  m3(q,c),
		  m4(c,q);
/*not		  m5(e,d),
		  m7(q,d);*/
not 		  m6(clkb,clk);
 
cmos  n1(a,data,clkb,clk),
      n2(c,b,clk,clkb) ;

pmos  nn1(c,vdd,R);      
     
endmodule