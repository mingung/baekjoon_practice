module ha8(data_in, data_out, pc_inc);
input [7:0] data_in;
input pc_inc;
output [7:0] data_out;
wire a [7:0];
genvar i; //gernerate 블록에서 반복문과 함께 사용
generate // for 활용 -> 여러 모듈을 반복적 생성
    ha ha0(data_out[0], a[0], pc_inc, data_in[0]);
    for (i = 1; i < 8; i = i + 1) begin:hagen // begin:hagen = 코드 블록을 이름으로 구분 할 수 있게 해줌
    ha ha1(data_out[i], a[i], a[i - 1], data_in[i]);
    end
endgenerate
endmodule