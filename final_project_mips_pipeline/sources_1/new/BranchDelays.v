// The BranchDelays code for the MEM stage
// this as 2 parts to this
// 1.) the first part is the branch and gate that takes in the zero bit from the ALU in the IE stage and the last control bit fom MEM_control [0] (named c_ctlout becuase that is what it was called in the project describiton)
//      it then assigns it value to the PCSrc whish is the pc_choose in the IF stage
// 2.) this is just the delays need for the wb stage
// all of this runs on the posedge of the clk

module BranchDelays(
    output reg PCSrc,
    output reg [4:0] ID_Registers,
    output reg controlRegWriteOut,
    output reg controlMemtoReg,
    input controlRegIn,
    input controlMemIn,
    input zero,
    input c_ctlout,
    input [4:0] five_bit_mux,
    input clk
    );
    
    //add gate for branch
    always @(posedge clk)
        begin
            PCSrc <= (zero && c_ctlout);
        end
        
    //five bit mux out and contorl delays
    always @(posedge clk)
        begin
            ID_Registers <= five_bit_mux;
            controlRegWriteOut <= controlRegIn;
            controlMemtoReg <= controlMemIn;
        end
        
endmodule
