// 명세: 16개 입력을 4개로 나눠서 하위 모듈 전달, o_digit에 값에 따라 segment 선택
// Clk, Rst 필요
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

parameter CLK_PERIOD = 20; // CLK 주기
parameter LST_CLK = 1000/CLK_PERIOD - 1; 

FND FND0(FND_i, o_FND); // 상위 모듈 FNDx4의 FND_i 신호를 하위 모듈 첫번째에 연결, o_FND를 하위 모듈 두번째에 연결

assign o_Digit = r_Digit; // ENA 신호 assign
assign FND_i = (r_Digit[0] ? i_Data[4*0+:4] : 0) |
               (r_Digit[1] ? i_Data[4*1+:4] : 0) |
               (r_Digit[2] ? i_Data[4*2+:4] : 0) |
               (r_Digit[3] ? i_Data[4*3+:4] : 0);

// 하위 모듈로 전달할 데이터 assign

always @(posedge i_Clk or negedge i_Rst) begin
    if(!rst) begin
        r_Digit <= 4'b0001;
        r_Cnt <= 0;
    end
    else if(LST_CLK == r_Cnt) begin // 카운터가 하나의 클럭 신호와 같다면
        r_Digit <= {r_Digit[2:0], r_Digit[3]}; // Rotation: 1000 0001 0010 0100 1000
        r_Cnt <= 0;
    end
    else
        r_Cnt <= r_Cnt + 1; // 카운터 상승
end

endmodule





// 명세: 4개의 입력을 받아서 7개 출력 -> 7-segment on/off

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
