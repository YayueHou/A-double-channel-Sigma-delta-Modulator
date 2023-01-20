module dem_top  (clk,s3,reset,//mclk_count,
			    //dem_bp,dem_tm,selftest_clr,assert,mode_sel,    //fenghui modified, 11/03/04
			     data_in,
			     dem_out_reg);   //fenghui modified, 11/03/04

input        clk,s3,reset;  //selftest_clr,dem_bp;  //fenghui modified, 11/03/04
//input[8:0]   mclk_count;
input[4:0]   data_in;
//input[4:0]   dem_tm;   //fenghui modified, 11/03/04
//output       assert;   //fenghui modified, 11/03/04
output[15:0] dem_out_reg; //fenghui modified, 11/03/04                 

reg [15:0]   dem_out_reg;	
wire[15:0]   dem_out;
wire[3:0]    y2_4to3,y1_4to3;
wire[2:0]    y1_3to2_1,y1_3to2_2,y2_3to2_1,y2_3to2_2;
wire[1:0]    y1_2to1_1,y1_2to1_2,y1_2to1_3,y1_2to1_4,
             y2_2to1_1,y2_2to1_2,y2_2to1_3,y2_2to1_4;


/*dem_test_mode_sel mode1(.clk(clk),
                        .rst(reset),
                        .mclk_count_4b(mclk_count[7:4]),
                        //.s3(s3),
                        .dem_bp(dem_bp),
                        .dem_tm(dem_tm),
                        .dsm_out(data_in),
                        .dem_out(dem_out),
                        .mode_out(mode_sel));


dem_error_assert    er1(.clk(clk),
                        .rst(reset),
                        //.s2(s2),
                        .error_clear(selftest_clr),
                        .data_in(data_in),
                        .dem_out(dem_out),
                        .assert(assert));*/     //fenghui modified, 11/03/04

dem_fun4           t4_1(.clk(clk),
                        .s3(s3),
                        .rst(reset),
                        .y_in(data_in),
                        .y_out1(y1_4to3),
                        .y_out2(y2_4to3));


dem_fun3           t3_1_1(.clk(clk),
                        .s3(s3),
                         .rst(reset),
                         .y_in(y1_4to3),
                         .y_out1(y1_3to2_1),
                         .y_out2(y2_3to2_1));
                   

dem_fun3           t3_2_1(.clk(clk),
                        .s3(s3),
                         .rst(reset),
                         .y_in(y2_4to3),
                         .y_out1(y1_3to2_2),
                         .y_out2(y2_3to2_2));
             
dem_fun2           t2_1_1(.clk(clk),
                        .s3(s3),
                         .rst(reset),
                         .y_in(y1_3to2_1),
                         .y_out1(y1_2to1_1),
                         .y_out2(y2_2to1_1));
                        
dem_fun2           t2_2_1(.clk(clk),
                        .s3(s3),
                        .rst(reset),
                         .y_in(y2_3to2_1),
                         .y_out1(y1_2to1_2),
                         .y_out2(y2_2to1_2));
                        
       
dem_fun2           t2_3_1(.clk(clk),
                        .s3(s3),
                         .rst(reset),
                          .y_in(y1_3to2_2),
                          .y_out1(y1_2to1_3),
                          .y_out2(y2_2to1_3));
                        
dem_fun2           t2_4_1(.clk(clk),
                        .s3(s3),
                          .rst(reset),
                          .y_in(y2_3to2_2),
                          .y_out1(y1_2to1_4),
                          .y_out2(y2_2to1_4));
                        
dem_fun1           t1_1_1(.clk(clk),
                        .s3(s3),
                          .rst(reset),
                          .y_in(y1_2to1_1),
                          .y_out1(dem_out[0]),
                          .y_out2(dem_out[1]));
                        

dem_fun1           t1_2_1(.clk(clk),
                        .s3(s3),
                          .rst(reset),
                          .y_in(y2_2to1_1),
                          .y_out1(dem_out[2]),
                          .y_out2(dem_out[3]));
                        

dem_fun1           t1_3_1(.clk(clk),
                        .s3(s3),
                         .rst(reset),
                         .y_in(y1_2to1_2),
                         .y_out1(dem_out[4]),
                         .y_out2(dem_out[5]));
                         
                         
