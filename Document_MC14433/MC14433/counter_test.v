module counter_test();
reg clk1,clk2,clk3,clk4,s1,s2,s3,s4,g2;
wire qb11,qb21,qb31,qb41,qb14,qb24,qb34,S2,G4;

counter c1(clk1,clk2,clk3,clk4,s1,s2,s3,s4,g2,qb11,qb21,qb31,qb41,qb14,qb24,qb34,S2,G4);

initial
begin
clk1=0;
clk2=0;
clk3=0;
clk4=0;
s1=0;
s2=0;
s3=0;
s4=0;
g2=0;
#15 s1=1;
    s2=1;
    s3=1;
    s4=1;
end

always
begin
#10 clk1=~clk1;
    clk2=~clk2;
    clk3=~clk3;
    clk4=~clk4;
end

always
#10 g2=~g2;
endmodule
