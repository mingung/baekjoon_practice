// mux4to1.v
module mux4to1 (out, i0, i1, i2, i3, s0, s1);
output reg out;
input i0, i1, i2, i3;
input s1, s0;

always @(s1 or s0 i0 or i1 or i2 or i3)
    case({s0, s1}) //s0, s1을 그룹화
        0: out <= i0;
        1: out <= i1;
        2: out <= i2;
        default: out <= i3;
    endcase
endmodule

// mux4to1_tb.v
`timescale 1ns/1ns
module mux4to1_tb;
reg i0, i1, i2, i3, s0, s1;
wire out;
mux4to1 mux4to1_tb0 (
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .i3(i3),
    .s0(s0),
    .s1(s1),
    .out(out)
);

initial
    begin
        s0 = 0;
        s1 = 0;
        i0 = 0;
        i1 = 0;
        i2 = 0;
        i3 = 0;
    end
    always #10 s0 = ~s0;
    always #5 s1 = ~s1;
    always #15 i0 = ~i0;
    always #5 i1 = ~i1;
    always #20 i2 = ~i2;
    always #10 i3 = ~i3;

endmodule