dem_fun1           t1_4_1(.clk(clk),
                        .s3(s3),
                          .rst(reset),
                          .y_in(y2_2to1_2),
                          .y_out1(dem_out[6]),
                          .y_out2(dem_out[7]));
                          
                        
dem_fun1           t1_5_1(.clk(clk),
                        .s3(s3),
                          .rst(reset),
                          .y_in(y1_2to1_3),
                          .y_out1(dem_out[8]),
                          .y_out2(dem_out[9]));
                          
                        
dem_fun1           t1_6_1(.clk(clk),
                        .s3(s3),
                          .rst(reset),
                          .y_in(y2_2to1_3),
                          .y_out1(dem_out[10]),
                          .y_out2(dem_out[11]));
                          
                        
dem_fun1           t1_7_1(.clk(clk),
                        .s3(s3),
                          .rst(reset),
                          .y_in(y1_2to1_4),
                          .y_out1(dem_out[12]),
                          .y_out2(dem_out[13]));
                        
dem_fun1           t1_8_1(.clk(clk),
                        .s3(s3),
                          .rst(reset),
                         .y_in(y2_2to1_4),
                         .y_out1(dem_out[14]),
                         .y_out2(dem_out[15]));
                         
                         
//fenghui modified, 12/2/04 
always @(posedge clk or posedge reset)           
	if(reset)
		dem_out_reg = 16'b1111_1111_0000_0000;
	else if(s3==1)
		dem_out_reg = dem_out;
	else
		dem_out_reg = dem_out_reg;

endmodule                         
                        
               

//*====================================Module of table_level4=============================*/

module dem_fun4(clk,s3,rst,y_in,y_out1,y_out2);

parameter IN_WIDTH=5;

input clk,s3;
input rst;
input [IN_WIDTH-1:0] y_in;
output [IN_WIDTH-2:0] y_out1, y_out2;
wire [IN_WIDTH-2:0] y_out1, y_out2;

reg [1:0] I1;
reg [1:0] I2;
reg Q;
reg [1:0] s;
reg [IN_WIDTH-2:0] temp_y1,temp_y2;
wire Okr,SGN1,SGN2,MAG2;
wire Qb;
wire[IN_WIDTH-2:0] y_out1_tmp,y_out2_tmp;


always @(posedge clk or posedge rst)
begin
if(rst)
  I1<=0;
else if(s3==1)
begin
  case({y_in[0],Qb})
    2'b00: I1<=I1;
    2'b01: I1<=I1;
    2'b10: I1<=I1-1;
    2'b11: I1<=I1+1;
  endcase  
end
else
   I1<=I1; 
end

     
assign SGN1=(I1[1]==0)?1:0;

always @(posedge clk or posedge rst)
begin
if(rst)
  I2<=0;
else if(s3==1)  
begin
  case(I1)
    2'b00: I2<=I2;
    2'b10: I2<=I2;
    2'b01: begin if(I2==2'b01) I2<=2'b01; else I2<=I2+1; end
    2'b11: begin if(I2==2'b11) I2<=2'b11; else I2<=I2-1; end
   endcase 
end
else
  I2<=I2; 
end
      

assign MAG2=(I2[0]==0)?0:1;
assign SGN2=(I2[1]==0)?1:0;

always @(I1 or I2 or rst or SGN1 or SGN2)
begin
if(rst)
  Q<=0;
else  
begin
  case({I1[0],I2[0]})
     2'b10: Q<=SGN1; 
     2'b11: Q<=SGN1; 
     2'b01: Q<=SGN2; 
     2'b00: Q<=0;    
  endcase
end
end
      

assign Qb=~Q;

always @(y_in or Q or rst)
begin
if(rst)
  s<=0;
else  
begin
   case({y_in[0],Q})
     2'b00: s<=2'b00;
     2'b01: s<=2'b00;
     2'b11: s<=2'b01;
     2'b10: s<=2'b11;
   endcase
