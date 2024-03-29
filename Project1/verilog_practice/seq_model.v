// seq_model.v
module seq_model(b, rstb, clk,a);
output reg b;
input rstb, clk, a;

always @(posedge clk or negedge rstb)
if(!rstb)
    b <= 0;
else
    b <= a;
endmodule

// seq_model_tb.v
//시뮬레이션 테스트벤치
`timescale 1ns/1ns

module seq_model_tb1;
wire b;
reg rstb, clk, a;

seq_model seq_model_tb0(
    .rstb(rstb),
    .clk(clk),
    .a(a),
    .b(b)
); // 이름에 의한 할당

initial begin //초깃값 설정
    rstb = 0;
    clk = 0;
    a = 0;
    #15 rstb = 1;
end

always #5 clk = ~clk; // 5ns의 시간 지연
always #10 a = ~a; // 10ns의 시간 지연

endmodule
