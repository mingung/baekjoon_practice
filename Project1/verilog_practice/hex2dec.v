// 16진수 -> 10진수
module hex2dec(h, dec_h, dec_l, clk);
input [7:0] h;
input clk;
output [3:0] dec_h, dec_l;
reg [7:0] reg_h;
reg [3:0] reg_add_l, reg_add_e;
reg [3:0] reg_dec_h, reg_dec_l, reg_f, reg_innerdata;
reg reg_cout;
wire [3:0] a, b, c, d, e, f, innerdata;
wire cout, overten;
always @(posedge clk) begin
    reg_h <= h;            
end // non-blocking
assign a[3] = reg_h[6]&reg_h[4];
assign a[2] = (reg_h[5] & reg_h[4]) | (reg_h[6] & ~reg_h[4]);
assign a[1] = (~reg_h[4]) & (reg_h[6] ^ reg_h[5]);
assign a[0] = (~reg_h[6]) & (reg_h[5] ^ reg_h[4]);
assign b[3] = reg_h[5] & reg_h[4];
assign b[2] = (~reg_h[5]) & (reg_h[6] ^ reg_h[4]); 
assign b[1] = (~reg_h[6]) & (reg_h[5] ^ reg_h[4]);
assign b[0] = 0;
assign c[3:1] = 0;
assign c[0] = reg_h[3] & (reg_h[2] | reg_h[1]);
assign d[3] = reg_h[3] & ~(reg_h[2] | reg_h[1]);    
assign d[2] = reg_h[2] & ((~reg_h[3]) | (reg_h[3] & reg_h[1]));
assign d[1] = ((~reg_h[3]) & reg_h[1]) | (reg_h[3] & reg_h[2] & (~reg_h[1]));
assign d[0] = reg_h[0];
always @(posedge clk) begin
    reg_add_e <= a + c;
end    
// assign e = a + c;
always @(posedge clk) begin
    {reg_cout, reg_f} <= b + d;
end
// assign {cout, f} =  b + d;
assign innerdata = {1'b0, {2{overten | reg_cout}}, 1'b0};
always @(posedge clk) begin
    reg_innerdata <= innerdata;
end
assign overten = (reg_f > 9);
always @(posedge clk) begin
    reg_dec_h <= (overten | reg_cout) + reg_add_e;
    reg_dec_l <= reg_f + reg_innerdata;
end
assign dec_h = reg_dec_h;
assign dec_l = reg_dec_l;
// assign dec_h = (overten | cout) + e;
// assign dec_l = f + innerdata;
endmodule