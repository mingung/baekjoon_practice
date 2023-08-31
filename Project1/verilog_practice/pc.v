// 프로그램 카운터 설계
module reg8(data_out, data_in, inen, oen, clk, clr);
input [7:0] data_in;
input inen, oen, clk, clr;
output [7:0] data_out;
reg [7:0] st;
always @(posedge clk, posedge clr) begin
    if(clr)
    st = 8'b0;
    else if (inen)
    st = data_in;
    else
    st = st;
end
assign data_out = (oen)?st:8'bz;
endmodule

module ha(s, c, x, y);
output s, c;
input x, y;
assign s = x ^ y; // xor = 두 수가 같으면 0
assign c = x & y;
endmodule // half-adder

module ha8(data_in, data_out, pc_inc);
input [7:0] data_in;
input pc_inc;
output [7:0] data_out;
wire a [7:0];
genvar i; //gernerate 블록에서 반복문과 함께 사용
generate // for 활용 -> 여러 모듈을 반복적 생성
    ha ha0(data_out[0], a[0], pc_inc, data_in[0]);
    for (i = 1; i < 8; i = i + 1) begin:hagen // begin:hagen = 코드 블록을 이름으로 구분 할 수 있게 해줌
    ha ha1(data_out[i], a[i], a[i - 1], data_in[i]);
    end
endgenerate
endmodule

module pc(clk, clr, pc_inc, load_pc, pc_oen, pc_input, pc_out);
input clk, clr, pc_inc, load_pc, pc_oen;
input [7:0] pc_input;
output [7:0] pc_out;
wire [7:0] a;
wire [7:0] b;
wire [7:0] c;
// ha8(datta_in, data_out, pc_inc);
ha8 u0(.data_in(a), .data_out(b), .pc_inc(pc_inc)); // module에 wire a, b, c 각각 할당
assign c = (load_pc)?pc_input:b; //MUX
// reg8(data_out, data_in, inen, oen, clk, clr);
reg8 u1(a, c, 1'b1, 1'b1, clk, clr);
assign pc_out = (pc_oen)?a:8'bz; // Tri-state buffer
endmodule