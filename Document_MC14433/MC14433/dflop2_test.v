module dflop_test;

reg in,ck,r1,r2,r3;
wire out,outb;

initial 
begin
ck=0;
r1=1;
r2=0;
r3=0;
in=0;
#5 r1=0;
   r2=1;
   r3=1;	
end

d_flop2  h1(in,r1,r2,r3,ck,out,outb);

always
begin
#10 ck=~ck;
end

always 
begin
#20 in=~in;
end

endmodule    