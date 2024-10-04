`timescale 1ns / 1ns
`include        "params.v"
module tb_sdr_sdram();
    reg                         CLK;    
    reg                         RESET_N;
    reg [`ASIZE-1:0]            ADDR;
    reg [2:0]                   CMD;
    reg [`DSIZE-1:0]            DATAIN;
    reg [`DSIZE/8-1:0]          DM; 
    
    wire                        CMDACK;
    wire [`DSIZE-1:0]           DATAOUT;
    wire  [11:0]                SA;   
    wire  [1:0]                 BA;   
    wire  [1:0]                 CS_N; 
    wire                        CKE;            
    wire                        RAS_N;
    wire                        CAS_N;
    wire                        WE_N; 
    wire [`DSIZE-1:0]           DQ;
    wire [`DSIZE/8-1:0]         DQM;    



    // Instantiate the sdr_sdram module
    sdr_sdram sdr_sdram(
        .CLK        (CLK),   
        .RESET_N    (RESET_N),
        .ADDR       (ADDR),
        .CMD        (CMD),
        .DATAIN     (DATAIN),
        .DM         (DM),
        .CMDACK     (CMDACK),
        .DATAOUT    (DATAOUT),
        .SA         (SA),
        .BA         (BA),
        .CS_N       (CS_N),
        .CKE        (CKE),
        .RAS_N      (RAS_N),
        .CAS_N      (CAS_N),
        .WE_N       (WE_N),
        .DQ         (DQ),
        .DQM        (DQM)
    );

    // Clock generation
    always
        #10 CLK = ~CLK;

    // Initial block for reset and test sequence
    initial begin
	    CLK = 1;
        RESET_N = 0;
        ADDR = 0;
        CMD = 0;
        DM = 0;
        DATAIN = 0;
        CMD = 3'b000;
        
        #5  RESET_N = 1;
        #20 CMD = 3'b010; ADDR = 23'h1AAAAA;  DATAIN = 32'h1;

        // Example command sequence
        #100 CMD = 3'b000; ADDR = 23'h1AAAAB; DM = 4'h1;// Issue a command and set an address
        #20 ADDR = 23'h1AAAAA;  CMD = 3'b000; DATAIN = 32'h2;
        #20 ADDR = 23'h1AAAAA;   DATAIN = 32'h3; DM = 4'hB;
        #20 ADDR = 23'h1AAAAA;   DATAIN = 32'h4; DM = 4'hC;
        #20 ADDR = 23'h1AAAAA;   DATAIN = 32'h5; DM = 4'hD;
        #20 ADDR = 23'h1AAAAA;   DATAIN = 32'h6; DM = 4'hE;




        #1000
        $finish;
    end
endmodule