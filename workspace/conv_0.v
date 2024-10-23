`timescale 1ns / 1ps

`define BIT_LEN     8   // ?? ??? ??
`define CONV_LEN    20  // ???? ?? ?? ??
`define M_LEN       3   // ???? = 3
`define FEA_SIZE    417 // padding ??? Feature Map ??

module conv_0 #(
    parameter BIT_LEN       = `BIT_LEN,
    parameter CONV_LEN      = `CONV_LEN,
    parameter M_LEN         = `M_LEN,
    parameter FEA_SIZE      = `FEA_SIZE,
    localparam BIT_ARRAY    = BIT_LEN*M_LEN
    )(
    output reg [BIT_LEN-1:0]    o_data,
    input [BIT_LEN-1:0]     i_dato0,    // LSB
    input [BIT_LEN-1:0]     i_dato1,
    input [BIT_LEN-1:0]     i_dato2,    // MSB
    
    input i_fStart,
    input i_fStop,
    input i_reset,
    input i_Clk
    
    );
    
    parameter IDLE = 2'b00,
              WORK = 2'b01,
              PAUSE = 2'b10;

    reg unsigned [BIT_ARRAY-1:0]  kernel [0:M_LEN-1];    

    reg signed [BIT_ARRAY-1:0]  c_imagen [0:M_LEN-1];
    reg signed [BIT_ARRAY-1:0]  n_imagen [0:M_LEN-1];

    reg signed [BIT_LEN-1:0]    n_buf [0:FEA_SIZE-1];
    //reg signed [BIT_LEN-1:0]    c_buf [0:FEA_SIZE-1];

    
    reg [1:0] c_state, n_state;
    reg [8:0] c_update, n_update;
    
    initial begin
                n_buf[0] = 8'h0;
                n_buf[1] = 8'h0;
                n_buf[2] = 8'h0;
                n_buf[3] = 8'h0;
                n_buf[4] = 8'h0;
                n_buf[5] = 8'h0;
                n_buf[6] = 8'h0;
                n_buf[7] = 8'h0;
                n_buf[8] = 8'h0;
                n_buf[9] = 8'h0;
                n_buf[10] = 8'h0;
                n_buf[11] = 8'h0;
                n_buf[12] = 8'h0;
                n_buf[13] = 8'h0;
                n_buf[14] = 8'h0;
                n_buf[15] = 8'h0;
                n_buf[16] = 8'h0;
                n_buf[17] = 8'h0;
                n_buf[18] = 8'h0;
                n_buf[19] = 8'h0;
                n_buf[20] = 8'h0;
                n_buf[21] = 8'h0;
                n_buf[22] = 8'h0;
                n_buf[23] = 8'h0;
                n_buf[24] = 8'h0;
                n_buf[25] = 8'h0;
                n_buf[26] = 8'h0;
                n_buf[27] = 8'h0;
                n_buf[28] = 8'h0;
                n_buf[29] = 8'h0;
                n_buf[30] = 8'h0;
                n_buf[31] = 8'h0;
                n_buf[32] = 8'h0;
                n_buf[33] = 8'h0;
                n_buf[34] = 8'h0;
                n_buf[35] = 8'h0;
                n_buf[36] = 8'h0;
                n_buf[37] = 8'h0;
                n_buf[38] = 8'h0;
                n_buf[39] = 8'h0;
                n_buf[40] = 8'h0;
                n_buf[41] = 8'h0;
                n_buf[42] = 8'h0;
                n_buf[43] = 8'h0;
                n_buf[44] = 8'h0;
                n_buf[45] = 8'h0;
                n_buf[46] = 8'h0;
                n_buf[47] = 8'h0;
                n_buf[48] = 8'h0;
                n_buf[49] = 8'h0;
                n_buf[50] = 8'h0;
                n_buf[51] = 8'h0;
                n_buf[52] = 8'h0;
                n_buf[53] = 8'h0;
                n_buf[54] = 8'h0;
                n_buf[55] = 8'h0;
                n_buf[56] = 8'h0;
                n_buf[57] = 8'h0;
                n_buf[58] = 8'h0;
                n_buf[59] = 8'h0;
                n_buf[60] = 8'h0;
                n_buf[61] = 8'h0;
                n_buf[62] = 8'h0;
                n_buf[63] = 8'h0;
                n_buf[64] = 8'h0;
                n_buf[65] = 8'h0;
                n_buf[66] = 8'h0;
                n_buf[67] = 8'h0;
                n_buf[68] = 8'h0;
                n_buf[69] = 8'h0;
                n_buf[70] = 8'h0;
                n_buf[71] = 8'h0;
                n_buf[72] = 8'h0;
                n_buf[73] = 8'h0;
                n_buf[74] = 8'h0;
                n_buf[75] = 8'h0;
                n_buf[76] = 8'h0;
                n_buf[77] = 8'h0;
                n_buf[78] = 8'h0;
                n_buf[79] = 8'h0;
                n_buf[80] = 8'h0;
                n_buf[81] = 8'h0;
                n_buf[82] = 8'h0;
                n_buf[83] = 8'h0;
                n_buf[84] = 8'h0;
                n_buf[85] = 8'h0;
                n_buf[86] = 8'h0;
                n_buf[87] = 8'h0;
                n_buf[88] = 8'h0;
                n_buf[89] = 8'h0;
                n_buf[90] = 8'h0;
                n_buf[91] = 8'h0;
                n_buf[92] = 8'h0;
                n_buf[93] = 8'h0;
                n_buf[94] = 8'h0;
                n_buf[95] = 8'h0;
                n_buf[96] = 8'h0;
                n_buf[97] = 8'h0;
                n_buf[98] = 8'h0;
                n_buf[99] = 8'h0;
                n_buf[100] = 8'h0;
                n_buf[101] = 8'h0;
                n_buf[102] = 8'h0;
                n_buf[103] = 8'h0;
                n_buf[104] = 8'h0;
                n_buf[105] = 8'h0;
                n_buf[106] = 8'h0;
                n_buf[107] = 8'h0;
                n_buf[108] = 8'h0;
                n_buf[109] = 8'h0;
                n_buf[110] = 8'h0;
                n_buf[111] = 8'h0;
                n_buf[112] = 8'h0;
                n_buf[113] = 8'h0;
                n_buf[114] = 8'h0;
                n_buf[115] = 8'h0;
                n_buf[116] = 8'h0;
                n_buf[117] = 8'h0;
                n_buf[118] = 8'h0;
                n_buf[119] = 8'h0;
                n_buf[120] = 8'h0;
                n_buf[121] = 8'h0;
                n_buf[122] = 8'h0;
                n_buf[123] = 8'h0;
                n_buf[124] = 8'h0;
                n_buf[125] = 8'h0;
                n_buf[126] = 8'h0;
                n_buf[127] = 8'h0;
                n_buf[128] = 8'h0;
                n_buf[129] = 8'h0;
                n_buf[130] = 8'h0;
                n_buf[131] = 8'h0;
                n_buf[132] = 8'h0;
                n_buf[133] = 8'h0;
                n_buf[134] = 8'h0;
                n_buf[135] = 8'h0;
                n_buf[136] = 8'h0;
                n_buf[137] = 8'h0;
                n_buf[138] = 8'h0;
                n_buf[139] = 8'h0;
                n_buf[140] = 8'h0;
                n_buf[141] = 8'h0;
                n_buf[142] = 8'h0;
                n_buf[143] = 8'h0;
                n_buf[144] = 8'h0;
                n_buf[145] = 8'h0;
                n_buf[146] = 8'h0;
                n_buf[147] = 8'h0;
                n_buf[148] = 8'h0;
                n_buf[149] = 8'h0;
                n_buf[150] = 8'h0;
                n_buf[151] = 8'h0;
                n_buf[152] = 8'h0;
                n_buf[153] = 8'h0;
                n_buf[154] = 8'h0;
                n_buf[155] = 8'h0;
                n_buf[156] = 8'h0;
                n_buf[157] = 8'h0;
                n_buf[158] = 8'h0;
                n_buf[159] = 8'h0;
                n_buf[160] = 8'h0;
                n_buf[161] = 8'h0;
                n_buf[162] = 8'h0;
                n_buf[163] = 8'h0;
                n_buf[164] = 8'h0;
                n_buf[165] = 8'h0;
                n_buf[166] = 8'h0;
                n_buf[167] = 8'h0;
                n_buf[168] = 8'h0;
                n_buf[169] = 8'h0;
                n_buf[170] = 8'h0;
                n_buf[171] = 8'h0;
                n_buf[172] = 8'h0;
                n_buf[173] = 8'h0;
                n_buf[174] = 8'h0;
                n_buf[175] = 8'h0;
                n_buf[176] = 8'h0;
                n_buf[177] = 8'h0;
                n_buf[178] = 8'h0;
                n_buf[179] = 8'h0;
                n_buf[180] = 8'h0;
                n_buf[181] = 8'h0;
                n_buf[182] = 8'h0;
                n_buf[183] = 8'h0;
                n_buf[184] = 8'h0;
                n_buf[185] = 8'h0;
                n_buf[186] = 8'h0;
                n_buf[187] = 8'h0;
                n_buf[188] = 8'h0;
                n_buf[189] = 8'h0;
                n_buf[190] = 8'h0;
                n_buf[191] = 8'h0;
                n_buf[192] = 8'h0;
                n_buf[193] = 8'h0;
                n_buf[194] = 8'h0;
                n_buf[195] = 8'h0;
                n_buf[196] = 8'h0;
                n_buf[197] = 8'h0;
                n_buf[198] = 8'h0;
                n_buf[199] = 8'h0;
                n_buf[200] = 8'h0;
                n_buf[201] = 8'h0;
                n_buf[202] = 8'h0;
                n_buf[203] = 8'h0;
                n_buf[204] = 8'h0;
                n_buf[205] = 8'h0;
                n_buf[206] = 8'h0;
                n_buf[207] = 8'h0;
                n_buf[208] = 8'h0;
                n_buf[209] = 8'h0;
                n_buf[210] = 8'h0;
                n_buf[211] = 8'h0;
                n_buf[212] = 8'h0;
                n_buf[213] = 8'h0;
                n_buf[214] = 8'h0;
                n_buf[215] = 8'h0;
                n_buf[216] = 8'h0;
                n_buf[217] = 8'h0;
                n_buf[218] = 8'h0;
                n_buf[219] = 8'h0;
                n_buf[220] = 8'h0;
                n_buf[221] = 8'h0;
                n_buf[222] = 8'h0;
                n_buf[223] = 8'h0;
                n_buf[224] = 8'h0;
                n_buf[225] = 8'h0;
                n_buf[226] = 8'h0;
                n_buf[227] = 8'h0;
                n_buf[228] = 8'h0;
                n_buf[229] = 8'h0;
                n_buf[230] = 8'h0;
                n_buf[231] = 8'h0;
                n_buf[232] = 8'h0;
                n_buf[233] = 8'h0;
                n_buf[234] = 8'h0;
                n_buf[235] = 8'h0;
                n_buf[236] = 8'h0;
                n_buf[237] = 8'h0;
                n_buf[238] = 8'h0;
                n_buf[239] = 8'h0;
                n_buf[240] = 8'h0;
                n_buf[241] = 8'h0;
                n_buf[242] = 8'h0;
                n_buf[243] = 8'h0;
                n_buf[244] = 8'h0;
                n_buf[245] = 8'h0;
                n_buf[246] = 8'h0;
                n_buf[247] = 8'h0;
                n_buf[248] = 8'h0;
                n_buf[249] = 8'h0;
                n_buf[250] = 8'h0;
                n_buf[251] = 8'h0;
                n_buf[252] = 8'h0;
                n_buf[253] = 8'h0;
                n_buf[254] = 8'h0;
                n_buf[255] = 8'h0;
                n_buf[256] = 8'h0;
                n_buf[257] = 8'h0;
                n_buf[258] = 8'h0;
                n_buf[259] = 8'h0;
                n_buf[260] = 8'h0;
                n_buf[261] = 8'h0;
                n_buf[262] = 8'h0;
                n_buf[263] = 8'h0;
                n_buf[264] = 8'h0;
                n_buf[265] = 8'h0;
                n_buf[266] = 8'h0;
                n_buf[267] = 8'h0;
                n_buf[268] = 8'h0;
                n_buf[269] = 8'h0;
                n_buf[270] = 8'h0;
                n_buf[271] = 8'h0;
                n_buf[272] = 8'h0;
                n_buf[273] = 8'h0;
                n_buf[274] = 8'h0;
                n_buf[275] = 8'h0;
                n_buf[276] = 8'h0;
                n_buf[277] = 8'h0;
                n_buf[278] = 8'h0;
                n_buf[279] = 8'h0;
                n_buf[280] = 8'h0;
                n_buf[281] = 8'h0;
                n_buf[282] = 8'h0;
                n_buf[283] = 8'h0;
                n_buf[284] = 8'h0;
                n_buf[285] = 8'h0;
                n_buf[286] = 8'h0;
                n_buf[287] = 8'h0;
                n_buf[288] = 8'h0;
                n_buf[289] = 8'h0;
                n_buf[290] = 8'h0;
                n_buf[291] = 8'h0;
                n_buf[292] = 8'h0;
                n_buf[293] = 8'h0;
                n_buf[294] = 8'h0;
                n_buf[295] = 8'h0;
                n_buf[296] = 8'h0;
                n_buf[297] = 8'h0;
                n_buf[298] = 8'h0;
                n_buf[299] = 8'h0;
                n_buf[300] = 8'h0;
                n_buf[301] = 8'h0;
                n_buf[302] = 8'h0;
                n_buf[303] = 8'h0;
                n_buf[304] = 8'h0;
                n_buf[305] = 8'h0;
                n_buf[306] = 8'h0;
                n_buf[307] = 8'h0;
                n_buf[308] = 8'h0;
                n_buf[309] = 8'h0;
                n_buf[310] = 8'h0;
                n_buf[311] = 8'h0;
                n_buf[312] = 8'h0;
                n_buf[313] = 8'h0;
                n_buf[314] = 8'h0;
                n_buf[315] = 8'h0;
                n_buf[316] = 8'h0;
                n_buf[317] = 8'h0;
                n_buf[318] = 8'h0;
                n_buf[319] = 8'h0;
                n_buf[320] = 8'h0;
                n_buf[321] = 8'h0;
                n_buf[322] = 8'h0;
                n_buf[323] = 8'h0;
                n_buf[324] = 8'h0;
                n_buf[325] = 8'h0;
                n_buf[326] = 8'h0;
                n_buf[327] = 8'h0;
                n_buf[328] = 8'h0;
                n_buf[329] = 8'h0;
                n_buf[330] = 8'h0;
                n_buf[331] = 8'h0;
                n_buf[332] = 8'h0;
                n_buf[333] = 8'h0;
                n_buf[334] = 8'h0;
                n_buf[335] = 8'h0;
                n_buf[336] = 8'h0;
                n_buf[337] = 8'h0;
                n_buf[338] = 8'h0;
                n_buf[339] = 8'h0;
                n_buf[340] = 8'h0;
                n_buf[341] = 8'h0;
                n_buf[342] = 8'h0;
                n_buf[343] = 8'h0;
                n_buf[344] = 8'h0;
                n_buf[345] = 8'h0;
                n_buf[346] = 8'h0;
                n_buf[347] = 8'h0;
                n_buf[348] = 8'h0;
                n_buf[349] = 8'h0;
                n_buf[350] = 8'h0;
                n_buf[351] = 8'h0;
                n_buf[352] = 8'h0;
                n_buf[353] = 8'h0;
                n_buf[354] = 8'h0;
                n_buf[355] = 8'h0;
                n_buf[356] = 8'h0;
                n_buf[357] = 8'h0;
                n_buf[358] = 8'h0;
                n_buf[359] = 8'h0;
                n_buf[360] = 8'h0;
                n_buf[361] = 8'h0;
                n_buf[362] = 8'h0;
                n_buf[363] = 8'h0;
                n_buf[364] = 8'h0;
                n_buf[365] = 8'h0;
                n_buf[366] = 8'h0;
                n_buf[367] = 8'h0;
                n_buf[368] = 8'h0;
                n_buf[369] = 8'h0;
                n_buf[370] = 8'h0;
                n_buf[371] = 8'h0;
                n_buf[372] = 8'h0;
                n_buf[373] = 8'h0;
                n_buf[374] = 8'h0;
                n_buf[375] = 8'h0;
                n_buf[376] = 8'h0;
                n_buf[377] = 8'h0;
                n_buf[378] = 8'h0;
                n_buf[379] = 8'h0;
                n_buf[380] = 8'h0;
                n_buf[381] = 8'h0;
                n_buf[382] = 8'h0;
                n_buf[383] = 8'h0;
                n_buf[384] = 8'h0;
                n_buf[385] = 8'h0;
                n_buf[386] = 8'h0;
                n_buf[387] = 8'h0;
                n_buf[388] = 8'h0;
                n_buf[389] = 8'h0;
                n_buf[390] = 8'h0;
                n_buf[391] = 8'h0;
                n_buf[392] = 8'h0;
                n_buf[393] = 8'h0;
                n_buf[394] = 8'h0;
                n_buf[395] = 8'h0;
                n_buf[396] = 8'h0;
                n_buf[397] = 8'h0;
                n_buf[398] = 8'h0;
                n_buf[399] = 8'h0;
                n_buf[400] = 8'h0;
                n_buf[401] = 8'h0;
                n_buf[402] = 8'h0;
                n_buf[403] = 8'h0;
                n_buf[404] = 8'h0;
                n_buf[405] = 8'h0;
                n_buf[406] = 8'h0;
                n_buf[407] = 8'h0;
                n_buf[408] = 8'h0;
                n_buf[409] = 8'h0;
                n_buf[410] = 8'h0;
                n_buf[411] = 8'h0;
                n_buf[412] = 8'h0;
                n_buf[413] = 8'h0;
                n_buf[414] = 8'h0;
                n_buf[415] = 8'h0;
                n_buf[416] = 8'h0;
    end

    always @(posedge i_Clk or negedge i_reset) begin
        if(!i_reset) begin
            begin
                o_data <= 0;
                c_update <= 0;
                c_state <= 0;
                c_imagen[0]<={BIT_ARRAY{1'b0}};
                c_imagen[1]<={BIT_ARRAY{1'b0}};
                c_imagen[2]<={BIT_ARRAY{1'b0}};
                kernel[0]<=24'b00000001_00000001_00000001;
                kernel[1]<=24'b00000001_00000001_00000001;
                kernel[2]<=24'b00000001_00000001_00000001;
            end 
        end
        else begin
            c_state <= n_state;
            c_update <= n_update;
            c_imagen[0] <= n_imagen[0];
            c_imagen[1] <= n_imagen[1];
            c_imagen[2] <= n_imagen[2];
            o_data <= n_buf[c_update]; 
        end

    end

    always@* begin
        n_update = c_update;
        n_state = c_state;
        n_imagen[0] = c_imagen[0];
        n_imagen[1] = c_imagen[1];
        n_imagen[2] = c_imagen[2];
        n_buf[c_update] = o_data; 
        case(c_state)
        IDLE    :   begin
                n_imagen[0]={BIT_ARRAY{1'b0}};
                n_imagen[1]={BIT_ARRAY{1'b0}};
                n_imagen[2]={BIT_ARRAY{1'b0}};
                if(i_fStart)    n_state = WORK;

        end
        WORK    :   begin
                n_imagen[0] = c_imagen[1];
                n_imagen[1] = c_imagen[2];
                n_imagen[2] = {i_dato2, i_dato1, i_dato0}; // ??? ??? ??

                n_buf[c_update] = c_imagen[0][7:0] * kernel[0][7:0] +
                                c_imagen[0][15:8] * kernel[0][15:8] + 
                                c_imagen[0][BIT_ARRAY-1:16] * kernel[0][BIT_ARRAY-1:16] +

                                c_imagen[1][7:0] * kernel[1][7:0] +
                                c_imagen[1][15:8] * kernel[1][15:8] +
                                c_imagen[1][BIT_ARRAY-1:16] * kernel[1][BIT_ARRAY-1:16] +

                                c_imagen[2][7:0] * kernel[2][7:0] +
                                c_imagen[2][15:8] * kernel[2][15:8] +
                                c_imagen[2][BIT_ARRAY-1:16] * kernel[2][BIT_ARRAY-1:16];
                n_update = c_update + 1;


                //if(i_fStart)        n_state = PAUSE;
                //else if(i_fStop)    n_state = IDLE;
        end
        PAUSE   :   begin
                if(i_fStart)        n_state = WORK;
                else if(i_fStop)    n_state = IDLE;
        end
    endcase
    end
endmodule


// 이 코드는 RGB각각 1픽셀씩 데이터가 들어올때의 계산코드
// 카메라에서 RGB로 데이터가 어떻게 들어오는지 파악


////////////////////////////
`timescale 1ns / 1ps

