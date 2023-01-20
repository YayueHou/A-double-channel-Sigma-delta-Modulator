

//*===================================Module of 1-bit Full adder============================*/

module ad01d0 (A,B,CI,S,CO);

input  A,B,CI;
output S,CO;

assign {CO,S}=A+B+CI;

endmodule



//*================================Module of 1-bit Half adder===============================*/

module ah01d0 (A,B,S,CO);

input  A,B;
output S,CO;

assign {CO,S}=A+B;

endmodule


//===============================Module of parameterized Adder=======================
module DW01_add (A,B,CI,SUM,CO);
parameter DATAPATH=28;

input [DATAPATH-1:0] A,B;
input                CI;
output[DATAPATH-1:0] SUM;
output               CO;

assign {CO,SUM}=A+B+CI;

endmodule




