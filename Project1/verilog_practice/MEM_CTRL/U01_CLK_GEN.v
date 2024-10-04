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


module U01_CLK_GEN(
	input	nReset,
	input	clk_100Mhz,
	output	clk_25MHz,
	output clk_1Hz
);

reg	clk_25MHz, clk_1Hz;
reg [2:0] clock_count;
reg [25:0] clock_count2;
/*
wire clk_200MHz;
clk_wiz_100_200 U03_clk_wiz_100_200(
    .clk_out1(clk_200MHz),
    .clk_in1(clk_100Mhz)
 );*/
always @(posedge clk_100Mhz or negedge nReset)
begin
		if(!nReset)	begin
				clock_count <= 0;
				clk_25MHz    <= 0;
		end
		else begin
				if(clock_count >= 1) begin
					 clock_count <= 0;
					 clk_25MHz	 <=	~clk_25MHz;
				end
				else
					 clock_count <= clock_count + 1;
		end
end

always @(posedge clk_100Mhz or negedge nReset )	
begin
    if(!nReset)	begin
        clock_count2   <= 0;
        clk_1Hz        <= 0;
    end 
    else begin
//        if( clock_count > 25_000_000 ) begin
        if( clock_count2 >= 5 ) begin
            clock_count2     <= 0;
            clk_1Hz     <= ~clk_1Hz;
        end
        else
           clock_count2 <= clock_count2 + 1; 
    end
end 
endmodule