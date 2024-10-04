`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/16 13:14:51
// Design Name: 
// Module Name: U04_LED_DIS
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


module U04_LED_DIS(
	input nReset,
	input clk_25MHz,
	input [7:0] LED_in,
	output reg [7:0] LED_out
  );

	always @(posedge clk_25MHz or negedge nReset) begin
		if(!nReset)
			LED_out <= 0;
		else if(REG_MEM[4'b0000] == )


	end
endmodule
