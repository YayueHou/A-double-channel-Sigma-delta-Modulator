`include "dflop3.v"
module shift_sub1(I,R,D,DB,Q8,Q8B);
input R,I,D,DB;
output Q8,Q8B;
wire s3,s4;

d_flop3  ds1(.data(s4),.R(R),.clk(I),.q(Q8));

not  inv1(Q8B,Q8),
     inv2(s4,s3);

cmos  c1(s3,Q8B,D,DB),
      c2(s3,Q8,DB,D);
      
endmodule      
