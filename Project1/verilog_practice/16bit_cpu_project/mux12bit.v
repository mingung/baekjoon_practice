module mux12bit (a, b, s, out);
input a;
input [11:0] a, b;
output [11:0] out;

assign out = s? a: b; // s가 1이면 out a, 0이면 out b
endmodule