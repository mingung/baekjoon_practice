// concurrent_modeling(assign)
// con_syn.v

module con_syn(a,  b, c, d, sel, e);
output [1:0] e;
input [1:0] a, b, c, d, sel;

assign e = sel[1] ? (sel[0]?d:c) : (sel[0]?b:a);
// sel[1] -> sel[0]?d:c
// else -> sel[0]?b:a
endmodule

