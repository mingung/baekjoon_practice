// 각 행의 데이터를 저장 후 출력

module convol_layer #(WIDTH = 28, HEIGHT = 28, DATA_BIT = 8)
(
	clk, rst,
	in_data, cs,
	
	out_data_0, out_data_1, out_data_2, out_data_3, out_data_4,
	out_data_5, out_data_6, out_data_7, out_data_8, out_data_9,
	out_data_10, out_data_11, out_data_12, out_data_13, out_data_14,
	out_data_15, out_data_16, out_data_17, out_data_18, out_data_19,
	out_data_20, out_data_21, out_data_22, out_data_23, out_data_24,
	
	
	valid_out
);

localparam KERNEL_SIZE = 5;

input wire cs;
input clk, rst;
input [DATA_BIT - 1 : 0]in_data;

output reg [DATA_BIT - 1:0] out_data_0, out_data_1, out_data_2, out_data_3, out_data_4,
							out_data_5, out_data_6, out_data_7, out_data_8, out_data_9,
							out_data_10, out_data_11, out_data_12, out_data_13, out_data_14,
							out_data_15, out_data_16, out_data_17, out_data_18, out_data_19,
							out_data_20, out_data_21, out_data_22, out_data_23, out_data_24;
						
				
output reg valid_out;

reg [DATA_BIT - 1:0] row1 [WIDTH * KERNEL_SIZE - 1 : 0];
reg [DATA_BIT - 1:0] bit_counter;


always @(posedge clk) begin
	if(rst == 0) begin
		bit_counter <= 1'b0;
		
	end
	else if(cs) begin
		bit_counter <= bit_counter + 1'b1;
	end
		begin
		row1[bit_counter - 1] <= in_data;
	    end

		begin
		out_data_0 <= row1[bit_counter - 1];
		out_data_1 <= row1[bit_counter];
		out_data_2 <= row1[bit_counter + 1]; 
		out_data_3 <= row1[bit_counter + 2]; 
		out_data_4 <= row1[bit_counter + 3];

		out_data_5 <= row1[bit_counter -1 + WIDTH];
		out_data_6 <= row1[bit_counter + WIDTH]; 
		out_data_7 <= row1[bit_counter + 1 + WIDTH]; 
		out_data_8 <= row1[bit_counter + 2 + WIDTH]; 
		out_data_9 <= row1[bit_counter + 3 + WIDTH];

		out_data_10 <= row1[bit_counter - 1 + 2 * WIDTH];
		out_data_11 <= row1[bit_counter + 2 * WIDTH];
		out_data_12 <= row1[bit_counter + 1 + 2 * WIDTH]; 
		out_data_13 <= row1[bit_counter + 2 + 2 * WIDTH]; 
		out_data_14 <= row1[bit_counter + 3 + 2 * WIDTH];

		out_data_15 <= row1[bit_counter - 1 + 3 * WIDTH];
		out_data_16 <= row1[bit_counter + 3 * WIDTH];
		out_data_17 <= row1[bit_counter + 1 + 3 * WIDTH]; 
		out_data_18 <= row1[bit_counter + 2 + 3 * WIDTH]; 
		out_data_19 <= row1[bit_counter + 3 + 3 * WIDTH];

		out_data_20 <= row1[bit_counter - 1 + 4 * WIDTH];
		out_data_21 <= row1[bit_counter + 4 * WIDTH];
		out_data_22 <= row1[bit_counter + 1 + 4 * WIDTH]; 
		out_data_23 <= row1[bit_counter + 2 + 4 * WIDTH]; 
		out_data_24 <= row1[bit_counter + 3 + 4 * WIDTH];
		end
		else if (bit_counter == WIDTH * KERNEL_SIZE) begin
			bit_counter <= 5'b0;
			cs <= 0;
	    end
    end

endmodule