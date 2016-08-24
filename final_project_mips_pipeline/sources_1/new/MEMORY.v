// The Memory stage part 4 of the pipeline
// this instainates the and gate for branch, delays, and the Datamemory block.
// everything runs on the clk 

module MEMORY(
output [31:0] WB_mux1,
output [31:0] WB_mux0,
output PCSrc,
output [4:0] ID_Registers,
output controlRegWriteOut,
output controlMemtoReg,
input controlRegIn,
input controlMemIn,
input [31:0] inAddress,
input [31:0] inWriteData,
input MemWrite,
input MemRead,
input zero,
input c_ctlout,
input [4:0] five_bit_mux,
input clk
);


//dMem
D_MEM dataMemory1(WB_mux1, WB_mux0, inAddress, inWriteData, MemWrite, MemRead, clk);

//branch and the delays needed
BranchDelays andGate(PCSrc, ID_Registers, controlRegWriteOut, controlMemtoReg, controlRegIn, controlMemIn, zero, c_ctlout, five_bit_mux, clk);




endmodule
