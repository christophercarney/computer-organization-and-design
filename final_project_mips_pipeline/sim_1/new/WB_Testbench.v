`timescale 1ns / 1ps

module WB_Testbench();

	wire [31:0] outputMux;
	wire [4:0] RegwriteOut;
	wire PCSrcout;
	reg PCSrcin;
	reg [4:0] RegWriteIn;
	reg [31:0] input1;
	reg [31:0] input0;
	reg select;
	reg clk;
	
	WB_Stage wb1(outputMux, RegwriteOut, PCSrcout, PCSrcin, RegWriteIn, input1, input0, select, clk);

	initial
		begin
			clk = 0;
			RegwriteOut = 0;
			PCSrcout = 0;
			select = 0;
			input1 = 0;
            input0 = 32'h002300AA;
            #20 input0 = 32'h10654321; 
            #20 input0 = 32'h00100022;
            #20 input0 = 32'h8C123456;
            #20 input0 = 32'h8F123456;
			#20 input0 = 32'hAD654321;
			#20 input0 = 32'h13012345;
			#20 input0 = 32'hAC654321;
			#20 input0 = 32'h12012345;
			#20 select = 1'b1; 
			#20 input1 = 32'h10654321; 
            #20 input1 = 32'h00100022;
            #20 input1 = 32'h8C123456;
            #20 input1 = 32'h8F123456;
            #20 input1 = 32'hAD654321;
            #20 input1 = 32'h13012345;
            #20 input1 = 32'hAC654321;
            #20 input1 = 32'h12012345;
            #40 $stop;
		end
	
	always
        begin
        #10 clk = ~clk;
        end
        
     always @(posedge clk)
        #1 $display ("At t = %0d,  ID_EX = %d, EX_MEM  = %d, MEM = %d, MemtoReg = %b", 
                        $time, , , ,select);
endmodule
