module all_circuit_test();
reg CP0,R_clock,R8,D,A1;
wire P1,P1B,CPL0B;

All_Circuit	AA1(.CP0(CP0),.R8(R8),.R_clock(R_clock),.D(D),.A1(A1),.P1(P1),.P1B(P1B),.CPL0B(CPL0B));

initial
begin
CP0=0;
R8=0;
R_clock=0;
//DH=1;
#5 R_clock=1;
   R8=1;
//#127058 DH=0;   
end

initial
begin
D=1;
#40063 D=0;
#7000 D=1;
#40000 D=1;
#40000 D=1;
#7000 D=0;
#20000 D=0;
#10000 D=0;
#12000 D=1;
end

initial
begin
A1=1;
#63 A1=0;
end

/*initial
begin
L3=0;
#60 L3=1;
#5 L3=0;
end*/

always
begin
#5 CP0=~CP0;
end

/*always
begin
#500 L3=~L3;
end*/


endmodule