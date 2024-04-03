module SPI_Interface (
    input wire clk,
    input wire reset,
    input wire ss,
    input wire sclk,
    input wire miso,
    output reg [7:0] rx_data,
    output reg ready
);

  // ���� ����
  parameter IDLE = 2'b00;
  parameter RECEIVE = 2'b01;
  
  // ���� ���� ��������
  reg [1:0] state;
  reg [2:0] bit_count; // 8��Ʈ ī���͸� ���� 3��Ʈ ��������

  // �ʱ�ȭ
  always @ (posedge clk or posedge reset)
  begin
    if (reset)
    begin
      state <= IDLE;
      rx_data <= 8'b0;
      ready <= 1'b0;
	  bit_count <= 3'b0;
    end
    // SPI ����
    else begin
        case (state)
      IDLE: begin
        if (!ss) 
		begin // SS ��ȣ�� Ȱ��ȭ�� ���
          state <= RECEIVE;
          ready <= 1'b0;
        end
      end
      RECEIVE: begin
        if (!ss) begin // SS ��ȣ�� ��� Ȱ��ȭ�� ���
          rx_data <= {rx_data[6:0], miso}; // MISO ��ȣ�κ��� ������ ����
			 bit_count <= bit_count + 1;
          if (bit_count == 3'b111) begin
            state <= IDLE;
            ready <= 1'b1; // �����͸� ���������� ���������� ǥ��
			bit_count <= 3'b0; // ��Ʈ ī���� �ʱ�ȭ
          end
        end
        else begin
          state <= IDLE; // SS ��ȣ�� ��Ȱ��ȭ�� ���, ���¸� IDLE�� ����
		  bit_count <= 3'b0; // ��Ȱ��ȭ �� ��Ʈ ī���� �ʱ�ȭ
        end
      end
    endcase
  end
  end
  

  
    


endmodule
