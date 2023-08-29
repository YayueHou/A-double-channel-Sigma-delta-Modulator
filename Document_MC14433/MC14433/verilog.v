// Verilog HDL for "ccadcLib", "dflop_b" "behavioral"
module dflop_b(data,s,clk,q,qb);
input data,s,clk;
output q,qb;
reg q,qb;

always
wait(s==0)
begin
q=1;
qb=0;
wait(s==1);
end

always
@(posedge clk)
begin
if(s!=0)
begin
q=data;
qb=~q;
end
end

endmodule

