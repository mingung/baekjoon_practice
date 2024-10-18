`timescale 1ns / 1ps

`define BIT_LEN     8   // 입력 데이터 비트
`define M_LEN       3   // 커널크기 = 3
`define FEA_SIZE    417 // padding 포함한 Feature Map 크기


module tb_conv_0();
localparam BIT_ARRAY    = BIT_LEN*M_LEN;
parameter BIT_LEN       = `BIT_LEN,
parameter M_LEN         = `M_LEN,
parameter FEA_SIZE      = `FEA_SIZE,
parameter   IDLE = 2'b00,
            WORK = 2'b01,
            PAUSE = 2'b10;

reg i_Clk;
reg i_reset;
reg i_fStart;
reg i_fStop;
reg [BIT_LEN-1:0]     i_dato0;
reg [BIT_LEN-1:0]     i_dato1;
reg [BIT_LEN-1:0]     i_dato2;
wire [BIT_LEN-1:0]    o_data;




conv_0 U0_conv_0(
    .i_reset(i_reset),
    .i_Clk(i_Clk),
	.i_fStart(i_fStart),
	.i_fStop(i_fStop),
	.i_dato0(i_dato0),
    .i_dato1(i_dato1),
    .i_dato2(i_dato2),
	.o_data(o_data)
);

always
    #10 i_Clk = ~i_Clk;

initial begin
    i_Clk = 1'b1;
    i_reset = 1'b0;
    i_fStart = 1'b0;
    i_fStop = 1'b0;
    i_dato0 = 8'h0;
    i_dato1 = 8'h0;
    i_dato2 = 8'h0;
    
    @(negedge i_Clk) i_reset = 1'b1;
    
    #100
    @(posedge i_Clk) i_fStart = 1'b1; i_dato0 = 8'h1; i_dato1 = 8'h2; i_dato2 = 8'h3;

    #200
    @(posedge i_Clk) i_dato0 = 8'h4; i_dato1 = 8'h5; i_dato2 = 8'h6;

    #500
    @(posedge i_Clk) i_fStart = 1'b0;

    #3000
    @(posedge i_Clk) i_fStop = 1'b1;
    @(posedge i_Clk) i_fStop = 1'b0;
    $stop;
end


endmodule