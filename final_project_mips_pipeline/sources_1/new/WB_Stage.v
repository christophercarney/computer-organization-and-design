// WB stage the 5 and final part of the pipeline
// it just has one mux (which I used the same one that was made in the IFStage lab 1) and has two bits that go to the IF stage
// the values that are sent the mux are the read data (input1) and the resualt from the ALU (input0) 
// the value for the mux is choosen from the last WB_control bit WB_mux[0] (select)
// this runs on the posedge of the clk

module WB_Stage(
output [31:0] outputMux,
output reg [4:0] RegwriteOut,
output reg ID_RegWrite,
input ID_RegWrite_In,
input [4:0] RegWriteIn,
input [31:0] input1, 
input [31:0] input0,
input select, 
input clk
);


mux WBmux(input1, input0, select, outputMux, clk);

// this sends the bits to the IF stage
always @(*)
    begin
        RegwriteOut = RegWriteIn;
        ID_RegWrite = ID_RegWrite_In;
    end
endmodule