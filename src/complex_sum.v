`timescale 1ns / 1ps
module complex_sum(
    input   wire    signed  [ 15 :  0 ] Re_1,
    input   wire    signed  [ 15 :  0 ] Im_1,
    input   wire    signed  [ 15 :  0 ] Re_2,
    input   wire    signed  [ 15 :  0 ] Im_2,
    output  wire    signed  [ 15 :  0 ] Re_out,
    output  wire    signed  [ 15 :  0 ] Im_out
    );

wire    signed  [ 16 :  0 ] w_Re = Re_1 + Re_2;
wire    signed  [ 16 :  0 ] w_Im = Im_1 + Im_2;

//assign Re_out = w_Re[16] ? w_Re[16-:16] + 1'b1 : w_Re[16-:16];
assign Re_out = w_Re[16-:16];
//assign Im_out = w_Im[16] ? w_Im[16-:16] + 1'b1 : w_Im[16-:16];
assign Im_out = w_Im[16-:16];


endmodule
