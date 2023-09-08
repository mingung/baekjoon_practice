// Case 이용 설계
// case_syn.v

module case_syn(c, a, b, sel);
output reg [2:0] c; 
input [2:0] a, b;
input sel;

always @(sel or a or b)
    case(sel)
        0: c <= a;
        default: c <= b;
    endcase
    
endmodule



//case_syn_tb.v
`timescale 1ns/1ns

module case_syn_tb;
wire [2:0] c;
reg [2:0] a, b;
reg sel;

case_syn case_syn_tb0(
    .a(a),
    .b(b),
    .c(c),
    .sel(sel)
);

initial begin
    sel = 0;
    a = 2;
    b = 6;
end

always #5 sel = ~sel;
endmodule