// decade_counter.v

module decade_counter (clk, count);
output [3:0] count;
reg [3:0] count;
input clk;

always @(posedge clk)
if(count == 4'h9) // 4 bit, 16진수 9 설정
// if(count == 9) 1차 오류(bit크기 지정하지않으면 32bit로 자동 지정 오류) 
count <= 1'b0;
else
count <= count + 1'b1;
endmodule