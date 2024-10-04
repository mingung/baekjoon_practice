module Stopwatch (i_Clk, i_Rst, i_fStart, i_fStop, o_Digit, o_FND);
input i_Clk;
input i_Rst;
input i_fStart;
input i_fStop;
output wire [3:0] o_Digit;
output wire [6:0] o_FNd;

reg [1:0] n_State, c_State;
reg [5:0] n_ClkCnt, c_ClkCnt;
reg [3:0] n_Sec0, c_Sec0;
reg [3:0] n_Sec1, c_Sec1;
reg [3:0] n_Sec2, c_Sec2;
reg [3:0] n_Sec3, c_Sec3;
                   
wire [15:0] FNDx4_i;
parameter LST_CLK = 1000/20 - 1;
parameter IDLE = 2'b00,
          WORK = 2'b01,
          PAUSE = 2'b10;

assign FNDx4_i = {c_Sec3, c_Sec2, c_Sec1, c_Sec0};
FNDx4 FNDx4_U0(i_Clk, i_Rst, FNDx4_i, o_Digit, o_FND);

// Generation D-F/Fs
always@(posedge i_Clk or negedge i_Rst) begin
    if(!i_Rst) begin
        c_State = 0;
        c_ClkCnt = 0;
        c_Sec0 = 0;
        c_Sec1 = 0;
        c_Sec2 = 0;
        c_Sec3 = 0;
    end
    else begin
        c_State = n_State;
        c_ClkCnt = n_ClkCnt;
        c_Sec0 = n_Sec0;
        c_Sec1 = n_Sec1;
        c_Sec2 = n_Sec2;
        c_Sec3 = n_Sec3;
    end
end

assign fLstClk = c_ClkCnt == LST_CLK,
       fLstSec0 = c_Sec0 == 9,
       fLstSec1 = c_Sec1 == 9,
       fLstSec2 = c_Sec2 == 9,
       fLstSec3 = c_Sec3 == 9;
assign  fIncSec0 = fLstClk,
        fIncSec1 = fLstSec0 && fIncSec0,
        fIncSec2 = fLstSec1 && fIncSec1,
        fIncSec3 = fLstSec2 && fIncSec2;

// Generation combinational block 
always@* begin
    n_State = c_State;
    n_ClkCnt = c_ClkCnt;
    n_Sec0 = c_Sec0;
    n_Sec1 = c_Sec1;
    n_Sec2 = c_Sec2;
    n_Sec3 = c_Sec3;
    case(c_State)
        IDLE    :   begin
                n_State = 0;
                n_ClkCnt = 0;
                n_Sec0 = 0;
                n_Sec1 = 0;
                n_Sec2 = 0;
                n_Sec3 = 0;
                if(i_fStart)    n_State = WORK;
        end
        WORK    :   begin
                n_ClkCnt =          fLstClk ? 0 : n_ClkCnt + 1;
                if(fIncSec0)        n_Sec0 = fLstSec0 ? 0 : c_Sec0 + 1;
                if(fIncSec1)        n_Sec1 = fLstSec1 ? 0 : c_Sec1 + 1;
                if(fIncSec2)        n_Sec2 = fLstSec2 ? 0 : c_Sec2 + 1;
                if(fIncSec3)        n_Sec3 = fLstSec3 ? 0 : c_Sec3 + 1;
                if(i_fStart)        n_State = PAUSE;
                else if(i_fStop)    n_State = IDLE;
        end
        PAUSE   :   begin
                if(i_fStart)        n_State = WORK;
                else if(i_fStop)    n_State = IDLE;
        end
    endcase
end
endmodule