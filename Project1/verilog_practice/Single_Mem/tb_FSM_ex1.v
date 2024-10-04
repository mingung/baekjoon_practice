`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/16 10:59:04
// Design Name: 
// Module Name: tb_FSM_ex1
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


module tb_FSM_ex1();
reg RESET, start_write;
reg clk_100Mhz;
wire [7:0] data_out;

U00_PL_SRAM U0(
        .RESET  (RESET),
        .clk_100Mhz (clk_100Mhz),
        .start_write    (start_write),
        .data_out   (data_out)
        );

initial begin
    clk_100Mhz = 1'b1;
    forever #5  clk_100Mhz = ~clk_100Mhz;
end

initial begin
    start_write = 0
    #5  RESET = 1'b0;
    #3  RESET = 1'b1;
    #10 start_write = 1'b1;
    #2000
    $finish;
end
endmodule
