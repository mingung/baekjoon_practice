`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/16 10:56:37
// Design Name: 
// Module Name: REG16X8
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


module REG16X8(
	input clk_25MHz,
	input reset,
	input write_en,
	input read_en,
	input [3:0] addr,
	input [7:0] data_in,
    output [7:0] data_out
);
reg [7:0] data_out;
reg	[7:0] REG_MEM[15:0];

always @(posedge clk_25MHz or negedge reset) begin
    if (!reset) begin
        data_out <= 8'h0;
        end
	else if(write_en == 1) 
		REG_MEM[addr] <= data_in;
	else if(read_en == 1)
		data_out <= REG_MEM[addr];
	else
		data_out <= 8'h0;
end
endmodule
