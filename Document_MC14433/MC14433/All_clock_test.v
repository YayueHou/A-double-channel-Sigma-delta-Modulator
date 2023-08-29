module All_clock_test();
reg CP,R,DH;
wire CP5B,CP6B,CP7B,B,BB,CP15,CP15B;

All_clock  A1(.CP(CP),.R(R),.DH(DH),.CP5B(CP5B),.CP6B(CP6B),.CP7B(CP7B),.B(B),.BB(BB),.CP15(CP15),.CP15B(CP15B));

initial
begin
CP=0;
R=0;
DH=1;
#2 R=1;
end

always
begin
#5 CP=~CP;
end

endmodule
