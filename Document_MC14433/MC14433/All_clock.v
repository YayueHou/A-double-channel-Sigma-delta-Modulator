`include "clock1.v"
`include  "clock.v"

module All_clock(CP,R,DH,CP5B,CP6B,CP7B,B,BB,CP15,CP15B);
input CP,R,DH;
output CP5B,CP6B,CP7B,B,BB,CP15,CP15B;
wire w1,w2;

clock1	e1(.DH(DH),.R6(R),.CP6(w1),.CP7(w2),.B(B),.BB(BB),.CP15(CP15),.CP15B(CP15B));
clock	e2(.CP(CP),.R(R),.CP5B(CP5B),.CP6(w1),.CP6B(CP6B),.CP7(w2),.CP7B(CP7B));

endmodule