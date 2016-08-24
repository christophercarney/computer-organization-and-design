// ifetch code
// first stage in our pipeline
// has a mux, adder for the pc, and an instruction Memory
// it gets pc_choose from a control bit in the WB stage



module IFetch(
        input clk, 
        input pc_choose,
        input [31:0] EX_MEM_NPC,
        input [31:0] pc,
        output [31:0] incr_out,
        output [31:0] mux_out,
        output [31:0] IF_ID_IR
        );
        
        incr adder1(pc, incr_out, clk);    
        mux mux1(incr_out, EX_MEM_NPC, pc_choose, mux_out, clk);
        instructionMemory instructionMemory1(pc, IF_ID_IR);
endmodule
