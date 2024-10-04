module fc_layer #(
    parameter NUM_INPUT_DATA = 48,
    parameter NUM_OUTPUT_DATA = 10
)
(
    input clk, rst, valid_in,
    input signed [11:0] in_data_1, in_data_2, in_data_3,

    output signed [11:0] out_data,
    output reg valid_out
);

localparam DIVIDED_NUM_INPUT = 16; // 48/3
localparam NUM_INPUT_DATA_BITS = 5; // ceil(log_2(48/3)) + 1

reg state; // 0 : Buffer Stacking // 1 : Calculation

reg [NUM_INPUT_DATA_BITS - 1 : 0] buf_count; // Buffer Stacking Count

reg [3:0] out_count; // Output Change (10)

reg signed [13:0] data_buffer [0 : NUM_INPUT_DATA - 1]; // 변경: buffer -> data_buffer

reg signed [7: 0] weight_matrix [0 : NUM_INPUT_DATA * NUM_OUTPUT_DATA - 1]; // 변경: weight -> weight_matrix
reg signed [7: 0] bias_vector [0 : NUM_OUTPUT_DATA - 1]; // 변경: bias -> bias_vector

wire signed [19:0] calc_result; // 변경: calc_out -> calc_result

wire signed [13:0] adjusted_data_1, adjusted_data_2, adjusted_data_3; // 변경: data_1, data_2, data_3 -> adjusted_data_1, adjusted_data_2, adjusted_data_3

initial begin
    $readmemh("fc_weight.txt", weight_matrix); // 변경: fc_weight.txt -> fc_weight.txt
    $readmemh("fc_bias.txt", bias_vector); // 변경: fc_bias.txt -> fc_bias.txt
end

assign adjusted_data_1 = (in_data_1[11] == 1) ? {2'b11, in_data_1} : {2'd0, in_data_1};
assign adjusted_data_2 = (in_data_2[11] == 1) ? {2'b11, in_data_2} : {2'd0, in_data_2};
assign adjusted_data_3 = (in_data_3[11] == 1) ? {2'b11, in_data_3} : {2'd0, in_data_3};

always @ (posedge clk) begin
    if (rst) begin
        valid_out <= 0;
        buf_count <= 0;
        out_count <= 0;
        state <= 0;
    end
    else begin
        case(state)
            0: begin // Buffer Stacking
                case(buf_count)
                    DIVIDED_NUM_INPUT - 1: begin
                        buf_count <= 0;
                        state <= 1;
                        valid_out <= 1;
                    end
                    default: begin
                        data_buffer[buf_count] <= adjusted_data_1;
                        data_buffer[DIVIDED_NUM_INPUT + buf_count] <= adjusted_data_2;
                        data_buffer[DIVIDED_NUM_INPUT * 2 + buf_count] <= adjusted_data_3;
                        buf_count <= buf_count + 1;
                    end
                endcase
            end
            1: begin // Calculation
                case(out_count)
                    NUM_OUTPUT_DATA - 1: out_count <= 0;
                    default: begin
                        out_count <= out_count + 1;
                        valid_out <= 1;
                    end
                endcase
            end
            default: begin
                state <= 0;
            end
        endcase
    end
end

assign calc_result = weight_matrix[out_count * NUM_INPUT_DATA] * data_buffer[0] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 1] * data_buffer[1] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 2] * data_buffer[2] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 3] * data_buffer[3] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 4] * data_buffer[4] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 5] * data_buffer[5] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 6] * data_buffer[6] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 7] * data_buffer[7] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 8] * data_buffer[8] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 9] * data_buffer[9] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 10] * data_buffer[10] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 11] * data_buffer[11] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 12] * data_buffer[12] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 13] * data_buffer[13] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 14] * data_buffer[14] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 15] * data_buffer[15] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 16] * data_buffer[16] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 17] * data_buffer[17] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 18] * data_buffer[18] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 19] * data_buffer[19] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 20] * data_buffer[20] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 21] * data_buffer[21] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 22] * data_buffer[22] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 23] * data_buffer[23] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 24] * data_buffer[24] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 25] * data_buffer[25] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 26] * data_buffer[26] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 27] * data_buffer[27] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 28] * data_buffer[28] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 29] * data_buffer[29] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 30] * data_buffer[30] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 31] * data_buffer[31] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 32] * data_buffer[32] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 33] * data_buffer[33] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 34] * data_buffer[34] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 35] * data_buffer[35] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 36] * data_buffer[36] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 37] * data_buffer[37] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 38] * data_buffer[38] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 39] * data_buffer[39] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 40] * data_buffer[40] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 41] * data_buffer[41] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 42] * data_buffer[42] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 43] * data_buffer[43] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 44] * data_buffer[44] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 45] * data_buffer[45] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 46] * data_buffer[46] +
                      weight_matrix[out_count * NUM_INPUT_DATA + 47] * data_buffer[47] +
                      bias_vector[out_count];

assign out_data = calc_result[18:7];

endmodule