end
end
     
        
always @(y_in)
case(y_in[IN_WIDTH-1])
  1'b1: begin temp_y1<=8;temp_y2<=8; end
  1'b0: case(y_in[IN_WIDTH-2:0])
            4'b0000: begin temp_y1<=0;temp_y2<=0; end
            4'b0001: begin temp_y1<=0;temp_y2<=1; end
            4'b0010: begin temp_y1<=1;temp_y2<=1; end
            4'b0011: begin temp_y1<=1;temp_y2<=2; end
            4'b0100: begin temp_y1<=2;temp_y2<=2; end
            4'b0101: begin temp_y1<=2;temp_y2<=3; end
            4'b0110: begin temp_y1<=3;temp_y2<=3; end
            4'b0111: begin temp_y1<=3;temp_y2<=4; end
            4'b1000: begin temp_y1<=4;temp_y2<=4; end
            4'b1001: begin temp_y1<=4;temp_y2<=5; end
            4'b1010: begin temp_y1<=5;temp_y2<=5; end
            4'b1011: begin temp_y1<=5;temp_y2<=6; end
            4'b1100: begin temp_y1<=6;temp_y2<=6; end
            4'b1101: begin temp_y1<=6;temp_y2<=7; end
            4'b1110: begin temp_y1<=7;temp_y2<=7; end
            4'b1111: begin temp_y1<=7;temp_y2<=8; end
        endcase
endcase

//------------------------------------Codes above construct the look-up table.

assign y_out1=(s[1]==1)?temp_y1:(s[0]==0)?temp_y1:temp_y2;
assign y_out2=(s[1]==1)?temp_y2:(s[0]==0)?temp_y2:temp_y1;


endmodule          
         

//*====================================Module of table_level3=============================*/

module dem_fun3(clk,s3,rst,y_in,y_out1,y_out2);

parameter IN_WIDTH=4;

input clk,s3;
input rst;
input [IN_WIDTH-1:0] y_in;
output [IN_WIDTH-2:0] y_out1, y_out2;
wire [IN_WIDTH-2:0] y_out1, y_out2;

reg [1:0] I1;
reg [1:0] I2;
reg Q;
reg [1:0] s;
reg [IN_WIDTH-2:0] temp_y1,temp_y2;
wire Okr,SGN1,SGN2,MAG2;
wire Qb;
wire[IN_WIDTH-2:0] y_out1_tmp,y_out2_tmp;


always @(posedge clk or posedge rst)
begin
if(rst)
  I1<=0;
else if(s3==1)
begin
  case({y_in[0],Qb})
    2'b00: I1<=I1;
    2'b01: I1<=I1;
    2'b10: I1<=I1-1;
    2'b11: I1<=I1+1;
  endcase  
end
else
   I1<=I1; 
end

        
assign SGN1=(I1[1]==0)?1:0;

always @(posedge clk or posedge rst)
begin
if(rst)
  I2<=0;
else if(s3==1)  
begin
  case(I1)
    2'b00: I2<=I2;
    2'b10: I2<=I2;
    2'b01: begin if(I2==2'b01) I2<=2'b01; else I2<=I2+1; end
    2'b11: begin if(I2==2'b11) I2<=2'b11; else I2<=I2-1; end
   endcase 
end
else
  I2<=I2; 
end
      

assign MAG2=(I2[0]==0)?0:1;
assign SGN2=(I2[1]==0)?1:0;

always @(I1 or I2 or rst or SGN1 or SGN2)
begin
if(rst)
  Q<=0;
else  
begin
  case({I1[0],I2[0]})
     2'b10: Q<=SGN1; 
     2'b11: Q<=SGN1; 
     2'b01: Q<=SGN2; 
     2'b00: Q<=0;    
  endcase
end
end
      
 
assign Qb=~Q;

always @(y_in or Q or rst)
begin
if(rst)
  s<=0;
else  
begin
   case({y_in[0],Q})
     2'b00: s<=2'b00;
     2'b01: s<=2'b00;
     2'b11: s<=2'b01;
     2'b10: s<=2'b11;
   endcase
end
end
     


always @(y_in)
case(y_in[IN_WIDTH-1])
  1'b1: begin temp_y1<=4;temp_y2<=4; end
  1'b0: case(y_in[IN_WIDTH-2:0])
            3'b000: begin temp_y1<=0;temp_y2<=0; end
            3'b001: begin temp_y1<=0;temp_y2<=1; end
            3'b010: begin temp_y1<=1;temp_y2<=1; end
            3'b011: begin temp_y1<=1;temp_y2<=2; end
            3'b100: begin temp_y1<=2;temp_y2<=2; end
            3'b101: begin temp_y1<=2;temp_y2<=3; end
            3'b110: begin temp_y1<=3;temp_y2<=3; end
            3'b111: begin temp_y1<=3;temp_y2<=4; end
        endcase
