module conv_buf #( parameter WIDTH = 28, HEIGHT = 28, DATA_BIT = 8 )
(
    clk, rst,
    in_data,
    
    conv_out_0, conv_out_1, conv_out_2, conv_out_3, conv_out_4,
    conv_out_5, conv_out_6, conv_out_7, conv_out_8, conv_out_9,
    conv_out_10, conv_out_11, conv_out_12, conv_out_13, conv_out_14,
    conv_out_15, conv_out_16, conv_out_17, conv_out_18, conv_out_19,
    conv_out_20, conv_out_21, conv_out_22, conv_out_23, conv_out_24,
    
    valid_out
);

localparam KERNEL_SIZE = 5;

input clk, rst;
input [DATA_BIT - 1 : 0] in_data;

output reg [DATA_BIT - 1:0] conv_out_0, conv_out_1, conv_out_2, conv_out_3, conv_out_4,
                            conv_out_5, conv_out_6, conv_out_7, conv_out_8, conv_out_9,
                            conv_out_10, conv_out_11, conv_out_12, conv_out_13, conv_out_14,
                            conv_out_15, conv_out_16, conv_out_17, conv_out_18, conv_out_19,
                            conv_out_20, conv_out_21, conv_out_22, conv_out_23, conv_out_24;
                
output reg valid_out;

reg [DATA_BIT - 1:0] pixel_buffer [0 : WIDTH * KERNEL_SIZE - 1];

reg [DATA_BIT - 1:0] buffer_index; // Index of Buffer (28 * 5)
reg [4:0] pixel_col; // Index of width (28)
reg [4:0] pixel_row; // Index of height (28)
reg [2:0] buffer_flag; // Flag of data processing 0 ~ 4
reg conv_state; // 0 : initialize, 1: Output Selection

