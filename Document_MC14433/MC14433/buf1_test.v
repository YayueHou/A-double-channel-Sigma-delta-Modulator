module buf1_test;

reg in,ck1,ck2,ck2b;
wire b_out;

d_buf k1(in,ck1,ck2,ck2b,b_out);

initial 
begin 
ck1=1;
ck2=0; 
ck2b=1; 
in=0; 
end

always 
begin
#10 ck1=~ck1;
end

always 
begin
#20 ck2b=~ck2b;
    ck2=~ck2;	
end

always 
begin
#50 in=~in;
end

endmodule     