module counter_1 (count, clk);
output [3:0] count;
input clk;
reg [3:0] count;
always @{posedge clk}
count <= count + 1'b1;
endmodule