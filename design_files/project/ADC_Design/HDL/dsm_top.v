//============================================================================= 
//     Company   :AIC Microsystems Co.,Ltd.
//     Author    :Kevin Dai 
//     Abstract  :This file produces a top-level DSM.
//                
//     Modification  History:
//     Date           By   
//     03/06/2003     Kevin
//     03/07/2003     Kevin      Make adaption for synthesis
//     04/25/2003     Kevin
//=============================================================================


//===============================The Top Level of DSM==============================

module dsm_top(mclk,rst,s1,dsmditheroff,chan1_in,chan2_in,chan_sel,int_sel,sticky_clr,
               dt_sign,quan_out,dsm_reg,ovfl_reg);

parameter DATAPATH = 28;

input  [DATAPATH-5:0] chan1_in;
input  [DATAPATH-5:0] chan2_in;
input                 chan_sel,int_sel,mclk,rst,sticky_clr,s1,dsmditheroff;
output                dt_sign,ovfl_reg;
output [4:0]          quan_out,dsm_reg;

wire [DATAPATH-1:0] int2_fb;
wire [DATAPATH-1:0] int3_fb;
wire [DATAPATH-1:0] mux_adder_fb;
wire [DATAPATH-1:0] int3_out;
wire [DATAPATH-1:0] int2_out;
wire [DATAPATH-1:0] int1_out;

wire [DATAPATH-1:0] quan_in;
wire [DATAPATH-1:0] chan_in;
wire                overflow1,overflow2,overflow3,ovclr,flag_rst;
wire [4:0]          quan_fb;
reg                 ovfl_reg;

//4-bit right shift
assign chan_in=chan_sel?{{4{chan2_in[23]}},chan2_in[23:0]}:
                        {{4{chan1_in[23]}},chan1_in[23:0]};
//assign chan_in=chan_sel?{chan2_in[3:0],chan2_in[(DATAPATH-1):(DATAPATH-24)]}:
                       // {chan1_in[3:0],chan1_in[(DATAPATH-1):(DATAPATH-24)]};

/*always@(posedge mclk or posedge rst)
  if(rst)
    chan_sel<=1;
  else
    chan_sel<=~chan_sel;//Selection signal for channel1 and channel2
*/
    
assign ovclr=overflow1|overflow2|overflow3;

assign flag_rst=sticky_clr|rst;

always@(posedge mclk or posedge flag_rst)
  if (flag_rst)
    ovfl_reg<=0;
  else
    ovfl_reg<=ovclr|ovfl_reg;
    

dsm_integrator I1(.int_fb  (quan_in), 
                  .int_in  (chan_in), 
                  .int_sel (int_sel), 
                  .mclk    (mclk), 
                  .rst     (rst), 
                  .ovclr   (ovclr),
                  .fb_sign (~int_sel),//To realize the substraction of 12-bit shifted
                                  //output of the integrator2
                  .int_out (int1_out),
                  .overflow(overflow1)); 

dsm_integrator I2(.int_fb   (int2_fb), 
                  .int_in   (int1_out), 
                  .int_sel  (int_sel), 
                  .mclk     (mclk), 
                  .rst      (rst),
                  .ovclr    (ovclr),
                  .fb_sign  (minus_b),
                  .int_out  (int2_out),
                  .overflow (overflow2));  
              

dsm_integrator I3(.int_fb   (int3_fb), 
              		  .int_in   (int2_out), 
                  .int_sel  (int_sel), 
                  .mclk     (mclk), 
                  .rst      (rst), 
                  .ovclr    (ovclr),
                  .fb_sign  (minus_a),
                  .int_out  (int3_out),
                  .overflow (overflow3)); 

dsm_mux_adder I4(.mclk         (mclk),
                 .rst          (rst),
                 .dt_sign      (dt_sign), 
                 .int2_out     (int2_out), 
                 .mux_adder_fb (mux_adder_fb),
                 .minus_c      (minus_c),
                 .int3_out     (int3_out), 
                 .int_sel      (int_sel), 
                 .quan_in      (quan_in),
                 .dsmditheroff (dsmditheroff)); 

