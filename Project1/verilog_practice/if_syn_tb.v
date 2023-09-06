`timescale 1ns/1ns
module if_syn_tb;
reg a, b;
wire c;

if_syn if_syn_tb0 (
    .a(a),
    .b(b),
    .c(c)
);

initial begin
    a = 0;
    b = 0;
end
always #10 a = ~a;
always #20 b = ~b;

endmodule