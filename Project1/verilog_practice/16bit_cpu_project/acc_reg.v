// Accumulator (ACC)
module acc_reg (clk, accce, alu, acc, acc15, accz); // 작업용 데이터 레지스터
input clk, accce;
input [15:0] alu;
output acc15, accz;
output [15:0] acc;
reg [15:0] acc;

assign acc15 = acc[15] // control logic에 값을 전달
assign accz = acc == 16'h0; // acc에 담긴값이 0인지 판단

always @(negedge clk)
if (accce)
acc <= alu[15:0];
endmodule