endcase


assign y_out1=(s[1]==1)?temp_y1:(s[0]==0)?temp_y1:temp_y2;
assign y_out2=(s[1]==1)?temp_y2:(s[0]==0)?temp_y2:temp_y1;

  

endmodule


//*====================================Module of table_level2=============================*/

module dem_fun2(clk,s3,rst,y_in,y_out1,y_out2);

parameter IN_WIDTH=3;

input clk,s3;
input rst;
input [IN_WIDTH-1:0] y_in;
output [IN_WIDTH-2:0] y_out1, y_out2;
wire [IN_WIDTH-2:0] y_out1, y_out2;

reg [1:0] I1;
reg [1:0] I2;
reg Q;
reg [1:0] s;
reg [IN_WIDTH-2:0] temp_y1,temp_y2;
wire Okr,SGN1,SGN2,MAG2;
wire Qb;
wire[IN_WIDTH-2:0] y_out1_tmp,y_out2_tmp;


always @(posedge clk or posedge rst)
begin
if(rst)
  I1<=0;
else if(s3==1)
begin
  case({y_in[0],Qb})
    2'b00: I1<=I1;
    2'b01: I1<=I1;
    2'b10: I1<=I1-1;
    2'b11: I1<=I1+1;
  endcase  
end
else
   I1<=I1; 
end

       
assign SGN1=(I1[1]==0)?1:0;

always @(posedge clk or posedge rst)
begin
if(rst)
  I2<=0;
else if(s3==1)  
begin
  case(I1)
    2'b00: I2<=I2;
    2'b10: I2<=I2;
    2'b01: begin if(I2==2'b01) I2<=2'b01; else I2<=I2+1; end
    2'b11: begin if(I2==2'b11) I2<=2'b11; else I2<=I2-1; end
   endcase 
end
else
  I2<=I2; 
end
      

assign MAG2=(I2[0]==0)?0:1;
assign SGN2=(I2[1]==0)?1:0;

always @(I1 or I2 or rst or SGN1 or SGN2)
begin
if(rst)
  Q<=0;
else  
begin
  case({I1[0],I2[0]})
     2'b10: Q<=SGN1; 
     2'b11: Q<=SGN1; 
     2'b01: Q<=SGN2; 
     2'b00: Q<=0;    
  endcase
end
end
      
 
assign Qb=~Q;

always @(y_in or Q or rst)
begin
if(rst)
  s<=0;
else  
begin
   case({y_in[0],Q})
     2'b00: s<=2'b00;
     2'b01: s<=2'b00;
     2'b11: s<=2'b01;
     2'b10: s<=2'b11;
   endcase
end
end
     
always @(y_in)
case(y_in[IN_WIDTH-1])
  1'b1: begin temp_y1<=2;temp_y2<=2; end
  1'b0: case(y_in[IN_WIDTH-2:0])
            2'b00: begin temp_y1<=0;temp_y2<=0; end
            2'b01: begin temp_y1<=0;temp_y2<=1; end
            2'b10: begin temp_y1<=1;temp_y2<=1; end
            2'b11: begin temp_y1<=1;temp_y2<=2; end
        endcase
endcase


assign y_out1=(s[1]==1)?temp_y1:(s[0]==0)?temp_y1:temp_y2;
assign y_out2=(s[1]==1)?temp_y2:(s[0]==0)?temp_y2:temp_y1;


    
endmodule   
         
         
//*====================================Module of table_level1=============================*/

module dem_fun1(clk,s3,rst,y_in,y_out1,y_out2);

parameter IN_WIDTH=2;

input clk,s3;
input rst;
input [IN_WIDTH-1:0] y_in;
output [IN_WIDTH-2:0] y_out1, y_out2;
wire [IN_WIDTH-2:0] y_out1, y_out2;

reg [1:0] I1;
reg [1:0] I2;
reg Q;
reg [1:0] s;
reg [IN_WIDTH-2:0] temp_y1,temp_y2;
wire Okr,SGN1,SGN2,MAG2;
wire Qb;
wire[IN_WIDTH-2:0] y_out1_tmp,y_out2_tmp;


always @(posedge clk or posedge rst)
begin
if(rst)
  I1<=0;
