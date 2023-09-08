// con_syn_tb.v
`timescale 1ns/1ns

module con_syn_tb;
wire [1:0] e;
reg [1:0] a, b, c, d, sel;
con_syn con_syn_tb(
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .sel(sel),
    .e(e)
);

initial
begin
    sel = 0;
    a = 0;
    b = 1;
    c = 2;
    d = 3;
end

always #10 sel = sel + 1;
endmodule