module Convol_layer(clk,b1,b2,b3,b4,b5);
input clk;
output [19:0] b1;
output [19:0] b2;
output [19:0] b3;
output [19:0] b4;
output [19:0] b5;

wire signed[3:0] row1 [9:0]; 
wire signed[3:0] row2 [9:0]; 
wire signed[3:0] row3 [9:0]; 
wire signed[3:0] row4 [9:0]; 
wire signed[3:0] row5 [9:0]; 
wire signed[3:0] row6 [9:0]; 
wire signed[3:0] row7 [9:0]; 
wire signed[3:0] row8 [9:0]; 
wire signed[3:0] row9 [9:0];
wire signed[3:0] row10 [9:0];

wire signed [3:0] pooled1 [4:0];
wire signed [3:0] pooled2 [4:0];
wire signed [3:0] pooled3 [4:0];
wire signed [3:0] pooled4 [4:0];
wire signed [3:0] pooled5 [4:0];

wire [3:0] temp1 [9:0];
wire [3:0] temp2 [9:0];
wire [3:0] temp3 [9:0];
wire [3:0] temp4 [9:0];
wire [3:0] temp5 [9:0];
wire [3:0] temp6 [9:0];
wire [3:0] temp7 [9:0];
wire [3:0] temp8 [9:0];
wire [3:0] temp9 [9:0];
wire [3:0] temp10 [9:0];


wire [3:0] result_temp1 [9:0];
wire [3:0] result_temp2 [9:0];
wire [3:0] result_temp3 [9:0];
wire [3:0] result_temp4 [9:0];
wire [3:0] result_temp5 [9:0];
wire [3:0] result_temp6 [9:0];
wire [3:0] result_temp7 [9:0];
wire [3:0] result_temp8 [9:0];
wire [3:0] result_temp9 [9:0];
wire [3:0] result_temp10 [9:0];

parameter  zeroPad = 0;


wire signed[3:0] F1row1 [2:0];
wire signed[3:0] F1row2 [2:0];
wire signed[3:0] F1row3 [2:0];

wire signed[3:0] F2row1 [2:0];
wire signed[3:0] F2row2 [2:0];
wire signed[3:0] F2row3 [2:0];

wire signed[3:0] F3row1 [2:0];
wire signed[3:0] F3row2 [2:0];
wire signed[3:0] F3row3 [2:0];

assign F1row1[0] = 4'b0001;
assign F1row1[1] = 4'b0001;
assign F1row1[2] = 4'b0001;

assign F2row1[0] = 4'b0001;
assign F2row1[1] = 4'b0001;
assign F2row1[2] = 4'b0001;

assign F3row1[0] = 4'b0001;
assign F3row1[1] = 4'b0001;
assign F3row1[2] = 4'b0001;

assign row1[0] = 4'b0001;
assign row1[1] = 4'b0001;
assign row1[2] = 4'b0001;
assign row1[3] = 4'b0001;
assign row1[4] = 4'b0001;
assign row1[5] = 4'b0001;
assign row1[6] = 4'b0001;
assign row1[7] = 4'b0001;
assign row1[8] = 4'b0001;
assign row1[9] = 4'b0001;

assign row2[0] = 4'b0001;
assign row2[1] = 4'b0001;
assign row2[2] = 4'b0001;
assign row2[3] = 4'b0001;
assign row2[4] = 4'b0001;
assign row2[5] = 4'b0001;
assign row2[6] = 4'b0001;
assign row2[7] = 4'b0001;
assign row2[8] = 4'b0001;
assign row2[9] = 4'b0001;

assign row3[0] = 4'b0001;
assign row3[1] = 4'b0001;
assign row3[2] = 4'b0001;
assign row3[3] = 4'b0001;
assign row3[4] = 4'b0001;
assign row3[5] = 4'b0001;
assign row3[6] = 4'b0001;
assign row3[7] = 4'b0001;
assign row3[8] = 4'b0001;
assign row3[9] = 4'b0001;

assign row4[0] = 4'b0001;
assign row4[1] = 4'b0001;
assign row4[2] = 4'b0001;
assign row4[3] = 4'b0001;
assign row4[4] = 4'b0001;
assign row4[5] = 4'b0001;
assign row4[6] = 4'b0001;
assign row4[7] = 4'b0001;
assign row4[8] = 4'b0001;
assign row4[9] = 4'b0001;

assign row5[0] = 4'b0001;
assign row5[1] = 4'b0001;
assign row5[2] = 4'b0001;
assign row5[3] = 4'b0001;
assign row5[4] = 4'b0001;
assign row5[5] = 4'b0001;
assign row5[6] = 4'b0001;
assign row5[7] = 4'b0001;
assign row5[8] = 4'b0001;
assign row5[9] = 4'b0001;

assign row6[0] = 4'b0001;
assign row6[1] = 4'b0001;
assign row6[2] = 4'b0001;
assign row6[3] = 4'b0001;
assign row6[4] = 4'b0001;
assign row6[5] = 4'b0001;
assign row6[6] = 4'b0001;
assign row6[7] = 4'b0001;
assign row6[8] = 4'b0001;
assign row6[9] = 4'b0001;

assign row7[0] = 4'b0001;
assign row7[1] = 4'b0001;
assign row7[2] = 4'b0001;
assign row7[3] = 4'b0001;
assign row7[4] = 4'b0001;
assign row7[5] = 4'b0001;
assign row7[6] = 4'b0001;
assign row7[7] = 4'b0001;
assign row7[8] = 4'b0001;
assign row7[9] = 4'b0001;

