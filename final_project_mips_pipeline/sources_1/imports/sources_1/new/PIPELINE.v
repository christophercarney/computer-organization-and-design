// The Pipeline module that calls all 5 parts of the pipeline and connects all of the wires together 
// the only we have is the clk
// everything else can be determined in the stages itself internally

module PIPELINE(clk, state, controlIRbits);
//wires for previous labs
    input [2:0] state;
    input  clk;
	output reg [5:0] controlIRbits;
    wire [1:0] wb_out;
    wire [2:0] m_out;
    wire [31:0] add_result;
    wire [31:0] alu_result;
    wire [4:0] five_bit_muxout;
    wire [3:0] ex_out;
    wire [31:0] data1out;
    wire [31:0] data2out;
    wire [31:0] s_extendout;
    wire [4:0] instrout_20;
    wire [4:0] instrout_15;
    wire [31:0] incr_out;
    //wire [31:0] npcout;
    wire [31:0] IF_ID_IR;
    wire MEM;
    wire RegWrite;
    wire [31:0] EX_MEM_NPC;
    wire [31:0] pc;
    wire [31:0] mux_out;
    wire zero;
    wire [31:0] incr_outIE;
    
    //Mem wires
    wire [31:0] WB_mux1;
    wire [31:0]WB_mux0;
    wire PCSrc;
    wire [4:0] ID_Registers;
    wire controlRegWriteOut;
    wire controlMemtoReg;
    
    //WB wires
    wire [31:0] outputMux;
    wire [4:0] RegwriteOut;
    wire PCSrcout;
	
	// the bits that when our controller tells it the state it is in
	always @(*)
		begin
			case(state)
				3'd0 :	controlIRbits = 6'b100011;
				3'd1 :	controlIRbits = 6'b101011;
				3'd2 :	controlIRbits = 6'b000100;
				3'd3 :	controlIRbits = 6'b100000;
				3'd4 :	controlIRbits = 6'b100010;
				3'd5 :	controlIRbits = 6'b100100;
				3'd6 :	controlIRbits = 6'b100101;
				3'd7 :	controlIRbits = 6'b101010;
				default : controlIRbits = 6'bxxxxxx;
			endcase
		end
  
    IFetch ifs(clk, PCSrcout, EX_MEM_NPC, pc, incr_out, mux_out, IF_ID_IR);    
    ID_Stage idstage(wb_out, m_out, ex_out, data1out, data2out, s_extendout, instrout_20, instrout_15, incr_outIE, IF_ID_IR, controlIRbits, incr_out, MEM, RegWrite, outputMux, RegwriteOut, clk);
    I_Execute iestage(wb_out, m_out, add_result, alu_result, five_bit_muxout, ex_out, zero, data1out, data2out, s_extendout, instrout_20, instrout_15, incr_outIE, clk);
    MEMORY memstage(WB_mux1, WB_mux0, PCSrc, ID_Registers, controlRegWriteOut, controlMemtoReg, wb_out[0], wb_out[1], add_result, alu_result, m_out[1], m_out[2], zero, m_out[0], five_bit_muxout, clk);
    WB_Stage wbstage(outputMux, RegwriteOut, PCSrcout, PCSrc, ID_Register, WB_mux1, WB_mux0, controlMemtoReg, clk);
endmodule
