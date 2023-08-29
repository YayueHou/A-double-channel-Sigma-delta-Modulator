module All_shift_test();
reg R,D,A1,G4,S2,Q14b,Q41b,E4,D4,CP15,P1;
wire B,L3,G2;

All_shift  Ash1(.R(R),.A1(A1),.G4(G4),.S2(S2),.D(D),.Q14b(Q14b),
	.Q41b(Q41b),.E4(E4),.D4(D4),.B(B),.CP15(CP15),.P1(P1),
		.L3(L3),.G2(G2));

initial
begin
D=0;
R=0;
A1=0;
G4=1;
S2=1;
E4=0;
D4=0;
CP15=0;
P1=0;
Q14b=0;
Q41b=0;
//B=0;
#3  R=1;
#2  P1=1;
#2  A1=1;
#5  A1=0;
#3 P1=0;

/*repeat(100)
begin
#1003 A1=1;
#5 A1=0;
end*/
   
repeat(100)
begin   
#1000 P1=1;
#10 P1=0;   
end

end

always
begin
#5 CP15=~CP15;
end

/*always
begin
#5 B=~B;
end*/

assign #3 B=CP15;

always
begin
#50 Q14b=~Q14b;
end

always
begin
#10000 Q41b=~Q41b;
end

endmodule 