assign row8[0] = 4'b0001;
assign row8[1] = 4'b0001;
assign row8[2] = 4'b0001;
assign row8[3] = 4'b0001;
assign row8[4] = 4'b0001;
assign row8[5] = 4'b0001;
assign row8[6] = 4'b0001;
assign row8[7] = 4'b0001;
assign row8[8] = 4'b0001;
assign row8[9] = 4'b0001;

assign row9[0] = 4'b0001;
assign row9[1] = 4'b0001;
assign row9[2] = 4'b0001;
assign row9[3] = 4'b0001;
assign row9[4] = 4'b0001;
assign row9[5] = 4'b0001;
assign row9[6] = 4'b0001;
assign row9[7] = 4'b0001;
assign row9[8] = 4'b0001;
assign row9[9] = 4'b0001;

assign row10[0] = 4'b0001;
assign row10[1] = 4'b0001;
assign row10[2] = 4'b0001;
assign row10[3] = 4'b0001;
assign row10[4] = 4'b0001;
assign row10[5] = 4'b0001;
assign row10[6] = 4'b0001;
assign row10[7] = 4'b0001;
assign row10[8] = 4'b0001;
assign row10[9] = 4'b0001;

// 1행
assign temp1[9] = (zeroPad*F1row1[2] + zeroPad*F1row1[1] + zeroPad*F1row1[0] + zeroPad*F1row2[2] + row1[9]*F1row2[1] + row1[8]*F1row2[0] + zeroPad*F1row3[2] + row2[9]*F1row3[1] + row2[8]*F1row3[0]);
assign temp1[8] = (zeroPad*F1row1[2] + zeroPad*F1row1[1] + zeroPad*F1row1[0] + row1[9]*F1row2[2] + row1[8]*F1row2[1] + row1[7]*F1row2[0] + row2[9]*F1row3[2] + row2[8]*F1row3[1] + row2[7]*F1row3[0]);
assign temp1[7] = (zeroPad*F1row1[2] + zeroPad*F1row1[1] + zeroPad*F1row1[0] + row1[8]*F1row2[2] + row1[7]*F1row2[1] + row1[6]*F1row2[0] + row2[8]*F1row3[2] + row2[7]*F1row3[1] + row2[6]*F1row3[0]);
assign temp1[6] = (zeroPad*F1row1[2] + zeroPad*F1row1[1] + zeroPad*F1row1[0] + row1[7]*F1row2[2] + row1[6]*F1row2[1] + row1[5]*F1row2[0] + row2[7]*F1row3[2] + row2[6]*F1row3[1] + row2[5]*F1row3[0]);
assign temp1[5] = (zeroPad*F1row1[2] + zeroPad*F1row1[1] + zeroPad*F1row1[0] + row1[6]*F1row2[2] + row1[5]*F1row2[1] + row1[4]*F1row2[0] + row2[6]*F1row3[2] + row2[5]*F1row3[1] + row2[4]*F1row3[0]);
assign temp1[4] = (zeroPad*F1row1[2] + zeroPad*F1row1[1] + zeroPad*F1row1[0] + row1[5]*F1row2[2] + row1[4]*F1row2[1] + row1[3]*F1row2[0] + row2[5]*F1row3[2] + row2[4]*F1row3[1] + row2[3]*F1row3[0]);
assign temp1[3] = (zeroPad*F1row1[2] + zeroPad*F1row1[1] + zeroPad*F1row1[0] + row1[4]*F1row2[2] + row1[3]*F1row2[1] + row1[2]*F1row2[0] + row2[4]*F1row3[2] + row2[3]*F1row3[1] + row2[2]*F1row3[0]);
assign temp1[2] = (zeroPad*F1row1[2] + zeroPad*F1row1[1] + zeroPad*F1row1[0] + row1[3]*F1row2[2] + row1[2]*F1row2[1] + row1[1]*F1row2[0] + row2[3]*F1row3[2] + row2[2]*F1row3[1] + row2[1]*F1row3[0]);
assign temp1[1] = (zeroPad*F1row1[2] + zeroPad*F1row1[1] + zeroPad*F1row1[0] + row1[2]*F1row2[2] + row1[1]*F1row2[1] + row1[0]*F1row2[0] + row2[2]*F1row3[2] + row2[1]*F1row3[1] + row2[0]*F1row3[0]);
assign temp1[0] = (zeroPad*F1row1[2] + zeroPad*F1row1[1] + zeroPad*F1row1[0] + row1[1]*F1row2[2] + row1[0]*F1row2[1] + zeroPad*F1row2[0] + row2[1]*F1row3[2] + row2[0]*F1row3[1] + zeroPad*F1row3[0]);
// 2행
assign temp2[9] = (zeroPad*F1row1[2] + row1[9]*F1row1[1] + row1[8]*F1row1[0] + zeroPad*F1row2[2] + row2[9]*F1row2[1] + row2[8]*F1row2[0] + zeroPad*F1row3[2] + row3[9]*F1row3[1] + row3[8]*F1row3[0]);
assign temp2[8] = (row1[9]*F1row1[2] + row1[8]*F1row1[1] + row1[7]*F1row1[0] + row2[9]*F1row2[2] + row2[8]*F1row2[1] + row2[7]*F1row2[0] + row3[9]*F1row3[2] + row3[8]*F1row3[1] + row3[7]*F1row3[0]);
assign temp2[7] = (row1[8]*F1row1[2] + row1[7]*F1row1[1] + row1[6]*F1row1[0] + row2[8]*F1row2[2] + row2[7]*F1row2[1] + row2[6]*F1row2[0] + row3[8]*F1row3[2] + row3[7]*F1row3[1] + row3[6]*F1row3[0]);
assign temp2[6] = (row1[7]*F1row1[2] + row1[6]*F1row1[1] + row1[5]*F1row1[0] + row2[7]*F1row2[2] + row2[6]*F1row2[1] + row2[5]*F1row2[0] + row3[7]*F1row3[2] + row3[6]*F1row3[1] + row3[5]*F1row3[0]);
assign temp2[5] = (row1[6]*F1row1[2] + row1[5]*F1row1[1] + row1[4]*F1row1[0] + row2[6]*F1row2[2] + row2[5]*F1row2[1] + row2[4]*F1row2[0] + row3[6]*F1row3[2] + row3[5]*F1row3[1] + row3[4]*F1row3[0]);
assign temp2[4] = (row1[5]*F1row1[2] + row1[4]*F1row1[1] + row1[3]*F1row1[0] + row2[5]*F1row2[2] + row2[4]*F1row2[1] + row2[3]*F1row2[0] + row3[5]*F1row3[2] + row3[4]*F1row3[1] + row3[3]*F1row3[0]);
assign temp2[3] = (row1[4]*F1row1[2] + row1[3]*F1row1[1] + row1[2]*F1row1[0] + row2[4]*F1row2[2] + row2[3]*F1row2[1] + row2[2]*F1row2[0] + row3[4]*F1row3[2] + row3[3]*F1row3[1] + row3[2]*F1row3[0]);
assign temp2[2] = (row1[3]*F1row1[2] + row1[2]*F1row1[1] + row1[1]*F1row1[0] + row2[3]*F1row2[2] + row2[2]*F1row2[1] + row2[1]*F1row2[0] + row3[3]*F1row3[2] + row3[2]*F1row3[1] + row3[1]*F1row3[0]);
assign temp2[1] = (row1[2]*F1row1[2] + row1[1]*F1row1[1] + row1[0]*F1row1[0] + row2[2]*F1row2[2] + row2[1]*F1row2[1] + row2[0]*F1row2[0] + row3[2]*F1row3[2] + row3[1]*F1row3[1] + row3[0]*F1row3[0]);
assign temp2[0] = (row1[1]*F1row1[2] + row1[0]*F1row1[1] + zeroPad*F1row1[0] + row2[1]*F1row2[2] + row2[0]*F1row2[1] + zeroPad*F1row2[0] + row3[1]*F1row3[2] + row3[0]*F1row3[1] + zeroPad*F1row3[0]);
// 3행
assign temp3[9] = (zeroPad*F1row1[2] + row2[9]*F1row1[1] + row2[8]*F1row1[0] + zeroPad*F1row2[2] + row3[9]*F1row2[1] + row3[8]*F1row2[0] + zeroPad*F1row3[2] + row4[9]*F1row3[1] + row4[8]*F1row3[0]);
assign temp3[8] = (row2[9]*F1row1[2] + row2[8]*F1row1[1] + row2[7]*F1row1[0] + row3[9]*F1row2[2] + row3[8]*F1row2[1] + row3[7]*F1row2[0] + row4[9]*F1row3[2] + row4[8]*F1row3[1] + row4[7]*F1row3[0]);
assign temp3[7] = (row2[8]*F1row1[2] + row2[7]*F1row1[1] + row2[6]*F1row1[0] + row3[8]*F1row2[2] + row3[7]*F1row2[1] + row3[6]*F1row2[0] + row4[8]*F1row3[2] + row4[7]*F1row3[1] + row4[6]*F1row3[0]);
assign temp3[6] = (row2[7]*F1row1[2] + row2[6]*F1row1[1] + row2[5]*F1row1[0] + row3[7]*F1row2[2] + row3[6]*F1row2[1] + row3[5]*F1row2[0] + row4[7]*F1row3[2] + row4[6]*F1row3[1] + row4[5]*F1row3[0]);
assign temp3[5] = (row2[6]*F1row1[2] + row2[5]*F1row1[1] + row2[4]*F1row1[0] + row3[6]*F1row2[2] + row3[5]*F1row2[1] + row3[4]*F1row2[0] + row4[6]*F1row3[2] + row4[5]*F1row3[1] + row4[4]*F1row3[0]);
assign temp3[4] = (row2[5]*F1row1[2] + row2[4]*F1row1[1] + row2[3]*F1row1[0] + row3[5]*F1row2[2] + row3[4]*F1row2[1] + row3[3]*F1row2[0] + row4[5]*F1row3[2] + row4[4]*F1row3[1] + row4[3]*F1row3[0]);
assign temp3[3] = (row2[4]*F1row1[2] + row2[3]*F1row1[1] + row2[2]*F1row1[0] + row3[4]*F1row2[2] + row3[3]*F1row2[1] + row3[2]*F1row2[0] + row4[4]*F1row3[2] + row4[3]*F1row3[1] + row4[2]*F1row3[0]);
assign temp3[2] = (row2[3]*F1row1[2] + row2[2]*F1row1[1] + row2[1]*F1row1[0] + row3[3]*F1row2[2] + row3[2]*F1row2[1] + row3[1]*F1row2[0] + row4[3]*F1row3[2] + row4[2]*F1row3[1] + row4[1]*F1row3[0]);
assign temp3[1] = (row2[2]*F1row1[2] + row2[1]*F1row1[1] + row2[0]*F1row1[0] + row3[2]*F1row2[2] + row3[1]*F1row2[1] + row3[0]*F1row2[0] + row4[2]*F1row3[2] + row4[1]*F1row3[1] + row4[0]*F1row3[0]);
assign temp3[0] = (row2[1]*F1row1[2] + row2[0]*F1row1[1] + zeroPad*F1row1[0] + row3[1]*F1row2[2] + row3[0]*F1row2[1] + zeroPad*F1row2[0] + row4[1]*F1row3[2] + row4[0]*F1row3[1] + zeroPad*F1row3[0]);
// 4행
assign temp4[9] = (zeroPad*F1row1[2] + row3[9]*F1row1[1] + row3[8]*F1row1[0] + zeroPad*F1row2[2] + row4[9]*F1row2[1] + row4[8]*F1row2[0] + zeroPad*F1row3[2] + row5[9]*F1row3[1] + row5[8]*F1row3[0]);
assign temp4[8] = (row3[9]*F1row1[2] + row3[8]*F1row1[1] + row3[7]*F1row1[0] + row4[9]*F1row2[2] + row4[8]*F1row2[1] + row4[7]*F1row2[0] + row5[9]*F1row3[2] + row5[8]*F1row3[1] + row5[7]*F1row3[0]);
assign temp4[7] = (row3[8]*F1row1[2] + row3[7]*F1row1[1] + row3[6]*F1row1[0] + row4[8]*F1row2[2] + row4[7]*F1row2[1] + row4[6]*F1row2[0] + row5[8]*F1row3[2] + row5[7]*F1row3[1] + row5[6]*F1row3[0]);
assign temp4[6] = (row3[7]*F1row1[2] + row3[6]*F1row1[1] + row3[5]*F1row1[0] + row4[7]*F1row2[2] + row4[6]*F1row2[1] + row4[5]*F1row2[0] + row5[7]*F1row3[2] + row5[6]*F1row3[1] + row5[5]*F1row3[0]);
assign temp4[5] = (row3[6]*F1row1[2] + row3[5]*F1row1[1] + row3[4]*F1row1[0] + row4[6]*F1row2[2] + row4[5]*F1row2[1] + row4[4]*F1row2[0] + row5[6]*F1row3[2] + row5[5]*F1row3[1] + row5[4]*F1row3[0]);
assign temp4[4] = (row3[5]*F1row1[2] + row3[4]*F1row1[1] + row3[3]*F1row1[0] + row4[5]*F1row2[2] + row4[4]*F1row2[1] + row4[3]*F1row2[0] + row5[5]*F1row3[2] + row5[4]*F1row3[1] + row5[3]*F1row3[0]);
assign temp4[3] = (row3[4]*F1row1[2] + row3[3]*F1row1[1] + row3[2]*F1row1[0] + row4[4]*F1row2[2] + row4[3]*F1row2[1] + row4[2]*F1row2[0] + row5[4]*F1row3[2] + row5[3]*F1row3[1] + row5[2]*F1row3[0]);
assign temp4[2] = (row3[3]*F1row1[2] + row3[2]*F1row1[1] + row3[1]*F1row1[0] + row4[3]*F1row2[2] + row4[2]*F1row2[1] + row4[1]*F1row2[0] + row5[3]*F1row3[2] + row5[2]*F1row3[1] + row5[1]*F1row3[0]);
assign temp4[1] = (row3[2]*F1row1[2] + row3[1]*F1row1[1] + row3[0]*F1row1[0] + row4[2]*F1row2[2] + row4[1]*F1row2[1] + row4[0]*F1row2[0] + row5[2]*F1row3[2] + row5[1]*F1row3[1] + row5[0]*F1row3[0]);
assign temp4[0] = (row3[1]*F1row1[2] + row3[0]*F1row1[1] + zeroPad*F1row1[0] + row4[1]*F1row2[2] + row4[0]*F1row2[1] + zeroPad*F1row2[0] + row5[1]*F1row3[2] + row5[0]*F1row3[1] + zeroPad*F1row3[0]);
// 5행
assign temp5[9] = (zeroPad*F1row1[2] + row4[9]*F1row1[1] + row4[8]*F1row1[0] + zeroPad*F1row2[2] + row5[9]*F1row2[1] + row5[8]*F1row2[0] + zeroPad*F1row3[2] + row6[9]*F1row3[1] + row6[8]*F1row3[0]);
assign temp5[8] = (row4[9]*F1row1[2] + row4[8]*F1row1[1] + row4[7]*F1row1[0] + row5[9]*F1row2[2] + row5[8]*F1row2[1] + row5[7]*F1row2[0] + row6[9]*F1row3[2] + row6[8]*F1row3[1] + row6[7]*F1row3[0]);
assign temp5[7] = (row4[8]*F1row1[2] + row4[7]*F1row1[1] + row4[6]*F1row1[0] + row5[8]*F1row2[2] + row5[7]*F1row2[1] + row5[6]*F1row2[0] + row6[8]*F1row3[2] + row6[7]*F1row3[1] + row6[6]*F1row3[0]);
assign temp5[6] = (row4[7]*F1row1[2] + row4[6]*F1row1[1] + row4[5]*F1row1[0] + row5[7]*F1row2[2] + row5[6]*F1row2[1] + row5[5]*F1row2[0] + row6[7]*F1row3[2] + row6[6]*F1row3[1] + row6[5]*F1row3[0]);
assign temp5[5] = (row4[6]*F1row1[2] + row4[5]*F1row1[1] + row4[4]*F1row1[0] + row5[6]*F1row2[2] + row5[5]*F1row2[1] + row5[4]*F1row2[0] + row6[6]*F1row3[2] + row6[5]*F1row3[1] + row6[4]*F1row3[0]);
assign temp5[4] = (row4[5]*F1row1[2] + row4[4]*F1row1[1] + row4[3]*F1row1[0] + row5[5]*F1row2[2] + row5[4]*F1row2[1] + row5[3]*F1row2[0] + row6[5]*F1row3[2] + row6[4]*F1row3[1] + row6[3]*F1row3[0]);
assign temp5[3] = (row4[4]*F1row1[2] + row4[3]*F1row1[1] + row4[2]*F1row1[0] + row5[4]*F1row2[2] + row5[3]*F1row2[1] + row5[2]*F1row2[0] + row6[4]*F1row3[2] + row6[3]*F1row3[1] + row6[2]*F1row3[0]);
assign temp5[2] = (row4[3]*F1row1[2] + row4[2]*F1row1[1] + row4[1]*F1row1[0] + row5[3]*F1row2[2] + row5[2]*F1row2[1] + row5[1]*F1row2[0] + row6[3]*F1row3[2] + row6[2]*F1row3[1] + row6[1]*F1row3[0]);
assign temp5[1] = (row4[2]*F1row1[2] + row4[1]*F1row1[1] + row4[0]*F1row1[0] + row5[2]*F1row2[2] + row5[1]*F1row2[1] + row5[0]*F1row2[0] + row6[2]*F1row3[2] + row6[1]*F1row3[1] + row6[0]*F1row3[0]);
assign temp5[0] = (row4[1]*F1row1[2] + row4[0]*F1row1[1] + zeroPad*F1row1[0] + row5[1]*F1row2[2] + row5[0]*F1row2[1] + zeroPad*F1row2[0] + row6[1]*F1row3[2] + row6[0]*F1row3[1] + zeroPad*F1row3[0]);
// 6행
assign temp6[9] = (zeroPad*F1row1[2] + row5[9]*F1row1[1] + row5[8]*F1row1[0] + zeroPad*F1row2[2] + row6[9]*F1row2[1] + row6[8]*F1row2[0] + zeroPad*F1row3[2] + row7[9]*F1row3[1] + row7[8]*F1row3[0]);
assign temp6[8] = (row5[9]*F1row1[2] + row5[8]*F1row1[1] + row5[7]*F1row1[0] + row6[9]*F1row2[2] + row6[8]*F1row2[1] + row6[7]*F1row2[0] + row7[9]*F1row3[2] + row7[8]*F1row3[1] + row7[7]*F1row3[0]);
assign temp6[7] = (row5[8]*F1row1[2] + row5[7]*F1row1[1] + row5[6]*F1row1[0] + row6[8]*F1row2[2] + row6[7]*F1row2[1] + row6[6]*F1row2[0] + row7[8]*F1row3[2] + row7[7]*F1row3[1] + row7[6]*F1row3[0]);
assign temp6[6] = (row5[7]*F1row1[2] + row5[6]*F1row1[1] + row5[5]*F1row1[0] + row6[7]*F1row2[2] + row6[6]*F1row2[1] + row6[5]*F1row2[0] + row7[7]*F1row3[2] + row7[6]*F1row3[1] + row7[5]*F1row3[0]);
assign temp6[5] = (row5[6]*F1row1[2] + row5[5]*F1row1[1] + row5[4]*F1row1[0] + row6[6]*F1row2[2] + row6[5]*F1row2[1] + row6[4]*F1row2[0] + row7[6]*F1row3[2] + row7[5]*F1row3[1] + row7[4]*F1row3[0]);
assign temp6[4] = (row5[5]*F1row1[2] + row5[4]*F1row1[1] + row5[3]*F1row1[0] + row6[5]*F1row2[2] + row6[4]*F1row2[1] + row6[3]*F1row2[0] + row7[5]*F1row3[2] + row7[4]*F1row3[1] + row7[3]*F1row3[0]);
assign temp6[3] = (row5[4]*F1row1[2] + row5[3]*F1row1[1] + row5[2]*F1row1[0] + row6[4]*F1row2[2] + row6[3]*F1row2[1] + row6[2]*F1row2[0] + row7[4]*F1row3[2] + row7[3]*F1row3[1] + row7[2]*F1row3[0]);
assign temp6[2] = (row5[3]*F1row1[2] + row5[2]*F1row1[1] + row5[1]*F1row1[0] + row6[3]*F1row2[2] + row6[2]*F1row2[1] + row6[1]*F1row2[0] + row7[3]*F1row3[2] + row7[2]*F1row3[1] + row7[1]*F1row3[0]);
assign temp6[1] = (row5[2]*F1row1[2] + row5[1]*F1row1[1] + row5[0]*F1row1[0] + row6[2]*F1row2[2] + row6[1]*F1row2[1] + row6[0]*F1row2[0] + row7[2]*F1row3[2] + row7[1]*F1row3[1] + row7[0]*F1row3[0]);
assign temp6[0] = (row5[1]*F1row1[2] + row5[0]*F1row1[1] + zeroPad*F1row1[0] + row6[1]*F1row2[2] + row6[0]*F1row2[1] + zeroPad*F1row2[0] + row7[1]*F1row3[2] + row7[0]*F1row3[1] + zeroPad*F1row3[0]);
// 7행
assign temp7[9] = (zeroPad*F1row1[2] + row6[9]*F1row1[1] + row6[8]*F1row1[0] + zeroPad*F1row2[2] + row7[9]*F1row2[1] + row7[8]*F1row2[0] + zeroPad*F1row3[2] + row8[9]*F1row3[1] + row8[8]*F1row3[0]);
assign temp7[8] = (row6[9]*F1row1[2] + row6[8]*F1row1[1] + row6[7]*F1row1[0] + row7[9]*F1row2[2] + row7[8]*F1row2[1] + row7[7]*F1row2[0] + row8[9]*F1row3[2] + row8[8]*F1row3[1] + row8[7]*F1row3[0]);
assign temp7[7] = (row6[8]*F1row1[2] + row6[7]*F1row1[1] + row6[6]*F1row1[0] + row7[8]*F1row2[2] + row7[7]*F1row2[1] + row7[6]*F1row2[0] + row8[8]*F1row3[2] + row8[7]*F1row3[1] + row8[6]*F1row3[0]);
assign temp7[6] = (row6[7]*F1row1[2] + row6[6]*F1row1[1] + row6[5]*F1row1[0] + row7[7]*F1row2[2] + row7[6]*F1row2[1] + row7[5]*F1row2[0] + row8[7]*F1row3[2] + row8[6]*F1row3[1] + row8[5]*F1row3[0]);
assign temp7[5] = (row6[6]*F1row1[2] + row6[5]*F1row1[1] + row6[4]*F1row1[0] + row7[6]*F1row2[2] + row7[5]*F1row2[1] + row7[4]*F1row2[0] + row8[6]*F1row3[2] + row8[5]*F1row3[1] + row8[4]*F1row3[0]);
assign temp7[4] = (row6[5]*F1row1[2] + row6[4]*F1row1[1] + row6[3]*F1row1[0] + row7[5]*F1row2[2] + row7[4]*F1row2[1] + row7[3]*F1row2[0] + row8[5]*F1row3[2] + row8[4]*F1row3[1] + row8[3]*F1row3[0]);
assign temp7[3] = (row6[4]*F1row1[2] + row6[3]*F1row1[1] + row6[2]*F1row1[0] + row7[4]*F1row2[2] + row7[3]*F1row2[1] + row7[2]*F1row2[0] + row8[4]*F1row3[2] + row8[3]*F1row3[1] + row8[2]*F1row3[0]);
assign temp7[2] = (row6[3]*F1row1[2] + row6[2]*F1row1[1] + row6[1]*F1row1[0] + row7[3]*F1row2[2] + row7[2]*F1row2[1] + row7[1]*F1row2[0] + row8[3]*F1row3[2] + row8[2]*F1row3[1] + row8[1]*F1row3[0]);
assign temp7[1] = (row6[2]*F1row1[2] + row6[1]*F1row1[1] + row6[0]*F1row1[0] + row7[2]*F1row2[2] + row7[1]*F1row2[1] + row7[0]*F1row2[0] + row8[2]*F1row3[2] + row8[1]*F1row3[1] + row8[0]*F1row3[0]);
assign temp7[0] = (row6[1]*F1row1[2] + row6[0]*F1row1[1] + zeroPad*F1row1[0] + row7[1]*F1row2[2] + row7[0]*F1row2[1] + zeroPad*F1row2[0] + row8[1]*F1row3[2] + row8[0]*F1row3[1] + zeroPad*F1row3[0]);
// 8행
assign temp8[9] = (zeroPad*F1row1[2] + row7[9]*F1row1[1] + row7[8]*F1row1[0] + zeroPad*F1row2[2] + row8[9]*F1row2[1] + row8[8]*F1row2[0] + zeroPad*F1row3[2] + row9[9]*F1row3[1] + row9[8]*F1row3[0]);
assign temp8[8] = (row7[9]*F1row1[2] + row7[8]*F1row1[1] + row7[7]*F1row1[0] + row8[9]*F1row2[2] + row8[8]*F1row2[1] + row8[7]*F1row2[0] + row9[9]*F1row3[2] + row9[8]*F1row3[1] + row9[7]*F1row3[0]);
assign temp8[7] = (row7[8]*F1row1[2] + row7[7]*F1row1[1] + row7[6]*F1row1[0] + row8[8]*F1row2[2] + row8[7]*F1row2[1] + row8[6]*F1row2[0] + row9[8]*F1row3[2] + row9[7]*F1row3[1] + row9[6]*F1row3[0]);
assign temp8[6] = (row7[7]*F1row1[2] + row7[6]*F1row1[1] + row7[5]*F1row1[0] + row8[7]*F1row2[2] + row8[6]*F1row2[1] + row8[5]*F1row2[0] + row9[7]*F1row3[2] + row9[6]*F1row3[1] + row9[5]*F1row3[0]);
assign temp8[5] = (row7[6]*F1row1[2] + row7[5]*F1row1[1] + row7[4]*F1row1[0] + row8[6]*F1row2[2] + row8[5]*F1row2[1] + row8[4]*F1row2[0] + row9[6]*F1row3[2] + row9[5]*F1row3[1] + row9[4]*F1row3[0]);
assign temp8[4] = (row7[5]*F1row1[2] + row7[4]*F1row1[1] + row7[3]*F1row1[0] + row8[5]*F1row2[2] + row8[4]*F1row2[1] + row8[3]*F1row2[0] + row9[5]*F1row3[2] + row9[4]*F1row3[1] + row9[3]*F1row3[0]);
assign temp8[3] = (row7[4]*F1row1[2] + row7[3]*F1row1[1] + row7[2]*F1row1[0] + row8[4]*F1row2[2] + row8[3]*F1row2[1] + row8[2]*F1row2[0] + row9[4]*F1row3[2] + row9[3]*F1row3[1] + row9[2]*F1row3[0]);
assign temp8[2] = (row7[3]*F1row1[2] + row7[2]*F1row1[1] + row7[1]*F1row1[0] + row8[3]*F1row2[2] + row8[2]*F1row2[1] + row8[1]*F1row2[0] + row9[3]*F1row3[2] + row9[2]*F1row3[1] + row9[1]*F1row3[0]);
assign temp8[1] = (row7[2]*F1row1[2] + row7[1]*F1row1[1] + row7[0]*F1row1[0] + row8[2]*F1row2[2] + row8[1]*F1row2[1] + row8[0]*F1row2[0] + row9[2]*F1row3[2] + row9[1]*F1row3[1] + row9[0]*F1row3[0]);
assign temp8[0] = (row7[1]*F1row1[2] + row7[0]*F1row1[1] + zeroPad*F1row1[0] + row8[1]*F1row2[2] + row8[0]*F1row2[1] + zeroPad*F1row2[0] + row9[1]*F1row3[2] + row9[0]*F1row3[1] + zeroPad*F1row3[0]);
// 9행
assign temp9[9] = (zeroPad*F1row1[2] + row8[9]*F1row1[1] + row8[8]*F1row1[0] + zeroPad*F1row2[2] + row9[9]*F1row2[1] + row9[8]*F1row2[0] + zeroPad*F1row3[2] + row10[9]*F1row3[1] + row10[8]*F1row3[0]);
assign temp9[8] = (row8[9]*F1row1[2] + row8[8]*F1row1[1] + row8[7]*F1row1[0] + row9[9]*F1row2[2] + row9[8]*F1row2[1] + row9[7]*F1row2[0] + row10[9]*F1row3[2] + row10[8]*F1row3[1] + row10[7]*F1row3[0]);
assign temp9[7] = (row8[8]*F1row1[2] + row8[7]*F1row1[1] + row8[6]*F1row1[0] + row9[8]*F1row2[2] + row9[7]*F1row2[1] + row9[6]*F1row2[0] + row10[8]*F1row3[2] + row10[7]*F1row3[1] + row10[6]*F1row3[0]);
assign temp9[6] = (row8[7]*F1row1[2] + row8[6]*F1row1[1] + row8[5]*F1row1[0] + row9[7]*F1row2[2] + row9[6]*F1row2[1] + row9[5]*F1row2[0] + row10[7]*F1row3[2] + row10[6]*F1row3[1] + row10[5]*F1row3[0]);
assign temp9[5] = (row8[6]*F1row1[2] + row8[5]*F1row1[1] + row8[4]*F1row1[0] + row9[6]*F1row2[2] + row9[5]*F1row2[1] + row9[4]*F1row2[0] + row10[6]*F1row3[2] + row10[5]*F1row3[1] + row10[4]*F1row3[0]);
assign temp9[4] = (row8[5]*F1row1[2] + row8[4]*F1row1[1] + row8[3]*F1row1[0] + row9[5]*F1row2[2] + row9[4]*F1row2[1] + row9[3]*F1row2[0] + row10[5]*F1row3[2] + row10[4]*F1row3[1] + row10[3]*F1row3[0]);
assign temp9[3] = (row8[4]*F1row1[2] + row8[3]*F1row1[1] + row8[2]*F1row1[0] + row9[4]*F1row2[2] + row9[3]*F1row2[1] + row9[2]*F1row2[0] + row10[4]*F1row3[2] + row10[3]*F1row3[1] + row10[2]*F1row3[0]);
assign temp9[2] = (row8[3]*F1row1[2] + row8[2]*F1row1[1] + row8[1]*F1row1[0] + row9[3]*F1row2[2] + row9[2]*F1row2[1] + row9[1]*F1row2[0] + row10[3]*F1row3[2] + row10[2]*F1row3[1] + row10[1]*F1row3[0]);
assign temp9[1] = (row8[2]*F1row1[2] + row8[1]*F1row1[1] + row8[0]*F1row1[0] + row9[2]*F1row2[2] + row9[1]*F1row2[1] + row9[0]*F1row2[0] + row10[2]*F1row3[2] + row10[1]*F1row3[1] + row10[0]*F1row3[0]);
assign temp9[0] = (row8[1]*F1row1[2] + row8[0]*F1row1[1] + zeroPad*F1row1[0] + row9[1]*F1row2[2] + row9[0]*F1row2[1] + zeroPad*F1row2[0] + row10[1]*F1row3[2] + row10[0]*F1row3[1] + zeroPad*F1row3[0]);
// 10행
assign temp10[9] = (zeroPad*F1row1[2] + row9[9]*F1row1[1] + row9[8]*F1row1[0] + zeroPad*F1row2[2] + row10[9]*F1row2[1] + row10[8]*F1row2[0] + zeroPad*F1row3[2] + zeroPad*F1row3[1] + zeroPad*F1row3[0]);
assign temp10[8] = (row9[9]*F1row1[2] + row9[8]*F1row1[1] + row9[7]*F1row1[0] + row10[9]*F1row2[2] + row10[8]*F1row2[1] + row10[7]*F1row2[0] + zeroPad*F1row3[2] + zeroPad*F1row3[1] + zeroPad*F1row3[0]);
assign temp10[7] = (row9[8]*F1row1[2] + row9[7]*F1row1[1] + row9[6]*F1row1[0] + row10[8]*F1row2[2] + row10[7]*F1row2[1] + row10[6]*F1row2[0] + zeroPad*F1row3[2] + zeroPad*F1row3[1] + zeroPad*F1row3[0]);
assign temp10[6] = (row9[7]*F1row1[2] + row9[6]*F1row1[1] + row9[5]*F1row1[0] + row10[7]*F1row2[2] + row10[6]*F1row2[1] + row10[5]*F1row2[0] + zeroPad*F1row3[2] + zeroPad*F1row3[1] + zeroPad*F1row3[0]);
assign temp10[5] = (row9[6]*F1row1[2] + row9[5]*F1row1[1] + row9[4]*F1row1[0] + row10[6]*F1row2[2] + row10[5]*F1row2[1] + row10[4]*F1row2[0] + zeroPad*F1row3[2] + zeroPad*F1row3[1] + zeroPad*F1row3[0]);
assign temp10[4] = (row9[5]*F1row1[2] + row9[4]*F1row1[1] + row9[3]*F1row1[0] + row10[5]*F1row2[2] + row10[4]*F1row2[1] + row10[3]*F1row2[0] + zeroPad*F1row3[2] + zeroPad*F1row3[1] + zeroPad*F1row3[0]);
assign temp10[3] = (row9[4]*F1row1[2] + row9[3]*F1row1[1] + row9[2]*F1row1[0] + row10[4]*F1row2[2] + row10[3]*F1row2[1] + row10[2]*F1row2[0] + zeroPad*F1row3[2] + zeroPad*F1row3[1] + zeroPad*F1row3[0]);
assign temp10[2] = (row9[3]*F1row1[2] + row9[2]*F1row1[1] + row9[1]*F1row1[0] + row10[3]*F1row2[2] + row10[2]*F1row2[1] + row10[1]*F1row2[0] + zeroPad*F1row3[2] + zeroPad*F1row3[1] + zeroPad*F1row3[0]);
assign temp10[1] = (row9[2]*F1row1[2] + row9[1]*F1row1[1] + row9[0]*F1row1[0] + row10[2]*F1row2[2] + row10[1]*F1row2[1] + row10[0]*F1row2[0] + zeroPad*F1row3[2] + zeroPad*F1row3[1] + zeroPad*F1row3[0]);
assign temp10[0] = (row9[1]*F1row1[2] + row9[0]*F1row1[1] + zeroPad*F1row1[0] + row10[1]*F1row2[2] + row10[0]*F1row2[1] + zeroPad*F1row2[0] + zeroPad*F1row3[2] + zeroPad*F1row3[1] + zeroPad*F1row3[0]);

