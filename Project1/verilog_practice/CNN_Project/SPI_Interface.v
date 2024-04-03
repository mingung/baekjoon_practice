module SPI_Interface (
    input wire clk,
    input wire reset,
    input wire ss,
    input wire sclk,
    input wire miso,
    output reg [7:0] rx_data,
    output reg ready
);

  // 상태 정의
  parameter IDLE = 2'b00;
  parameter RECEIVE = 2'b01;
  
  // 내부 상태 레지스터
  reg [1:0] state;
  reg [2:0] bit_count; // 8비트 카운터를 위한 3비트 레지스터

  // 초기화
  always @ (posedge clk or posedge reset)
  begin
    if (reset)
    begin
      state <= IDLE;
      rx_data <= 8'b0;
      ready <= 1'b0;
	  bit_count <= 3'b0;
    end
    // SPI 동작
    else begin
        case (state)
      IDLE: begin
        if (!ss) 
		begin // SS 신호가 활성화된 경우
          state <= RECEIVE;
          ready <= 1'b0;
        end
      end
      RECEIVE: begin
        if (!ss) begin // SS 신호가 계속 활성화된 경우
          rx_data <= {rx_data[6:0], miso}; // MISO 신호로부터 데이터 수신
			 bit_count <= bit_count + 1;
          if (bit_count == 3'b111) begin
            state <= IDLE;
            ready <= 1'b1; // 데이터를 성공적으로 수신했음을 표시
			bit_count <= 3'b0; // 비트 카운터 초기화
          end
        end
        else begin
          state <= IDLE; // SS 신호가 비활성화된 경우, 상태를 IDLE로 변경
		  bit_count <= 3'b0; // 비활성화 시 비트 카운터 초기화
        end
      end
    endcase
  end
  end
  

  
    


endmodule
