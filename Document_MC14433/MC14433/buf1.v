module d_buf(data,g2,q1,q1b,out);

input data,g2,q1,q1b;
output out;
tri a,b,c,d;
wire g2b;

cmos n1(a,data,g2b,g2),
     n2(d,c,q1,q1b),
     n3(d,b,q1b,q1);
     
not(pull0,pull1)  m1(b,a),
		  m2(a,b);
		  
not  m3(c,b),
     m4(out,d); 
     
not m5(g2b,g2);
     
endmodule