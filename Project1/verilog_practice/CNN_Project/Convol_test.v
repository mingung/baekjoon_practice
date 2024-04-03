module Convol_test(clk, b);
input clk;
output reg [1:0] b;
reg [1:0] rx_data [1:0] [1:0];

always @(posedge clk)
begin
rx_data [1][0] <= 1'b0;
rx_data [1][1] <= 1'b1;
b[0] <= rx_data[1][0];
b[1] <= rx_data[1][1];
end

endmodule