dsm_quantizer I5(.mclk     (mclk), 
                 .rst      (rst), 
                 .quan_in  (quan_in), 
                 .quan_out (quan_out),
                 .quan_fb  (quan_fb),
                 .dsm_reg  (dsm_reg)); 

dsm_feedback I6(.mclk        (mclk), 
                .rst         (rst), 
                .quan_fb     (quan_fb), 
                .minus_a     (minus_a),
                .minus_b     (minus_b),
                .minus_c     (minus_c),
                .mux_adder_fb(mux_adder_fb), 
                .int2_fb     (int2_fb), 
                .int3_fb     (int3_fb)); 

 
dsm_dither I7  (.mclk   (mclk), 
                .rst    (rst), 
                .int_sel(int_sel),
                .s1     (s1),
                .dt_sign(dt_sign)); 

endmodule 


//============================The Module of Integrator=========================

module dsm_integrator(int_fb,int_in,int_sel,mclk,rst,fb_sign,ovclr,
                      int_out,overflow);

parameter DATAPATH = 28;

input  [DATAPATH-1:0] int_fb;
input  [DATAPATH-1:0] int_in;
input                 int_sel,mclk,rst,fb_sign,ovclr;
output [DATAPATH-1:0] int_out;
output                overflow;

reg  carry_in;
reg  overflow;
reg [DATAPATH-1:0] adder_in;
wire [DATAPATH-1:0] adder_out;
reg [DATAPATH-1:0] chan1_reg;
reg [DATAPATH-1:0] chan2_reg;
wire               carry_out;

assign int_out = chan1_reg;

always @ (int_sel or int_in or int_fb or fb_sign)
begin
  adder_in <=int_sel?int_in : int_fb;
  carry_in<=int_sel?0:fb_sign;
  
  //When int_sel is 0,feedback data is input to the adder. 
  //At this time, the carry bit should have the value of feedback data's
  // sign bit. 
end

//always @ (chan1_reg or adder_in or carry_in)
//  adder_out <= chan1_reg+adder_in+carry_in;
DW01_add #(DATAPATH) adder1 (.A(chan1_reg),.B(adder_in),.CI(carry_in),
                             .SUM(adder_out),.CO(carry_out));

always @ (adder_in or chan1_reg or adder_out)
  overflow <= (adder_in[(DATAPATH-1)]&chan1_reg[(DATAPATH-1)]&~adder_out[(DATAPATH-1)])
               |(~adder_in[(DATAPATH-1)]&~chan1_reg[(DATAPATH-1)]&adder_out[(DATAPATH-1)]);

always @ (posedge rst or posedge mclk)
  if (rst)
    begin
      chan1_reg <= 0;
      chan2_reg <= 0;
    end 
  else 
    begin
      chan1_reg <= chan2_reg;
      chan2_reg <= ovclr?0:adder_out;
    end
    
endmodule


//==================================The Module of mux_adder======================

module dsm_mux_adder(mclk,rst,dt_sign,int2_out,mux_adder_fb,minus_c,int3_out,
                    int_sel,quan_in,dsmditheroff);

parameter DATAPATH = 28,
          DT_POS=28'b000_00000_11001_10011_00110_01100,
          DT_NEG=28'b111_11111_00110_01100_11001_10011;

input                 mclk,rst,dt_sign,int_sel,minus_c,dsmditheroff;
input  [DATAPATH-1:0] int2_out;
input  [DATAPATH-1:0] mux_adder_fb;
input  [DATAPATH-1:0] int3_out;
output [DATAPATH-1:0] quan_in;

reg  carry_in;
reg  [DATAPATH-1:0] adder_in1;
reg  [DATAPATH-1:0] adder_in2;
wire  [DATAPATH-1:0] adder_out;
wire [DATAPATH-1:0] int2_12;
wire                carry_out;
wire [DATAPATH-1:0] ditherok;

assign ditherok =dt_sign?DT_NEG:DT_POS; 

assign quan_in = adder_out;

