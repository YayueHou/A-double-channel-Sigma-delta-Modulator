module dflop_test;

reg in,ck,s;
wire out,outb;

initial 
begin
ck=0;
in=0;
s=0;
#5 s=1;
end

dflop_b  h1(in,s,ck,out,outb);

always
begin
#10 ck=~ck;
end

always 
begin
#20 in=~in;
end

endmodule    