module relu (
    input signed [9:0] in,
    output [9:0] out
);
    assign out = (in[9] == 1'b1) ? 10'd0 : in;
endmodule