// ReLU 적용
genvar i;
generate
    for (i = 0; i < 10; i = i + 1) begin: relu_block
        assign result_temp1[i] = temp1[i] > 0 ? temp1[i] : 0;
        assign result_temp2[i] = temp2[i] > 0 ? temp2[i] : 0;
        assign result_temp3[i] = temp3[i] > 0 ? temp3[i] : 0;
        assign result_temp4[i] = temp4[i] > 0 ? temp4[i] : 0;
        assign result_temp5[i] = temp5[i] > 0 ? temp5[i] : 0;
        assign result_temp6[i] = temp6[i] > 0 ? temp6[i] : 0;
        assign result_temp7[i] = temp7[i] > 0 ? temp7[i] : 0;
        assign result_temp8[i] = temp8[i] > 0 ? temp8[i] : 0;
        assign result_temp9[i] = temp9[i] > 0 ? temp9[i] : 0;
        assign result_temp10[i] = temp10[i] > 0 ? temp10[i] : 0;
    end
endgenerate

// 맥스 풀링 적용
generate
    for (i = 0; i < 5; i = i + 1) begin: maxpool_block
        // 각 행마다 2x2 영역에서 최대값을 선택
        assign pooled1[i] = max4(result_temp1[2*i], result_temp1[2*i+1], result_temp2[2*i], result_temp2[2*i+1]);
        assign pooled2[i] = max4(result_temp3[2*i], result_temp3[2*i+1], result_temp4[2*i], result_temp4[2*i+1]);
        assign pooled3[i] = max4(result_temp5[2*i], result_temp5[2*i+1], result_temp6[2*i], result_temp6[2*i+1]);
        assign pooled4[i] = max4(result_temp7[2*i], result_temp7[2*i+1], result_temp8[2*i], result_temp8[2*i+1]);
        assign pooled5[i] = max4(result_temp9[2*i], result_temp9[2*i+1], result_temp10[2*i], result_temp10[2*i+1]);
    end
endgenerate

// 4개의 값 중 최대값을 선택하는 함수
function signed [3:0] max4(
    input signed [3:0] a,
    input signed [3:0] b,
    input signed [3:0] c,
    input signed [3:0] d
);
    begin
        max4 = (a > b) ? a : b;
        max4 = (max4 > c) ? max4 : c;
        max4 = (max4 > d) ? max4 : d;
    end
endfunction

assign b1 = {pooled1[4], pooled1[3], pooled1[2], pooled1[1], pooled1[0]};
assign b2 = {pooled2[4], pooled2[3], pooled2[2], pooled2[1], pooled2[0]};
assign b3 = {pooled3[4], pooled3[3], pooled3[2], pooled3[1], pooled3[0]};
assign b4 = {pooled4[4], pooled4[3], pooled4[2], pooled4[1], pooled4[0]};
assign b5 = {pooled5[4], pooled5[3], pooled5[2], pooled5[1], pooled5[0]};
endmodule