// if_syn.v

module if_syn(c, a, b);
output reg c;
input a, b;

always @(a or b)
if (a == b)
c <= 1;
else
c <= 0;
endmodule