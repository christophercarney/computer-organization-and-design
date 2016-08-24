// the D_MEM for the Memory stage
// this has 256 32'bit Memories
// it takes as inputs the first 2 Mem_conrol bits [2:1] and the 32'bit resualt from the ALU in the IEstage (inAddress)
// it also takes in the 32'bit data that was in the rt Register that was delayed in the IE stage (inWriteData)
// for the if statements if the MemWrite is 1 it will date the Data from rt and put it into the Memory located at the inAddress (WB_mux1)
// if MemWrite is 0 and MemRead is 1 it wll read the value located in the Memory located at inAdrress (WB_mux1)
// the WB_mux0 at the bottum is for the delay needed in the WB Stage

module D_MEM(
    output reg [31:0] WB_mux1,
    output reg [31:0] WB_mux0,
    input [31:0] inAddress,
    input [31:0] inWriteData,
    input MemWrite,
    input MemRead,
    input clk
    );
    
    reg [31:0] MEM[0:255];
    
    always @(posedge clk)
        begin   
            if(MemWrite == 1)
                begin
                    MEM[inAddress] <= inWriteData;
                end
            else if(MemRead == 1)
                begin
                   WB_mux1 <= MEM[inAddress];
                end
            WB_mux0 <= inAddress;
        end
        
endmodule
