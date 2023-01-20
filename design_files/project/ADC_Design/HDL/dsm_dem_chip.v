//  This file is only used in the place-and-route flow with PAD!

module dsm_dem_pad(mclk512, reset, exchangeLR, dsm_chan1, dsm_chan2, dsm_clr, dsm_ovfl, dsmditheroff, dem_count, dem_out_l, dem_out_r, mclk512_o, reset_o, exchangeLR_o, dsm_chan1_o, dsm_chan2_o, dsm_clr_o, dsm_ovfl_i, dsmditheroff_o, dem_count_o, dem_out_l_i,dem_out_r_i);
  input [23:0] dsm_chan1,dsm_chan2;
  input mclk512,reset,exchangeLR,dsm_clr,dsmditheroff;  
  input [1:0] dem_count;
  output dsm_ovfl;
  output [15:0] dem_out_l,dem_out_r;   

  output [23:0] dsm_chan1_o,dsm_chan2_o;
  output mclk512_o,reset_o,exchangeLR_o,dsm_clr_o,dsmditheroff_o;  
  output [1:0] dem_count_o;
  input dsm_ovfl_i;
  input [15:0] dem_out_l_i,dem_out_r_i;

  PADDI dsm_chan10_pad(.PAD (dsm_chan1[0]), .Y (dsm_chan1_o[0]));
  PADDI dsm_chan11_pad(.PAD (dsm_chan1[1]), .Y (dsm_chan1_o[1]));
  PADDI dsm_chan12_pad(.PAD (dsm_chan1[2]), .Y (dsm_chan1_o[2]));
  PADDI dsm_chan13_pad(.PAD (dsm_chan1[3]), .Y (dsm_chan1_o[3]));
  PADDI dsm_chan14_pad(.PAD (dsm_chan1[4]), .Y (dsm_chan1_o[4]));
  PADDI dsm_chan15_pad(.PAD (dsm_chan1[5]), .Y (dsm_chan1_o[5]));
  PADDI dsm_chan16_pad(.PAD (dsm_chan1[6]), .Y (dsm_chan1_o[6]));
  PADDI dsm_chan17_pad(.PAD (dsm_chan1[7]), .Y (dsm_chan1_o[7]));
  PADDI dsm_chan18_pad(.PAD (dsm_chan1[8]), .Y (dsm_chan1_o[8]));
  PADDI dsm_chan19_pad(.PAD (dsm_chan1[9]), .Y (dsm_chan1_o[9]));
  PADDI dsm_chan110_pad(.PAD (dsm_chan1[10]), .Y (dsm_chan1_o[10]));
  PADDI dsm_chan111_pad(.PAD (dsm_chan1[11]), .Y (dsm_chan1_o[11]));
  PADDI dsm_chan112_pad(.PAD (dsm_chan1[12]), .Y (dsm_chan1_o[12]));
  PADDI dsm_chan113_pad(.PAD (dsm_chan1[13]), .Y (dsm_chan1_o[13]));
  PADDI dsm_chan114_pad(.PAD (dsm_chan1[14]), .Y (dsm_chan1_o[14]));
  PADDI dsm_chan115_pad(.PAD (dsm_chan1[15]), .Y (dsm_chan1_o[15]));
  PADDI dsm_chan116_pad(.PAD (dsm_chan1[16]), .Y (dsm_chan1_o[16]));
  PADDI dsm_chan117_pad(.PAD (dsm_chan1[17]), .Y (dsm_chan1_o[17]));
  PADDI dsm_chan118_pad(.PAD (dsm_chan1[18]), .Y (dsm_chan1_o[18]));
  PADDI dsm_chan119_pad(.PAD (dsm_chan1[19]), .Y (dsm_chan1_o[19]));
  PADDI dsm_chan120_pad(.PAD (dsm_chan1[20]), .Y (dsm_chan1_o[20]));
  PADDI dsm_chan121_pad(.PAD (dsm_chan1[21]), .Y (dsm_chan1_o[21]));
  PADDI dsm_chan122_pad(.PAD (dsm_chan1[22]), .Y (dsm_chan1_o[22]));
  PADDI dsm_chan123_pad(.PAD (dsm_chan1[23]), .Y (dsm_chan1_o[23]));

  PADDI dsm_chan20_pad(.PAD (dsm_chan2[0]), .Y (dsm_chan2_o[0]));
  PADDI dsm_chan21_pad(.PAD (dsm_chan2[1]), .Y (dsm_chan2_o[1]));
  PADDI dsm_chan22_pad(.PAD (dsm_chan2[2]), .Y (dsm_chan2_o[2]));
  PADDI dsm_chan23_pad(.PAD (dsm_chan2[3]), .Y (dsm_chan2_o[3]));
  PADDI dsm_chan24_pad(.PAD (dsm_chan2[4]), .Y (dsm_chan2_o[4]));
  PADDI dsm_chan25_pad(.PAD (dsm_chan2[5]), .Y (dsm_chan2_o[5]));
  PADDI dsm_chan26_pad(.PAD (dsm_chan2[6]), .Y (dsm_chan2_o[6]));
  PADDI dsm_chan27_pad(.PAD (dsm_chan2[7]), .Y (dsm_chan2_o[7]));
  PADDI dsm_chan28_pad(.PAD (dsm_chan2[8]), .Y (dsm_chan2_o[8]));
  PADDI dsm_chan29_pad(.PAD (dsm_chan2[9]), .Y (dsm_chan2_o[9]));
  PADDI dsm_chan210_pad(.PAD (dsm_chan2[10]), .Y (dsm_chan2_o[10]));
  PADDI dsm_chan211_pad(.PAD (dsm_chan2[11]), .Y (dsm_chan2_o[11]));
  PADDI dsm_chan212_pad(.PAD (dsm_chan2[12]), .Y (dsm_chan2_o[12]));
  PADDI dsm_chan213_pad(.PAD (dsm_chan2[13]), .Y (dsm_chan2_o[13]));
  PADDI dsm_chan214_pad(.PAD (dsm_chan2[14]), .Y (dsm_chan2_o[14]));
  PADDI dsm_chan215_pad(.PAD (dsm_chan2[15]), .Y (dsm_chan2_o[15]));
  PADDI dsm_chan216_pad(.PAD (dsm_chan2[16]), .Y (dsm_chan2_o[16]));
  PADDI dsm_chan217_pad(.PAD (dsm_chan2[17]), .Y (dsm_chan2_o[17]));
  PADDI dsm_chan218_pad(.PAD (dsm_chan2[18]), .Y (dsm_chan2_o[18]));
  PADDI dsm_chan219_pad(.PAD (dsm_chan2[19]), .Y (dsm_chan2_o[19]));
  PADDI dsm_chan220_pad(.PAD (dsm_chan2[20]), .Y (dsm_chan2_o[20]));
  PADDI dsm_chan221_pad(.PAD (dsm_chan2[21]), .Y (dsm_chan2_o[21]));
  PADDI dsm_chan222_pad(.PAD (dsm_chan2[22]), .Y (dsm_chan2_o[22]));
  PADDI dsm_chan223_pad(.PAD (dsm_chan2[23]), .Y (dsm_chan2_o[23]));
  

  PADDI mclk512_pad(.PAD (mclk512), .Y (mclk512_o));
  PADDI reset_pad(.PAD (reset), .Y (reset_o));
  PADDI exchangeLR_pad(.PAD (exchangeLR), .Y (exchangeLR_o));
  PADDI dsm_clr_pad(.PAD (dsm_clr), .Y (dsm_clr_o));
  PADDI dsmditheroff_pad(.PAD (dsmditheroff), .Y (dsmditheroff_o));
  PADDI dem_count0_pad(.PAD (dem_count[0]), .Y (dem_count_o[0]));
  PADDI dem_count1_pad(.PAD (dem_count[1]), .Y (dem_count_o[1]));


  PADDO dsm_ovfl_pad(.A (dsm_ovfl_i), .PAD (dsm_ovfl));

  PADDO dem_out_l0_pad(.A (dem_out_l_i[0]), .PAD (dem_out_l[0]));
  PADDO dem_out_l1_pad(.A (dem_out_l_i[1]), .PAD (dem_out_l[1]));
  PADDO dem_out_l2_pad(.A (dem_out_l_i[2]), .PAD (dem_out_l[2]));
  PADDO dem_out_l3_pad(.A (dem_out_l_i[3]), .PAD (dem_out_l[3]));
  PADDO dem_out_l4_pad(.A (dem_out_l_i[4]), .PAD (dem_out_l[4]));
  PADDO dem_out_l5_pad(.A (dem_out_l_i[5]), .PAD (dem_out_l[5]));
  PADDO dem_out_l6_pad(.A (dem_out_l_i[6]), .PAD (dem_out_l[6]));
  PADDO dem_out_l7_pad(.A (dem_out_l_i[7]), .PAD (dem_out_l[7]));
  PADDO dem_out_l8_pad(.A (dem_out_l_i[8]), .PAD (dem_out_l[8]));
  PADDO dem_out_l9_pad(.A (dem_out_l_i[9]), .PAD (dem_out_l[9]));
  PADDO dem_out_l10_pad(.A (dem_out_l_i[10]), .PAD (dem_out_l[10]));
  PADDO dem_out_l11_pad(.A (dem_out_l_i[11]), .PAD (dem_out_l[11]));
  PADDO dem_out_l12_pad(.A (dem_out_l_i[12]), .PAD (dem_out_l[12]));
  PADDO dem_out_l13_pad(.A (dem_out_l_i[13]), .PAD (dem_out_l[13]));
  PADDO dem_out_l14_pad(.A (dem_out_l_i[14]), .PAD (dem_out_l[14]));
  PADDO dem_out_l15_pad(.A (dem_out_l_i[15]), .PAD (dem_out_l[15]));

  PADDO dem_out_r0_pad(.A (dem_out_r_i[0]), .PAD (dem_out_r[0]));
  PADDO dem_out_r1_pad(.A (dem_out_r_i[1]), .PAD (dem_out_r[1]));
  PADDO dem_out_r2_pad(.A (dem_out_r_i[2]), .PAD (dem_out_r[2]));
  PADDO dem_out_r3_pad(.A (dem_out_r_i[3]), .PAD (dem_out_r[3]));
  PADDO dem_out_r4_pad(.A (dem_out_r_i[4]), .PAD (dem_out_r[4]));
  PADDO dem_out_r5_pad(.A (dem_out_r_i[5]), .PAD (dem_out_r[5]));
  PADDO dem_out_r6_pad(.A (dem_out_r_i[6]), .PAD (dem_out_r[6]));
  PADDO dem_out_r7_pad(.A (dem_out_r_i[7]), .PAD (dem_out_r[7]));
  PADDO dem_out_r8_pad(.A (dem_out_r_i[8]), .PAD (dem_out_r[8]));
  PADDO dem_out_r9_pad(.A (dem_out_r_i[9]), .PAD (dem_out_r[9]));
  PADDO dem_out_r10_pad(.A (dem_out_r_i[10]), .PAD (dem_out_r[10]));
  PADDO dem_out_r11_pad(.A (dem_out_r_i[11]), .PAD (dem_out_r[11]));
  PADDO dem_out_r12_pad(.A (dem_out_r_i[12]), .PAD (dem_out_r[12]));
  PADDO dem_out_r13_pad(.A (dem_out_r_i[13]), .PAD (dem_out_r[13]));
  PADDO dem_out_r14_pad(.A (dem_out_r_i[14]), .PAD (dem_out_r[14]));
  PADDO dem_out_r15_pad(.A (dem_out_r_i[15]), .PAD (dem_out_r[15]));

  PADVDD vdd_pad0();
  PADVSS vss_pad0();
  PADVDDIOR vddior_pad0();
  PADVSSIOR vssior_pad0();

  PADVDD vdd_pad1();
  PADVSS vss_pad1();
  PADVDDIOR vddior_pad1();
  PADVSSIOR vssior_pad1();

  padIORINGCORNER llcorner_pad();
  padIORINGCORNER lrcorner_pad();
  padIORINGCORNER ulcorner_pad();
  padIORINGCORNER urcorner_pad();

