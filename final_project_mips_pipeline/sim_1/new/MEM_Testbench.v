`timescale 1ns/1ps

module Mem_Wb_Testbench();

    wire [31:0] WB_mux1;
    wire [31:0] WB_mux0;
    wire PCSrc;
    wire [4:0] ID_Registers;
    wire controlRegWriteOut;
    wire controlMemtoReg;
    reg controlRegIn;
    reg controlMemIn;
    reg [31:0] inAddress;
    reg [31:0] inWriteData;
    reg MemWrite;
    reg MemRead;
    reg zero;
    reg c_ctlout;
    reg [4:0] five_bit_mux;
    reg clk;
    
    wire RegWrite;   
    wire [31:0] outputMux;
    wire [4:0] RegwriteOut;

    MEMORY mem1(WB_mux1, WB_mux0, PCSrc, ID_Registers, controlRegWriteOut, controlMemtoReg, controlRegIn, controlMemIn, inAddress, inWriteData, MemWrite, MemRead, zero, c_ctlout, five_bit_mux, clk);
    WB_Stage wb1(outputMux, RegwriteOut, RegWrite, controlRegWriteOut, ID_Registers, WB_mux1, WB_mux0, controlMemtoReg, clk);

    initial
        begin
            clk = 0;
            MemWrite = 1;
            MemRead = 0;
            controlRegIn = 0;
            controlMemIn = 0;
            five_bit_mux = 0;
            zero = 0;
            c_ctlout = 0;
            inAddress = 0; inWriteData = 32'h002300AA;
            #20 inAddress = 1; inWriteData = 32'h10654321; 
            #20 inAddress = 2; inWriteData = 32'h00100022;
            #20 inAddress = 3; inWriteData = 32'h8C123456;
            #20 inAddress = 4; inWriteData = 32'h8F123456;
			#20 inAddress = 5; inWriteData = 32'hAD654321;
			#20 inAddress = 6; inWriteData = 32'h13012345;
			#20 inAddress = 7; inWriteData = 32'hAC654321;
			#20 inAddress = 8; inWriteData = 32'h12012345;
			#20 MemWrite = 0; MemRead = 1; inAddress = 0;
			#20 inAddress = 1;
			#20 inAddress = 2;
			#20 inAddress = 3;
			#20 inAddress = 4;
			#20 inAddress = 5;
			#20 inAddress = 6;
			#20 inAddress = 7;
			#20 inAddress = 8;
            #20 $stop;
        end

     always
        begin
        #10 clk = ~clk;
        end
        
     always @(posedge clk)
        #1 $display ("At t = %0d,  ID_EX = %d, EX_MEM  = %d, MEM_WB = %d, MemWrite = %b, MemRead = %b, WB_MUX_OUT = %d, MemtoReg = %b", 
                        $time, WB_mux0, ID_Registers, WB_mux1, MemWrite, MemRead, outputMux, controlMemtoReg);

endmodule
