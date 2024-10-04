`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/23 11:16:42
// Design Name: 
// Module Name: tb_Stopwatch
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module tb_Stopwatch();
reg i_Clk;
reg i_Rst;
reg i_fStart;
reg i_fStop;
wire [3:0] o_Digit;
wire [6:0] o_FND;

Stopwatch U0_StopWatch(
    .i_Rst(i_Rst),
    .i_Clk(i_Clk),
	.i_fStart(i_fStart),
	.i_fStop(i_fStop),
	.o_Digit(o_Digit),
	.o_FND(o_FND)
);

always
    #10 i_Clk = ~i_Clk;

initial begin
    i_Clk = 1'b1;
    i_Rst = 1'b0;
    i_fStart = 1'b0;
    i_fStop = 1'b0;
    
    @(negedge i_Clk) i_Rst = 1'b1;
    
    #100
    @(posedge i_Clk) i_fStart = 1'b1;
    @(posedge i_Clk) i_fStart = 1'b0;
    
    #2000
    @(posedge i_Clk) i_fStart = 1'b1;
    @(posedge i_Clk) i_fStart = 1'b0;
    
    #3000
    @(posedge i_Clk) i_fStart = 1'b1;
    @(posedge i_Clk) i_fStart = 1'b0;
    
    #3000
    @(posedge i_Clk) i_fStop = 1'b1;
    @(posedge i_Clk) i_fStop = 1'b0;
    $stop;
end


endmodule