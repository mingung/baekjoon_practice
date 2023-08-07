// sig_var_const_1.v
module sig_var_const_1(data_out, rstb, clk, data_in);
output reg [3:0] data_out; // 4 bit
input rstb, clk;
input [3:0] data_in;
reg [3:0] sig_delay;

always @(posedge clk or negedge rstb)
if (!rstb) begin
    data_out <= 0;
    sig_delay <= 0;
end
else begin
    sig_delay <= data_in;
    data_out <= sig_delay;
end
endmodule

// sig_var_cinst_1_tb.v
`timescale 1ns/1ns

module sig_var_const_1_tb;
wire [3:0] data_out;
reg rstb, clk;
reg [3:0] data_in;

sig_var_const_1 sig_var_const_1_tb0(
    .rstb(rstb),
    .clk(clk),
    .data_in(data_in),
    .data_out(data_out)
);

initial
begin
    clk = 0;
    rstb = 0;
    data_in = 1;
    #10 data_in = 2;
    #5 rstb = 1;
    #10 data_in = 3;
    #10 data_in = 4;
    #10 data_in = 5;
    #10 data_in = 6;
    #10 data_in = 7;
    #10 data_in = 8;
    #10 data_in = 9;
    #10 data_in = 10;
    #10 data_in = 11;
    #10 data_in = 12;
    #10 data_in = 13;
    #10 data_in = 14;
    #10 data_in = 15;

end

always #5 clk = ~clk;

endmodule