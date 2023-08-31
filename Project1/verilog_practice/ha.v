module ha(s, c, x, y);
output s, c;
input x, y;
assign s = x ^ y; // xor = 두 수가 같으면 0
assign c = x & y;
endmodule // half-adder