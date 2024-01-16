module mojo_top(
    // 50MHz clock input
    input clk,
    // Input from reset button (active low)
    input rst_n,
    // cclk input from AVR, high when AVR is ready
    input cclk,
    // Outputs to the 8 onboard LEDs
    output[7:0]led,
    // AVR SPI connections
    output spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    // AVR ADC channel select
    output [3:0] spi_channel,
    // Serial connections
    input avr_tx, // AVR Tx => FPGA Rx
    output avr_rx, // AVR Rx => FPGA Tx
    input avr_rx_busy // AVR Rx buffer full
    );

wire rst = ~rst_n; // make reset active high (rst_n = active_low)

// these signals should be high-z when not used
assign spi_miso = 1'bz; // 1 bit high-impedance
assign avr_rx = 1'bz; // 1 bit high-impedance
assign spi_channel = 4'bzzzz; // 4 bit high-impedance

assign led = 7'b0; // 7 bit 2진수 0으로 할당
assign led[7] = rst; // rst를 led MSB에 할당


endmodule