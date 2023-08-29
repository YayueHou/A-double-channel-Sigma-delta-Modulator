`include "V_con.v"
`include "V_out.v"

module All_V(P1,data1,data2,B,V,out);
input P1,data1,data1,B,V;
output out;
wire w1;

V_con s1(.P1(P1),.data(data1),.B(B),.V(),.CPL0(w1));
V_out s2(.data(data2),.CPL0(w1),.D_out(out));

endmodule