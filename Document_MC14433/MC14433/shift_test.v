module shift_test();
reg clk,A1,Q8,Q8B;
wire G1,E1,H1,J1,I1,F1,N1,H1B,J1B,L1,K1,M1;

shift sh1(.clk(clk),.A1(A1),.G1(G1),.Q8(Q8),.Q8B(Q8B),.E1(E1),.H1(H1),.J1(J1),.I1(I1),.F1(F1),.N1(N1),.H1B(H1B),.J1B(J1B),.L1(L1),.K1(K1),.M1(M1),.O1(O1),.O1B(O1B));

initial
begin
clk=1;
A1=1;
Q8=0;
Q8B=1;
#5 A1=0;
end

always
begin
#30 clk=~clk;
end
always
begin
#30 Q8=~Q8;
    Q8B=~Q8B;
end

endmodule