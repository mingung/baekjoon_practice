//sig_var_const_2.v
//D-플립플롭
module
sig_var_const_2(data_out, sig_delay, rstb, clk, data_in);
output reg [3:0] data_out, sig_delay;
input rstb, clk;
input [3:0] data_in;

always @(posedge clk or negedge rstb)
if(!rstb) begin
    data_out = 0;
    sig_delay = 0;
end
else begin
    sig_delay = data_in;
    data_out = sig_delay;
end
endmodule

//sig_var_const_2_tb.v
`timescale 1ns/1ns

module sig_var_const_2_tb;
wire [3:0] data_out, sig_delay;
reg rstb, clk;
reg [3:0] data_in;

sig_var_const_2 sig_var_const_2_tb0(
    .rstb(rstb),
    .clk(clk),
    .data_in(data_in),
    .data_out(data_out),
    .sig_delay(sig_delay)
);

initial
begin
    // non-blocking
clk <= 0;
rstb <= 0;
data_in <= 1;
data_in <= #10 2;
data_in <= #20 3;
data_in <= #30 4;
data_in <= #40 5;
data_in <= #50 6;
data_in <= #60 7;
data_in <= #70 8;
data_in <= #80 9;
data_in <= #90 10;
rstb <= #10 1;
 end
always #5 clk = ~clk;
endmodule  
    