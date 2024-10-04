module classifier #(
    parameter INPUT_BITS = 12,
    parameter NUM_CLASS = 10
)
(
    input clk, rst,
    input valid_in,
    input signed [INPUT_BITS-1:0] data_in,

    output reg [3:0] class_decision,
    output reg valid_out
);  

reg signed [INPUT_BITS-1:0] data_buffer [0:NUM_CLASS-1];  
reg signed [INPUT_BITS-1:0] max_value;   
reg signed [INPUT_BITS-1:0] cmp1_0, cmp1_1, cmp1_2, cmp1_3, cmp1_4,
                            cmp2_0, cmp2_1, cmp2_2, cmp3_0, cmp3_1;  

reg [3:0] buf_index;
reg [11:0] delay_counter; // 4-bit counter
reg state;

always @ (posedge clk) begin
    if (rst) begin
        valid_out <= 0;
        buf_index <= 0;
        delay_counter <= 0;
        state <= 0;
    end
    else begin
        if (valid_in == 1) begin
            buf_index <= buf_index + 1;
            if (buf_index == NUM_CLASS - 1) begin
                state <= 1;
            end
            data_buffer[buf_index] <= data_in;
        end
        else begin
            case(state)
                0: begin // Buffer Stacking
                    buf_index <= buf_index + 1;
                    data_buffer[buf_index] <= data_in;
                    if (buf_index == NUM_CLASS - 1) begin
                        state <= 1;
                        buf_index <= 0;
                        valid_out <= 1;
                    end
                end
                1: begin // Sorting and Decision Making
                    delay_counter <= delay_counter + 1;
                    valid_out <= (delay_counter == 12'd5) ? 1 : 0;

                    // First compare
                    case(buf_index)
                        0: cmp1_0 <= (data_buffer[0] >= data_buffer[1]) ? data_buffer[0] : data_buffer[1];
                        2: cmp1_1 <= (data_buffer[2] >= data_buffer[3]) ? data_buffer[2] : data_buffer[3];
                        4: cmp1_2 <= (data_buffer[4] >= data_buffer[5]) ? data_buffer[4] : data_buffer[5];
                        6: cmp1_3 <= (data_buffer[6] >= data_buffer[7]) ? data_buffer[6] : data_buffer[7];
                        8: cmp1_4 <= (data_buffer[8] >= data_buffer[9]) ? data_buffer[8] : data_buffer[9];
                        default: begin // Do nothing on other cases
                            cmp1_0 <= cmp1_0;
                            cmp1_1 <= cmp1_1;
                            cmp1_2 <= cmp1_2;
                            cmp1_3 <= cmp1_3;
                            cmp1_4 <= cmp1_4;
                        end
                    endcase

                    // Second compare
                    case({buf_index})
                        0: cmp2_0 <= (cmp1_0 >= cmp1_1) ? cmp1_0 : cmp1_1;
                        2: cmp2_1 <= (cmp1_2 >= cmp1_3) ? cmp1_2 : cmp1_3;
                        default: cmp2_2 <= cmp1_4; // Do nothing on other cases
                    endcase

                    // Third compare
                    case({buf_index})
                        0: cmp3_0 <= (cmp2_0 >= cmp2_1) ? cmp2_0 : cmp2_1;
                        default: cmp3_1 <= cmp2_2; // Do nothing on other cases
                    endcase

                    // Last compare   
                    max_value <= (cmp3_0 >= cmp3_1) ? cmp3_0 : cmp3_1;

                    // Output Index
                    case(max_value)
                        data_buffer[0]: class_decision <= 4'b0000;
                        data_buffer[1]: class_decision <= 4'b0001;
                        data_buffer[2]: class_decision <= 4'b0010;
                        data_buffer[3]: class_decision <= 4'b0011;
                        data_buffer[4]: class_decision <= 4'b0100;
                        data_buffer[5]: class_decision <= 4'b0101;
                        data_buffer[6]: class_decision <= 4'b0110;
                        data_buffer[7]: class_decision <= 4'b0111;
                        data_buffer[8]: class_decision <= 4'b1000;
                        data_buffer[9]: class_decision <= 4'b1001;
                        default: class_decision <= class_decision; // Do nothing on useless values
                    endcase
                end
                default: begin // Do nothing on other cases
                    valid_out <= valid_out;
                end
            endcase
        end
    end
end

endmodule