module all_circuit_test();
reg L3,g2,CP0,R_clock,DH;
wire P1,P1B,S2,G4,D4;

All_Circuit	A1(.L3(L3),.g2(g2),.CP0(CP0),.R_clock(R_clock),.DH(DH),.P1(P1),.P1B(P1B),.S2(S2),.G4(G4),.E4(E4),.D4(D4));

initial
begin
CP0=0;
L3=1;
R_clock=0;
g2=0;
DH=1;
#5 R_clock=1;
#140 L3=0;
end

/*always
begin
#75 L3=0;
end */

always
begin
#10 CP0=~CP0;
end

/*always
begin
#500 L3=~L3;
end*/

always
begin
#20 g2=~g2;
end

endmodule