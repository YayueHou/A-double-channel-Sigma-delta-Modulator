module shift_sub1_test();
reg clk1,clk2;
wire Q8,Q8B;
reg clk2b,R;

shift_sub1  b1(.R(R),.I(clk1),.D(clk2),.DB(clk2b),.Q8(Q8),.Q8B(Q8B));

initial
begin
R=0;
clk1=0;
clk2=0;
clk2b=1;
#10 R=1;
end

always
begin
#40 clk2=~clk2;
   clk2b=~clk2b;
end

always
begin
#5 clk1=~clk1;
end

endmodule


