module clock_test();
reg cp,r;
wire cp5b,cp6,cp6b,cp7,cp7b;

clock w1(.CP(cp),.R(r),.CP5B(cp5b),.CP6(cp6),.CP6B(cp6b),.CP7(cp7),.CP7B(cp7b));

initial
begin
cp=0;
r=0;
#10 r=1;
end

always
begin
#5 cp=~cp;
end

endmodule
