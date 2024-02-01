// Accumulator (ACC)
module acc_reg (clk, accce, alu, acc, acc15, accz); // �۾��� ������ ��������
input clk, accce;
input [15:0] alu;
output acc15, accz;
output [15:0] acc;
reg [15:0] acc;

assign acc15 = acc[15] // control logic�� ���� ����
assign accz = acc == 16'h0; // acc�� ��䰪�� 0���� �Ǵ�

always @(negedge clk)
if (accce)
acc <= alu[15:0];
endmodule