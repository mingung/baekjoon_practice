module Convol_layer(clk, b);
input clk;
output reg [3:0] b;
reg [3:0] rx_data [2:0] [2:0];
reg [3:0] filter_1 [1:0] [1:0];
reg [3:0] result [1:0] [1:0];

always @(posedge clk) begin
    // 입력 데이터에 예시 값 할당
    rx_data[0][0] <= 2'b00;
    rx_data[0][1] <= 2'b00;
    rx_data[0][2] <= 2'b00;
    rx_data[1][0] <= 2'b00;
    rx_data[1][1] <= 2'b00;
    rx_data[1][2] <= 2'b00;
    rx_data[2][0] <= 2'b00;
    rx_data[2][1] <= 2'b00;
    rx_data[2][2] <= 2'b01;
    

    // 커널 (간단한 커널 예시)
    filter_1[0][0] <= 2'b00;
    filter_1[0][1] <= 2'b00;
    filter_1[1][0] <= 2'b00;
    filter_1[1][1] <= 2'b01;
   

    // 컨볼루션 연산 결과
    
    result[0][0] <= (rx_data[0][0] * filter_1[0][0] + rx_data[0][1] * filter_1[0][1] + rx_data[1][0] * filter_1[1][0] + rx_data[1][1] * filter_1[1][1]);
    result[0][1] <= (rx_data[0][1] * filter_1[0][0] + rx_data[0][2] * filter_1[0][1] + rx_data[1][1] * filter_1[1][0] + rx_data[1][2] * filter_1[1][1]);
    result[1][0] <= (rx_data[1][0] * filter_1[0][0] + rx_data[1][1] * filter_1[0][1] + rx_data[2][0] * filter_1[1][0] + rx_data[2][1] * filter_1[1][1]);
    result[1][1] <= (rx_data[1][1] * filter_1[0][0] + rx_data[1][2] * filter_1[0][1] + rx_data[2][1] * filter_1[1][0] + rx_data[2][2] * filter_1[1][1]);
    
   
    
end

endmodule
// 패딩 필요