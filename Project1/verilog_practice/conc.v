// 결합 연산자{} -> MSB,LSB 결합
// conc.v
module conc(data_out, data_in);
output reg [5:0] data_out; // 6 bit
input [5:0] data_in;

always @(data_in)
if(data_in <= 32)
    data_out <= data_in;
else
    data_out <= {data_in[2:0], data_in[5:3]}; //LSB, MSB
endmodule

// conc_tb.v
`timescale 1ns/1ns

module conc_tb;
reg [5:0] data_in;
wire [5:0] data_out;

conc conc_tb0(
    .data_in(data_in),
    .data_out(data_out)
);

initial
begin
    data_in = 32;
    // #10 data_in = 33;
    // #10 data_in = 34;
    // #10 data_in = 35;
    // #10 data_in = 36;
    // #10 data_in = 37;
end
always #10 data_in <= data_in + 1;
endmodule