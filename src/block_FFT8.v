`timescale 1ns / 1ps
module block_FFT8(
    input   wire    signed  [ 31 :  0 ] A0,
    input   wire    signed  [ 31 :  0 ] A1,
    input   wire    signed  [ 31 :  0 ] A2,
    input   wire    signed  [ 31 :  0 ] A3,
    
    input   wire    signed  [ 31 :  0 ] B0,
    input   wire    signed  [ 31 :  0 ] B1,
    input   wire    signed  [ 31 :  0 ] B2,
    input   wire    signed  [ 31 :  0 ] B3,
    
    output  wire    signed  [ 31 :  0 ] X0,
    output  wire    signed  [ 31 :  0 ] X1,
    output  wire    signed  [ 31 :  0 ] X2,
    output  wire    signed  [ 31 :  0 ] X3,
    output  wire    signed  [ 31 :  0 ] X4,
    output  wire    signed  [ 31 :  0 ] X5,
    output  wire    signed  [ 31 :  0 ] X6,
    output  wire    signed  [ 31 :  0 ] X7
    
    );

wire    signed  [ 11 :  0 ] W0RE = 12'd1024;
wire    signed  [ 11 :  0 ] W0IM = 12'd0;

wire    signed  [ 11 :  0 ] W1RE = 12'd724;
wire    signed  [ 11 :  0 ] W1IM = -12'd724;

wire    signed  [ 11 :  0 ] W2RE = 12'd0;
wire    signed  [ 11 :  0 ] W2IM = -12'd1024;

wire    signed  [ 11 :  0 ] W3RE = -12'd724;
wire    signed  [ 11 :  0 ] W3IM = -12'd724;

wire    signed  [ 15 :  0 ] A0RE = A0[31-:16];
wire    signed  [ 15 :  0 ] A1RE = A1[31-:16];
wire    signed  [ 15 :  0 ] A2RE = A2[31-:16];
wire    signed  [ 15 :  0 ] A3RE = A3[31-:16];

wire    signed  [ 15 :  0 ] A0IM = A0[15-:16];
wire    signed  [ 15 :  0 ] A1IM = A1[15-:16];
wire    signed  [ 15 :  0 ] A2IM = A2[15-:16];
wire    signed  [ 15 :  0 ] A3IM = A3[15-:16];

wire    signed  [ 15 :  0 ] B0RE = B0[31-:16];
wire    signed  [ 15 :  0 ] B1RE = B1[31-:16];
wire    signed  [ 15 :  0 ] B2RE = B2[31-:16];
wire    signed  [ 15 :  0 ] B3RE = B3[31-:16];

wire    signed  [ 15 :  0 ] B0IM = B0[15-:16];
wire    signed  [ 15 :  0 ] B1IM = B1[15-:16];
wire    signed  [ 15 :  0 ] B2IM = B2[15-:16];
wire    signed  [ 15 :  0 ] B3IM = B3[15-:16];

//COMPLEX MULT
wire    signed  [ 15 :  0 ] w_B0RE;
wire    signed  [ 15 :  0 ] w_B0IM;
complex_mult mult_u0(
    .Re_1(B0RE),
    .Im_1(B0IM),
    .Re_2(W0RE),
    .Im_2(W0IM),
    .Re_out(w_B0RE),
    .Im_out(w_B0IM)
    );

wire    signed  [ 15 :  0 ] w_B1RE;
wire    signed  [ 15 :  0 ] w_B1IM;
complex_mult mult_u1(
    .Re_1(B1RE),
    .Im_1(B1IM),
    .Re_2(W1RE),
    .Im_2(W1IM),
    .Re_out(w_B1RE),
    .Im_out(w_B1IM)
    );

wire    signed  [ 15 :  0 ] w_B2RE;
wire    signed  [ 15 :  0 ] w_B2IM;
complex_mult mult_u2(
    .Re_1(B2RE),
    .Im_1(B2IM),
    .Re_2(W2RE),
    .Im_2(W2IM),
    .Re_out(w_B2RE),
    .Im_out(w_B2IM)
    );

wire    signed  [ 15 :  0 ] w_B3RE;
wire    signed  [ 15 :  0 ] w_B3IM;
complex_mult mult_u3(
    .Re_1(B3RE),
    .Im_1(B3IM),
    .Re_2(W3RE),
    .Im_2(W3IM),
    .Re_out(w_B3RE),
    .Im_out(w_B3IM)
    );

wire    signed  [ 15 :  0 ] w_X0RE;
wire    signed  [ 15 :  0 ] w_X0IM;
wire    signed  [ 15 :  0 ] w_X4RE;
wire    signed  [ 15 :  0 ] w_X4IM;
assign X0 = {w_X0RE, w_X0IM};
assign X4 = {w_X4RE, w_X4IM};
complex_sum sum_u0(
    .Re_1(A0RE),
    .Im_1(A0IM),
    .Re_2(w_B0RE),
    .Im_2(w_B0IM),
    .Re_out(w_X0RE),
    .Im_out(w_X0IM)
    );
complex_sum sum_u4(
    .Re_1(A0RE),
    .Im_1(A0IM),
    .Re_2(-w_B0RE),
    .Im_2(-w_B0IM),
    .Re_out(w_X4RE),
    .Im_out(w_X4IM)
    );

wire    signed  [ 15 :  0 ] w_X1RE;
wire    signed  [ 15 :  0 ] w_X1IM;
wire    signed  [ 15 :  0 ] w_X5RE;
wire    signed  [ 15 :  0 ] w_X5IM;
assign X1 = {w_X1RE, w_X1IM};
assign X5 = {w_X5RE, w_X5IM};
complex_sum sum_u1(
    .Re_1(A1RE),
    .Im_1(A1IM),
    .Re_2(w_B1RE),
    .Im_2(w_B1IM),
    .Re_out(w_X1RE),
    .Im_out(w_X1IM)
    );
complex_sum sum_u5(
    .Re_1(A1RE),
    .Im_1(A1IM),
    .Re_2(-w_B1RE),
    .Im_2(-w_B1IM),
    .Re_out(w_X5RE),
    .Im_out(w_X5IM)
    );

wire    signed  [ 15 :  0 ] w_X2RE;
wire    signed  [ 15 :  0 ] w_X2IM;
wire    signed  [ 15 :  0 ] w_X6RE;
wire    signed  [ 15 :  0 ] w_X6IM;
assign X2 = {w_X2RE, w_X2IM};
assign X6 = {w_X6RE, w_X6IM};
complex_sum sum_u2(
    .Re_1(A2RE),
    .Im_1(A2IM),
    .Re_2(w_B2RE),
    .Im_2(w_B2IM),
    .Re_out(w_X2RE),
    .Im_out(w_X2IM)
    );
complex_sum sum_u6(
    .Re_1(A2RE),
    .Im_1(A2IM),
    .Re_2(-w_B2RE),
    .Im_2(-w_B2IM),
    .Re_out(w_X6RE),
    .Im_out(w_X6IM)
    );

wire    signed  [ 15 :  0 ] w_X3RE;
wire    signed  [ 15 :  0 ] w_X3IM;
wire    signed  [ 15 :  0 ] w_X7RE;
wire    signed  [ 15 :  0 ] w_X7IM;
assign X3 = {w_X3RE, w_X3IM};
assign X7 = {w_X7RE, w_X7IM};
complex_sum sum_u3(
    .Re_1(A3RE),
    .Im_1(A3IM),
    .Re_2(w_B3RE),
    .Im_2(w_B3IM),
    .Re_out(w_X3RE),
    .Im_out(w_X3IM)
    );
complex_sum sum_u7(
    .Re_1(A3RE),
    .Im_1(A3IM),
    .Re_2(-w_B3RE),
    .Im_2(-w_B3IM),
    .Re_out(w_X7RE),
    .Im_out(w_X7IM)
    );


endmodule
