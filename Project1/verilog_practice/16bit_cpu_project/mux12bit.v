module mux12bit (a, b, s, out);
input a;
input [11:0] a, b;
output [11:0] out;

assign out = s? a: b; // s�� 1�̸� out a, 0�̸� out b
endmodule