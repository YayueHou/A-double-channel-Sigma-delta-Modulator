module dflop3_test();
reg clk,in,R;
wire out;

d_flop3 d3(in,R,clk,out);

initial
begin
R=0;
clk=0;
in=0;
#5 R=1;
end

always
begin
#10 in=~in;
end

always
begin
#5 clk=~clk;
end
endmodule