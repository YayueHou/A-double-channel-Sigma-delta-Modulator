module clock1_test();
reg dh,cp6,cp7;
wire b,bb,cp15,cp15b;

clock1	u1(.DH(dh),.CP6(cp6),.CP7(cp7),.B(b),.BB(bb),.CP15(cp15),.CP15B(cp15b));

initial
begin
dh=0;
cp6=0;
cp7=0;
end

always
begin
#50 dh=~dh;
end

always
begin
#5 cp6=~cp6;
end

always
begin
#8 cp7=~cp7;
end

endmodule