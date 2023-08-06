// behave_model.v

module behave_model(c, d, rstb, clk, a, b);
output reg c, d;
input rstb, clk, a, b;

always @(posedge clk or negedge rstb)
if(!rstb) begin
    c <= 0;
    d <= 0;
end
else begin
    c <= a;
    d <= b;
end
endmodule

// behave_model_tb.v
`timescale 1ns/1ns

module behave_model_tb;
wire c, d;
reg rstb, clk, a, b;

behave_model behave_model_tb0(
    .rstb(rstb),
    .clk(clk),
    .a(a),
    .b(b),
    .c(c),
    .d(d)
);

initial
begin
    rstb = 0;
    clk = 0;
    a = 0;
    b = 0;
    #15 rstb = 1;
end

always #5 clk = ~clk;
always #10 a = ~a;
always #20 b = ~b;

endmodule
