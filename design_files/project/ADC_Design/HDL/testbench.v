`timescale 1ns/10ps

module test_dsm_dem;

`define DATA_L	1024*128
`define SIM_L	1024*128

parameter DATAPATH = 28;

reg                 mclk512,clock2,clock4,reset,dsm_int_sel,dsm_clr;

reg  [1:0]          dem_count;
wire                dsm_ovfl,dither;
wire [15:0]         dem_mode_sel_l,dem_mode_sel_r;
//wire[4:0]           dsm_out;
integer             i,nL,nR,left,right,dsmdem_dt;
integer		    dem_out_l,dem_out_r,dsmout;

reg[DATAPATH-1:0]   chan_left[`DATA_L-1:0],chan_right[`DATA_L-1:0];
//reg[DATAPATH-4:0]   chan_left[`DATA_L-1:0],chan_right[`DATA_L-1:0];
initial begin
	$dumpfile("test_dsm_dem.dump");
	$dumplimit(5000000);
	$dumpvars(0,test_dsm_dem);
end

initial
  fork
    $readmemh("H:/Grade3Term2/EDADesign/DATA/dsm_left_in0dB1k28b.data",chan_left);
    $readmemh("H:/Grade3Term2/EDADesign/DATA/dsm_right_in60dB1k28b.data",chan_right);
  //  chan_left[(`DATA_L-1):0]=chan_left_in[(`DATA_L-1):0][(DATAPATH-1):(DATAPATH-24)];
  //  chan_right[(`DATA_L-1):0]=chan_right_in[(`DATA_L-1):0][(DATAPATH-1):(DATAPATH-24)];
    left=$fopen("H:/Grade3Term2/EDADesign/DATA/dsm_left_out.data");
    right=$fopen("H:/Grade3Term2/EDADesign/DATA/dsm_right_out.data");
    dsmdem_dt=$fopen("H:/Grade3Term2/EDADesign/DATA/dither.data");
    dem_out_l=$fopen("H:/Grade3Term2/EDADesign/DATA/dem_out_l.data");
    dem_out_r=$fopen("H:/Grade3Term2/EDADesign/DATA/dem_out_r.data");
  //  dem_inL=$fopen("H:/Grade3Term2/EDADesign/DATA/dem_in_l.data");
  //  dem_inR=$fopen("DH:/Grade3Term2/EDADesign/ATA/dem_in_r.data");
    dsmout=$fopen("H:/Grade3Term2/EDADesign/DATA/dsmout.data");
    mclk512<=1;
    reset<=1;
    dsm_clr<=0;
 
    i<=0;
    
    nL<=0;
    nR<=0;
  #3reset<=0;
 join

dsm_dem_top   all(.mclk512     (mclk512),
                                .reset        (reset),
	                        .exchangeLR   (1'b0),	
               
                    .dsm_chan1    (chan_left[nL][(DATAPATH-1):(DATAPATH-24)]),
	               		.dsm_chan2    (chan_right[nR][(DATAPATH-1):(DATAPATH-24)]),
        	       		.dsm_clr      (dsm_clr),
               			.dsm_ovfl     (dsm_ovfl),
               		 //       .dsm_out	(dsm_out),
	               		.dsmditheroff (1'b0),
	
        	       		.dem_count    (dem_count),
	
        	     
        	       		.dem_out_l(dem_mode_sel_l),
              	 
              
              		.dem_out_r(dem_mode_sel_r));
              	//	.dem_inL_ex    (dem_inl),
              	//	.dem_inR_ex    (dem_inr));

always
 #20 mclk512<=~mclk512;

always @(posedge mclk512 or posedge reset)
  if(reset) clock2<=1;
  else clock2<=~clock2;
    
always@(posedge clock2 or posedge reset)
  if(reset) dsm_int_sel<=0;
  else dsm_int_sel<=~dsm_int_sel;

//lways @(posedge mclk512 )
//if((clock2==1)&&(dsm_int_sel==1))
//begin
 // nL<=nL+1;
 // $fdisplay(left,"%d",convert2signed(dsm_out,5));
//end

//always@(posedge mclk512)
//if((clock2==0)&&(dsm_int_sel==1))
//begin
 // nR<=nR+1;
//  $fdisplay(right,"%d",convert2signed(dsm_out,5));
//end

always@(posedge mclk512)
  if(dem_count[1:0]==2'b11) $fdisplay(dsmdem_dt,"%d",dither);
  
//always@(posedge mclk512)
 // if(dem_count[1:0]==2'b11) $fdisplay(dem_inL,"%d",dem_inl);  

//always@(posedge mclk512)
 // if(dem_count[1:0]==2'b11) $fdisplay(dsmout,"%d",dsm_out);
  
//always@(posedge mclk512)
  //if(dem_count[1:0]==2'b11) $fdisplay(dem_inR,"%d",dem_inr); 



always@(dem_count)
if(dem_count[1:0]==2'b01)
  begin
    $fdisplay(dem_out_l,"%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d",
	dem_mode_sel_l[0],dem_mode_sel_l[1],dem_mode_sel_l[2],dem_mode_sel_l[3],dem_mode_sel_l[4],dem_mode_sel_l[5],dem_mode_sel_l[6],dem_mode_sel_l[7],
	dem_mode_sel_l[8],dem_mode_sel_l[9],dem_mode_sel_l[10],dem_mode_sel_l[11],dem_mode_sel_l[12],dem_mode_sel_l[13],dem_mode_sel_l[14],dem_mode_sel_l[15]);
    $fdisplay(dem_out_r,"%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d",
	dem_mode_sel_r[0],dem_mode_sel_r[1],dem_mode_sel_r[2],dem_mode_sel_r[3],dem_mode_sel_r[4],dem_mode_sel_r[5],dem_mode_sel_r[6],dem_mode_sel_r[7],
	dem_mode_sel_r[8],dem_mode_sel_r[9],dem_mode_sel_r[10],dem_mode_sel_r[11],dem_mode_sel_r[12],dem_mode_sel_r[13],dem_mode_sel_r[14],dem_mode_sel_r[15]);

end

always@(posedge clock2 or posedge reset)
if(reset) clock4<=0;
else clock4<=~clock4;

always @(posedge clock4)
  i<=i+1;

always@(i)
if(i==`SIM_L) $finish;
  
always @(posedge mclk512 or posedge reset)
  if (reset) dem_count<=0;
  else dem_count<=dem_count+1;
  
function integer ipow;
    input j,k;
    integer j,k;

    integer l;
    begin
        ipow=1;
        for (l=0;l<k;l=l+1)  ipow=ipow*j;
    end
endfunction

function integer convert2signed;
    input i,bits;
    integer i,bits;

    if (i<ipow(2,bits-1))
        convert2signed=i;
    else
    convert2signed=i-ipow(2,bits);
endfunction

endmodule

