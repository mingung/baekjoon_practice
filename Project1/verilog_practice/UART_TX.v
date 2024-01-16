module UART_TX (clk, reset, data, data1, data2, tx, tx1, tx2); //port(input, output)
    input clk;
    input reset;
    input [7:0] data; // ���� ������
    input [7:0] data1; // ���� ������
    input [7:0] data2; // ���� ������
    output reg tx,tx1,tx2; // UART ��� ��
   

    reg [3:0] tx_state;
    reg [10:0] bit_count;
    reg start_bit, stop_bit;
    reg [7:0] data_out;
    wire tx_done;


    always @(posedge clk or posedge reset)
    if (reset) begin
        tx_state <= 4'b0000;
        bit_count <= 11'b00000000000;
        start_bit <= 1'b0;
        stop_bit <= 1'b1;
        data_out <= 8'b00000000;
    end
    else begin
        tx <= data;
        tx1 <= data1;
        tx2 <= data2;
    end

endmodule