`define BIT_LEN     8   // ?? ??? ??
`define CONV_LEN    20  // ???? ?? ?? ??
`define M_LEN       3   // ???? = 3
`define FEA_SIZE    417 // padding ??? Feature Map ??

module conv_0 #(
    parameter BIT_LEN       = `BIT_LEN,
    parameter CONV_LEN      = `CONV_LEN,
    parameter M_LEN         = `M_LEN,
    parameter FEA_SIZE      = `FEA_SIZE,
    localparam BIT_ARRAY    = BIT_LEN*M_LEN
    )(
    output reg [BIT_LEN-1:0]    o_data,
    input [BIT_LEN-1:0]     i_dato0,    // LSB
    input [BIT_LEN-1:0]     i_dato1,
    input [BIT_LEN-1:0]     i_dato2,    // MSB
    
    input i_reset,
    input i_Clk
    
    );


    reg unsigned [BIT_ARRAY-1:0]  kernel [0:M_LEN-1];    

    reg signed [BIT_ARRAY-1:0]  c_imagen [0:M_LEN-1];

    reg signed [BIT_LEN-1:0]    n_buf [0:FEA_SIZE-1];
    //reg signed [BIT_LEN-1:0]    c_buf [0:FEA_SIZE-1];

    reg [8:0] c_update;
    
    initial begin
                n_buf[0] = 8'h0;
                n_buf[1] = 8'h0;
                n_buf[2] = 8'h0;
                n_buf[3] = 8'h0;
                n_buf[4] = 8'h0;
                n_buf[5] = 8'h0;
                n_buf[6] = 8'h0;
                n_buf[7] = 8'h0;
                n_buf[8] = 8'h0;
                n_buf[9] = 8'h0;
                n_buf[10] = 8'h0;
                n_buf[11] = 8'h0;
                n_buf[12] = 8'h0;
                n_buf[13] = 8'h0;
                n_buf[14] = 8'h0;
                n_buf[15] = 8'h0;
                n_buf[16] = 8'h0;
                n_buf[17] = 8'h0;
                n_buf[18] = 8'h0;
                n_buf[19] = 8'h0;
                n_buf[20] = 8'h0;
                n_buf[21] = 8'h0;
                n_buf[22] = 8'h0;
                n_buf[23] = 8'h0;
                n_buf[24] = 8'h0;
                n_buf[25] = 8'h0;
                n_buf[26] = 8'h0;
                n_buf[27] = 8'h0;
                n_buf[28] = 8'h0;
                n_buf[29] = 8'h0;
                n_buf[30] = 8'h0;
                n_buf[31] = 8'h0;
                n_buf[32] = 8'h0;
                n_buf[33] = 8'h0;
                n_buf[34] = 8'h0;
                n_buf[35] = 8'h0;
                n_buf[36] = 8'h0;
                n_buf[37] = 8'h0;
                n_buf[38] = 8'h0;
                n_buf[39] = 8'h0;
                n_buf[40] = 8'h0;
                n_buf[41] = 8'h0;
                n_buf[42] = 8'h0;
                n_buf[43] = 8'h0;
                n_buf[44] = 8'h0;
                n_buf[45] = 8'h0;
                n_buf[46] = 8'h0;
                n_buf[47] = 8'h0;
                n_buf[48] = 8'h0;
                n_buf[49] = 8'h0;
                n_buf[50] = 8'h0;
                n_buf[51] = 8'h0;
                n_buf[52] = 8'h0;
                n_buf[53] = 8'h0;
                n_buf[54] = 8'h0;
                n_buf[55] = 8'h0;
                n_buf[56] = 8'h0;
                n_buf[57] = 8'h0;
                n_buf[58] = 8'h0;
                n_buf[59] = 8'h0;
                n_buf[60] = 8'h0;
                n_buf[61] = 8'h0;
                n_buf[62] = 8'h0;
                n_buf[63] = 8'h0;
                n_buf[64] = 8'h0;
                n_buf[65] = 8'h0;
                n_buf[66] = 8'h0;
                n_buf[67] = 8'h0;
                n_buf[68] = 8'h0;
                n_buf[69] = 8'h0;
                n_buf[70] = 8'h0;
                n_buf[71] = 8'h0;
                n_buf[72] = 8'h0;
                n_buf[73] = 8'h0;
                n_buf[74] = 8'h0;
                n_buf[75] = 8'h0;
                n_buf[76] = 8'h0;
                n_buf[77] = 8'h0;
                n_buf[78] = 8'h0;
                n_buf[79] = 8'h0;
                n_buf[80] = 8'h0;
                n_buf[81] = 8'h0;
                n_buf[82] = 8'h0;
                n_buf[83] = 8'h0;
                n_buf[84] = 8'h0;
                n_buf[85] = 8'h0;
                n_buf[86] = 8'h0;
                n_buf[87] = 8'h0;
                n_buf[88] = 8'h0;
                n_buf[89] = 8'h0;
                n_buf[90] = 8'h0;
                n_buf[91] = 8'h0;
                n_buf[92] = 8'h0;
                n_buf[93] = 8'h0;
                n_buf[94] = 8'h0;
                n_buf[95] = 8'h0;
                n_buf[96] = 8'h0;
                n_buf[97] = 8'h0;
                n_buf[98] = 8'h0;
                n_buf[99] = 8'h0;
                n_buf[100] = 8'h0;
                n_buf[101] = 8'h0;
                n_buf[102] = 8'h0;
                n_buf[103] = 8'h0;
                n_buf[104] = 8'h0;
                n_buf[105] = 8'h0;
                n_buf[106] = 8'h0;
                n_buf[107] = 8'h0;
                n_buf[108] = 8'h0;
                n_buf[109] = 8'h0;
                n_buf[110] = 8'h0;
                n_buf[111] = 8'h0;
                n_buf[112] = 8'h0;
                n_buf[113] = 8'h0;
                n_buf[114] = 8'h0;
                n_buf[115] = 8'h0;
                n_buf[116] = 8'h0;
                n_buf[117] = 8'h0;
                n_buf[118] = 8'h0;
                n_buf[119] = 8'h0;
                n_buf[120] = 8'h0;
                n_buf[121] = 8'h0;
                n_buf[122] = 8'h0;
                n_buf[123] = 8'h0;
                n_buf[124] = 8'h0;
                n_buf[125] = 8'h0;
                n_buf[126] = 8'h0;
                n_buf[127] = 8'h0;
                n_buf[128] = 8'h0;
                n_buf[129] = 8'h0;
                n_buf[130] = 8'h0;
                n_buf[131] = 8'h0;
                n_buf[132] = 8'h0;
                n_buf[133] = 8'h0;
                n_buf[134] = 8'h0;
                n_buf[135] = 8'h0;
                n_buf[136] = 8'h0;
                n_buf[137] = 8'h0;
                n_buf[138] = 8'h0;
                n_buf[139] = 8'h0;
                n_buf[140] = 8'h0;
                n_buf[141] = 8'h0;
                n_buf[142] = 8'h0;
                n_buf[143] = 8'h0;
                n_buf[144] = 8'h0;
                n_buf[145] = 8'h0;
                n_buf[146] = 8'h0;
                n_buf[147] = 8'h0;
                n_buf[148] = 8'h0;
                n_buf[149] = 8'h0;
                n_buf[150] = 8'h0;
                n_buf[151] = 8'h0;
                n_buf[152] = 8'h0;
                n_buf[153] = 8'h0;
                n_buf[154] = 8'h0;
                n_buf[155] = 8'h0;
                n_buf[156] = 8'h0;
                n_buf[157] = 8'h0;
                n_buf[158] = 8'h0;
                n_buf[159] = 8'h0;
                n_buf[160] = 8'h0;
                n_buf[161] = 8'h0;
                n_buf[162] = 8'h0;
                n_buf[163] = 8'h0;
                n_buf[164] = 8'h0;
                n_buf[165] = 8'h0;
                n_buf[166] = 8'h0;
                n_buf[167] = 8'h0;
                n_buf[168] = 8'h0;
                n_buf[169] = 8'h0;
                n_buf[170] = 8'h0;
                n_buf[171] = 8'h0;
                n_buf[172] = 8'h0;
                n_buf[173] = 8'h0;
                n_buf[174] = 8'h0;
                n_buf[175] = 8'h0;
                n_buf[176] = 8'h0;
                n_buf[177] = 8'h0;
                n_buf[178] = 8'h0;
                n_buf[179] = 8'h0;
                n_buf[180] = 8'h0;
                n_buf[181] = 8'h0;
                n_buf[182] = 8'h0;
                n_buf[183] = 8'h0;
                n_buf[184] = 8'h0;
                n_buf[185] = 8'h0;
                n_buf[186] = 8'h0;
                n_buf[187] = 8'h0;
                n_buf[188] = 8'h0;
                n_buf[189] = 8'h0;
                n_buf[190] = 8'h0;
                n_buf[191] = 8'h0;
                n_buf[192] = 8'h0;
                n_buf[193] = 8'h0;
                n_buf[194] = 8'h0;
                n_buf[195] = 8'h0;
                n_buf[196] = 8'h0;
                n_buf[197] = 8'h0;
                n_buf[198] = 8'h0;
                n_buf[199] = 8'h0;
                n_buf[200] = 8'h0;
                n_buf[201] = 8'h0;
                n_buf[202] = 8'h0;
                n_buf[203] = 8'h0;
                n_buf[204] = 8'h0;
                n_buf[205] = 8'h0;
                n_buf[206] = 8'h0;
                n_buf[207] = 8'h0;
                n_buf[208] = 8'h0;
                n_buf[209] = 8'h0;
                n_buf[210] = 8'h0;
                n_buf[211] = 8'h0;
                n_buf[212] = 8'h0;
                n_buf[213] = 8'h0;
                n_buf[214] = 8'h0;
                n_buf[215] = 8'h0;
                n_buf[216] = 8'h0;
                n_buf[217] = 8'h0;
                n_buf[218] = 8'h0;
                n_buf[219] = 8'h0;
                n_buf[220] = 8'h0;
                n_buf[221] = 8'h0;
                n_buf[222] = 8'h0;
                n_buf[223] = 8'h0;
                n_buf[224] = 8'h0;
                n_buf[225] = 8'h0;
                n_buf[226] = 8'h0;
                n_buf[227] = 8'h0;
                n_buf[228] = 8'h0;
                n_buf[229] = 8'h0;
                n_buf[230] = 8'h0;
                n_buf[231] = 8'h0;
                n_buf[232] = 8'h0;
                n_buf[233] = 8'h0;
                n_buf[234] = 8'h0;
                n_buf[235] = 8'h0;
                n_buf[236] = 8'h0;
                n_buf[237] = 8'h0;
                n_buf[238] = 8'h0;
                n_buf[239] = 8'h0;
                n_buf[240] = 8'h0;
                n_buf[241] = 8'h0;
                n_buf[242] = 8'h0;
                n_buf[243] = 8'h0;
                n_buf[244] = 8'h0;
                n_buf[245] = 8'h0;
                n_buf[246] = 8'h0;
                n_buf[247] = 8'h0;
                n_buf[248] = 8'h0;
                n_buf[249] = 8'h0;
                n_buf[250] = 8'h0;
                n_buf[251] = 8'h0;
                n_buf[252] = 8'h0;
                n_buf[253] = 8'h0;
                n_buf[254] = 8'h0;
                n_buf[255] = 8'h0;
                n_buf[256] = 8'h0;
                n_buf[257] = 8'h0;
                n_buf[258] = 8'h0;
                n_buf[259] = 8'h0;
                n_buf[260] = 8'h0;
                n_buf[261] = 8'h0;
                n_buf[262] = 8'h0;
                n_buf[263] = 8'h0;
                n_buf[264] = 8'h0;
                n_buf[265] = 8'h0;
                n_buf[266] = 8'h0;
                n_buf[267] = 8'h0;
                n_buf[268] = 8'h0;
                n_buf[269] = 8'h0;
                n_buf[270] = 8'h0;
                n_buf[271] = 8'h0;
                n_buf[272] = 8'h0;
                n_buf[273] = 8'h0;
                n_buf[274] = 8'h0;
                n_buf[275] = 8'h0;
                n_buf[276] = 8'h0;
                n_buf[277] = 8'h0;
                n_buf[278] = 8'h0;
                n_buf[279] = 8'h0;
                n_buf[280] = 8'h0;
                n_buf[281] = 8'h0;
                n_buf[282] = 8'h0;
                n_buf[283] = 8'h0;
                n_buf[284] = 8'h0;
                n_buf[285] = 8'h0;
                n_buf[286] = 8'h0;
                n_buf[287] = 8'h0;
                n_buf[288] = 8'h0;
                n_buf[289] = 8'h0;
                n_buf[290] = 8'h0;
                n_buf[291] = 8'h0;
                n_buf[292] = 8'h0;
                n_buf[293] = 8'h0;
                n_buf[294] = 8'h0;
                n_buf[295] = 8'h0;
                n_buf[296] = 8'h0;
                n_buf[297] = 8'h0;
                n_buf[298] = 8'h0;
                n_buf[299] = 8'h0;
                n_buf[300] = 8'h0;
                n_buf[301] = 8'h0;
                n_buf[302] = 8'h0;
                n_buf[303] = 8'h0;
                n_buf[304] = 8'h0;
                n_buf[305] = 8'h0;
                n_buf[306] = 8'h0;
                n_buf[307] = 8'h0;
                n_buf[308] = 8'h0;
                n_buf[309] = 8'h0;
                n_buf[310] = 8'h0;
                n_buf[311] = 8'h0;
                n_buf[312] = 8'h0;
                n_buf[313] = 8'h0;
                n_buf[314] = 8'h0;
                n_buf[315] = 8'h0;
                n_buf[316] = 8'h0;
                n_buf[317] = 8'h0;
                n_buf[318] = 8'h0;
                n_buf[319] = 8'h0;
                n_buf[320] = 8'h0;
                n_buf[321] = 8'h0;
                n_buf[322] = 8'h0;
                n_buf[323] = 8'h0;
                n_buf[324] = 8'h0;
                n_buf[325] = 8'h0;
                n_buf[326] = 8'h0;
                n_buf[327] = 8'h0;
                n_buf[328] = 8'h0;
                n_buf[329] = 8'h0;
                n_buf[330] = 8'h0;
                n_buf[331] = 8'h0;
                n_buf[332] = 8'h0;
                n_buf[333] = 8'h0;
                n_buf[334] = 8'h0;
                n_buf[335] = 8'h0;
                n_buf[336] = 8'h0;
                n_buf[337] = 8'h0;
                n_buf[338] = 8'h0;
                n_buf[339] = 8'h0;
                n_buf[340] = 8'h0;
                n_buf[341] = 8'h0;
                n_buf[342] = 8'h0;
                n_buf[343] = 8'h0;
                n_buf[344] = 8'h0;
                n_buf[345] = 8'h0;
                n_buf[346] = 8'h0;
                n_buf[347] = 8'h0;
                n_buf[348] = 8'h0;
                n_buf[349] = 8'h0;
                n_buf[350] = 8'h0;
                n_buf[351] = 8'h0;
                n_buf[352] = 8'h0;
                n_buf[353] = 8'h0;
                n_buf[354] = 8'h0;
                n_buf[355] = 8'h0;
                n_buf[356] = 8'h0;
                n_buf[357] = 8'h0;
                n_buf[358] = 8'h0;
                n_buf[359] = 8'h0;
                n_buf[360] = 8'h0;
                n_buf[361] = 8'h0;
                n_buf[362] = 8'h0;
                n_buf[363] = 8'h0;
                n_buf[364] = 8'h0;
                n_buf[365] = 8'h0;
                n_buf[366] = 8'h0;
                n_buf[367] = 8'h0;
                n_buf[368] = 8'h0;
                n_buf[369] = 8'h0;
                n_buf[370] = 8'h0;
                n_buf[371] = 8'h0;
                n_buf[372] = 8'h0;
                n_buf[373] = 8'h0;
                n_buf[374] = 8'h0;
                n_buf[375] = 8'h0;
                n_buf[376] = 8'h0;
                n_buf[377] = 8'h0;
                n_buf[378] = 8'h0;
                n_buf[379] = 8'h0;
                n_buf[380] = 8'h0;
                n_buf[381] = 8'h0;
                n_buf[382] = 8'h0;
                n_buf[383] = 8'h0;
                n_buf[384] = 8'h0;
                n_buf[385] = 8'h0;
                n_buf[386] = 8'h0;
                n_buf[387] = 8'h0;
                n_buf[388] = 8'h0;
                n_buf[389] = 8'h0;
                n_buf[390] = 8'h0;
                n_buf[391] = 8'h0;
                n_buf[392] = 8'h0;
                n_buf[393] = 8'h0;
                n_buf[394] = 8'h0;
                n_buf[395] = 8'h0;
                n_buf[396] = 8'h0;
                n_buf[397] = 8'h0;
                n_buf[398] = 8'h0;
                n_buf[399] = 8'h0;
                n_buf[400] = 8'h0;
                n_buf[401] = 8'h0;
                n_buf[402] = 8'h0;
                n_buf[403] = 8'h0;
                n_buf[404] = 8'h0;
                n_buf[405] = 8'h0;
                n_buf[406] = 8'h0;
                n_buf[407] = 8'h0;
                n_buf[408] = 8'h0;
                n_buf[409] = 8'h0;
                n_buf[410] = 8'h0;
                n_buf[411] = 8'h0;
                n_buf[412] = 8'h0;
                n_buf[413] = 8'h0;
                n_buf[414] = 8'h0;
                n_buf[415] = 8'h0;
                n_buf[416] = 8'h0;
    end

    always @(posedge i_Clk or negedge i_reset) begin
        if(!i_reset) begin
                c_imagen[0]<={BIT_ARRAY{1'b0}};
                c_imagen[1]<={BIT_ARRAY{1'b0}};
                c_imagen[2]<={BIT_ARRAY{1'b0}};
                kernel[0]<=24'b00000001_00000001_00000001;
                kernel[1]<=24'b00000001_00000001_00000001;
                kernel[2]<=24'b00000001_00000001_00000001;

        end
        else begin
            c_imagen[0] <= c_imagen[1];
            c_imagen[1] <= c_imagen[2];
            c_imagen[2] <= {i_dato2, i_dato1, i_dato0};
        end
    end

             

    always @(posedge i_Clk or negedge i_reset) begin
        if(!i_reset) begin
            n_buf[c_update] <= 0;
            c_update <= 0;
        end
        else begin
            n_buf[c_update] <=  c_imagen[0][7:0] * kernel[0][7:0] +
                                c_imagen[0][15:8] * kernel[0][15:8] + 
                                c_imagen[0][BIT_ARRAY-1:16] * kernel[0][BIT_ARRAY-1:16] +

                                c_imagen[1][7:0] * kernel[1][7:0] +
                                c_imagen[1][15:8] * kernel[1][15:8] +
                                c_imagen[1][BIT_ARRAY-1:16] * kernel[1][BIT_ARRAY-1:16] +

                                c_imagen[2][7:0] * kernel[2][7:0] +
                                c_imagen[2][15:8] * kernel[2][15:8] +
                                c_imagen[2][BIT_ARRAY-1:16] * kernel[2][BIT_ARRAY-1:16];
            c_update <= c_update + 1;
        end
    end

    always @(posedge i_Clk or negedge i_reset) begin
        if(!i_reset)
            o_data <= 0;
        else if(c_update > 1)
            o_data <= n_buf[c_update - 1];
        else
            o_data <= 0;
    end
endmodule


// 이 코드는 RGB각각 1픽셀씩 데이터가 들어올때의 계산코드
// 카메라에서 RGB로 데이터가 어떻게 들어오는지 파악

// 20241024_파이프라이닝 적용 병렬처리 확인