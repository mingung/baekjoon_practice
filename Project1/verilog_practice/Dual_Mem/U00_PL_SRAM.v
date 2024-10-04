`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/16 10:54:12
// Design Name: 
// Module Name: U00_PL_SRAM
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


module U00_PL_SRAM(
	input RESET,
	input clk_100Mhz,
	input start_write,
    output [7:0] data_out
);
wire write_en;
wire read_en;
wire [6:0] addr;
wire [7:0] data_in;
wire clk_25MHz;

U01_CLK_GEN U01(
	.nReset(RESET),
	.clk_100Mhz(clk_100Mhz),
	.clk_25MHz(clk_25MHz)
);

U03_MEM_CTRL U03_MEM_CTRL(
	.nReset(RESET),
	.clk_25MHz(clk_25MHz),
	.start_write(start_write),
	.write_en(write_en),
	.read_en(read_en),
	.addr(addr),
	.data_in(data_in)
);

REG16X8 U09_REG16X8(
	.clk_25MHz(clk_25MHz),
	.reset(RESET),
	.write_en(write_en),
	.read_en(read_en),
	.addr(addr),
	.data_in(data_in),
	.data_out(data_out)
);


endmodule

