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
reg ENA;
reg RESET, start_write;
reg clk_100Mhz;
wire LD0;
wire LD1; 
wire LD2; 
wire LD3; 
wire LD4; 
wire LD5; 
wire LD6; 
wire LD7; 

U00_PL_SRAM U0(
        .ENA    (ENA),
        .RESET  (RESET),
        .clk_100Mhz (clk_100Mhz),
        .start_write    (start_write),
        .LD0    (LD0),
        .LD1    (LD1),
        .LD2    (LD2),
        .LD3    (LD3),
        .LD4    (LD4),
        .LD5    (LD5),
        .LD6    (LD6),
        .LD7    (LD7)

        );
initial begin
    clk_100Mhz = 1'b1;
    forever #5  clk_100Mhz = ~clk_100Mhz;
end

initial begin
    RESET = 1'b1; start_write = 0; ENA = 0;
    #5  RESET = 1'b0;
    #3  RESET = 1'b1;
    #10 start_write = 1'b1;
    #2000
    $finish;
end
endmodule
