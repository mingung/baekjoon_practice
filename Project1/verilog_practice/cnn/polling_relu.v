module Pooling_relu #(
    parameter CONV_BIT = 12,
    parameter HALF_WIDTH = 12,
    parameter HALF_HEIGHT = 12,
    parameter HALF_WIDTH_BIT = 4
)
(
    input clk, rst,
    input in_valid,
    input signed [CONV_BIT - 1 : 0] in_data_1, in_data_2, in_data_3,

    output reg [CONV_BIT - 1 : 0] out_max_1, out_max_2, out_max_3,
    output reg out_valid
);

reg signed [CONV_BIT - 1 : 0] relu_buffer_1 [0 : HALF_WIDTH - 1];
reg signed [CONV_BIT - 1 : 0] relu_buffer_2 [0 : HALF_WIDTH - 1];
reg signed [CONV_BIT - 1 : 0] relu_buffer_3 [0 : HALF_WIDTH - 1];

reg [HALF_WIDTH_BIT - 1 : 0] pcount;
reg state; // 0 : p0, p1 // 1 : p2, p3, out
reg flag; // 0 : input // 1 : Compare

always @ (posedge clk) begin
    if (rst) begin
        state <= 0;
        pcount <= 0;
        out_valid <= 0;
        flag <= 0;
    end
    else begin
        // Only Valid Value
        if (in_valid == 1) begin
            // Toggle Flag 
            flag <= ~flag;
            // 1 Count to 2 Clock
            if (flag == 1) begin
                pcount <= pcount + 1;
                if (pcount == HALF_WIDTH - 1) begin
                    state <= ~state;
                    pcount <= 0;
                end
            end
            
            // State Machine
            case (state)
                0: begin // First line
                    // Input without Comparison
                    case (flag)
                        0: begin
                            out_valid <= 0;
                            relu_buffer_1[pcount] <= in_data_1;
                            relu_buffer_2[pcount] <= in_data_2;
                            relu_buffer_3[pcount] <= in_data_3;
                        end
                        1: begin
                            out_valid <= 0;
                            case (1)
                                in_data_1 > relu_buffer_1[pcount]: relu_buffer_1[pcount] <= in_data_1;
                                in_data_2 > relu_buffer_2[pcount]: relu_buffer_2[pcount] <= in_data_2;
                                in_data_3 > relu_buffer_3[pcount]: relu_buffer_3[pcount] <= in_data_3;
                                default: begin end
                            endcase
                        end
                    endcase
                end
                
                1: begin // Second line
                    // Input with Comparison
                    case (flag)
                        0: begin
                            out_valid <= 0;
                            case (1)
                                in_data_1 > relu_buffer_1[pcount]: relu_buffer_1[pcount] <= in_data_1;
                                in_data_2 > relu_buffer_2[pcount]: relu_buffer_2[pcount] <= in_data_2;
                                in_data_3 > relu_buffer_3[pcount]: relu_buffer_3[pcount] <= in_data_3;
                                default: begin end
                            endcase
                        end
                        1: begin
                            out_valid <= 1;
                            // Channel 1
                            case (1)
                                in_data_1 > relu_buffer_1[pcount]: begin
                                    if (in_data_1 > 0)
                                        out_max_1 <= in_data_1;
                                    else
                                        out_max_1 <= 0;
                                end
                                default: begin
                                    if (relu_buffer_1[pcount] > 0)
                                        out_max_1 <= relu_buffer_1[pcount];
                                    else
                                        out_max_1 <= 0;
                                end
                            endcase

                            // Channel 2
                            case (1)
                                in_data_2 > relu_buffer_2[pcount]: begin
                                    if (in_data_2 > 0)
                                        out_max_2 <= in_data_2;
                                    else
                                        out_max_2 <= 0;
                                end
                                default: begin
                                    if (relu_buffer_2[pcount] > 0)
                                        out_max_2 <= relu_buffer_2[pcount];
                                    else
                                        out_max_2 <= 0;
                                end
                            endcase

                            // Channel 3
                            case (1)
                                in_data_3 > relu_buffer_3[pcount]: begin
                                    if (in_data_3 > 0)
                                        out_max_3 <= in_data_3;
                                    else
                                        out_max_3 <= 0;
                                end
                                default: begin
                                    if (relu_buffer_3[pcount] > 0)
                                        out_max_3 <= relu_buffer_3[pcount];
                                    else
                                        out_max_3 <= 0;
                                end
                            endcase
                        end
                    endcase
                end
            endcase
        end
        else begin
            out_valid <= 0;
        end
    end
end

endmodule
