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

 // ReLU �Լ� ���
    function [7:0] relu(input [7:0] input_val);
        begin
            if (input_val > 0)
                relu = input_val;
            else
                relu = 8'b0;
        end
    endfunction

always @(posedge clk) begin
    // �Է� �����Ϳ� ���� �� �Ҵ�
    
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


    // Zero-Padding ó��
    for (k = 0; k < 30; k = k + 1) begin
        rx_data[0][k] <= 8'b0; 
        rx_data[29][k] <= 8'b0; 
        rx_data[k][0] <= 8'b0; 
        rx_data[k][29] <= 8'b0; 
    end

    // ������� ���� ����

    for (i = 0; i < 27; i = i + 1) begin
        for (j = 0; j < 27; j = j + 1) begin
            result_1[i][j] <= rx_data[i][j] * filter_1[0][0] + rx_data[i][j+1] * filter_1[0][1] + rx_data[i][j+2] * filter_1[0][2] + rx_data[i+1][j] * filter_1[1][0] + rx_data[i+1][j+1] * filter_1[1][1] + rx_data[i+1][j+2] * filter_1[1][2] + rx_data[i+2][j] * filter_1[2][0] + rx_data[i+2][j+1] * filter_1[2][1] + rx_data[i+2][j+2] * filter_1[2][2];
            result_2[i][j] <= rx_data[i][j] * filter_2[0][0] + rx_data[i][j+1] * filter_2[0][1] + rx_data[i][j+2] * filter_2[0][2] + rx_data[i+1][j] * filter_2[1][0] + rx_data[i+1][j+1] * filter_2[1][1] + rx_data[i+1][j+2] * filter_2[1][2] + rx_data[i+2][j] * filter_2[2][0] + rx_data[i+2][j+1] * filter_2[2][1] + rx_data[i+2][j+2] * filter_2[2][2];
            result_3[i][j] <= rx_data[i][j] * filter_3[0][0] + rx_data[i][j+1] * filter_3[0][1] + rx_data[i][j+2] * filter_3[0][2] + rx_data[i+1][j] * filter_3[1][0] + rx_data[i+1][j+1] * filter_3[1][1] + rx_data[i+1][j+2] * filter_3[1][2] + rx_data[i+2][j] * filter_3[2][0] + rx_data[i+2][j+1] * filter_3[2][1] + rx_data[i+2][j+2] * filter_3[2][2];
        end
    end
    
    // ReLU �Լ� ����
    for (i = 0; i < 27; i = i + 1) begin
        for (j = 0; j < 27; j = j + 1) begin

            result_1[i][j] <= relu(result_1[i][j]);
            result_2[i][j] <= relu(result_2[i][j]);
            result_3[i][j] <= relu(result_3[i][j]);
            
        end
    end

  
end


endmodule

// ������� ���� ����
// 2���� �迭 -> 1���� 30��Ʈ �迭�� 30�� ����
// result �� ���� 1���� �迭�� ����

// �ƴϸ� ������ �״�� �����ϵ�, result�� �� 1��Ʈ�� �̾Ƽ� output���� ���� �� ���� ���̾ ����
// output���� result�� �����ϴ°��� �����߿�(���� ���̾��� �Է¿� �Ҵ��ؾ��ϱ⶧��)
