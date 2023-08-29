module test1_test();
reg cp,s1,s2,dh;
wire qb11,qb12,qb13,qb14;

test1	t1(.cp(cp),.s1(s1),.s2(s2),.dh(dh),.qb11(qb11),.qb12(qb12),.qb13(qb13),.qb14(qb14));

initial
begin
//r=0;
cp=0;
s1=0;
s2=0;
dh=1;
#5 s2=1;
#140 s1=1;
end

always
begin
#10 cp=~cp;
end

/*always
begin
#16 r=~r;
end*/
endmodule 