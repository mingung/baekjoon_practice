module Convol_layer(clk, b);
input clk;
output reg [3:0] b;
reg [7:0] rx_data [29:0] [29:0];
reg [7:0] filter_1 [2:0] [2:0]; 
reg [7:0] result [27:0] [27:0];
parameter stride = 1;

always @(posedge clk) begin
    // 입력 데이터에 예시 값 할당
    
    for (i = 0; i < 30; i = i + 1) begin
        for (j = 0; j < 30; j = j + 1) begin
            rx_data[i][j] <= 8'b0;
        end
    end
    
   for (i = 0; i < 3; i = i + 1) begin
        for (j = 0; j < 3; j = j + 1) begin
            filter_1[i][j] <= 8'b0;
        end
    end

    // Zero-Padding
    begin
    rx_data[0][29:0] <= 8'b0;
    rx_data[29][29:0] <= 8'b0;
    rx_data[29:0][0] <= 8'b0;
    rx_data[29:0][29] <= 8'b0;
    end

    // 컨볼루션 연산 과정

    for (i = 0; i < 27; i = i + 1) begin
        for (j = 0; j < 27; j = j + 1) begin
            rx_data[i][j] * filter_1[0][0] + rx_data[i][j+1] * filter_1[0][1] + rx_data[i][j+2] * filter_1[0][2] + rx_data[i+1][j] * filter_1[1][0] + rx_data[i+1][j+1] * filter_1[1][1] + rx_data[i+1][j+2] * filter_1[1][2] + rx_data[i+2][j] * filter_1[2][0] + rx_data[i+2][j+1] * filter_1[2][1] + rx_data[i+2][j+2] * filter_1[2][2];
        end
    end
    result[0][0] <= (rx_data[0][0] * filter_1[0][0] + rx_data[0][1] * filter_1[0][1] + rx_data[1][0] * filter_1[1][0] + rx_data[1][1] * filter_1[1][1]);
    result[0][1] <= (rx_data[0][1] * filter_1[0][0] + rx_data[0][2] * filter_1[0][1] + rx_data[1][1] * filter_1[1][0] + rx_data[1][2] * filter_1[1][1]);
    result[1][0] <= (rx_data[1][0] * filter_1[0][0] + rx_data[1][1] * filter_1[0][1] + rx_data[2][0] * filter_1[1][0] + rx_data[2][1] * filter_1[1][1]);
    result[1][1] <= (rx_data[1][1] * filter_1[0][0] + rx_data[1][2] * filter_1[0][1] + rx_data[2][1] * filter_1[1][0] + rx_data[2][2] * filter_1[1][1]);
  
end


endmodule
// 패딩 필요