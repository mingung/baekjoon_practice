
module Mnist_CNN(
	clk, rst, in_data,
	
	decision, valid_out
);

input clk, rst;
input [7:0] in_data;

output [3:0] decision;
output valid_out;

wire signed [11:0] out_conv1, out_conv2, out_conv3;
wire signed [11:0] max1, max2, max3;
wire signed [11:0] out1_conv2, out2_conv2, out3_conv2;
wire signed [11:0] max2_1, max2_2, max2_3;
wire signed [11:0] fc_out;

wire valid_out_1, valid_out_2, valid_out_3, valid_out_4, valid_out_5;

conv_5ks_1 conv_5ks_1(
	clk, rst, in_data,
	
	out_conv1, out_conv2, out_conv3,
	valid_out_1
);

Pooling_relu #(.CONV_BIT(12), .HALF_WIDTH(12), .HALF_HEIGHT(12), .HALF_WIDTH_BIT(4)) 
Pooling_relu_1(
    clk, rst,
    valid_out_1,
    out_conv1, out_conv2, out_conv3,
	
    max1, max2, max3,
    valid_out_2
);

conv_5ks_2 conv_5ks_2(
	clk, rst, valid_out_2,
	max1, max2, max3,
	
	out1_conv2, out2_conv2, out3_conv2,
	valid_out_3
);

Pooling_relu #(.CONV_BIT(12), .HALF_WIDTH(4), .HALF_HEIGHT(4), .HALF_WIDTH_BIT(3)) 
Pooling_relu_2(
    clk, rst,
    valid_out_3,
    out1_conv2, out2_conv2, out3_conv2,
	
    max2_1, max2_2, max2_3,
    valid_out_4
);

fc_layer #(.NUM_INPUT_DATA(48), .NUM_OUTPUT_DATA(10))
fc_layer(
    clk, rst, valid_out_4,
    max2_1,
    max2_2,
    max2_3,

    valid_out_5,
    fc_out
);

comparator #(.INPUT_BITS(12), .NUM_CLASS(10))
comparator(
    clk, rst,
    valid_out_5,
    fc_out,
			   
    decision,
	valid_out
);  

endmodule
