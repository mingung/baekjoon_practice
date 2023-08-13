// decade_counter.v

module decade_counter (clk, count);
output [3:0] count;
reg [3:0] count;
input clk;

always @(posedge clk)
if(count == 4'h9) // 4 bit, 16���� 9 ����
// if(count == 9) 1�� ����(bitũ�� �������������� 32bit�� �ڵ� ���� ����) 
count <= 1'b0;
else
count <= count + 1'b1;
endmodule