else if(s3==1)
begin
  case({y_in[0],Qb})
    2'b00: I1<=I1;
    2'b01: I1<=I1;
    2'b10: I1<=I1-1;
    2'b11: I1<=I1+1;
  endcase  
end
else
   I1<=I1; 
end

     
assign SGN1=(I1[1]==0)?1:0;

always @(posedge clk or posedge rst)
begin
if(rst)
  I2<=0;
else if(s3==1)  
begin
  case(I1)
    2'b00: I2<=I2;
    2'b10: I2<=I2;
    2'b01: begin if(I2==2'b01) I2<=2'b01; else I2<=I2+1; end
    2'b11: begin if(I2==2'b11) I2<=2'b11; else I2<=I2-1; end
   endcase 
end
else
  I2<=I2; 
end
      

assign MAG2=(I2[0]==0)?0:1;
assign SGN2=(I2[1]==0)?1:0;

always @(I1 or I2 or rst or SGN1 or SGN2)
begin
if(rst)
  Q<=0;
else  
begin
  case({I1[0],I2[0]})
     2'b10: Q<=SGN1; 
     2'b11: Q<=SGN1; 
     2'b01: Q<=SGN2; 
     2'b00: Q<=0;    
  endcase
end
end
      

assign Qb=~Q;

always @(y_in or Q or rst)
begin
if(rst)
  s<=0;
else  
begin
   case({y_in[0],Q})
     2'b00: s<=2'b00;
     2'b01: s<=2'b00;
     2'b11: s<=2'b01;
     2'b10: s<=2'b11;
   endcase
end
end
     

always @(y_in)
case(y_in[IN_WIDTH-1])
  1'b1: begin temp_y1<=1;temp_y2<=1; end
  1'b0: case(y_in[IN_WIDTH-2:0])
            1'b0: begin temp_y1<=0;temp_y2<=0; end
            1'b1: begin temp_y1<=0;temp_y2<=1; end
        endcase
endcase


assign y_out1=(s[1]==1)?temp_y1:(s[0]==0)?temp_y1:temp_y2;
assign y_out2=(s[1]==1)?temp_y2:(s[0]==0)?temp_y2:temp_y1;

    
endmodule
//*====================================Module of error_assert=========================*/

/*module dem_error_assert(clk,rst,error_clear,data_in,dem_out,assert);

input       clk,rst,error_clear;
input[4:0]  data_in;
input[15:0] dem_out;
output      assert;

reg         assert;
reg[4:0]    data_in_tmp1,data_in_tmp2,data_in_tmp3,data_in_tmp4;
wire        assertwire,assert_rst;
wire[2:0]   sum2b1,sum2b2,sum2b3,sum2b4;
wire[3:0]   sum3b1,sum3b2;
wire[4:0]   sum;


assign sum=sum3b1+sum3b2;
assign sum3b1=sum2b1+sum2b2;
assign sum3b2=sum2b3+sum2b4;
assign sum2b1=dem_out[0]+dem_out[1]+dem_out[2]+dem_out[3];
assign sum2b2=dem_out[4]+dem_out[5]+dem_out[6]+dem_out[7];
assign sum2b3=dem_out[8]+dem_out[9]+dem_out[10]+dem_out[11];
assign sum2b4=dem_out[12]+dem_out[13]+dem_out[14]+dem_out[15];

assign assertwire=(sum==data_in)?0:1;

assign assert_rst=rst|error_clear;

always @(posedge clk or posedge assert_rst)
if(assert_rst)
  assert<=0;
else 
  assert<=assertwire|assert;
  
endmodule*/   //fenghui modified, 11/03/04

//*===================================Module of Repeat8Fs=============================*/

/*module dem_repeat8Fs(mclk_count_4b,rp8_out);

input[3:0]  mclk_count_4b;
output[4:0] rp8_out;

reg[4:0]    rp8_out;

always @(mclk_count_4b)
  case(mclk_count_4b)
    4'b0000:  rp8_out<=0;
    4'b0001:  rp8_out<=1;
    4'b0010:  rp8_out<=2;
    4'b0011:  rp8_out<=3;
    4'b0100:  rp8_out<=4;
    4'b0101:  rp8_out<=5;
    4'b0110:  rp8_out<=6;
    4'b0111:  rp8_out<=7;
    4'b1000:  rp8_out<=9;
    4'b1001:  rp8_out<=10;
    4'b1010:  rp8_out<=11;
    4'b1011:  rp8_out<=12;
    4'b1100:  rp8_out<=13;
    4'b1101:  rp8_out<=14;
    4'b1110:  rp8_out<=15;
    4'b1111:  rp8_out<=16;
  endcase

endmodule*/  //fenghui modified, 11/03/04