endmodule

module dsm_dem_chip(mclk512, reset, exchangeLR, dsm_chan1, dsm_chan2, dsm_clr, dsm_ovfl, dsmditheroff, dem_count, dem_out_l, dem_out_r);
  input [23:0] dsm_chan1,dsm_chan2;
  input mclk512,reset,exchangeLR,dsm_clr,dsmditheroff;  
  input [1:0] dem_count;
  output dsm_ovfl;
  output [15:0] dem_out_l,dem_out_r;   

  wire [23:0] dsm_chan1,dsm_chan2;
  wire mclk512,reset,exchangeLR,dsm_clr,dsmditheroff;  
  wire [1:0] dem_count;
  wire dsm_ovfl;
  wire [15:0] dem_out_l,dem_out_r;   

  wire [23:0] dsm_chan1_o,dsm_chan2_o;
  wire mclk512_o,reset_o,exchangeLR_o,dsm_clr_o,dsmditheroff_o;  
  wire [1:0] dem_count_o;
  wire dsm_ovfl_i;
  wire [15:0] dem_out_l_i,dem_out_r_i;
  
  dsm_dem_pad dsm_dem_pad0(mclk512, reset, exchangeLR, dsm_chan1, dsm_chan2, dsm_clr, dsm_ovfl, dsmditheroff, dem_count, dem_out_l, dem_out_r, mclk512_o, reset_o, exchangeLR_o, dsm_chan1_o, dsm_chan2_o, dsm_clr_o, dsm_ovfl_i, dsmditheroff_o, dem_count_o, dem_out_l_i,dem_out_r_i);
  dsm_dem_top dsm_dem0(mclk512, reset, exchangeLR, dsm_chan1, dsm_chan2, dsm_clr, dsm_ovfl, dsmditheroff, dem_count, dem_out_l, dem_out_r);

endmodule

