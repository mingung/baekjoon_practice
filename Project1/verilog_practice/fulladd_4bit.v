module fulladd_4bit(sum, c_out, a, b, c_in);
output [3:0] sum;
output c_out;
input [3:0] a, b;
input c_in;

assign {c_out,sum} = a + b + c_in; // carry 발생(5bit 연산)

endmodule