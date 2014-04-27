`timescale 1ns / 1ps
module complex_mult(
    input   wire    signed  [ 15 :  0 ] Re_1,
    input   wire    signed  [ 15 :  0 ] Im_1,
    input   wire    signed  [ 11 :  0 ] Re_2,
    input   wire    signed  [ 11 :  0 ] Im_2,
    output  wire    signed  [ 15 :  0 ] Re_out,
    output  wire    signed  [ 15 :  0 ] Im_out
    );

wire    signed  [ 27 :  0 ] w_Re = Re_1 * Re_2 - Im_1 * Im_2 + 16'sd512;
wire    signed  [ 27 :  0 ] w_Im = Re_1 * Im_2 + Re_2 * Im_1 + 16'sd512;

wire    signed  [ 27 :  0 ] w_Re1Im2 = Re_1 * Im_2;
wire    signed  [ 27 :  0 ] w_Re2Im1 = Re_2 * Im_1;

assign Re_out = w_Re[10+:16];
//assign Re_out = w_Re[27] ? w_Re[10+:16] + 1'b1 : w_Re[10+:16];
assign Im_out = w_Im[10+:16];
//assign Im_out = w_Im[27] ? w_Im[10+:16] + 1'b1 : w_Im[10+:16];

endmodule