//*=====================================Module of TMC=================================*/

/*module dem_tmc(tmc_in,tmc_out);

input[4:0]   tmc_in;
output[15:0] tmc_out;

reg[15:0]    tmc_out;

always @(tmc_in)
  if(tmc_in[4])
    tmc_out<=16'b1111_1111_1111_1111;
  else
    case(tmc_in[3:0])
      4'b0000:  tmc_out<=16'b0000_0000_0000_0000;
      4'b0001:  tmc_out<=16'b0000_0000_0000_0001;
      4'b0010:  tmc_out<=16'b0000_0000_0000_0011;
      4'b0011:  tmc_out<=16'b0000_0000_0000_0111;
      4'b0100:  tmc_out<=16'b0000_0000_0000_1111;
      4'b0101:  tmc_out<=16'b0000_0000_0001_1111;
      4'b0110:  tmc_out<=16'b0000_0000_0011_1111;
      4'b0111:  tmc_out<=16'b0000_0000_0111_1111;
      4'b1000:  tmc_out<=16'b0000_0000_1111_1111;
      4'b1001:  tmc_out<=16'b0000_0001_1111_1111;
      4'b1010:  tmc_out<=16'b0000_0011_1111_1111;
      4'b1011:  tmc_out<=16'b0000_0111_1111_1111;
      4'b1100:  tmc_out<=16'b0000_1111_1111_1111;
      4'b1101:  tmc_out<=16'b0001_1111_1111_1111;
      4'b1110:  tmc_out<=16'b0011_1111_1111_1111;
      4'b1111:  tmc_out<=16'b0111_1111_1111_1111;
    endcase

endmodule*/ //fenghui modified, 11/03/04
    



//*=====================================Module of Test Modes Selection===============*/

/*module dem_test_mode_sel(clk,rst,mclk_count_4b,dem_bp,dem_tm,dsm_out,dem_out,mode_out);

input        clk,rst,dem_bp;
input [3:0]  mclk_count_4b;
input[4:0]   dem_tm,dsm_out;
input[15:0]  dem_out;
output[15:0] mode_out;

reg[15:0]    mode_out;
reg[4:0]     tmc_in;
wire[15:0]   tmc_out;
wire[4:0]    rp8_out;
wire[15:0]   dem_bp_y;
wire[15:0]   s3_y;


dem_tmc       t (.tmc_in(tmc_in),.tmc_out(tmc_out));

dem_repeat8Fs r (.mclk_count_4b(mclk_count_4b),.rp8_out(rp8_out));

always @(dem_tm or dsm_out or rp8_out)
  if(dem_tm[4])
    if(dem_tm[1])
      tmc_in<=16;
    else
      case(dem_tm[0])
        1'b0:  tmc_in<=14;
        1'b1:  tmc_in<=15;
      endcase
  else
    case(dem_tm[3:0])
      4'b0000:  tmc_in<=dsm_out;
      4'b0001:  tmc_in<=rp8_out;
      4'b0010:  tmc_in<=0;
      4'b0011:  tmc_in<=1;
      4'b0100:  tmc_in<=2;
      4'b0101:  tmc_in<=3;
      4'b0110:  tmc_in<=4;
      4'b0111:  tmc_in<=5;
      4'b1000:  tmc_in<=6;
      4'b1001:  tmc_in<=7;
      4'b1010:  tmc_in<=8;
      4'b1011:  tmc_in<=9;
      4'b1100:  tmc_in<=10;
      4'b1101:  tmc_in<=11;
      4'b1110:  tmc_in<=12;
      4'b1111:  tmc_in<=13;
    endcase

assign dem_bp_y=(dem_bp)?tmc_out:dem_out;

//assign s3_y=(s3)?dem_bp_y:mode_out;

always @(dem_bp_y or rst)
  if(rst)
    mode_out<=16'b1111_1111_0000_0000;  //fenghui modified, 26/07/04
  else 
    mode_out<=dem_bp_y;
    

endmodule*/    //fenghui modified, 11/03/04


