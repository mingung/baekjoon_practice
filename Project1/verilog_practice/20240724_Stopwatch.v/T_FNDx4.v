// ��: 16�� �Է��� 4���� ������ ���� ��� ����, o_digit�� ���� ���� segment ����
// Clk, Rst �ʿ�
// 16bit i_Data, 7bit o_FND, 4bit o_Digit
// To rotate r_Digit 
module FNDx4(
    input i_Clk,
    input i_Rst,
    input [15:0] i_Data,
    output wire [3:0] o_Digit,
    output [6:0] o_FND
);

wire [3:0] FND_i;
reg  [3:0] r_Digit;
reg  [5:0] r_Cnt;

parameter CLK_PERIOD = 20; // CLK �ֱ�
parameter LST_CLK = 1000/CLK_PERIOD - 1; 

FND FND0(FND_i, o_FND); // ���� ��� FNDx4�� FND_i ��ȣ�� ���� ��� ù��°�� ����, o_FND�� ���� ��� �ι�°�� ����

assign o_Digit = r_Digit; // ENA ��ȣ assign
assign FND_i = (r_Digit[0] ? i_Data[4*0+:4] : 0) |
               (r_Digit[1] ? i_Data[4*1+:4] : 0) |
               (r_Digit[2] ? i_Data[4*2+:4] : 0) |
               (r_Digit[3] ? i_Data[4*3+:4] : 0);

// ���� ���� ������ ������ assign

always @(posedge i_Clk or negedge i_Rst) begin
    if(!rst) begin
        r_Digit <= 4'b0001;
        r_Cnt <= 0;
    end
    else if(LST_CLK == r_Cnt) begin // ī���Ͱ� �ϳ��� Ŭ�� ��ȣ�� ���ٸ�
        r_Digit <= {r_Digit[2:0], r_Digit[3]}; // Rotation: 1000 0001 0010 0100 1000
        r_Cnt <= 0;
    end
    else
        r_Cnt <= r_Cnt + 1; // ī���� ���
end

endmodule





// ��: 4���� �Է��� �޾Ƽ� 7�� ��� -> 7-segment on/off

module FND(
    input [3:0] i_data;
    output [6:0] o_FND;
);
    always@*
    case(i_data)
        4'h0	: o_FND = 7'b1000000;
		4'h1	: o_FND = 7'b1111001;
		4'h2	: o_FND = 7'b0100100;
		4'h3	: o_FND = 7'b0110000;
		4'h4	: o_FND = 7'b0011001;
		4'h5	: o_FND = 7'b0010010;
		4'h6	: o_FND = 7'b0000010;
		4'h7	: o_FND = 7'b1011000;
		4'h8	: o_FND = 7'b0000000;
		4'h9	: o_FND = 7'b0011000;
        default : 7'hFF;
        endcase
endmodule
