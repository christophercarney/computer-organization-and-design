// Code for IExecute part 3 of the pipeline
// includes adder, alu contor, bottum mux, alu max, id mem
// since all of this happens on a clk we need a way to store the value coming out of the ALU Control and mux before the ALU and send it to the ALU before the cycle is over
// we did this by putting everything on the posedge of the clk and the ALU on a negedge and then we used 2 internal wires to connect the outputs of the 2 things 
// memtioned above to the inputs of the ALU causing the ALU to evaluate with the correct values


module I_Execute(
    output reg [1:0] wb_out,
    output reg [2:0] m_out,
    output [31:0] add_result,
    output [31:0] alu_result,
    output [4:0] five_bit_muxout,
    output [3:0] ex_out,
    output zero,
    input [31:0] data1out,
    input [31:0] data2out,
    input [31:0] s_extendout,
    input [4:0] instrout_20,
    input [4:0] instrout_15,
    input [31:0] npcin,
    input clk
    );
 
    wire [31:0] alu_mux_out;
    wire [2:0] alu_control;
    
    ALU_MUX alumux(alu_mux_out, s_extendout, data2out, ex_out[0], clk);
    ALU au(alu_result, zero, alu_control, data1out, alu_mux_out, clk);
    
    ADDER add(add_result, npcin, s_extendout, clk);
    ALU_CONTROL alu_contr(alu_control, s_extendout[5:0], ex_out[2:1], clk);
    BOTTOM_MUX bottommux(five_bit_muxout, instrout_20, instrout_15, ex_out[3], clk);
endmodule
