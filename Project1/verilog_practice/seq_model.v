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
//�ùķ��̼� �׽�Ʈ��ġ
`timescale 1ns/1ns

module seq_model_tb1;
wire b;
reg rstb, clk, a;

seq_model seq_model_tb0(
    .rstb(rstb),
    .clk(clk),
    .a(a),
    .b(b)
); // �̸��� ���� �Ҵ�

initial begin //�ʱ갪 ����
    rstb = 0;
    clk = 0;
    a = 0;
    #15 rstb = 1;
end

always #5 clk = ~clk; // 5ns�� �ð� ����
always #10 a = ~a; // 10ns�� �ð� ����

endmodule