assign int2_12 = {{13{~int2_out[DATAPATH-1]}},~int2_out[DATAPATH-2],~int2_out[DATAPATH-3],
                        ~int2_out[DATAPATH-4],~int2_out[DATAPATH-5],~int2_out[DATAPATH-6],
                        ~int2_out[DATAPATH-7],~int2_out[DATAPATH-8],~int2_out[DATAPATH-9],
                        ~int2_out[DATAPATH-10],~int2_out[DATAPATH-11],~int2_out[DATAPATH-12],
                        ~int2_out[DATAPATH-13],~int2_out[DATAPATH-14],~int2_out[DATAPATH-15],
                        ~int2_out[DATAPATH-16]};

always @ (int_sel or dt_sign or int2_12 or int3_out or mux_adder_fb or minus_c or dsmditheroff or ditherok)
begin
  adder_in1<=int_sel?(dsmditheroff?28'b0:ditherok):int2_12;
  adder_in2<=int_sel? int3_out:mux_adder_fb;
  carry_in<=int_sel?(dsmditheroff?1'b0:dt_sign):minus_c;
end

  // NOTICE! 
// When int_sel is 0,two sign bits:the sign bit of the output of integrator2 multiplied
// by -2^12 and the sign bit of the feedback data -c should both be taken into consideration.
// But the adder have only one carry_in,so in this module only minus_c is calculated.
// The other sign bit(-2^12) is delt with in integrator1. The int_sel is used to achieved
//this goal.

//always @ (adder_in1 or adder_in2 or carry_in)
//   adder_out<=adder_in1+adder_in2+carry_in;

DW01_add #(DATAPATH) adder2 (.A(adder_in1),.B(adder_in2),.CI(carry_in),
                             .SUM(adder_out),.CO(carry_out));
                             
endmodule


//=================================The Module of quantizer=======================

module dsm_quantizer(mclk,rst,quan_in,quan_out,quan_fb,dsm_reg);

parameter DATAPATH = 28;

input                 mclk;
input                 rst;
input  [DATAPATH-1:0] quan_in;
output [4:0]          quan_out,quan_fb,dsm_reg;

reg [4:0] chan1_out;
reg [4:0] chan2_out;
reg [4:0] quan_out;

always@(quan_in)
// The method to judge if the adder's output is overflowed is to compare 
// the 2 guard bits and the original sign bit. If they are all 0 or 1,they 
// are NOT overflowed.
  if ((quan_in[DATAPATH-1]&quan_in[DATAPATH-2]&quan_in[DATAPATH-3])||
      ~(quan_in[DATAPATH-1]|quan_in[DATAPATH-2]|quan_in[DATAPATH-3]))
    if(quan_in[DATAPATH-3]==0)
      case(quan_in[(DATAPATH-4):(DATAPATH-7)])
        4'b0000:  quan_out<=5'b00001;
        4'b0001:  quan_out<=quan_in[(DATAPATH-3):(DATAPATH-7)];
        4'b0010:  quan_out<=quan_in[(DATAPATH-3):(DATAPATH-7)];
        4'b0011:  quan_out<=quan_in[(DATAPATH-3):(DATAPATH-7)];
        4'b0100:  quan_out<=quan_in[(DATAPATH-3):(DATAPATH-7)];
        4'b0101:  quan_out<=quan_in[(DATAPATH-3):(DATAPATH-7)];
        4'b0110:  quan_out<=quan_in[(DATAPATH-3):(DATAPATH-7)];
        4'b0111:  quan_out<=quan_in[(DATAPATH-3):(DATAPATH-7)];
        default:  quan_out<=5'b01000;//Including the maxim value "1" and other
                                      //bigger values
      endcase
    else
      case(quan_in[(DATAPATH-4):(DATAPATH-7)])
        4'b1111:  quan_out<=quan_in[(DATAPATH-3):(DATAPATH-7)];
        4'b1110:  quan_out<=quan_in[(DATAPATH-3):(DATAPATH-7)];
        4'b1101:  quan_out<=quan_in[(DATAPATH-3):(DATAPATH-7)];
        4'b1100:  quan_out<=quan_in[(DATAPATH-3):(DATAPATH-7)];
        4'b1011:  quan_out<=quan_in[(DATAPATH-3):(DATAPATH-7)];
        4'b1010:  quan_out<=quan_in[(DATAPATH-3):(DATAPATH-7)];
        4'b1001:  quan_out<=quan_in[(DATAPATH-3):(DATAPATH-7)];
        default:  quan_out<=5'b11000;//Including the minimum value "-1" and other
                                      //smaller values
      endcase
      
  else  // Situation of overflow.Results of addition are clipped.
    if(quan_in[DATAPATH-1]==0)
      quan_out<=5'b01000;
    else
      quan_out<=5'b11000;
    
assign  quan_fb=chan1_out;
assign  dsm_reg=chan2_out;
               
always @ (posedge rst or posedge mclk)
  if (rst) 
      begin
          chan1_out <= 0;
          chan2_out <= 0;
      end
  else
      begin
          chan1_out<=chan2_out;
          chan2_out<=quan_out;
      end
    
  
endmodule


//================================The Module of feedback==================

module dsm_feedback(mclk,rst,quan_fb,minus_a,minus_b,minus_c,
                    mux_adder_fb,int2_fb,int3_fb);

parameter DATAPATH     = 28,

          INT3_FB8_POS  = 32198832,
          INT3_FB8_NEG  = 236236624,
          INT3_FB7_POS  = 28173978,
          INT3_FB7_NEG  = 240261478,
          INT3_FB6_POS  = 24149124,
          INT3_FB6_NEG  = 244286332,
          INT3_FB5_POS  = 20124270,
          INT3_FB5_NEG  = 248311186,
          INT3_FB4_POS  = 16099416,
          INT3_FB4_NEG  = 252336040,
          INT3_FB3_POS  = 12074562,
          INT3_FB3_NEG  = 256360894,
          INT3_FB2_POS  = 8049708,
          INT3_FB2_NEG  = 260385748,
          INT3_FB1_POS  = 4024854,
          INT3_FB1_NEG  = 264410602,
          
                    
          INT2_FB8_POS = 13733829,
          INT2_FB8_NEG = 254701627,
          INT2_FB7_POS = 12017100,
          INT2_FB7_NEG = 256418356,
          INT2_FB6_POS = 10300371,
          INT2_FB6_NEG = 258135085,
          INT2_FB5_POS = 8583643,
          INT2_FB5_NEG = 259851813,
          INT2_FB4_POS = 6866914,
          INT2_FB4_NEG = 261568542,
          INT2_FB3_POS = 5150185,
          INT2_FB3_NEG = 263285271,
          INT2_FB2_POS = 3433457,
          INT2_FB2_NEG = 265001999,
          INT2_FB1_POS = 1716728,
          INT2_FB1_NEG = 266718728,
         
          MUX_FB8_POS = 2466250,
          MUX_FB8_NEG = 265969206,
          MUX_FB7_POS = 2157969,
          MUX_FB7_NEG = 266277487,
          MUX_FB6_POS = 1849688,
          MUX_FB6_NEG = 266585768,
          MUX_FB5_POS = 1541406,
          MUX_FB5_NEG = 266894050,
          MUX_FB4_POS = 1233125,
          MUX_FB4_NEG = 267202331,
          MUX_FB3_POS = 924844,
          MUX_FB3_NEG = 267510612,
          MUX_FB2_POS = 616562,
          MUX_FB2_NEG = 267818894,
          MUX_FB1_POS = 308281,
          MUX_FB1_NEG = 268127175;
          

input                 mclk;
input                 rst;
input  [4:0]          quan_fb;
output                minus_a,minus_b,minus_c;
output [DATAPATH-1:0] mux_adder_fb;
output [DATAPATH-1:0] int2_fb;
output [DATAPATH-1:0] int3_fb;

reg                minus_a,minus_b,minus_c;
reg [DATAPATH-1:0] mux_adder_fb;
reg [DATAPATH-1:0] int2_fb;
reg [DATAPATH-1:0] int3_fb;


always@(quan_fb)
  if(quan_fb[4]==0)
    begin
      minus_a<=0;// Actually this bit is the sign bit of "-a"
      minus_b<=0;
      minus_c<=0;
  //mux_adder_fb is c;int2_fb is b;int3_fb is a 
      case (quan_fb[2:0])
      3'b000:  begin mux_adder_fb<=MUX_FB8_NEG;int2_fb<=INT2_FB8_NEG;int3_fb<=INT3_FB8_NEG; end
      3'b001:  begin mux_adder_fb<=MUX_FB1_NEG;int2_fb<=INT2_FB1_NEG;int3_fb<=INT3_FB1_NEG; end
      3'b010:  begin mux_adder_fb<=MUX_FB2_NEG;int2_fb<=INT2_FB2_NEG;int3_fb<=INT3_FB2_NEG; end
      3'b011:  begin mux_adder_fb<=MUX_FB3_NEG;int2_fb<=INT2_FB3_NEG;int3_fb<=INT3_FB3_NEG; end
      3'b100:  begin mux_adder_fb<=MUX_FB4_NEG;int2_fb<=INT2_FB4_NEG;int3_fb<=INT3_FB4_NEG; end
      3'b101:  begin mux_adder_fb<=MUX_FB5_NEG;int2_fb<=INT2_FB5_NEG;int3_fb<=INT3_FB5_NEG; end
      3'b110:  begin mux_adder_fb<=MUX_FB6_NEG;int2_fb<=INT2_FB6_NEG;int3_fb<=INT3_FB6_NEG; end
      3'b111:  begin mux_adder_fb<=MUX_FB7_NEG;int2_fb<=INT2_FB7_NEG;int3_fb<=INT3_FB7_NEG; end
      endcase
    end
  else
    begin
      minus_a<=0;
      minus_b<=0;
      minus_c<=0;
  //mux_adder_fb is c;int2_fb is b;int3_fb is a 
      case (quan_fb[2:0])
      3'b000:  begin mux_adder_fb<=MUX_FB8_POS;int2_fb<=INT2_FB8_POS;int3_fb<=INT3_FB8_POS; end
      3'b001:  begin mux_adder_fb<=MUX_FB7_POS;int2_fb<=INT2_FB7_POS;int3_fb<=INT3_FB7_POS; end
      3'b010:  begin mux_adder_fb<=MUX_FB6_POS;int2_fb<=INT2_FB6_POS;int3_fb<=INT3_FB6_POS; end
      3'b011:  begin mux_adder_fb<=MUX_FB5_POS;int2_fb<=INT2_FB5_POS;int3_fb<=INT3_FB5_POS; end
      3'b100:  begin mux_adder_fb<=MUX_FB4_POS;int2_fb<=INT2_FB4_POS;int3_fb<=INT3_FB4_POS; end
      3'b101:  begin mux_adder_fb<=MUX_FB3_POS;int2_fb<=INT2_FB3_POS;int3_fb<=INT3_FB3_POS; end
      3'b110:  begin mux_adder_fb<=MUX_FB2_POS;int2_fb<=INT2_FB2_POS;int3_fb<=INT3_FB2_POS; end
      3'b111:  begin mux_adder_fb<=MUX_FB1_POS;int2_fb<=INT2_FB1_POS;int3_fb<=INT3_FB1_POS; end
      endcase
    end
      
endmodule


//============================The Module of dither============================


module dsm_dither(mclk,rst,int_sel,s1,dt_sign);

parameter DATAPATH = 28;
          
input                 mclk,s1;
input                 rst;
input                 int_sel;
output                dt_sign;

reg  [27:0] dither_reg;
wire [26:0] dither_rest;
wire        msb;

assign dt_sign =~dither_reg[0];//Corresponding to the LSB's value:0 and 1,
                               //matlab outputs are -1 and +1. So the verilog
                               //outputs should be 1 and 0. 
assign dither_rest = dither_reg[27:1];
assign msb = dither_reg[0] ^ dither_reg[3];

always @ (posedge rst or posedge mclk)
  if (rst)
  begin
    dither_reg[27:1] <= 27'b0;
    dither_reg[0] <= 1'b1;
  end
  else 
  begin
 // dt_cycle and int_sel are used together to guarantee the new value of 
// dither signal is output every 4 clocks. 

    dither_reg[26:0]<=(s1)?dither_rest:dither_reg[26:0];
    dither_reg[27] <=(s1)?msb:dither_reg[27];
  end

endmodule
