module FNDx4(i_Clk, i_Rst,
	i_Data,
	o_Digit, o_FND); 						// fnd
	
input				i_Clk;			
input				i_Rst;
input		[15:0]	i_Data;
output	wire [3:0]	o_Digit;	// fnd digit select : dig 3 ~ 0
output	wire [6:0]	o_FND;	// fnd data setting : g~a
wire    [3:0] FND_i;
reg		[23:0] r_Digit;
reg		[22:0] r_Cnt;

parameter CLK_PERIOD = 20;
parameter LST_CLK = 10_000_000/CLK_PERIOD - 1;

FND	FND0(FND_i, o_FND);

assign o_Digit = r_Digit;
assign	FND_i =
	(r_Digit[0] ? i_Data[4*0+:4] : 0) |
	(r_Digit[1] ? i_Data[4*1+:4] : 0) |
	(r_Digit[2] ? i_Data[4*2+:4] : 0) |
	(r_Digit[3] ? i_Data[4*3+:4] : 0);

/* counting the number of i_Clk */
always@(posedge i_Clk, negedge i_Rst)
	if(!i_Rst)	begin
		r_Digit <= 4'b0001;
		r_Cnt	<= 0;
	end else if(r_Cnt == LST_CLK)	begin
		r_Digit <= {r_Digit[2:0], r_Digit[3]};
		r_Cnt	<= 0;
	end else
		r_Cnt	<= r_Cnt + 1;

endmodule


module FND(i_Data, o_FND);
	
input	[3:0] i_Data;
output	reg	[6:0] o_FND;	// fnd data setting : g~a

always@*
	case(i_Data)
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
		default	: o_FND = 7'h1111111;
	endcase
	
endmodule