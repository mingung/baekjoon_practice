// counter_rst.v
module counter_rst (count, clk, rst);
output [3:0] count;
reg [3:0] count;
input clk, rst; 
//rst�� 1�϶� 1����
//rst�� 0�϶� ī���� ���ҷ� reg�� ����
always @(posedge clk)
if(rst == 0)
count <= 1'b0;
else
count <= count + 1'b1;
endmodule
