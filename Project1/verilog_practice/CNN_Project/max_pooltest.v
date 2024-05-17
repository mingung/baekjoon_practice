module Convol_layer(temp1, temp2, temp3, temp4, b1);
    input [3:0] temp1;
    input [3:0] temp2;
    input [3:0] temp3;
    input [3:0] temp4;
    wire [1:0] row1, row2, row3, row4;
    output [3:0] b1;

    // 상단 왼쪽 2x2
    assign row1[1] = (temp1[3] >= temp1[2]) ? temp1[3] : temp1[2];
    assign row1[0] = (temp2[3] >= temp2[2]) ? temp2[3] : temp2[2];
    assign b1[3] = (row1[1] >= row1[0]) ? row1[1] : row1[0];

    // 상단 오른쪽 2x2
    assign row2[1] = (temp1[1] >= temp1[0]) ? temp1[1] : temp1[0];
    assign row2[0] = (temp2[1] >= temp2[0]) ? temp2[1] : temp2[0];
    assign b1[2] = (row2[1] >= row2[0]) ? row2[1] : row2[0];

    // 하단 왼쪽 2x2
    assign row3[1] = (temp3[3] >= temp3[2]) ? temp3[3] : temp3[2];
    assign row3[0] = (temp4[3] >= temp4[2]) ? temp4[3] : temp4[2];
    assign b1[1] = (row3[1] >= row3[0]) ? row3[1] : row3[0];

    // 하단 오른쪽 2x2
    assign row4[1] = (temp3[1] >= temp3[0]) ? temp3[1] : temp3[0];
    assign row4[0] = (temp4[1] >= temp4[0]) ? temp4[1] : temp4[0];
    assign b1[0] = (row4[1] >= row4[0]) ? row4[1] : row4[0];

endmodule
