// counter_rst.v
module counter_rst (count, clk, rst);
output [3:0] count;
reg [3:0] count;
input clk, rst; 
//rst가 1일때 1전달
//rst가 0일때 카운터 역할로 reg에 전달
always @(posedge clk)
if(rst == 0)
count <= 1'b0;
else
count <= count + 1'b1;
endmodule
