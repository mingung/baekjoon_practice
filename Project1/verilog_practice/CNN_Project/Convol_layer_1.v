module Convol_layer_1(clk, b);
input clk;
output reg [7:0] b;
reg [7:0] rx_data [29:0] [29:0];
reg [7:0] filter_1 [2:0] [2:0];
reg [7:0] filter_2 [2:0] [2:0];
reg [7:0] filter_3 [2:0] [2:0];
reg [7:0] result_1 [27:0] [27:0];
reg [7:0] result_2 [27:0] [27:0];
reg [7:0] result_3 [27:0] [27:0];
integer i, j, k;

 // ReLU 함수 모듈
    function [7:0] relu(input [7:0] input_val);
        begin
            if (input_val > 0)
                relu = input_val;
            else
                relu = 8'b0;
        end
    endfunction

always @(posedge clk) begin
    // 입력 데이터에 예시 값 할당
    
    for (i = 0; i < 30; i = i + 1) begin
        for (j = 0; j < 30; j = j + 1) begin
            rx_data[i][j] <= 8'b00000001;
        end
    end
    
   for (i = 0; i < 3; i = i + 1) begin
        for (j = 0; j < 3; j = j + 1) begin
            filter_1[i][j] <= 8'b00000001;
        end
    end


    // Zero-Padding 처리
    for (k = 0; k < 30; k = k + 1) begin
        rx_data[0][k] <= 8'b0; 
        rx_data[29][k] <= 8'b0; 
        rx_data[k][0] <= 8'b0; 
        rx_data[k][29] <= 8'b0; 
    end

    // 컨볼루션 연산 과정

    for (i = 0; i < 27; i = i + 1) begin
        for (j = 0; j < 27; j = j + 1) begin
            result_1[i][j] <= rx_data[i][j] * filter_1[0][0] + rx_data[i][j+1] * filter_1[0][1] + rx_data[i][j+2] * filter_1[0][2] + rx_data[i+1][j] * filter_1[1][0] + rx_data[i+1][j+1] * filter_1[1][1] + rx_data[i+1][j+2] * filter_1[1][2] + rx_data[i+2][j] * filter_1[2][0] + rx_data[i+2][j+1] * filter_1[2][1] + rx_data[i+2][j+2] * filter_1[2][2];
            result_2[i][j] <= rx_data[i][j] * filter_2[0][0] + rx_data[i][j+1] * filter_2[0][1] + rx_data[i][j+2] * filter_2[0][2] + rx_data[i+1][j] * filter_2[1][0] + rx_data[i+1][j+1] * filter_2[1][1] + rx_data[i+1][j+2] * filter_2[1][2] + rx_data[i+2][j] * filter_2[2][0] + rx_data[i+2][j+1] * filter_2[2][1] + rx_data[i+2][j+2] * filter_2[2][2];
            result_3[i][j] <= rx_data[i][j] * filter_3[0][0] + rx_data[i][j+1] * filter_3[0][1] + rx_data[i][j+2] * filter_3[0][2] + rx_data[i+1][j] * filter_3[1][0] + rx_data[i+1][j+1] * filter_3[1][1] + rx_data[i+1][j+2] * filter_3[1][2] + rx_data[i+2][j] * filter_3[2][0] + rx_data[i+2][j+1] * filter_3[2][1] + rx_data[i+2][j+2] * filter_3[2][2];
        end
    end
    
    // ReLU 함수 적용
    for (i = 0; i < 27; i = i + 1) begin
        for (j = 0; j < 27; j = j + 1) begin

            result_1[i][j] <= relu(result_1[i][j]);
            result_2[i][j] <= relu(result_2[i][j]);
            result_3[i][j] <= relu(result_3[i][j]);
            
        end
    end

  
end


endmodule

// 컨볼루션 구조 수정
// 2차원 배열 -> 1차원 30비트 배열을 30개 생성
// result 값 또한 1차원 배열로 생성

// 아니면 구조는 그대로 생성하되, result의 값 1비트씩 뽑아서 output으로 저장 후 다음 레이어에 연결
// output으로 result를 저장하는것이 가장중요(다음 레이어의 입력에 할당해야하기때문)
