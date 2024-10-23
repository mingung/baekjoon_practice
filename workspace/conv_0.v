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
    
 genvar i;
generate
    for (i = 0; i < FEA_SIZE; i = i + 1) begin : init_n_buf
        initial begin
            n_buf[i] = 8'h0;
        end
    end
endgenerate


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