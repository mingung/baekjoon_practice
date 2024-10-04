module	Stopwatch(i_Clk,	i_Rst,
	i_fStart,	i_fStop,
	o_Digit,	o_FND);

input	i_Clk;
input	i_Rst;
input	i_fStart;
input	i_fStop;
output	wire	[3:0]	o_Digit;
output	wire	[6:0]	o_FND;

reg	[1:0]	c_State	, n_State	;
reg	[23:0]	c_ClkCnt, n_ClkCnt	;
reg	[3:0]	c_Sec0	, n_Sec0	;
reg	[3:0]	c_Sec1	, n_Sec1	;
reg	[3:0]	c_Sec2	, n_Sec2	;
reg	[3:0]	c_Sec3	, n_Sec3	;

wire	[15:0]	FNDx4_i;
parameter	LST_CLK	= 1000/20 - 1;
parameter	IDLE	= 2'h0,
			WORK	= 2'h1,
			PAUSE	= 2'h2;

assign	FNDx4_i = {c_Sec3, c_Sec2, c_Sec1, c_Sec0};
FNDx4	FNDx4_U0(i_Clk, i_Rst, FNDx4_i, o_Digit, o_FND);

// generation of D-FFs
always@(posedge i_Clk, negedge i_Rst)
	if(!i_Rst)begin
		c_State	= 0;
		c_ClkCnt= 0;
		c_Sec0	= 0;
		c_Sec1	= 0;
		c_Sec2	= 0;
		c_Sec3	= 0;
	end else begin
		c_State	= n_State	;
		c_ClkCnt= n_ClkCnt	;
		c_Sec0	= n_Sec0	;
		c_Sec1	= n_Sec1	;
		c_Sec2	= n_Sec2	;
		c_Sec3	= n_Sec3	;
	end

assign	fLstClk	= c_ClkCnt == 1000/20 - 1,
		fLstSec0= c_Sec0 == 9,
		fLstSec1= c_Sec1 == 9,
		fLstSec2= c_Sec2 == 9,
		fLstSec3= c_Sec3 == 9;
assign	fIncSec0= fLstClk,
		fIncSec1= fIncSec0 && fLstSec0,
		fIncSec2= fIncSec1 && fLstSec1,
		fIncSec3= fIncSec2 && fLstSec2;
// Define Combinational logic for the input of D-FFs
always@*
begin
	n_State = c_State;
	n_ClkCnt= c_ClkCnt;
	n_Sec0	= c_Sec0;
	n_Sec1	= c_Sec1;
	n_Sec2	= c_Sec2;
	n_Sec3	= c_Sec3;
	case(c_State)
		IDLE	: begin
			n_ClkCnt = 0;
			n_Sec0	= 0;
			n_Sec1	= 0;
			n_Sec2	= 0;
			n_Sec3	= 0;
			if(i_fStart)	n_State = WORK;
		end
		WORK	: begin
			n_ClkCnt = fLstClk ? 0 : c_ClkCnt + 1;
			if(fIncSec0)	n_Sec0	= fIncSec0 ? fLstSec0 ? 0 : c_Sec0 + 1 : c_Sec0;
			if(fIncSec1)	n_Sec1	= fIncSec1 ?fLstSec1 ? 0 : c_Sec1 + 1	 : c_Sec1;
			if(fIncSec2)	n_Sec2	= fIncSec2 ?fLstSec2 ? 0 : c_Sec2 + 1  : c_Sec2;
			if(fIncSec3)	n_Sec3	= fIncSec3 ?fLstSec3 ? 0 : c_Sec3 + 1  : c_Sec3;
			if(i_fStart)		n_State = PAUSE;
			else if(i_fStop)	n_State = IDLE;
		end
		PAUSE	: begin
			if(i_fStart)		n_State = WORK;
			else if(i_fStop)	n_State = IDLE;
		end
	endcase
end

endmodule