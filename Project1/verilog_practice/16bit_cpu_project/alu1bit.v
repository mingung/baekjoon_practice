module alu1bit (reset, a, b, aen, binv, cin, cout, sum);
input reset, a, b, aen, binv, cin;
output cout, sum;
wire x1, x2, x3, x4, x5, x6, x7, x8, x9, x10;

assign x1 = (b & !binv) | (!b & binv); // XOR GATE
assign x2 = (a & aen);
assign x3 = !(x1 & x2);
assign x4 = !(x1 & x3);
assign x5 = !(x2 & x3);
assign x6 = !(x4 & x5);
assign x7 = !(x6 & cin);
assign x8 = !(x7 & cin);
assign x9 = !(x7 & x6);
assign x10 = !(x8 & x9);
assign cout = !(x7 & x3);
assign sum = (x10 & !reset);
endmodule





module alu1bit (reset, a, b, aen, binv, cin, cout, sum);
input reset, a, b, aen, binv, cin;
output cout, sum;
wire x0, x01, not_x0, not_x01, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10;

assign x0 = !(b & !binv);
assign x01 = !(!b & binv);
assign not_x0 = !x0;
assign not_x01 = !x01;
assign x1 = not_x0 | not_x01; // XOR GATE
assign x2 = (a & aen);
assign x3 = !(x1 & x2);
assign x4 = !(x1 & x3);
assign x5 = !(x2 & x3);
assign x6 = !(x4 & x5);
assign x7 = !(cin & x6);
assign x8 = !(cin & x7);
assign x9 = !(x7 & x6);
assign x10 = !(x8 & x9);
assign cout = !(x7 & x3);
assign sum = (x10 & !reset);
endmodule



// and gate -> nand - not --> area's decrease effect


module alu1bit (reset, a, b, aen, binv, cin, cout, sum);
input reset, a, b, aen, binv, cin;
output cout, sum;
wire x0, x01, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10;

assign x0 = !(b & !binv); // NAND
assign x01 = !(!b & binv); // NAND
assign x1 = !(x0 & x01); // NAND
assign x2 = (a & aen);
assign x3 = !(x1 & x2);
assign x4 = !(x1 & x3);
assign x5 = !(x2 & x3);
assign x6 = !(x4 & x5);
assign x7 = !(cin & x6);
assign x8 = !(cin & x7);
assign x9 = !(x7 & x6);
assign x10 = !(x8 & x9);
assign cout = !(x7 & x3);
assign sum = (x10 & !reset);
endmodule

// AND - OR LOGIC equal 3 - nand LOgic
// To catching Area decreasing effect




module alu1bit (reset, a, b, aen, binv, cin, cout, sum);
input reset, a, b, aen, binv, cin;
output cout, sum;
wire x0, x01, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10;

assign x0 = !(!b | binv); // AND = NOT - NOR
assign x01 = !(b | !binv); // AND = NOT - NOR
assign x1 = (x0 | x01); // OR
assign x2 = !(!a | !aen); // AND = NOT - NOR
assign x3 = !(x1 & x2);
assign x4 = !(x1 & x3);
assign x5 = !(x2 & x3);
assign x6 = !(x4 & x5);
assign x7 = !(cin & x6);
assign x8 = !(cin & x7);
assign x9 = !(x7 & x6);
assign x10 = !(x8 & x9);
assign cout = !(x7 & x3);
assign sum = (x10 & !reset);
endmodule

// testing
// AND - OR LOGIC equal 3 - nand LOgic
// To catching Area decreasing effect



