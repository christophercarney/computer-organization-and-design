// ID_Stage code which is the second part of the Pipeline
// it has a contorler, a signextend, a (IR_to_mux) which is a delay for the IR[20-11] bits, and a Register
// the IR_out at the bottum is delayed so that it can be used in the next step of the pipeline which is the IE stage (for the add)


module ID_Stage(
    output [1:0] wb_out,
    output [2:0] m_out,
    output [3:0] ex_out,
 //   output [31:0] npcout,
    output [31:0] data1out,
    output [31:0] data2out,
    output [31:0] s_extendout,
    output [4:0] instrout_20,
    output [4:0] instrout_15,
    output reg [31:0] IR_out,
    input [31:0] IR_in,
    input [5:0] controlIR,
    input [31:0] npcin,
    input MEM,
    input RegWrite,
    input [31:0] Writedata,
    input [4:0] WriteReg,
    input clk
    );
    //ID stage
    Control cntr(wb_out, m_out, ex_out, controlIR, clk);
    SignExtend s_extend(s_extendout, IR_in[15:0], clk);
    IR_to_mux irtomux(instrout_20, instrout_15, IR_in[20:16], IR_in[15:11], clk);
    Register r1(data1out, data2out, IR_in[25:21], IR_in[20:16], MEM, RegWrite, Writedata, WriteReg, clk);
    
    always @(posedge clk)
        begin
            IR_out <= IR_in;
        end
endmodule
