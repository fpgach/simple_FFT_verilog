module FFT_tb4();

reg clk;
reg [13:0]din;
wire[15:0]X0;
wire[15:0]X1;
wire[15:0]X2;
wire[15:0]X3;
wire[15:0]X4;
wire[15:0]X5;
wire[15:0]X6;
wire[15:0]X7;

FFT8 uut(
    .clk(clk),
    .din(din),
    .X0(X0),
    .X1(X1),
    .X2(X2),
    .X3(X3),
    .X4(X4),
    .X5(X5),
    .X6(X6),
    .X7(X7)
    );
reg[2:0]cnt = 3'b0;

always@(posedge clk)
begin
    cnt <= cnt + 1'b1;
    case(cnt)
        3'd0:
            din <= 512;
        3'd1:
            din <= 362;
        3'd2:
            din <= 0;
        3'd3:
            din <= -362;
        3'd4:
            din <= -512;
        3'd5:
            din <= -362;
        3'd6:
            din <= 0;
        3'd7:
            din <= 362;
        
    endcase
end


initial begin
    clk = 0;
    din = 0;
    forever #5 clk = !clk;
end

endmodule

