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
    input ENA,
	input clk_25MHz,
	input reset,
	input write_en,
	input read_en,
	input [3:0] addr,
	input [7:0] data_in,
    output LD0,
	output LD1,
	output LD2,
	output LD3,
	output LD4,
	output LD5,
	output LD6,
	output LD7
);
reg LD0;
reg LD1;
reg LD2;
reg LD3;
reg LD4;
reg LD5;
reg LD6;
reg LD7;
reg [7:0] data_out;
reg	[7:0] REG_MEM[15:0];
reg [1:0] cnt;
reg [7:0] data_out;

always @(posedge clk_25MHz or negedge reset) begin
    if (!reset) begin
        data_out <= 8'h0;
        LD0 <= 0;
		LD1 <= 0;
        LD2 <= 0;
		LD3 <= 0;
		LD4 <= 0;
		LD5 <= 0;
		LD6 <= 0;
		LD7 <= 0;
        cnt <= 2'b0;
        end
	else if(write_en == 1)
		REG_MEM[addr] <= data_in;
	else if(read_en == 1) begin
	   if(ENA == 1) begin
        cnt <= cnt + 2'b01;
		data_out <= 8'h0;
		LD0 <= (cnt[1] && cnt[0]);
        LD1 <= (cnt[1] && cnt[0]);
		LD2 <= (cnt[1] && cnt[0]);
		LD3 <= (cnt[1] && cnt[0]);
		LD4 <= (cnt[1] && cnt[0]);
		LD5 <= (cnt[1] && cnt[0]);
		LD6 <= (cnt[1] && cnt[0]);
		LD7 <= (cnt[1] && cnt[0]);
	   end 
	   else begin
	    cnt <= cnt + 2'b01;
		data_out <= REG_MEM[addr];
		LD0 <= (REG_MEM[cnt] && data_out);
		LD1 <= (REG_MEM[cnt] && data_out);
		LD2 <= (REG_MEM[cnt] && data_out);
		LD3 <= (REG_MEM[cnt] && data_out);
		LD4 <= (REG_MEM[cnt] && data_out);
		LD5 <= (REG_MEM[cnt] && data_out);
		LD6 <= (REG_MEM[cnt] && data_out);
		LD7 <= (REG_MEM[cnt] && data_out);
		end
    end

	else begin
		data_out <= 8'h0;
        LD0 <= 0;
		LD1 <= 0;
        LD2 <= 0;
		LD3 <= 0;
		LD4 <= 0;
		LD5 <= 0;
		LD6 <= 0;
		LD7 <= 0;
	end
		
end
endmodule