always @(posedge clk) begin
    if (rst) begin
        buffer_index <= -1;
        pixel_col <= 0;
        pixel_row <= 0;
        buffer_flag <= 0;
        conv_state <= 0;
        valid_out <= 0;
    end
    else begin
        buffer_index <= buffer_index + 1;
        if (buffer_index == WIDTH * KERNEL_SIZE - 1) begin
            buffer_index <= 0;
        end
        pixel_buffer[buffer_index] <= in_data;
        
        case (conv_state)
            0: begin // Initialization
                if (buffer_index == WIDTH * KERNEL_SIZE - 1) begin
                    conv_state <= 1;
                end
            end
            
            1: begin // Output Selection
                pixel_col <= pixel_col + 1;
                
                // Handle valid_out
                case (pixel_col)
                    WIDTH - 4: valid_out <= 0;
                    0: valid_out <= 1;
                endcase

                // Handle pixel_col and buffer_flag
                case (pixel_col)
                    WIDTH - 1: begin
                        buffer_flag <= buffer_flag + 1;
                        if (buffer_flag == KERNEL_SIZE - 1) begin
                            buffer_flag <= 0;
                        end
                        
                        pixel_col <= 0;
                        if (pixel_row == HEIGHT - 5) begin
                            pixel_row <= 0;
                            conv_state <= 0;
                        end
                        pixel_row <= pixel_row + 1;
                    end
                endcase
                
            // Buffer Output Selection
            case(buffer_flag)
                3'd0: begin 
                    conv_out_0 <= pixel_buffer[pixel_col];
                    conv_out_1 <= pixel_buffer[pixel_col + 1]; 
                    conv_out_2 <= pixel_buffer[pixel_col + 2]; 
                    conv_out_3 <= pixel_buffer[pixel_col + 3]; 
                    conv_out_4 <= pixel_buffer[pixel_col + 4];
                    
                    conv_out_5 <= pixel_buffer[pixel_col + WIDTH]; 
                    conv_out_6 <= pixel_buffer[pixel_col + 1 + WIDTH]; 
                    conv_out_7 <= pixel_buffer[pixel_col + 2 + WIDTH]; 
                    conv_out_8 <= pixel_buffer[pixel_col + 3 + WIDTH]; 
                    conv_out_9 <= pixel_buffer[pixel_col + 4 + WIDTH];
                    
                    conv_out_10 <= pixel_buffer[pixel_col + (WIDTH * 2)]; 
                    conv_out_11 <= pixel_buffer[pixel_col + 1 + (WIDTH * 2)]; 
                    conv_out_12 <= pixel_buffer[pixel_col + 2 + (WIDTH * 2)]; 
                    conv_out_13 <= pixel_buffer[pixel_col + 3 + (WIDTH * 2)]; 
                    conv_out_14 <= pixel_buffer[pixel_col + 4 + (WIDTH * 2)];
                    
                    conv_out_15 <= pixel_buffer[pixel_col + (WIDTH * 3)]; 
                    conv_out_16 <= pixel_buffer[pixel_col + 1 + (WIDTH * 3)]; 
                    conv_out_17 <= pixel_buffer[pixel_col + 2 + (WIDTH * 3)]; 
                    conv_out_18 <= pixel_buffer[pixel_col + 3 + (WIDTH * 3)]; 
                    conv_out_19 <= pixel_buffer[pixel_col + 4 + (WIDTH * 3)];
                    
                    conv_out_20 <= pixel_buffer[pixel_col + (WIDTH * 4)]; 
                    conv_out_21 <= pixel_buffer[pixel_col + 1 + (WIDTH * 4)]; 
                    conv_out_22 <= pixel_buffer[pixel_col + 2 + (WIDTH * 4)]; 
                    conv_out_23 <= pixel_buffer[pixel_col + 3 + (WIDTH * 4)]; 
                    conv_out_24 <= pixel_buffer[pixel_col + 4 + (WIDTH * 4)];
                end
                3'd1: begin 
                    conv_out_20 <= pixel_buffer[pixel_col]; 
                    conv_out_21 <= pixel_buffer[pixel_col + 1]; 
                    conv_out_22 <= pixel_buffer[pixel_col + 2]; 
                    conv_out_23 <= pixel_buffer[pixel_col + 3]; 
                    conv_out_24 <= pixel_buffer[pixel_col + 4];
                    
                    conv_out_0 <= pixel_buffer[pixel_col + WIDTH]; 
                    conv_out_1 <= pixel_buffer[pixel_col + 1 + WIDTH]; 
                    conv_out_2 <= pixel_buffer[pixel_col + 2 + WIDTH]; 
                    conv_out_3 <= pixel_buffer[pixel_col + 3 + WIDTH]; 
                    conv_out_4 <= pixel_buffer[pixel_col + 4 + WIDTH];
                    
                    conv_out_5 <= pixel_buffer[pixel_col + (WIDTH * 2)]; 
                    conv_out_6 <= pixel_buffer[pixel_col + 1 + (WIDTH * 2)]; 
                    conv_out_7 <= pixel_buffer[pixel_col + 2 + (WIDTH * 2)]; 
                    conv_out_8 <= pixel_buffer[pixel_col + 3 + (WIDTH * 2)]; 
                    conv_out_9 <= pixel_buffer[pixel_col + 4 + (WIDTH * 2)];
                    
                    conv_out_10 <= pixel_buffer[pixel_col + (WIDTH * 3)]; 
                    conv_out_11 <= pixel_buffer[pixel_col + 1 + (WIDTH * 3)]; 
                    conv_out_12 <= pixel_buffer[pixel_col + 2 + (WIDTH * 3)]; 
                    conv_out_13 <= pixel_buffer[pixel_col + 3 + (WIDTH * 3)]; 
                    conv_out_14 <= pixel_buffer[pixel_col + 4 + (WIDTH * 3)];
                    
                    conv_out_15 <= pixel_buffer[pixel_col + (WIDTH * 4)]; 
                    conv_out_16 <= pixel_buffer[pixel_col + 1 + (WIDTH * 4)]; 
                    conv_out_17 <= pixel_buffer[pixel_col + 2 + (WIDTH * 4)]; 
                    conv_out_18 <= pixel_buffer[pixel_col + 3 + (WIDTH * 4)]; 
                    conv_out_19 <= pixel_buffer[pixel_col + 4 + (WIDTH * 4)];
                end    
                3'd2: begin
                    conv_out_15 <= pixel_buffer[pixel_col]; 
                    conv_out_16 <= pixel_buffer[pixel_col + 1]; 
                    conv_out_17 <= pixel_buffer[pixel_col + 2]; 
                    conv_out_18 <= pixel_buffer[pixel_col + 3]; 
                    conv_out_19 <= pixel_buffer[pixel_col + 4];
                    
                    conv_out_20 <= pixel_buffer[pixel_col + WIDTH]; 
                    conv_out_21 <= pixel_buffer[pixel_col + 1 + WIDTH]; 
                    conv_out_22 <= pixel_buffer[pixel_col + 2 + WIDTH]; 
                    conv_out_23 <= pixel_buffer[pixel_col + 3 + WIDTH]; 
                    conv_out_24 <= pixel_buffer[pixel_col + 4 + WIDTH];
                    
                    conv_out_0 <= pixel_buffer[pixel_col + (WIDTH * 2)]; 
                    conv_out_1 <= pixel_buffer[pixel_col + 1 + (WIDTH * 2)]; 
                    conv_out_2 <= pixel_buffer[pixel_col + 2 + (WIDTH * 2)]; 
                    conv_out_3 <= pixel_buffer[pixel_col + 3 + (WIDTH * 2)]; 
                    conv_out_4 <= pixel_buffer[pixel_col + 4 + (WIDTH * 2)];
                    
                    conv_out_5 <= pixel_buffer[pixel_col + (WIDTH * 3)]; 
                    conv_out_6 <= pixel_buffer[pixel_col + 1 + (WIDTH * 3)]; 
                    conv_out_7 <= pixel_buffer[pixel_col + 2 + (WIDTH * 3)]; 
                    conv_out_8 <= pixel_buffer[pixel_col + 3 + (WIDTH * 3)]; 
                    conv_out_9 <= pixel_buffer[pixel_col + 4 + (WIDTH * 3)];
                    
                    conv_out_10 <= pixel_buffer[pixel_col + (WIDTH * 4)]; 
                    conv_out_11 <= pixel_buffer[pixel_col + 1 + (WIDTH * 4)]; 
                    conv_out_12 <= pixel_buffer[pixel_col + 2 + (WIDTH * 4)]; 
                    conv_out_13 <= pixel_buffer[pixel_col + 3 + (WIDTH * 4)]; 
                    conv_out_14 <= pixel_buffer[pixel_col + 4 + (WIDTH * 4)];
                end
                3'd3: begin
                    conv_out_10 <= pixel_buffer[pixel_col]; 
                    conv_out_11 <= pixel_buffer[pixel_col + 1]; 
                    conv_out_12 <= pixel_buffer[pixel_col + 2]; 
                    conv_out_13 <= pixel_buffer[pixel_col + 3]; 
                    conv_out_14 <= pixel_buffer[pixel_col + 4];
                    
                    conv_out_15 <= pixel_buffer[pixel_col + WIDTH]; 
                    conv_out_16 <= pixel_buffer[pixel_col + 1 + WIDTH]; 
                    conv_out_17 <= pixel_buffer[pixel_col + 2 + WIDTH]; 
                    conv_out_18 <= pixel_buffer[pixel_col + 3 + WIDTH]; 
                    conv_out_19 <= pixel_buffer[pixel_col + 4 + WIDTH];
                    
                    conv_out_20 <= pixel_buffer[pixel_col + (WIDTH * 2)]; 
                    conv_out_21 <= pixel_buffer[pixel_col + 1 + (WIDTH * 2)]; 
                    conv_out_22 <= pixel_buffer[pixel_col + 2 + (WIDTH * 2)]; 
                    conv_out_23 <= pixel_buffer[pixel_col + 3 + (WIDTH * 2)]; 
                    conv_out_24 <= pixel_buffer[pixel_col + 4 + (WIDTH * 2)];
                    
                    conv_out_0 <= pixel_buffer[pixel_col + (WIDTH * 3)]; 
                    conv_out_1 <= pixel_buffer[pixel_col + 1 + (WIDTH * 3)]; 
                    conv_out_2 <= pixel_buffer[pixel_col + 2 + (WIDTH * 3)]; 
                    conv_out_3 <= pixel_buffer[pixel_col + 3 + (WIDTH * 3)]; 
                    conv_out_4 <= pixel_buffer[pixel_col + 4 + (WIDTH * 3)];
                    
                    conv_out_5 <= pixel_buffer[pixel_col + (WIDTH * 4)]; 
                    conv_out_6 <= pixel_buffer[pixel_col + 1 + (WIDTH * 4)]; 
                    conv_out_7 <= pixel_buffer[pixel_col + 2 + (WIDTH * 4)]; 
                    conv_out_8 <= pixel_buffer[pixel_col + 3 + (WIDTH * 4)]; 
                    conv_out_9 <= pixel_buffer[pixel_col + 4 + (WIDTH * 4)];
                end
                3'd4: begin
                    conv_out_5 <= pixel_buffer[pixel_col]; 
                    conv_out_6 <= pixel_buffer[pixel_col + 1]; 
                    conv_out_7 <= pixel_buffer[pixel_col + 2]; 
                    conv_out_8 <= pixel_buffer[pixel_col + 3]; 
                    conv_out_9 <= pixel_buffer[pixel_col + 4];
                    
                    conv_out_10 <= pixel_buffer[pixel_col + WIDTH]; 
                    conv_out_11 <= pixel_buffer[pixel_col + 1 + WIDTH]; 
                    conv_out_12 <= pixel_buffer[pixel_col + 2 + WIDTH]; 
                    conv_out_13 <= pixel_buffer[pixel_col + 3 + WIDTH]; 
                    conv_out_14 <= pixel_buffer[pixel_col + 4 + WIDTH];
                    
                    conv_out_15 <= pixel_buffer[pixel_col + (WIDTH * 2)]; 
                    conv_out_16 <= pixel_buffer[pixel_col + 1 + (WIDTH * 2)]; 
                    conv_out_17 <= pixel_buffer[pixel_col + 2 + (WIDTH * 2)]; 
                    conv_out_18 <= pixel_buffer[pixel_col + 3 + (WIDTH * 2)]; 
                    conv_out_19 <= pixel_buffer[pixel_col + 4 + (WIDTH * 2)];
                    
                    conv_out_20 <= pixel_buffer[pixel_col + (WIDTH * 3)]; 
                    conv_out_21 <= pixel_buffer[pixel_col + 1 + (WIDTH * 3)]; 
                    conv_out_22 <= pixel_buffer[pixel_col + 2 + (WIDTH * 3)]; 
                    conv_out_23 <= pixel_buffer[pixel_col + 3 + (WIDTH * 3)]; 
                    conv_out_24 <= pixel_buffer[pixel_col + 4 + (WIDTH * 3)];
                    
                    conv_out_0 <= pixel_buffer[pixel_col + (WIDTH * 4)]; 
                    conv_out_1 <= pixel_buffer[pixel_col + 1 + (WIDTH * 4)]; 
                    conv_out_2 <= pixel_buffer[pixel_col + 2 + (WIDTH * 4)]; 
                    conv_out_3 <= pixel_buffer[pixel_col + 3 + (WIDTH * 4)]; 
                    conv_out_4 <= pixel_buffer[pixel_col + 4 + (WIDTH * 4)];
                end
            endcase
        end
    end
end
endmodule
