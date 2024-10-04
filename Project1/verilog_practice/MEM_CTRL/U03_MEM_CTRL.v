`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/15 14:55:24
// Design Name: 
// Module Name: U01_CLK_GEN
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


module U03_MEM_CTRL(
	input	nReset,
	input	clk_25MHz,
	input	start_write,		// write high --> input
	output reg write_en,
	output reg read_en,
	output reg [6:0] addr,
	output reg [7:0] data_in
);

// reg [6:0] clock_count;
reg [5:0] clock_count;

always @(posedge clk_25MHz or negedge nReset)
begin
			if(!nReset)	begin
				clock_count <= 0;
				write_en		<= 0;
				read_en			<= 0;
				addr			<= 0;
				data_in			<= 0; 
		end
		else begin
		  if( start_write == 1) begin
			case(clock_count)
					5:	begin	write_en <= 1;	addr <= 7'd0;	data_in <= 8'hAA;	end	
					6:	begin	write_en <= 1;	addr <= 7'd1;	data_in <= 8'hBB;	end	
					7:	begin	write_en <= 1;	addr <= 7'd2;	data_in <= 8'hCC;	end	
					8:	begin	write_en <= 1;	addr <= 7'd3;	data_in <= 8'hDD;	end

					10:	begin	read_en <= 1;	addr <= 7'd0;	end
					11:	begin	read_en <= 1;	addr <= 7'd1;	end
					12:	begin	read_en <= 1;	addr <= 7'd2;	end
					13:	begin	read_en <= 1;	addr <= 7'd3;	end
					default:	begin addr <= 7'h7F; write_en <= 0;	read_en <= 0;	end
			endcase

				if(clock_count >= 20)
					clock_count <= 1;
				else
					clock_count <= clock_count + 1;
			end
		end
end
endmodule