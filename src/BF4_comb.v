`timescale 1ns / 1ps
module BF4_comb(
    input   wire    signed  [ 13 :  0 ] re_0,
    input   wire    signed  [ 13 :  0 ] re_1,
    input   wire    signed  [ 13 :  0 ] re_2,
    input   wire    signed  [ 13 :  0 ] re_3,
    
    output  wire    signed  [ 15 :  0 ] reout_0,
    output  wire    signed  [ 15 :  0 ] reout_1,
    output  wire    signed  [ 15 :  0 ] reout_2,
    output  wire    signed  [ 15 :  0 ] reout_3,
    
    output  wire    signed  [ 15 :  0 ] imout_0,
    output  wire    signed  [ 15 :  0 ] imout_1,
    output  wire    signed  [ 15 :  0 ] imout_2,
    output  wire    signed  [ 15 :  0 ] imout_3
    
    );

    
wire    signed  [ 15 :  0 ] w_reout_0 = re_0 + re_2 + re_1 + re_3;

//assign reout_0 = w_reout_0 >>> 2;
assign reout_0 = w_reout_0[15]  ? (w_reout_0 + 8'sd2) >>> 2 
                                : w_reout_0 >>> 2;

assign imout_0 = 16'd0;




wire    signed  [ 15 :  0 ] w_reout_1 = re_0 - re_2;
wire    signed  [ 15 :  0 ] w_imout_1 = re_3 - re_1;

//assign reout_1 = w_reout_1 >>> 1;
assign reout_1 = w_reout_1[15] ? (w_reout_1 + 8'sd1) >>> 1 : w_reout_1 >>> 1;
//assign imout_1 = w_imout_1 >>> 1;
assign imout_1 = w_imout_1[15] ? (w_imout_1 + 8'sd1) >>> 1 : w_imout_1 >>> 1;



wire    signed  [ 15 :  0 ] w_reout_2 = re_0 + re_2 - re_1 - re_3;

//assign reout_2 = w_reout_2 >>> 2;
assign reout_2 = w_reout_2[15]  ? (w_reout_2 + 8'sd2) >>> 2 
                                : w_reout_2 >>> 2;

assign imout_2 = 16'd0;






wire    signed  [ 15 :  0 ] w_reout_3 = re_0 - re_2;
wire    signed  [ 15 :  0 ] w_imout_3 = re_1 - re_3;

//assign reout_3 = w_reout_3 >>> 1;
assign reout_3 = w_reout_3[15] ? (w_reout_3 + 8'sd1) >>> 1 : w_reout_3 >>> 1;

//assign imout_3 = w_imout_3 >>> 1;
assign imout_3 = w_imout_3[15] ? (w_imout_3 + 8'sd1) >>> 1 : w_imout_3 >>> 1;



endmodule
