// Register File Code for the IEStage
// This code has two parts of it
// 1.) the first part that happens on the posedge of the clk will write data into one of the 32 bit registers only if the the control bit RegWrite is 1
//  if it is 1 it will take the WriteData (from the mux of the WBstage) and store it into the REG position determined by the WriteReg which also comes from the WBStage
// 2.) the second part of the code which occurs on the negedge is the reading part
// here it takes in the IR values of rs and rt which corresponde to IR[25-21] and IR[20-16]
// then it will assign the data from those corresponding registers to the variables of EX_ALU and EX_Mux which named corrrectly will go to the EX stage for the ALU and Mux
// the commented out intial block was to test this code for one of the labs which was for assigning intial values to the Registers
// this was replaced by the first part of this code


module Register(
    output reg [31:0] EX_ALU,
    output reg [31:0] EX_Mux,
    input [4:0] IR_rs,
    input [4:0] IR_rt,
    input MEM,
    input RegWrite,
    input [31:0] Writedata,
    input [4:0] WriteReg,
    input clk
    );
    
    reg [31:0] REG[0:31];
    
    always @(posedge clk)
        begin
        if(RegWrite == 1)
            begin
                REG[WriteReg] <= Writedata;
            end
        end
//    initial
//        begin
//        REG[0] = 32'hA00000AA;
//        REG[1] = 32'h10000011;
//        REG[2] = 32'h20000022;
//        REG[3] = 32'h30000033;
//        REG[4] = 32'h40000044;
//        REG[5] = 32'h50000055;
//        REG[6] = 32'h60000066;
//        REG[7] = 32'h70000077;
//        REG[8] = 32'h80000088;
//        REG[9] = 32'h90000099;       
//        REG[10] = 32'hA00000AA;
//        REG[11] = 32'h10000011;
//        REG[12] = 32'h20000022;
//        REG[13] = 32'h30000033;
//        REG[14] = 32'h40000044;
//        REG[15] = 32'h50000055;
//        REG[16] = 32'h60000066;
//        REG[17] = 32'h70000077;
//        REG[18] = 32'h80000088;
//        REG[19] = 32'h90000099;       
//        REG[20] = 32'hA00000AA;
//        REG[21] = 32'h10000011;
//        REG[22] = 32'h20000022;
//        REG[23] = 32'h30000033;
//        REG[24] = 32'h40000044;
//        REG[25] = 32'h50000055;
//        REG[26] = 32'h60000066;
//        REG[27] = 32'h70000077;
//        REG[28] = 32'h80000088;
//        REG[29] = 32'h90000099;
//        REG[30] = 32'hA00000AA;
//        REG[31] = 32'h10000011;
//        end
        
     always @(negedge clk)
        begin
            EX_ALU <= REG[IR_rs];
            EX_Mux <= REG[IR_rt];
        end
            
endmodule
