module Convol_layer(clk, b1);
input clk;
output reg [783:0] b1;
reg [783:0] b;
reg [3:0] row1 [9:0]; 
reg [3:0] row2 [9:0]; 
reg [3:0] row3 [9:0]; 
reg [3:0] row4 [9:0]; 
reg [3:0] row5 [9:0]; 
reg [3:0] row6 [9:0]; 
reg [3:0] row7 [9:0]; 
reg [3:0] row8 [9:0]; 
reg [3:0] row9 [9:0];
reg [3:0] row10 [9:0];
reg zeroPad;


reg [3:0] F1row1 [2:0];
reg [3:0] F1row2 [2:0];
reg [3:0] F1row3 [2:0];

reg [3:0] filter_2 [2:0];
reg [3:0] filter_3 [2:0];
reg [3:0] result_1 [27:0] [27:0];
reg [3:0] result_2 [27:0] [27:0];
reg [3:0] result_3 [27:0] [27:0];
reg [3:0] max_pool_result_1 [13:0][13:0];
//reg [3:0] max_pool_result_2 [13:0][13:0];
//reg [3:0] max_pool_result_3 [13:0][13:0];
reg [3:0] temp_max;



zeroPad = 1'b0;







// ��� ��Ʈ�� ���� ���ͷ� ����

// integer i, j, k;
// integer m, n, p, q;
// integer idx, x, y;

//  // ReLU �Լ� ���
//     function [3:0] relu(input [3:0] input_val);
//         begin
//             if (input_val > 0)
//                 relu = input_val;
//             else
//                 relu = 8'b0;
//         end
//     endfunction



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
            filter_2[i][j] <= 8'b00000001;
            filter_3[i][j] <= 8'b00000001;
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


    // max - pooling (2x2 filter and stride 2)


for (i = 0; i < 27; i = i + 2) begin
    for (j = 0; j < 27; j = j + 2) begin
        m = i / 2; // ��� �迭�� �ε���
        n = j / 2;

        // ��� 1�� ���� max pooling
        temp_max = result_1[i][j];
        for (p = 0; p < 2; p = p + 1) begin
            for (q = 0; q < 2; q = q + 1) begin
                if (result_1[i+p][j+q] > temp_max) begin
                    temp_max = result_1[i+p][j+q];
                end
            end
        end
        max_pool_result_1[m][n] <= temp_max;

//        // ��� 2�� ���� max pooling
//        temp_max = result_2[i][j];
//        for (p = 0; p < 2; p = p + 1) begin
//            for (q = 0; q < 2; q = q + 1) begin
//                if (result_2[i+p][j+q] > temp_max) begin
//                    temp_max = result_2[i+p][j+q];
//                end
//            end
//        end
//        max_pool_result_2[m][n] <= temp_max;
//
//        // ��� 3�� ���� max pooling
//        temp_max = result_3[i][j];
//        for (p = 0; p < 2; p = p + 1) begin
//            for (q = 0; q < 2; q = q + 1) begin
//                if (result_3[i+p][j+q] > temp_max) begin
//                    temp_max = result_3[i+p][j+q];
//                end
//            end
//        end
//        max_pool_result_3[m][n] <= temp_max;
    end
end

  // max_pool_result_1�� ��� ���Ҹ� b�� ����
    idx = 0; // b������ ���� ��ġ �ε���

    for (x = 0; x < 14; x = x + 1) begin
        for (y = 0; y < 14; y = y + 1) begin
            // max_pool_result_1�� �� ���Ҹ� b�� ���������� ����
            b[idx +: 4] = max_pool_result_1[x][y]; // 4��Ʈ ������ ����
            idx = idx + 4; // ���� ���Ҹ� ���� �ε��� ����
        end
    end

	 b1 <= b;
end




endmodule

// ������� ���� ����
// 2���� �迭 -> 1���� 30��Ʈ �迭�� 30�� ����
// result �� ���� 1���� �迭�� ����

// �ƴϸ� ������ �״�� �����ϵ�, result�� �� 1��Ʈ�� �̾Ƽ� output���� ���� �� ���� ���̾ ����
// output���� result�� �����ϴ°��� �����߿�(���� ���̾��� �Է¿� �Ҵ��ؾ��ϱ⶧��)
