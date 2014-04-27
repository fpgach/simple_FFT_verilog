`timescale 1ns / 1ps
module FFT8(
    input   wire                clk,
    input   wire    [ 13 :  0 ] din,
    output  wire    [ 31 :  0 ] X0,
    output  wire    [ 31 :  0 ] X1,
    output  wire    [ 31 :  0 ] X2,
    output  wire    [ 31 :  0 ] X3,
    output  wire    [ 31 :  0 ] X4,
    output  wire    [ 31 :  0 ] X5,
    output  wire    [ 31 :  0 ] X6,
    output  wire    [ 31 :  0 ] X7
    );


reg     [ 13 :  0 ] r_data[0:7];
/*
initial begin
    r_data[0] = 1000;
    r_data[1] = 1000;
    r_data[2] = 1000;
    r_data[3] = 1000;
    r_data[4] = 1000;
    r_data[5] = 1000;
    r_data[6] = 1000;
    r_data[7] = 1000;

end
*/
/*
initial begin
    r_data[0] =  1000;
    r_data[1] =   707;
    r_data[2] =     0;
    r_data[3] =  -707;
    r_data[4] = -1000;
    r_data[5] =  -707;
    r_data[6] =     0;
    r_data[7] =   707;
end
*/

always@(posedge clk)
begin
    r_data[0] <=  din;
    r_data[1] <= r_data[0];
    r_data[2] <= r_data[1];
    r_data[3] <= r_data[2];
    r_data[4] <= r_data[3];
    r_data[5] <= r_data[4];
    r_data[6] <= r_data[5];
    r_data[7] <= r_data[6];
end


wire    signed  [ 31 :  0 ] A0;
wire    signed  [ 31 :  0 ] A1;
wire    signed  [ 31 :  0 ] A2;
wire    signed  [ 31 :  0 ] A3;
BF4_comb u0 (
    .re_0(r_data[0]), 
    .re_1(r_data[2]), 
    .re_2(r_data[4]), 
    .re_3(r_data[6]), 
    .reout_0(A0[31-:16]), 
    .reout_1(A1[31-:16]), 
    .reout_2(A2[31-:16]), 
    .reout_3(A3[31-:16]), 
    .imout_0(A0[15-:16]), 
    .imout_1(A1[15-:16]), 
    .imout_2(A2[15-:16]), 
    .imout_3(A3[15-:16])
    );

wire    signed  [ 31 :  0 ] B0;
wire    signed  [ 31 :  0 ] B1;
wire    signed  [ 31 :  0 ] B2;
wire    signed  [ 31 :  0 ] B3;
BF4_comb u1 (
    .re_0(r_data[1]), 
    .re_1(r_data[3]), 
    .re_2(r_data[5]), 
    .re_3(r_data[7]), 
    .reout_0(B0[31-:16]), 
    .reout_1(B1[31-:16]), 
    .reout_2(B2[31-:16]), 
    .reout_3(B3[31-:16]), 
    .imout_0(B0[15-:16]), 
    .imout_1(B1[15-:16]), 
    .imout_2(B2[15-:16]), 
    .imout_3(B3[15-:16])
    );


block_FFT8 u3 (
    .A0(A0), 
    .A1(A1), 
    .A2(A2), 
    .A3(A3), 
    .B0(B0), 
    .B1(B1), 
    .B2(B2), 
    .B3(B3), 
    .X0(X0), 
    .X1(X1), 
    .X2(X2), 
    .X3(X3), 
    .X4(X4), 
    .X5(X5), 
    .X6(X6), 
    .X7(X7)
    );
wire    signed  [ 15 :  0 ] w_re_abs0 = X0[31] ? -X0[31-:16] : X0[31-:16];
wire    signed  [ 15 :  0 ] w_im_abs0 = X0[15] ? -X0[15-:16] : X0[15-:16];
wire            [ 15 :  0 ] w_r_0;
length #16 absu0 (
    .x1(w_re_abs0), 
    .x2(w_im_abs0), 
    .y(w_r_0)
    );

    
wire    signed  [ 15 :  0 ] w_re_abs1 = X1[31] ? -X1[31-:16] : X1[31-:16];
wire    signed  [ 15 :  0 ] w_im_abs1 = X1[15] ? -X1[15-:16] : X1[15-:16];
wire            [ 15 :  0 ] w_r_1;
length #16 absu1 (
    .x1(w_re_abs1), 
    .x2(w_im_abs1), 
    .y(w_r_1)
    );

wire    signed  [ 15 :  0 ] w_re_abs2 = X2[31] ? -X2[31-:16] : X2[31-:16];
wire    signed  [ 15 :  0 ] w_im_abs2 = X2[15] ? -X2[15-:16] : X2[15-:16];
wire            [ 15 :  0 ] w_r_2;
length #16 absu2 (
    .x1(w_re_abs2), 
    .x2(w_im_abs2), 
    .y(w_r_2)
    );

wire    signed  [ 15 :  0 ] w_re_abs3 = X3[31] ? -X3[31-:16] : X3[31-:16];
wire    signed  [ 15 :  0 ] w_im_abs3 = X3[15] ? -X3[15-:16] : X3[15-:16];
wire            [ 15 :  0 ] w_r_3;
length #16 absu3 (
    .x1(w_re_abs3), 
    .x2(w_im_abs3), 
    .y(w_r_3)
    );

wire    signed  [ 15 :  0 ] w_re_abs4 = X4[31] ? -X4[31-:16] : X4[31-:16];
wire    signed  [ 15 :  0 ] w_im_abs4 = X4[15] ? -X4[15-:16] : X4[15-:16];
wire            [ 15 :  0 ] w_r_4;
length #16 absu4 (
    .x1(w_re_abs4), 
    .x2(w_im_abs4), 
    .y(w_r_4)
    );

wire    signed  [ 15 :  0 ] w_re_abs5 = X5[31] ? -X5[31-:16] : X5[31-:16];
wire    signed  [ 15 :  0 ] w_im_abs5 = X5[15] ? -X5[15-:16] : X5[15-:16];
wire            [ 15 :  0 ] w_r_5;
length #16 absu5 (
    .x1(w_re_abs5), 
    .x2(w_im_abs5), 
    .y(w_r_5)
    );

wire    signed  [ 15 :  0 ] w_re_abs6 = X6[31] ? -X6[31-:16] : X6[31-:16];
wire    signed  [ 15 :  0 ] w_im_abs6 = X6[15] ? -X6[15-:16] : X6[15-:16];
wire            [ 15 :  0 ] w_r_6;
length #16 absu6 (
    .x1(w_re_abs6), 
    .x2(w_im_abs6), 
    .y(w_r_6)
    );

wire    signed  [ 15 :  0 ] w_re_abs7 = X7[31] ? -X7[31-:16] : X7[31-:16];
wire    signed  [ 15 :  0 ] w_im_abs7 = X7[15] ? -X7[15-:16] : X7[15-:16];
wire            [ 15 :  0 ] w_r_7;
length #16 absu7 (
    .x1(w_re_abs7), 
    .x2(w_im_abs7), 
    .y(w_r_7)
    );
endmodule
