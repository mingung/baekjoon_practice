module Relu (b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, relu1, relu2, relu3, relu4);
    input [39:0] b1;
    input [39:0] b2;
    input [39:0] b3;
    input [39:0] b4;
    input [39:0] b5;
    input [39:0] b6;
    input [39:0] b7;
    input [39:0] b8;
    input [39:0] b9;
    input [39:0] b10;
    
    output [39:0] relu1;
    output [39:0] relu2;
    output [39:0] relu3;
    output [39:0] relu4;
    output [39:0] relu5;
    output [39:0] relu6;
    output [39:0] relu7;
    output [39:0] relu8;
    output [39:0] relu9;
    output [39:0] relu10;



    assign relu1 = (b1 > 0) ? b1 : 40'b0;
    // 1?
    // assign relu[15] = (temp1[3] > 0) ? temp1[3] : 1'b0;
    // assign row1[2] = (temp1[2] > 0) ? temp1[2] : 1'b0;
    // assign row1[1] = (temp1[1] > 0) ? temp1[1] : 1'b0;
    // assign row1[0] = (temp1[0] > 0) ? temp1[0] : 1'b0;
    // assign b1 = row1;

    // // 2?
    // assign row2[3] = (temp2[3] > 0) ? temp2[3] : 1'b0;
    // assign row2[2] = (temp2[2] > 0) ? temp2[2] : 1'b0;
    // assign row2[1] = (temp2[1] > 0) ? temp2[1] : 1'b0;
    // assign row2[0] = (temp2[0] > 0) ? temp2[0] : 1'b0;
    // assign b2 = row2;
    // // 3?
    // assign row3[3] = (temp3[3] > 0) ? temp3[3] : 1'b0;
    // assign row3[2] = (temp3[2] > 0) ? temp3[2] : 1'b0;
    // assign row3[1] = (temp3[1] > 0) ? temp3[1] : 1'b0;
    // assign row3[0] = (temp3[0] > 0) ? temp3[0] : 1'b0;
    // assign b3 = row3;

    // // 4?
    // assign row4[3] = (temp4[3] > 0) ? temp4[3] : 1'b0;
    // assign row4[2] = (temp4[2] > 0) ? temp4[2] : 1'b0;
    // assign row4[1] = (temp4[1] > 0) ? temp4[1] : 1'b0;
    // assign row4[0] = (temp4[0] > 0) ? temp4[0] : 1'b0;
    // assign b4 = row4;

endmodule
