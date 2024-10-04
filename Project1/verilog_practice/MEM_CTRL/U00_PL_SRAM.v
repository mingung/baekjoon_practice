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
    input ENA,
	input RESET,
	input clk_100Mhz,
	input start_write,
    output LD0,
	output LD1,
	output LD2,
	output LD3,
	output LD4,
	output LD5,
	output LD6,
	output LD7
);
wire write_en;
wire read_en;
wire [6:0] addr;
wire [7:0] data_in;
wire clk_25MHz;

U01_CLK_GEN U01(
	.nReset(RESET),
	.clk_100Mhz(clk_100Mhz),
	.clk_25MHz(clk_25MHz),
	.clk_1Hz(clk_1Hz)
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
    .ENA    (ENA),
	.clk_25MHz(clk_25MHz),
	.reset(RESET),
	.write_en(write_en),
	.read_en(read_en),
	.addr(addr),
	.data_in(data_in),
	.LD0(LD0),
    .LD1(LD1),
	.LD2(LD2),
	.LD3(LD3),
	.LD4(LD4),
	.LD5(LD5),
	.LD6(LD6),
	.LD7(LD7)

);


endmodule

